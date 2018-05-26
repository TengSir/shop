package com.oracle.shop.control.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.shop.model.dao.OrderDAO;
import com.oracle.shop.model.dao.OrderDAOImp;
import com.oracle.shop.model.javabean.Address;
import com.oracle.shop.model.javabean.Order;
import com.oracle.shop.model.javabean.Product;
import com.oracle.shop.model.javabean.User;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private OrderDAO orderDAO;
    public OrderServlet() {
    	orderDAO=new OrderDAOImp();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String method=request.getParameter("method");
		switch (method) {
		case "addOrder":
		{
			addOrder(request,response);
			break;
		}case "clearShopCar":
		{
			clearShopCar(request,response);
			break;
		}case "loadOrderById":
		{
			loadOrderById(request,response);
			break;
		}case "listAllOrdersByUserid":
		{
			listAllOrdersByUserid(request,response);
			break;
		}
		default:
			break;
		}
	}
	/**
	 * 这个方法出生成订单的业务方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void addOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//订单id(自动生成),时间(自动生成)，状态(默认就是未发货)，userid(session)，addressid
		request.setCharacterEncoding("UTF-8");
		String  addressid=request.getParameter("address");
		int userid=((User)request.getSession().getAttribute("loginedUser")).getUserid();
		String nowDate=new Date().toLocaleString();
		int status=1;//1代表未发货
		String message=request.getParameter("message");
		String orderId=UUID.randomUUID().toString();
		Order  o=new Order(orderId,nowDate,status,message,new Address(Integer.parseInt(addressid)),userid);
		boolean  saveStatus=orderDAO.saveOrder(o, (HashMap<Product, Integer>)request.getSession().getAttribute("shopCars"));
		
		if(saveStatus)
		{
			request.getSession().removeAttribute("total");
			request.getSession().removeAttribute("shopCars");
			response.sendRedirect("OrderServlet?method=loadOrderById&orderId="+orderId);
		}else
		{
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("失败");
		}
	}
	protected void clearShopCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("shopCars");
		request.getSession().removeAttribute("total");
		response.sendRedirect("checkout.jsp");
	}
	protected void loadOrderById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderId=request.getParameter("orderId");
		Order o=orderDAO.loadOrderById(orderId);
		request.setAttribute("o", o);
		request.getRequestDispatcher("orders.jsp").forward(request, response);
	}
	protected void listAllOrdersByUserid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid=request.getParameter("userid");
		ArrayList<Order> os=orderDAO.listAllOrdersByUserid(userid);
		request.setAttribute("orders", os);
		request.getRequestDispatcher("orders.jsp").forward(request, response);
	}

}
