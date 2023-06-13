package com.classicdeli.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.classicdeli.model.*;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try{
			ArrayList<Cart> cartList = new ArrayList<>();
//			get string 'id' in product page 
			int id = Integer.parseInt(request.getParameter("id"));
			Cart cm = new Cart();
//			set pId = id and setQuantity = 1
			cm.setpId(id);
			cm.setQuantity(1);
//			initialize sessison cart-list to save product to cart
			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
//			get string 'category' and 'cate' in product page 
			String category = request.getParameter("category");
			String cate = request.getParameter("cate");
			if (category == null && cate == null) {
				response.sendRedirect("search.jsp");
			}
			if(cart_list == null) {
				cartList.add(cm);
				session.setAttribute("cart-list",cartList);
//			return page have address product_page.jsp?category="+category+"&cate="+cate	
				response.sendRedirect("product_page.jsp?category="+category+"&cate="+cate);
			}
			else {
				cartList = cart_list;
				boolean exist = false;
				
				for(Cart c:cart_list) {
					if(c.getpId() == id) {
						exist = true;
						response.sendRedirect("product_page.jsp?category="+category+"&cate="+cate);
					}
				}
				if(!exist) {
					cartList.add(cm);
					response.sendRedirect("product_page.jsp?category="+category+"&cate="+cate);
				}
			}
		} catch (Exception e) {
			
		}
	}

}