package com.classicdeli.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CategoryProducts
 */
@WebServlet("/category-product")
public class Admin_CategoryProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String category = request.getParameter("categrory");
		out.print(category);
		request.setAttribute("categrory",category);
		request.getRequestDispatcher("qlsp.jsp").forward(request, response);
	}

}