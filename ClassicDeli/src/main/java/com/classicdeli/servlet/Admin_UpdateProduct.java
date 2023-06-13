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

/**
 * Servlet implementation class Admin_UpdateProduct
 */
@WebServlet("/admin-update-product")
public class Admin_UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			response.setContentType("text/html;charset=UTF-8");
			int pId = Integer.parseInt(String.valueOf(request.getParameter("pId")));
			request.setAttribute("pId", pId);
			request.getRequestDispatcher("udSP.jsp").forward(request, response);
		}
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			response.setContentType("text/html;charset=UTF-8");
			
			int pId = Integer.parseInt(String.valueOf(request.getParameter("pId")));
				String pName = request.getParameter("Pname");
				String pCate = request.getParameter("Pcategory");
				String pPrice = request.getParameter("Pprice");
				String pImage = request.getParameter("Pimage");
				String pRemain = request.getParameter("Premain");
				ProductDAO pd = new ProductDAO(ClassicDeliDB.getConnection());
				
				pd.UpdateProduct(pId,pName, pCate, pImage, Integer.parseInt(pPrice), Integer.parseInt(pRemain));
				response.sendRedirect("qlsp.jsp");
			
			
		} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
			
		}
	
	
			
	}