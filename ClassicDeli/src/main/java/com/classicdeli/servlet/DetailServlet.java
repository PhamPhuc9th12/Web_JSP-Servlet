package com.classicdeli.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classicdeli.connect.ClassicDeliDB;
import com.classicdeli.dao.ProductDAO;
import com.classicdeli.model.Product;

@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetailServlet() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String pid = request.getParameter("pid");
		try {
			ProductDAO pdao = new ProductDAO(ClassicDeliDB.getConnection());
			Product p = pdao.getSingleProduct(Integer.parseInt(pid));
			request.setAttribute("detai", p);
			request.getRequestDispatcher("detail.jsp").forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

