package com.controller.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.entity.Product;
import com.model.entity.ProductSelected;
import com.model.service.ProductService;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int productid = Integer.parseInt(request.getParameter("productID").trim());
			int quantity = Integer.parseInt(request.getParameter("quantity").trim());
			List<ProductSelected> listProductSelected;
			if (request.getSession().getAttribute("listProductSelected") == null) {//Nếu có list sản phẩm thì lấy ra, không thì tạo mới
				listProductSelected = new Vector<ProductSelected>();
			} else {
				listProductSelected = (List<ProductSelected>) request.getSession().getAttribute("listProductSelected");
			}
			boolean isExist = false;//kiểm tra xem sản phẩm thêm vào có trong list sản phẩm chưa, có thì cộng số lượng  
			for (int i = 0; i < listProductSelected.size(); i++) {
				if (listProductSelected.get(i).getProduct().getProductId() == productid) {
					isExist=true;
					ProductSelected productCart = listProductSelected.get(i);
					productCart.setQuantity(productCart.getQuantity() + quantity);
					listProductSelected.set(i, productCart);
					break;
				}
			}
			if (isExist == false) {//NẾu chưa co thì thêm vào list sản phẩm
				ProductService productService = new ProductService();
				Product addProduct = productService.getProduct(productid);
				
				ProductSelected ProductSelected = new ProductSelected(addProduct, quantity);
				listProductSelected.add(ProductSelected);
			}			
			request.getSession().setAttribute("listProductSelected", listProductSelected);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		} catch (NumberFormatException e) {
			request.getRequestDispatcher("shop.jsp").forward(request, response);
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
