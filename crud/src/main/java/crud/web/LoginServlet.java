package crud.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crud.dao.CrudDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CrudDao crudDao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        this.crudDao = new CrudDao();
        // TODO Auto-generated constructor stub
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	System.out.println("JALAN KOK");
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("login/action jalan");
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        String test = crudDao.validateUser(username,password);
        if(test.equals("SUCCESS")) {
        	RequestDispatcher dispatcher = request.getRequestDispatcher("servlet2");
        	dispatcher.forward(request, response);
        } else {
        	request.setAttribute("errMsg", test);
        	RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
        	dispatcher.forward(request, response);
        }
	}

}
