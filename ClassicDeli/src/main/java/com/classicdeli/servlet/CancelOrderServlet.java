package com.classicdeli.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classicdeli.connect.ClassicDeliDB;
import com.classicdeli.dao.OrderDAO;
import com.classicdeli.dao.ProductDAO;

/**
 * Servlet implementation class CancelOrderServlet
 */
@WebServlet("/cancel-order")
public class CancelOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String id = request.getParameter("id");
			String quantity = request.getParameter("quantity");
			String pid = request.getParameter("pId");
			if(id != null) {
				OrderDAO oDao = new OrderDAO(ClassicDeliDB.getConnection());
				ProductDAO pDao = new ProductDAO(ClassicDeliDB.getConnection());
				pDao.updateRemain(Integer.parseInt(pid),-Integer.parseInt(quantity));
				oDao.cancelOrder(Integer.parseInt(id));
				
			}
			response.sendRedirect("order.jsp");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
