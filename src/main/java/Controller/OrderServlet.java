package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import Impl.OrderDaoImpl;
import POJO.OrderFood;

/**
 * Servlet implementation class OrderServlet
 */
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private int orderId;
	private LocalDateTime orderDate;
	private double totalBill;
	private String emailId;
	private String orderStatus;
	
	Boolean flag;

	RequestDispatcher rd;
	HttpSession session;

	OrderFood o;
	List<OrderFood> olist;
	OrderDaoImpl oimpl=new OrderDaoImpl();
	
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String Process=request.getParameter("process");
		session=request.getSession();

		if(Process!=null && Process.equals("myOrders")) {
			emailId=(String)session.getAttribute("username");

			olist=oimpl.showMyOrderHistory(emailId);

			if(olist==null || olist.isEmpty()) {

				request.setAttribute("errormsg", "You have not ordered anything till now!!!");

				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
			}
			else {

				request.setAttribute("msg", "Your orders....");

				session.setAttribute("olist", olist);
				rd=request.getRequestDispatcher("OrderList.jsp");
				rd.forward(request, response);
			}

		}
		else if(Process!=null && Process.equals("placeOrder")) {

			emailId=(String) session.getAttribute("username");
			orderStatus="Order confirmed";

			o=new OrderFood();
			o.setEmailId(emailId);
			o.setOrderStatus(orderStatus);

			flag=oimpl.placeOrder(o);

			if(flag) {

				request.setAttribute("msg", "Your order has been placed successfully!!");

				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
			}
			else {

				request.setAttribute("errormsg", "Error while placing order");

				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Process = request.getParameter("process");
		session=request.getSession();

		if(Process!=null && Process.equals("placeOrder")) {

			emailId=(String) session.getAttribute("username");
			orderStatus="Order confirmed";

			o=new OrderFood();
			o.setEmailId(emailId);
			o.setOrderStatus(orderStatus);

			flag=oimpl.placeOrder(o);

			if(flag) {

				request.setAttribute("msg", "Your order has been placed successfully!!");

				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
			}
			else {

				request.setAttribute("errormsg", "Error while placing order");

				rd=request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
			}
		}
	}

}
