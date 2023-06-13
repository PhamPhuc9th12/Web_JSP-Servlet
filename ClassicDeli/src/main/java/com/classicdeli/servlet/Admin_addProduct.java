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
import com.classicdeli.model.*;

/**
 * Servlet implementation class Admin_addProduct
 */
@WebServlet("/admin-add-product")
public class Admin_addProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()) {
			response.setContentType("text/html;charset=UTF-8");
			String pName = request.getParameter("pName");
			String category = request.getParameter("categro");
			String price = request.getParameter("Price");
			String image = request.getParameter("Image");
			String remain = request.getParameter("Remain");
			ProductDAO pdDao = new ProductDAO(ClassicDeliDB.getConnection());
			boolean check = pdDao.addProductAdmin(pName, category, image,Integer.parseInt(price),Integer.parseInt(remain));
			
			if(check) {
				request.setAttribute("statusA", "success");
				request.getRequestDispatcher("qlsp.jsp").forward(request, response);
			}else {
				request.setAttribute("statusA", "failed");
				request.getRequestDispatcher("qlsp.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}