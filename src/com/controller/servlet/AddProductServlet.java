package com.controller.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.entity.Product;
import com.model.service.ProductService;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String product_id = request.getParameter("product_id");
		String product_name = request.getParameter("product_name");
		String product_price = request.getParameter("product_price");
		String product_price_promotion = request.getParameter("product_price_promotion");
		String description = request.getParameter("description");
		String product_category_id = request.getParameter("product_category_id");
		String product_image = request.getParameter("product_image");
		String origin = "Viet Nam";
		String quantity = "1";
		
		Product product = new Product();
		product.setProductId(Integer.parseInt(product_id));
		product.setProductName(product_name);
		product.setProductPrice(Double.parseDouble(product_price));
		product.setProductPricePromotion(Double.parseDouble(product_price_promotion));		
		product.setDescription(description);
		product.setProductCategoryId(Integer.parseInt(product_category_id));
		product.setProductImage(product_image);
		product.setOrigin(origin);
		product.setQuantity(Integer.parseInt(quantity));
		
		ProductService productService = new ProductService();
		productService.addProduct(product);
		request.getRequestDispatcher("admin_product.jsp").forward(request, response);
	}

}
