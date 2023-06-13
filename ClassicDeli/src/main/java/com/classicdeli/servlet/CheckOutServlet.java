package com.classicdeli.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classicdeli.connect.ClassicDeliDB;
import com.classicdeli.dao.OrderDAO;
import com.classicdeli.dao.ProductDAO;
import com.classicdeli.model.*;


/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/check-out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()) {
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			
		
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			
			Users auth = (Users) request.getSession().getAttribute("auth");
			
			if (cart_list != null && auth != null) {
				
				for(Cart c : cart_list) {
					Order order = new Order();
					order.setpId(c.getpId());
					order.setuId(auth.getuId());
					order.setoQuantity(c.getQuantity());
					order.setoDate(formatter.format(date));
				
					ProductDAO pDao = new ProductDAO(ClassicDeliDB.getConnection());
					pDao.updateRemain(c.getpId(), c.getQuantity());		
					
					OrderDAO orderDAO = new OrderDAO(ClassicDeliDB.getConnection());
					Boolean result =  orderDAO.insertOrder(order);
					if (!result) {
						break;
					}
				}
				
				
				cart_list.clear();
				response.sendRedirect("order.jsp");
			}else {
				if (auth == null) {
					response.sendRedirect("login.jsp");
				}
				response.sendRedirect("cart.jsp");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}