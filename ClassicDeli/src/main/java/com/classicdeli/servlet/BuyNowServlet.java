package com.classicdeli.servlet;

import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classicdeli.connect.ClassicDeliDB;
import com.classicdeli.dao.OrderDAO;
import com.classicdeli.dao.ProductDAO;
import com.classicdeli.model.Order;
import com.classicdeli.model.Users;

/**
 * Servlet implementation class BuyNowServlet
 */
@WebServlet("/buy-now")
public class BuyNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Users auth = (Users) request.getSession().getAttribute("auth");
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			
			if (auth != null) {
				String productId = request.getParameter("id");
				int productQuantity = Integer.parseInt(request.getParameter("quantity"));
				if (productQuantity <= 0) {
					productQuantity = 1;
				}
				
				Order orderModel = new Order();
				orderModel.setpId(Integer.parseInt(productId));
				orderModel.setuId(auth.getuId());
				orderModel.setoQuantity(productQuantity);
				orderModel.setoDate(formatter.format(date));
				
				OrderDAO orderDAO = new OrderDAO(ClassicDeliDB.getConnection());
				ProductDAO pDao = new ProductDAO(ClassicDeliDB.getConnection());
				pDao.updateRemain(Integer.parseInt(productId),productQuantity);
				boolean result = orderDAO.insertOrder(orderModel);
				
				if (result) {
					response.sendRedirect("order.jsp");
				}
			}else {
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
