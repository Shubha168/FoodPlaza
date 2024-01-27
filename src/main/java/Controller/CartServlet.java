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
import java.util.List;

import Impl.CartDaoImpl;
import Impl.FoodDaoImpl;
import POJO.Cart;
import POJO.Food;

/**
 * Servlet implementation class CartServlet
 */
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private int cartid;
	private int foodid;
	private String cEmail;
	private int fquantity;
	private String fname;
	private double fprice;
	private double totalPrice;
	
	HttpSession session = null;
	List<Food> flist;
	List<Cart> clist;
	RequestDispatcher rd = null;
	boolean flag;
	Cart c = null;
	CartDaoImpl cimpl = new CartDaoImpl();
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Process = request.getParameter("process");
		session = request.getSession();
		
		if(Process != null && Process.equals("addToCart"))
		{
			foodid = Integer.parseInt(request.getParameter("foodId"));
			flag = cimpl.getFoodIdFromCart(foodid);
			 
			fquantity = 1;
			
			c = new Cart();
			c.setFoodid(foodid);
			c.setFquantity(fquantity);
			cEmail = (String)session.getAttribute("username");
			
			c.setcEmail(cEmail);
			
			flag = cimpl.addToCart(c);
			
			if(flag)
			{
				request.setAttribute("msg", "1 Item add successfully");
			}
			else
			{
				request.setAttribute("errormsg", "Errror");
			}
			
			flist = new FoodDaoImpl().getAllFood();
			
			session.setAttribute("flist", flist);
			
			rd = request.getRequestDispatcher("FoodList.jsp");
			rd.forward(request, response);
		}
		else if(Process != null && Process.equals("showMyCart"))
		{
			String email = (String)session.getAttribute("username");
			
			clist = cimpl.searchCartByEmailId(email);
			if(clist==null || clist.isEmpty())
			{
				request.setAttribute("errormsg", "Your Cart is empty...?");
				flist = new FoodDaoImpl().getAllFood();
				session.setAttribute("flist", flist);
				
				rd = request.getRequestDispatcher("FoodList.jsp");
				rd.forward(request, response);
			}
			else
			{
				session.setAttribute("clist", clist);
				response.sendRedirect("CartList.jsp");
			}
		}
		else if(Process != null && Process.equals("deleteCartItem"))
		{
			cartid = Integer.parseInt(request.getParameter("cartid"));
			
			flag = cimpl.deleteCartById(cartid);
			
			 if(flag)
			 {
				 request.setAttribute("msg", "Item deleted from cart");
			 }
			 else
			 {
				 request.setAttribute("errormsg", "Could not delete this Item. Please try again!!");
			 }
			 
			 clist= cimpl.searchCartByEmailId(cEmail);
			 if(clist==null || clist.isEmpty())
			 {
				 request.setAttribute("errormsg", "Your Cart is empty");
				 flist = new FoodDaoImpl().getAllFood();
				 session.setAttribute("flist", flist);
				 
				 rd = request.getRequestDispatcher("FoodList.jsp");
				 rd.forward(request, response);
			 }
			 else
			 {
				 session.setAttribute("clist", clist);
			     response.sendRedirect("CartList.jsp");
			 }
		}
		else if(Process!=null && Process.equals("clearCart"))
		{
			String email = (String) session.getAttribute("username");
			flag = cimpl.deleteCartByEmail(email);
			
			if(flag)
			{
				request.setAttribute("msg", "Your Cart is now empty");
				flist = new FoodDaoImpl().getAllFood();
				session.setAttribute("flist", flist);
				rd = request.getRequestDispatcher("FoodList.jsp");
				rd.forward(request, response);
			}
			else
			{
				request.setAttribute("errormsg", "Could not clear the cart. Please try again....");
				clist = cimpl.searchCartByEmailId(cEmail);
				session.setAttribute("clist", clist);
			     
			     rd = request.getRequestDispatcher("CartList.jsp");
				 rd.forward(request, response);
			}
		}
	}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String process=request.getParameter("process");
		session=request.getSession();
		
		PrintWriter pw=response.getWriter();

		if(process!=null && process.equals("updateCartQuantity")) {
			cartid=Integer.parseInt(request.getParameter("cartid"));
			fquantity=Integer.parseInt(request.getParameter("fquantity"));

			flag=cimpl.updateCart(cartid, fquantity);
			if(flag) {

				c=cimpl.searchCartById(cartid);
				totalPrice=c.getTotalPrice();
				pw.print(totalPrice);
			}

		}
	}

}
