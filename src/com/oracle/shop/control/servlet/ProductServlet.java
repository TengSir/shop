package com.oracle.shop.control.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.oracle.shop.model.dao.ProductDAO;
import com.oracle.shop.model.dao.ProductDAOImp;
import com.oracle.shop.model.javabean.PageBean;
import com.oracle.shop.model.javabean.Product;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private ProductDAO productDAO;
	@Override
	public void init() throws ServletException {
		productDAO=new ProductDAOImp();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		switch (method) {
		case "listProductByType":{

			listProductByType(request, response);
			break;

		}
		case "listProductByPage":{

			listProductByPage(request, response);
			break;

		}
		case "loadProductDetailInfo":{
			
			loadProductDetailInfo(request, response);
			break;
			
		}case "addProductToShopcar":{
			
			addProductToShopcar(request, response);
			break;
			
		}case "searchProduct":{
			
			searchProduct(request, response);
			break;
			
		}case "deleteProductFromShopCar":{
			
			deleteProductFromShopCar(request, response);
			break;
			
		}case "ajaxSearch":{
			
			ajaxSearch(request, response);
			break;
			
		}
		default:
			break;
		}
	}
	protected void ajaxSearch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String key=request.getParameter("key");
		ArrayList<String> names=productDAO.ajaxSearch(key);
		response.setContentType("text/html;charset=utf-8");//text-  xml
		PrintWriter  out=response.getWriter();
		
		StringBuffer b=new StringBuffer("[");
		for (String  name:names) {
				b.append("\""+name+"\",");
		}
		b.delete(b.length()-1, b.length());
		b.append("]");
		out.write(b.toString());
		out.flush();
		out.close();
	}
	protected void listProductByType(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String typeName=request.getParameter("type");
		List<Product>  ps=productDAO.listAllByProductType(typeName);
		request.setAttribute("ps", ps);
		request.getRequestDispatcher("products.jsp").forward(request, response);
	}
	protected void deleteProductFromShopCar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String  productId=request.getParameter("productId");
		HashMap<Product, Integer> shopCars=(HashMap<Product, Integer>)request.getSession().getAttribute("shopCars");
		float total=Float.parseFloat(request.getSession().getAttribute("total").toString());
		
		if(productId.indexOf(",")==-1)
		{
			for(Product  p:shopCars.keySet())
			{
				if(p.getId()==Integer.parseInt(productId))
				{
					total-=p.getBasicprice()*(1-p.getDiscount())*shopCars.get(p);
					shopCars.remove(p);
					break;
				}
			}
		}else
		{
			String[]  ids=productId.split(",");
			for(String id:ids){
				for(Product  p:shopCars.keySet())
				{
					if(p.getId()==Integer.parseInt(id))
					{
						total-=p.getBasicprice()*(1-p.getDiscount())*shopCars.get(p);
						shopCars.remove(p);
						break;
					}
				}
			}
		}
		
		
		
		request.getSession().setAttribute("total", total);
		response.sendRedirect("checkout.jsp");
		
	}
	protected void searchProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String key=request.getParameter("key");
		String page=request.getParameter("page");
		String count=request.getParameter("count");
		
		int  nowPage=Integer.parseInt(page);//当前页
		int firstPage=1;
		int allCount=productDAO.getAllProductCountBySearchKey(key);
		int wagePage=(allCount%Integer.parseInt(count)==0)?(allCount/Integer.parseInt(count)):(allCount/Integer.parseInt(count)+1);
		int nextPage=nowPage==wagePage?wagePage:(nowPage+1);
		int previousPage=nowPage==1?1:(nowPage-1);
		
		PageBean  p=new PageBean(Integer.parseInt(count), nowPage, nextPage, previousPage, firstPage, wagePage, allCount);
		request.setAttribute("page", p);
		
		List<Product>  ps=productDAO.searchProduct(key,Integer.parseInt(page),Integer.parseInt(count));
		request.setAttribute("ps", ps);
		request.getRequestDispatcher("products.jsp").forward(request, response);
	}
	protected void listProductByPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page=request.getParameter("page");
		String count=request.getParameter("count");
		int  nowPage=Integer.parseInt(page);//当前页
		int firstPage=1;
		int allCount=productDAO.getAllProductCount();
		int wagePage=(allCount%Integer.parseInt(count)==0)?(allCount/Integer.parseInt(count)):(allCount/Integer.parseInt(count)+1);
		int nextPage=nowPage==wagePage?wagePage:(nowPage+1);
		int previousPage=nowPage==1?1:(nowPage-1);
		
		if(request.getParameter("ajax")==null)
		{
			PageBean  p=new PageBean(Integer.parseInt(count), nowPage, nextPage, previousPage, firstPage, wagePage, allCount);
			request.setAttribute("page", p);
			List<Product>  ps=productDAO.listAllProduct(Integer.parseInt(page), Integer.parseInt(count));
			request.setAttribute("ps", ps);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else
		{
			List<Product>  ps=productDAO.listAllProduct(Integer.parseInt(page), Integer.parseInt(count));
			response.setContentType("text/json;charset=utf-8");
			PrintWriter out=response.getWriter();
			JSONArray  pps=new JSONArray();
			try {
				for(Product p:ps)
				{
					JSONObject  o=new JSONObject();
					o.put("id", p.getId());
					o.put("name", p.getName());
					o.put("brand", p.getBrand());
					o.put("price", p.getBasicprice());
					o.put("description", p.getDescription());
					o.put("firstImage", p.getFirstImage());
					o.put("discount", p.getDiscount());
					pps.put(o);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			out.write(pps.toString());
			out.flush();
			out.close();
		}
		
	}
	protected void loadProductDetailInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=request.getParameter("id");//product id
		Product p=productDAO.getProductDetailInfoById(Integer.parseInt(id));
		request.setAttribute("p", p);//load data  save data 
		request.getRequestDispatcher("single.jsp").forward(request, response);
		
	}
	protected void addProductToShopcar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=request.getParameter("productId");
		String count=request.getParameter("count");
		HttpSession  session=request.getSession();
		Product  p=productDAO.getProductDetailInfoById(Integer.parseInt(id));
		HashMap<Product, Integer>  shopCars=null;
		float total=0;
		if(session.getAttribute("shopCars")==null)
		{
			shopCars=new HashMap<>();
			shopCars.put(p, Integer.parseInt(count));
			total=p.getBasicprice()*(1-p.getDiscount())*Integer.parseInt(count);
		}else
		{	total=Float.parseFloat(session.getAttribute("total").toString());
			shopCars=(HashMap<Product, Integer>)session.getAttribute("shopCars");
			if(shopCars.containsKey(p)){
				shopCars.put(p,shopCars.get(p)+Integer.parseInt(count));
				total+=Integer.parseInt(count)*p.getBasicprice()*(1-p.getDiscount());
			}else
			{
				shopCars.put(p, Integer.parseInt(count));
				total+=p.getBasicprice()*(1-p.getDiscount())*Integer.parseInt(count);
			}
		}
		session.setAttribute("total", total);
		session.setAttribute("shopCars", shopCars);
		response.sendRedirect("checkout.jsp");
		
	}

}
