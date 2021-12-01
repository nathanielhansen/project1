package crud.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crud.dao.CrudDao;
import crud.model.T_STOCK;
import crud.model.T_USERS;
import crud.model.V_STOCK;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CrudDao crudDao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        this.crudDao = new CrudDao();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET JALAN");
		
		String action = request.getServletPath();
		System.out.println(action);
		
		try {
			switch (action) {
			case "/create":
		        viewCreatePage(request,response);
				break;
			
			case "/insert":
				insertNewStock(request,response);
				break;
				
			case "/update":
				String update = request.getParameter("update");
				String delete = request.getParameter("delete");
				System.out.println(update);
				System.out.println(delete);
				if(update != null) {
					updateStock(request,response);
					break;
				} else if(delete != null) {
					deleteStock(request,response);
					break;
				}
//				updateStock(request,response);
//				break;
			default:
				showList(request,response);
				break;
			}
		} catch (Exception e) {
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}
	
	private void viewCreatePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("create.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<V_STOCK> listStock = crudDao.getViewStock();
		for(V_STOCK items: listStock) {
			System.out.println(items.getId() + " " + items.getName() + " " + items.getPrice() + " " + items.getQuantity());
		}
		if(listStock.isEmpty()) {
			request.setAttribute("isNull", "true");
		} else {
			request.setAttribute("isNull", "false");
		}
		
		request.setAttribute("listStock", listStock);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
        dispatcher.forward(request, response);
	}
	
	private void insertNewStock(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String productName = request.getParameter("name");
		String quantity = request.getParameter("quantity");
		int productQuantity = Integer.parseInt(quantity);
		String price = request.getParameter("price");
		double productPrice = Double.parseDouble(price);
		
		T_STOCK tStock = new T_STOCK(0, productName, productQuantity, productPrice);
		crudDao.insertStock(tStock);
		response.sendRedirect("list");
	}
	
	private void updateStock(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("updatedId"));
		String name = request.getParameter("name");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		double price = Double.parseDouble(request.getParameter("price"));
		
		T_STOCK tStock = new T_STOCK(0, name, quantity, price);
		boolean success = crudDao.updateStockById(tStock, id);
		if(success) {
			System.out.println("success");
		}else {
			System.out.println(success);
		}
		response.sendRedirect("list");
	}
	
	private void deleteStock(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("updatedId"));
		
		boolean success = crudDao.deleteStockById(id);
		if(success) {
			System.out.println("success");
		} else {
			System.out.println(success);
		}
		response.sendRedirect("list");
	}

}
