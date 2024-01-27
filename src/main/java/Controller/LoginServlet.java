package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import Impl.CustomerDaoImpl;
import Impl.LoginDaoImpl;
import POJO.Customer;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	LoginDaoImpl limpl = new LoginDaoImpl();
	RequestDispatcher rd = null;
	HttpSession session = null;
	
	boolean flag;
	String msg, login, errormsg;
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		String Username = request.getParameter("username");
		String Password = request.getParameter("password");
		
		session = request.getSession();
		
		flag = limpl.userLogin(Username, Password);
		
		if(flag)
		{
			login = "customer";
			Customer c = new CustomerDaoImpl().searchByEmailId(Username);
			
//			out.println("Login successfully.....");
			msg = "welcome to our website ";
			
			session.setAttribute("login", login);
			request.setAttribute("msg", msg);
			session.setAttribute("username", Username);
			
			rd = request.getRequestDispatcher("MyIndex.jsp");
			rd.forward(request, response);
		}
		else
		{
			flag = limpl.adminLogin(Username, Password);
			
			if(flag)
			{
				login = "admin";
				
				msg = "welcome to our website";
				
				session.setAttribute("login", login);
				request.setAttribute("msg", msg);
				session.setAttribute("username", Username);
				
				rd = request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
				
			}
			else
			{
				login = null;
				errormsg = "Error.....";
				
				request.setAttribute("errormsg", errormsg);
				session.setAttribute("login", login);
				
				rd = request.getRequestDispatcher("Login.jsp");
				rd.forward(request, response);
				
			}
		}
		
	}

}
