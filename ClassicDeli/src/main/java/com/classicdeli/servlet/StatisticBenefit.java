package com.classicdeli.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classicdeli.connect.ClassicDeliDB;
import com.classicdeli.dao.OrderDAO;
import com.classicdeli.model.Order;

/**
 * Servlet implementation class StatisticBenefit
 */
@WebServlet("/thong-ke-ngay")
public class StatisticBenefit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html,charset = UTF-8");
		String action = request.getParameter("action");
		if(action.equals("theoNgay")== true) {
			try {
				OrderDAO od = new OrderDAO(ClassicDeliDB.getConnection());
				ArrayList<Order> listO = new ArrayList<>();
				Date oDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("ngay"));
				String date = new SimpleDateFormat("yyyy-MM-dd").format(oDate);
				listO = od.adminOrderDate(date);
				
				request.setAttribute("listO", listO);
				request.getRequestDispatcher("thongke.jsp").forward(request, response);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(action.equals("theoThang") == true) {
			try {
				OrderDAO od = new OrderDAO(ClassicDeliDB.getConnection());
				ArrayList<Order> listO = new ArrayList<>();
				String date = request.getParameter("thang");
				listO = od.adminOrderMonth(date);
				
				request.setAttribute("listO", listO);
				request.getRequestDispatcher("thongke.jsp").forward(request, response);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(action.equals("theoKhoangNgay") == true) {
			try {
				OrderDAO od = new OrderDAO(ClassicDeliDB.getConnection());
				ArrayList<Order> listO = new ArrayList<>();
				String startDay = request.getParameter("startDay");
				String endDay = request.getParameter("endDay");
				listO = od.adminOrderMonth(startDay,endDay);
				
				request.setAttribute("listO", listO);
				request.getRequestDispatcher("thongke.jsp").forward(request, response);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

	

}

