<%@page import="com.model.service.CategoryService"%>
<%@page import="com.model.service.AccountService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Timer"%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.entity.Account"%>
<%@page import="com.model.entity.Product"%>
<%@page import="com.model.entity.Category"%>
<%@page import="com.model.entity.ProductSelected"%>
<%@page import="com.model.service.ProductService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>    
<%
ProductService productService = new ProductService();
AccountService accountService = new AccountService();
CategoryService categoryService = new CategoryService(); 

List<Product> listProduct = productService.getAllProduct();
List<Category> listCategory = categoryService.getAllCategory();
List<Product> listProductByCategory = new ArrayList();
List<ProductSelected> listProductSelected = (List<ProductSelected>)request.getSession().getAttribute("listProductSelected");

Product product = (Product)request.getAttribute("product");
if (product == null) {
	product = listProduct.get(0);
	listProductByCategory = productService.getProductByCategory(product.getProductCategoryId());
}

Account account = new Account();
account = (Account)request.getSession().getAttribute("account");


Date date = new Date(System.currentTimeMillis());
SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm");
String day = dateFormat.format(date.getTime());
String time = timeFormat.format(date.getTime());
%>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Shop</title>
    
    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Times News Roman:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Times News Roman:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Times News Roman:400,100' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
   
    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="user-menu">
                        <ul>
                        	<%
                            if (account != null) {
                            %>	
                            	<li><a href="account.jsp"><i class="fa fa-user"></i> <%=account.getFullName() %></a></li>
                            <%	
                            }
                            else {
                            %>
                            	<li><a href="#"><i class="fa fa-user"></i> Đăng ký</a></li>
                            <%	
                            }
                            %>                        	                        		
                        	<li><a href="cart.jsp"><i class="fa fa-user"></i> Giỏ hàng</a></li>
                            <li><a href="checkout.jsp"><i class="fa fa-user"></i> Thanh toán</a></li>
                            <%
                            if (account != null) {
                            %>	
                            	<li><a href="LogoutServlet"><i class="fa fa-user"></i> Đăng xuất</a></li>
                            <%	
                            }
                            else {
                            %>
                            	<li><a href="login.jsp"><i class="fa fa-user"></i>Đăng nhập</a></li>
                            <%	
                            }
                            %>
                            
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="header-right">
                        <ul class="list-unstyled list-inline">
                            <%=time %> - <%= day%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End header area -->
    
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="index.jsp">e<span>Electronics</span></a></h1>
                    </div>
                </div>
                
                <div class="col-sm-6">
                    <div class="shopping-item">
                        <a href="cart.jsp">Cart - <span class="cart-amunt">$800</span> <i class="fa fa-shopping-cart"></i> <span class="product-count">5</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End site branding area -->
    
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> 
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="shop.jsp">Shop page</a></li>
                        <li class="active"><a href="single-product.jsp">Single product</a></li>
                        <li><a href="cart.jsp">Cart</a></li>
                        <li><a href="checkout.jsp">Checkout</a></li>
                        <li><a href="#">Category</a></li>
                        <li><a href="#">Others</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> <!-- End mainmenu area -->
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Shop</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Search Products</h2>
                        <form action="SearchServlet">
                            <input type="text" name="SearchKey" placeholder="Search products...">
                            <input type="submit"  value="Search">
                        </form>
                    </div>
                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Products</h2>
                    <%
                    for (int i = 0; i < 6; i++) {
                    %>
                   		<div class="thubmnail-recent">
                            <img src="<%=listProduct.get(i).getProductImage() %>" class="recent-thumb" alt="">
                            <h2><a href="/ProductServlet?productID=<%= listProduct.get(i).getProductId()%>"><%=listProduct.get(i).getProductName() %></a></h2>
                            <div class="product-sidebar-price">
                                <ins>$<%=listProduct.get(i).getProductPricePromotion() %></ins> <del>$<%=listProduct.get(i).getProductPrice() %></del>
                            </div>                             
                        </div>
					<%
                    }
					%>      
                    </div>
                    
                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Recent Posts</h2>
                        <ul>
                        <%
                        for (int i = 0; i < 4; i++) {
                        
                        %>
                            <li><a href=""><%=listProduct.get(i).getProductName() %></a></li>
                            
                        <%
                        }
                        %>    
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="product-breadcroumb">
                            <h2>Not found!</h2>
                        </div>
                            <div class="col-sm-6">
                                <div class="product-inner">
                                    
                                </div>
                            </div>
                        </div>
                        
                        <div class="related-products-wrapper">
                            <h2 class="related-products-title">Sản phẩm cùng loại</h2>
                            <div class="related-products-carousel">
                            <%
		                    for (int i = 0; i < listProductByCategory.size(); i++) {
		                    %>
		                   		<div class="single-product">
                                    <div class="product-f-image">
                                        <img src="<%=listProductByCategory.get(i).getProductImage() %>" alt="">
                                        <div class="product-hover">
                                            <a href="CartServlet?productID=<%=listProductByCategory.get(i).getProductId() %>&quantity=1" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                            <a href="ProductServlet?productID=<%=listProductByCategory.get(i).getProductId() %>" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                        </div>
                                    </div>
                                    <h2><a href="ProductServlet?productID=<%=listProductByCategory.get(i).getProductId()%>"><%=listProductByCategory.get(i).getProductName() %></a></h2>
                                    <div class="product-carousel-price">
                                        <ins>$<%=listProductByCategory.get(i).getProductPricePromotion() %></ins> <del>$<%=listProductByCategory.get(i).getProductPrice() %></del>
                                    </div> 
                                </div>
							<%
		                    }
							%>
                                  
                            </div>
                        </div>
                    </div>                    
                </div>
            </div>
        </div>
    </div>

   <div class="footer-top-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="footer-about-us">
                        <h2>e<span>Shop</span></h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero quam laborum quas alias dolores blanditiis iusto consequatur, modi aliquid eveniet eligendi iure eaque ipsam iste, pariatur omnis sint! Suscipit, debitis, quisquam. Laborum commodi veritatis magni at?</p>
                        <div class="footer-social">
                            <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Người dùng </h2>
                        <ul>
                            <li><a href="account.jsp">Tài khoản</a></li>
                            <li><a href="cart.jsp">Giỏ hàng</a></li>
                            <li><a href="checkout.jsp">Thanh toán</a></li>
                            
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Mặt hàng</h2>
                        <ul>
	                         <%
	                         for (int i = 0; i < listCategory.size(); i++) {
	                         %>	 
	                        	<li><a href="#"><%=listCategory.get(i).getCategoryName() %></a></li> 
	                         <%	 
	                         }
	                         %>
                            
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-newsletter">
                        <h2 class="footer-wid-title">Newsletter</h2>
                        <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
                        <div class="newsletter-form">
                            <form action="#">
                                <input type="email" placeholder="Type your email">
                                <input type="submit" value="Subscribe">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End footer top area -->
    
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="copyright">
                        <p>&copy; 2016 eShop. All Rights Reserved. Coded by <a href="http://www.nguyenductamlhp.com" target="_blank">Nguyen Duc Tam</a></p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="footer-card-icon">
                        <i class="fa fa-cc-discover"></i>
                        <i class="fa fa-cc-mastercard"></i>
                        <i class="fa fa-cc-paypal"></i>
                        <i class="fa fa-cc-visa"></i>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End footer bottom area -->
   
    <!-- Latest jQuery form server -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="js/main.js"></script>
  </body>
</html>