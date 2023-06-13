package com.classicdeli.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classicdeli.connect.ClassicDeliDB;
import com.classicdeli.dao.ProductDAO;
import com.classicdeli.dao.UserDAO;
import com.classicdeli.model.Cart;

/**
 * Servlet implementation class RemoveProductAdmin
 */
@WebServlet("/remove-user-admin")
public class Admin_deleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			int uId = Integer.parseInt(request.getParameter("uId"));
			UserDAO ud = new UserDAO(ClassicDeliDB.getConnection());
			ud.deleteUser_Order(uId);
			ud.deleteUser_Position(uId);
			ud.deleteUser(uId);
			request.getRequestDispatcher("qluser.jsp").forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
