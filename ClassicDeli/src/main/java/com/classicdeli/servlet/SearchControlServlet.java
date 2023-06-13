package com.classicdeli.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classicdeli.connect.ClassicDeliDB;
import com.classicdeli.dao.ProductDAO;
import com.classicdeli.model.Product;

/**
 * Servlet implementation class SearchControlServlet
 */
@WebServlet("/search-control")
public class SearchControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()) {
			
			String txt = request.getParameter("txtSearch");
			String indexString = request.getParameter("index");
			int index = Integer.parseInt(indexString);
			
			ProductDAO pDao = new ProductDAO(ClassicDeliDB.getConnection());
			//count the number of products have 'txt'
			int count = pDao.countSearch(txt);
			//default 12 products / 1 page
			int pageSize = 12;
			//count the number of page
			int endPage = 0;
			endPage = count / pageSize;
			if (count % pageSize != 0) {
				endPage++;
			}
			List<Product> products = pDao.search(txt, index);
			
			request.getSession().setAttribute("products", products); 
			request.getSession().setAttribute("end",endPage);
			request.getSession().setAttribute("count", count);
			request.getSession().setAttribute("txt", txt);
			request.getRequestDispatcher("search.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}