package com.oracle.shop.control.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.Date;
import java.util.Enumeration;
import java.util.Locale;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UtilServlet
 */
@WebServlet("/UtilServlet")
public class UtilServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		switch (method) {
		case "generateCode":{//
			generateCode(request,response);
			break;
		}
		case "changeLocale":{//
			changeLocale(request,response);
			break;
		}
		case "processChat":{//
			processChat(request,response);
			break;
		}
		case "loadChatMessage":{//
			loadChatMessage(request,response);
			break;
		}
		default:
			break;
		}
		
        
	}
	protected void processChat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String date=new Date().toLocaleString();
		String words=request.getParameter("words");
		String fullMessage="\""+username+"\": "+date+"\r\n"+words;
		request.getServletContext().setAttribute("message",fullMessage);
		
		 response.setContentType("text/html;charset=utf-8");
		 PrintWriter out=response.getWriter();
		 out.write(fullMessage);
		 out.flush();
	}
	protected void loadChatMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		if(request.getServletContext().getAttribute("message")!=null)
		{
		 out.write(request.getServletContext().getAttribute("message").toString());
		}
		out.write("");
		out.flush();
	}
	protected void changeLocale(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String locale=request.getParameter("language");
		String url=URLDecoder.decode(request.getParameter("url"));
		request.getSession().setAttribute("Locale", locale);
		response.sendRedirect(url);
	}
	protected void generateCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("image/jpg");//设置相应的内容类型
		response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        
        BufferedImage  im=new BufferedImage(100, 40, Image.SCALE_DEFAULT);
        
        Graphics  g=im.getGraphics();
        
        g.setColor(Color.white);
        
        g.fillRect(0, 0, 100, 40);
        
        int  x=5;
       
        StringBuffer  code=new StringBuffer();
        for(int n=0;n<5;n++)
        {
        	g.setColor(new Color(new Random().nextInt(255), new Random().nextInt(255), new Random().nextInt(255)));
        	
        	g.fillRect(new Random().nextInt(100), new Random().nextInt(40), new Random().nextInt(10),new Random().nextInt(10));
        	g.drawLine(new Random().nextInt(100), new Random().nextInt(40), new Random().nextInt(100), new Random().nextInt(40));
        }
        for(int n=0;n<6;n++)
        {
        	int randomTextSize=new Random().nextInt(25)+20;
        	if(new Random().nextInt(2)==1)
        	{
        		g.setFont(new Font("宋体", Font.BOLD, randomTextSize));
        	}else 
        	{
        		if(new Random().nextInt(2)==2)
            	{
            		g.setFont(new Font("黑体", Font.ITALIC, randomTextSize));
            	}else
            	{
            		g.setFont(new Font("楷体", Font.PLAIN, randomTextSize));
            	}
        	}
        	int randomNum=new Random().nextInt(10);
        	code.append(randomNum);
        	request.getSession().setAttribute("code", code);//将生成的验证码存储到session中，方便登陆的servlet访问这个系统生成的验证码
        	g.setColor(new Color(new Random().nextInt(255), new Random().nextInt(255), new Random().nextInt(255)));
        	
        	g.drawString(randomNum+"", x, 30);
        	x+=randomTextSize/2;
        }
        
        ImageIO.write(im, "jpg", response.getOutputStream());
        response.getOutputStream().flush();
        response.getOutputStream().close();
	}

}
