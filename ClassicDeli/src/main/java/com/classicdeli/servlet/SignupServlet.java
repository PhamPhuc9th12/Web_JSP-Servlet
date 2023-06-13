package com.classicdeli.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classicdeli.connect.ClassicDeliDB;
import com.classicdeli.dao.PositionDAO;
import com.classicdeli.dao.UserDAO;
import com.classicdeli.model.Position;
import com.classicdeli.model.Users;

import encode.EncodeSHA;


/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/user-signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("signup.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try{
			String phone = request.getParameter("phone");
			String name = request.getParameter("name");
			String password = request.getParameter("pass");
			String address = request.getParameter("address");
			int check_invalid_form = 0 ;
			try {
				UserDAO uDao = new UserDAO(ClassicDeliDB.getConnection());
				PositionDAO posDao = new PositionDAO(ClassicDeliDB.getConnection());
					if (!phone.matches("\\d{10}")) {
	                	String msg = "Invalid phone number format";
	                	request.setAttribute("msg", msg);
	                	request.getRequestDispatcher("signup.jsp").forward(request, response);
	                	check_invalid_form +=1;
	                }
	                if (password.length() < 8 || !password.matches(".*[A-Z].*")) {
	                	String msg1 = "Password must be at least 8 characters long";
	                	String msg2 = "and contain at least 1 uppercase letter";
	                	request.setAttribute("msg1", msg1);
	                	request.setAttribute("msg2", msg2);
	                	request.getRequestDispatcher("signup.jsp").forward(request, response);
	                	check_invalid_form += 1;
	                }
	                
	                if(check_invalid_form == 0) {
	                	Users users = uDao.userSignup(name, phone, EncodeSHA.transFer(password), address);
	                	
	 	               	Position pos = posDao.setPositions(uDao.getIdUser(phone).getuId());
	                	if(users != null) {
	 						response.sendRedirect("login.jsp");
	 					}else {
	 						String msg4 = "Phone number already exists";
	 						request.setAttribute("msg4", msg4);
	 						request.getRequestDispatcher("signup.jsp").forward(request, response);
	 					}
	                }
	               
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}