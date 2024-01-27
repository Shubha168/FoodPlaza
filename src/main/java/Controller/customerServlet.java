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
import POJO.Customer;


public class customerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 String custName;
	 String emailId;
	 String custPassword;
	 String custAddress;
	 String contactNo;
	 String custLocation;
	 
	 Boolean flag;
	 HttpSession session = null;
	 
	 String login, msg, errormsg;

	 Customer c1 = null;
	 CustomerDaoImpl cimpl = new CustomerDaoImpl();
	 RequestDispatcher rd = null;
	 
    public customerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String Process = request.getParameter("process");
		session = request.getSession();
		
		if(Process != null && Process.equals("updateProfile"))
		{
			emailId = (String)session.getAttribute("username");
			
			c1 = cimpl.searchByEmailId(emailId);
			
			session.setAttribute("custObj", c1);
			response.sendRedirect("UpdateCustomer.jsp");
			
		}
		else
		{
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		String Process = request.getParameter("process");
		
		if(Process!=null && Process.equals("custRegister"))
		{
			custName=request.getParameter("custName");
			emailId=request.getParameter("custEmail");
			custPassword=request.getParameter("custPass");
			custAddress=request.getParameter("custAddress");
			contactNo=request.getParameter("custContact");
			custLocation=request.getParameter("custLocation");
			
			c1=new Customer();
			c1.setCustName(custName);
			c1.setEmailId(emailId);
			c1.setCustPassword(custPassword);
			c1.setCustAddress(custAddress);
			c1.setContactNo(contactNo);
			c1.setCustLocation(custLocation);
			
			flag=cimpl.addCustomer(c1);
			
			if(flag)
			{
				//out.print("Registration successful!!! Now you can login....");
				msg = "Registration successful....";
				request.setAttribute("msg", msg);
				
				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
			}
			else
			{
				//out.print("Error while registration....");
				errormsg = "Error while registration....";
				request.setAttribute("errorMsg", errormsg);
				
				rd=request.getRequestDispatcher("AddFood.jsp");
				rd.forward(request, response);
			}
		}
		else if(Process!=null && Process.equals("editCustomer")) // code is remaining for update customer
		{
			custName=request.getParameter("custName");
			emailId=request.getParameter("custEmail");
			custPassword=request.getParameter("custPass");
			custAddress=request.getParameter("custAddress");
			contactNo=request.getParameter("custContact");
			custLocation=request.getParameter("custLocation");
			
			c1=new Customer(custName,emailId,custPassword,custAddress,contactNo,custLocation);
			flag=cimpl.updateCustomer(c1);
			
			if(flag)
			{
				msg = "Update Customer Item Successfully";
				request.setAttribute("msg", msg);
				
				rd = request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
			}
			else
			{
				
				errormsg = "Faild to Update Customer Item";
				request.setAttribute("errormsg", errormsg);
				rd = request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
			}
			
		}    
	}

}
