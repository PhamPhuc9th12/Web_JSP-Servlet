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
import com.classicdeli.model.Cart;

/**
 * Servlet implementation class RemoveProductAdmin
 */
@WebServlet("/remove-product-admin")
public class RemoveProductAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()) {
			String pName =  request.getParameter("pName");
			if(pName != null) {
				ProductDAO pd = new ProductDAO(ClassicDeliDB.getConnection());
				pd.deleteProduct(pName);
				request.getRequestDispatcher("qlsp.jsp").forward(request, response);
			}
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
	}
}
