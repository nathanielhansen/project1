package crud.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import crud.model.T_STOCK;
import crud.model.V_STOCK;
import crud.model.V_USERS;

public class CrudDao {
	private String url = "jdbc:mysql://localhost:3306/project1";
	private String username = "root";
	private String password = "Th3w1nner";
	
	private static final String INSERT_STOCK_DATA = 
			"INSERT INTO stock (name, quantity, price) VALUES " + 
			"(?, ?, ?);";
	private static final String VIEW_USERS =
			"SELECT * FROM view_user;";
	
	private static final String VIEW_STOCK =
			"SELECT * FROM view_stock;";
	
	private static final String UPDATE_STOCK = 
			"UPDATE stock "
			+ "SET name = ?, quantity = ?, price = ? "
			+ "WHERE id = ?;";
	
	private static final String DELETE_STOCK = 
			"DELETE FROM stock WHERE id = ?;";
	
	
	public Connection getConnection() {
		Connection connection = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	public String validateUser(String username, String password) {
		String uname = username;
		String pass = password;
		System.out.println(uname);
		System.out.println(pass);
		
		try(Connection connection = getConnection()) {
			PreparedStatement preparedStatement = connection.prepareStatement(VIEW_USERS);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getString("username"));
				System.out.println(rs.getString("password"));
				System.out.println(rs.getString("email"));
				String usernameDb = rs.getString("username");
				String passwordDb = rs.getString("password");
				if(uname.equals(usernameDb) && pass.equals(passwordDb)) {
					return "SUCCESS";
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "Invalid user credentials!";
	}
	
	public List<V_STOCK> getViewStock() {
		List<V_STOCK> listStock = new ArrayList<>();
		try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(VIEW_STOCK);) {
			
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				V_STOCK stock = new V_STOCK();
				stock.setId(rs.getInt("id"));
				stock.setName(rs.getString("name"));
				stock.setQuantity(rs.getInt("quantity"));
				stock.setPrice(rs.getDouble("price"));
				listStock.add(stock);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return listStock;
	}
	
	public void insertStock(T_STOCK stock) throws SQLException{
		try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STOCK_DATA);){
			preparedStatement.setString(1, stock.getName());
			preparedStatement.setInt(2, stock.getQuantity());
			preparedStatement.setDouble(3, stock.getPrice());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			
		}
	}
	
	public boolean updateStockById(T_STOCK stock, int id) throws SQLException {
		boolean stockUpdated;
		try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STOCK);) {
			preparedStatement.setString(1, stock.getName());
			preparedStatement.setInt(2, stock.getQuantity());
			preparedStatement.setDouble(3, stock.getPrice());
			preparedStatement.setInt(4, id);

			stockUpdated = preparedStatement.executeUpdate() > 0;
		}
		return stockUpdated;
	}
	
	public boolean deleteStockById(int id) throws SQLException {
		boolean stockDeleted;
		try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(DELETE_STOCK);) {
			preparedStatement.setInt(1, id);

			stockDeleted = preparedStatement.executeUpdate() > 0;
		}
		return stockDeleted;
	}
}
