package com.classicdeli.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classicdeli.connect.ClassicDeliDB;
import com.classicdeli.dao.UserDAO;
import com.classicdeli.model.Users;

/**
 * Servlet implementation class GetInfoUser
 */
@WebServlet("/info-user")
public class GetInforUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html,charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			int idU = Integer.parseInt(request.getParameter("idU"));
			UserDAO udao = new UserDAO(ClassicDeliDB.getConnection());
			Users info_User = udao.getSingleUsers(idU);

			request.getSession().setAttribute("info_User", info_User);
			request.getRequestDispatcher("information_user.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
