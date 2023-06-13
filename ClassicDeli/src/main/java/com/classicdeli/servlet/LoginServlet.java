
package com.classicdeli.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classicdeli.connect.ClassicDeliDB;
import com.classicdeli.dao.*;
import com.classicdeli.model.Position;
import com.classicdeli.model.Users;

import encode.EncodeSHA;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/users-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()) {
			String phone = request.getParameter("contact");
			String password = request.getParameter("password");
			String passwordEncode = EncodeSHA.transFer(password);
			RequestDispatcher dispatcher = null;
			
			try {
				UserDAO uDao = new UserDAO(ClassicDeliDB.getConnection());
				PositionDAO posDao = new PositionDAO(ClassicDeliDB.getConnection());
				Users users = uDao.userLogin(phone, passwordEncode);
				
				if(users != null) {
					Position pos = posDao.checkPositions(users.getuId());
					if(pos.getPosition().equals("user")== true ) {
						request.getSession().setAttribute("auth", users);
						request.getRequestDispatcher("mainpage.jsp").forward(request, response);;
					}else {
						request.getSession().setAttribute("auth", users);						
						request.getRequestDispatcher("mainpage.jsp").forward(request, response);;
					}
					
				}else {
					
					request.setAttribute("status","failed");
					dispatcher = request.getRequestDispatcher("login.jsp");
				}
				dispatcher.forward(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}