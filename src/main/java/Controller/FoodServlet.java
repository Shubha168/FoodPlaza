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

import Impl.FoodDaoImpl;
import POJO.Food;

/**
 * Servlet implementation class FoodServlet
 */
public class FoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	int foodId;
	String foodName;
	String foodType;
	String foodCategory;
	String foodDesc;
	double foodPrice;
	String image;
	boolean flag;
	String msg;
	String errormsg;
	
	Food f = null;
	FoodDaoImpl fimpl = new FoodDaoImpl();
	RequestDispatcher rd = null;
	HttpSession session = null;
	List<Food> flist = null;
	
    public FoodServlet() {
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
		
		if(Process != null && Process.equals("allFood"))
		{
			flist = fimpl.getAllFood();
			session.setAttribute("flist", flist);
			
			response.sendRedirect("FoodList.jsp");
		}
		else if(Process != null && Process.equals("updateFood"))
		{
			foodId = Integer.parseInt(request.getParameter("foodId"));
			
			f = fimpl.searchFood(foodId);
			
			session.setAttribute("foodObj", f);
			response.sendRedirect("UpdateFood.jsp");
		}
		else if(Process != null && Process.equals("deleteFood"))
		{
			foodId = Integer.parseInt(request.getParameter("foodId"));
			
			flag = fimpl.deleteFood(foodId);
			
			if(flag)
			{
				msg = "Food Item delete to database successfully";
				request.setAttribute("msg", msg);
				
				flist = fimpl.getAllFood();
				session.setAttribute("flist", flist);
				
				rd = request.getRequestDispatcher("FoodList.jsp");
				rd.forward(request, response);
				
			}
			else
			{
				errormsg = "Error.....";
				request.setAttribute("errormsg", errormsg);
				rd = request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String process = request.getParameter("process");
		
		if(process!=null && process.equals("addFood"))
		{
			foodName = request.getParameter("foodName");
			foodCategory = request.getParameter("foodCategory");
			foodDesc = request.getParameter("foodDesc");
			foodPrice = Double.parseDouble(request.getParameter("foodPrice"));
			foodType = request.getParameter("foodType");
			image = request.getParameter("image");
			f = new Food();
			f.setFoodName(foodName);
			f.setFoodCategory(foodCategory);
			f.setFoodDesc(foodDesc);
			f.setFoodPrice(foodPrice);
			f.setFoodType(foodType);
			f.setImage(image);
			
			flag = fimpl.addFood(f);
			
			if(flag)
			{
//				out.println("Food item added to database successfully.........");
				msg = "Food item added to database successfully.........";
				request.setAttribute("msg", msg);
				rd = request.getRequestDispatcher("MyIndex.jsp");
				rd.include(request, response);
			}
			else
			{
//				out.println("Error.....");
				errormsg = "Error......";
				request.setAttribute("errormsg", errormsg);
				rd = request.getRequestDispatcher("addfood.jsp");
				rd.include(request, response);
			}
		}
		else if(process != null && process.equals("editFood"))
		{
			foodName = request.getParameter("foodName");
			foodCategory = request.getParameter("foodCategory");
			foodDesc = request.getParameter("foodDesc");
			foodPrice = Double.parseDouble(request.getParameter("foodPrice"));
			foodType = request.getParameter("foodType");
			foodId = Integer.parseInt(request.getParameter("foodId"));
			image = request.getParameter("image");
			f = new Food(foodId, foodName, foodCategory, foodDesc, foodType, foodPrice, image);
			
			flag = fimpl.updateFood(f);
			
			if(flag)
			{
//				out.println("Update Food Item Successfully");
				msg = "Update Food Item Successfully";
				request.setAttribute("msg", msg);
				
				flist = fimpl.getAllFood();
				session.setAttribute("flist", flist);
				
				rd = request.getRequestDispatcher("FoodList.jsp");
				rd.forward(request, response);
				
			}
			else
			{
//			    out.println("Faild to Update Food Item");
				
				errormsg = "Faild to Update Food Item";
				request.setAttribute("errormsg", errormsg);
				
				rd = request.getRequestDispatcher("MyIndex.jsp");
				rd.forward(request, response);
			}
		}
		else if(process != null && process.equals("deleteFood"))
		{
			foodId = Integer.parseInt(request.getParameter("foodID"));
			
			f = new Food();
			 
			flag = fimpl.deleteFood(foodId);
			
			if(flag)
			{
				out.println("Delete Food Item Successfully....");
			}
			else
			{
				out.println("Failed to delete Food Item....");
			}
		}
	}

}
