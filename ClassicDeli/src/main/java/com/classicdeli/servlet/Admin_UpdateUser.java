package com.classicdeli.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classicdeli.connect.ClassicDeliDB;
import com.classicdeli.dao.ProductDAO;
import com.classicdeli.dao.UserDAO;

@WebServlet("/admin-update-user")
public class Admin_UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			response.setContentType("text/html;charset=UTF-8");
			int uId = Integer.parseInt(String.valueOf(request.getParameter("uId")));
			request.setAttribute("uId", uId);
			request.getRequestDispatcher("udND.jsp").forward(request, response);
		}
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			response.setContentType("text/html;charset=UTF-8");
			
			int uId = Integer.parseInt(String.valueOf(request.getParameter("uId")));
				String uName = request.getParameter("Uname");
				String uPhone = request.getParameter("Uphone");
				/* String uPass = request.getParameter("Upass"); */
				String uAddress = request.getParameter("Uaddress");
				UserDAO ud = new UserDAO(ClassicDeliDB.getConnection());
				
				ud.UpdateUser(uId,uName, uPhone,uAddress);
				response.sendRedirect("qluser.jsp");
			
			
		} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
			
		}
	
	
			
	}


