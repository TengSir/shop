package com.oracle.shop.control.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

import com.oracle.shop.model.dao.UserDAO;
import com.oracle.shop.model.dao.UserDAOImp;
import com.oracle.shop.model.javabean.User;
@WebServlet(urlPatterns="/UserServlet")
public class UserServlet extends HttpServlet {
	//如果本类中多个方法都要用一个对象，那么可以将它声明为全局的(例如dao对象)
	private UserDAO  userDAO;
	
	@Override
	public void init() throws ServletException {
		userDAO=new UserDAOImp();
	}
	
	/**
	 * servlet命名应该跟对象有关，例如处理user的servlet，应该叫做userServlet
	 * 而且为了体现一个servlet组件的复用性，应该是把所有跟这个对象有关的后台方法都定义在
	 * 相关的这个servlet里面，前端通过url传参的方式让后台识别到底调用能个方法。
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String  methodName=request.getParameter("method");
		switch(methodName)
		{
			case"login":{
				login(request,response);
				break;
			}
			case"register":{
				register(request, response);
				break;
			}
			case "logoff":{
				logoff(request,response);
				break;
			}
			case "loadUserInfo":{
				loadUserInfo(request,response);
				break;
			}case "loadUserAddressInfo":{
				loadUserAddressInfo(request,response);
				break;
			}case "update":{
				try {
					update(request,response);
				} catch (FileUploadException e) {
					e.printStackTrace();
				}
				break;
			}case "checkUsername":{
					checkUsername(request,response);
				break;
			}
		}
	}
	
	protected void checkUsername(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String  inputUsername=request.getParameter("username");
		boolean  has=userDAO.checkUsernameExsist(inputUsername);
		
		PrintWriter  out=response.getWriter();//获取后台响应的对象的输出流
		if(has==true)
		{
			out.write("true");
		}else
		{
			out.write("false");
		}
		out.flush();
		out.close();
	}
	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, FileUploadException {
		request.setCharacterEncoding("UTF-8");
		String userid=null,username=null,password=null,realname=null,sex=null,age=null,image=null;
		if(ServletFileUpload.isMultipartContent(request))//判断这个提交过来的数据是不是按照文件上传编码的格式
		{
			FileItemFactory  f=new DiskFileItemFactory();
			
			ServletFileUpload  upload=new ServletFileUpload(f);
			
			upload.setFileSizeMax(1024*1024*5);
			
			List<FileItem>  files=upload.parseRequest(request);//用fileupload解析表单中的元素
			for(FileItem  file:files)
			{
				if(file.getFieldName().equals("userid"))
				{
					userid=file.getString();
				}else if(file.getFieldName().equals("username"))
				{
					username=file.getString();
					username=new String(username.getBytes("ISO8859-1"),"UTF-8");
				}else if(file.getFieldName().equals("password"))
				{
					password=file.getString();
				}else if(file.getFieldName().equals("realname"))
				{
					realname=file.getString();
					realname=new String(realname.getBytes("ISO8859-1"),"UTF-8");
				}else if(file.getFieldName().equals("sex"))
				{
					sex=file.getString();
				}else if(file.getFieldName().equals("age"))
				{
					age=file.getString();
				}else if(file.getFieldName().equals("image"))
				{
					//如果判断到该item是文件对象，则需要用io流讲这个文件读取到指定的位置
					InputStream  in=file.getInputStream();
					String path=request.getRealPath("images/userImages/upload");
					String uuidName=UUID.randomUUID().toString();
					StringBuffer  childPath=new StringBuffer("/");
					for(int n=0;n<5;n++)
					{
						childPath.append(uuidName.charAt(n)+"/");
					}
					String  fileName=uuidName+".jpg";
					File newPath=new File(path+childPath);
					if(!newPath.exists())newPath.mkdirs();
					File  ff=new File(newPath,fileName);
					OutputStream  out=new FileOutputStream(ff);
					int len=-1;
					byte[] bytes=new byte[1024*1024];
					while((len=in.read(bytes))!=-1)
					{
						out.write(bytes, 0, len);
					}
					out.flush();
					out.close();
					in.close();
					image="images/userImages/upload"+childPath+fileName;
				}
			}
		}
		User  user=new User(Integer.parseInt(userid), username, password, realname, sex, Integer.parseInt(age), image, true);
		
		boolean b=userDAO.update(user);
		
		User newUser=userDAO.getUserInfoByUserId(userid);
		request.getSession().setAttribute("loginedUser", newUser);
		if(b)
		{
			request.setAttribute("updateResult", "<b style='color:green'>修改成功!</b>");
		}else
		{
			request.setAttribute("updateResult", "<b style='color:red'>修改失败!</b>");
		}
		request.setAttribute("user",newUser);//移除session里面存储的用户信息
		request.getRequestDispatcher("profile.jsp").forward(request, response);
	}
	protected void loadUserInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userid=request.getParameter("userid");
		User user=userDAO.getUserInfoByUserId(userid);
		request.setAttribute("user",user);//移除session里面存储的用户信息
		request.getRequestDispatcher("profile.jsp").forward(request, response);
	}
	protected void loadUserAddressInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userid=request.getParameter("userid");
		User user=userDAO.getUserInfoByUserId(userid);
		request.setAttribute("user",user);//移除session里面存储的用户信息
		if(request.getParameter("editOrder")==null)
		{
			request.getRequestDispatcher("address.jsp").forward(request, response);
		}else
		{
			request.getRequestDispatcher("editOrder.jsp").forward(request, response);
		}
	}
		protected void logoff(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			request.getSession().removeAttribute("loginedUser");//移除session里面存储的用户信息
			response.sendRedirect("index.jsp");
		}
	/**
	 * 这是处理登陆业务的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//这个jsp里面只定义了一个书写java代码的脚本片段，用来处理登陆功能，不提供任何html显示功能
		request.setCharacterEncoding("UTF-8");
		
		String code=request.getParameter("code");
		String systemCode=request.getSession().getAttribute("code").toString();
		if(code.equals(systemCode))
		{

			
			//取上一个表单提交过来的数据(request)
			String u=request.getParameter("username");
			String p=request.getParameter("password");
			//调用dao 的方法查询该用户名和密码是不是存在
			User user=userDAO.login(u, p);
			//判断该user是否使null，然后执行页面跳转功能
			if(user==null)
			{
				request.setAttribute("errorMessage", "用户名和密码不正确!");
				
//			  	request.getRequestDispatcher("account.jsp").forward(request, response);//转发
					response.sendRedirect("account.jsp");//重定向
			}else
			{
				
				if(request.getParameterValues("isRemember")!=null)
				{
					//将用户名和密码存到cookie里面吧
					Cookie  username=new Cookie("username", u);
					username.setMaxAge(60*60*24*3);
//					username.setComment("这是存储用户名的cookie");
//					username.setDomain("oracle");
					Cookie  password=new Cookie("password", p);
//					password.setComment("这是存储密码的cookie");
					password.setMaxAge(60*60*24*3);
					
//					password.setDomain("oracle");
					response.addCookie(username);
					response.addCookie(password);
				}else
				{
					Cookie  password=new Cookie("password", "");
//					password.setComment("这是存储密码的cookie");
					password.setMaxAge(0);
					
//					password.setDomain("oracle");
					response.addCookie(password);
				}
				//servlet中获取session,是要用request.getSession()
				request.getSession().setAttribute("loginedUser", user);
//			 	request.setAttribute("loginedUser", user);
				//request.getRequestDispatcher("index.jsp").forward(request, response);//页面跳转
				response.sendRedirect(response.encodeRedirectURL("index.jsp"));//页面跳转
				//request转发 ，response重定向
			}
		}else
		{
			request.setAttribute("errorMessage", "验证码不正确!");
			
		  	request.getRequestDispatcher("account.jsp").forward(request, response);//转发
//				response.sendRedirect("account.jsp");//重定向
		}
	}
	
	/**
	 * 这是处理注册业务的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//取注册页面上用户输入的数据
		String username=request.getParameter("username").toString();
		username=new String(username.getBytes("ISO8859-1"),"UTF-8");
		String password=request.getParameter("password");
		String realname=request.getParameter("realname").toString();
		realname=new String(realname.getBytes("ISO8859-1"),"UTF-8");
		String age=request.getParameter("age");
		String sex=request.getParameter("sex");
		String status=request.getParameter("status");
		
		//因为dao方法里面要求的是一个user对象，可以我们从表单上去到的是单独的属性，则先应该把所有的数据
		//封装成一个user对象，再调用dao
		User  willRegisterUser=new User(0, username, password, realname, sex, Integer.parseInt(age), "images/image1.jpg", true);
		//调用dao执行注册功能
		boolean  registerResult=userDAO.add(willRegisterUser);
		//根据注册dao方法返回的结果，跳转页面
		if(registerResult)
		{
			response.sendRedirect("account.jsp");
		}else
		{
			response.sendRedirect("register.jsp");
		}
		
	}

}
