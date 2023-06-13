package com.classicdeli.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classicdeli.connect.ClassicDeliDB;
import com.classicdeli.dao.UserDAO;
import com.classicdeli.model.Users;

/**
 * Servlet implementation class UpdateInforUser
 */
@WebServlet("/ud-user")
public class UpdateInforUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset = UTF-8");
		try {
			int idU =  Integer.parseInt( request.getParameter("IdUser"));
			UserDAO udao = new UserDAO(ClassicDeliDB.getConnection());
			Users info_User = udao.getSingleUsers(idU);
			request.getSession().setAttribute("info_Users", info_User);
			request.getRequestDispatcher("update_user.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int idU =  Integer.parseInt( request.getParameter("IdUser"));
			UserDAO udao = new UserDAO(ClassicDeliDB.getConnection());
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			udao.UpdateInforUser(idU, name, address);
			request.getRequestDispatcher("information_user.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
