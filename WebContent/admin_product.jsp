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
                        <h1><a href="index.jsp">e<span>Shop</span></a></h1>
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
                        <li class="active"><a href="index.jsp">Trang chủ</a></li>
                        <li><a href="shop.jsp">Sản phẩm</a></li>
                        <li><a href="single-product.jsp">Chi tiết</a></li>
                        <li><a href="cart.jsp">Giỏ hàng</a></li>
                        <li><a href="checkout.jsp">Thanh toán</a></li>
                        <li><a href="#">Mặt hàng</a></li>
                        <li><a href="#">Liên hệ</a></li>
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
						<h2>Quản lý sản phẩm</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Page title area -->
	<div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">
                            <form method="post" action="#">
                                <table cellspacing="0" class="shop_table cart">
                                    <thead>
                                        <tr>
                                            <th class="product-remove">Xóa</th>
                                            <th class="product-thumbnail">Hình ảnh</th>
                                            <th class="product-name">Sản phẩm</th>
                                            <th class="product-price">Đơn giá</th>
                                            <th class="product-quantity">Mặt hàng</th>
                                            
                                        </tr>
                                    </thead>
                                    <%
                                    if (listProduct != null)
                                    	for (int i = 0; i < listProduct.size(); i++) {
                                    %>
                                    <tbody>
                                        <tr class="cart_item">                                                                                
                                            <td class="product-remove">
                                                <a title="Remove this item" class="remove" href="DeleteProductServlet?productID=<%=listProduct.get(i).getProductId() %>">X</a> 
                                            </td>
                                            <td class="product-thumbnail">
                                                <a href="ProductServlet?=<%= listProduct.get(i).getProductId()%>"><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="<%= listProduct.get(i).getProductImage()%>"></a>
                                            </td>
                                            <td class="product-name">
                                                <a href="ProductServlet?=<%= listProduct.get(i).getProductId()%>"><%= listProduct.get(i).getProductName()%></a> 
                                            </td>
                                            <td class="product-price">
                                                <span class="amount">$<%=listProduct.get(i).getProductPrice() %></span> 
                                            </td>											
                                            <td class="product-subtotal">
                                                <span class="amount"><%=listProduct.get(i).getProductCategoryId()%></span> 
                                            </td>
                                        </tr>                                        
                                    </tbody>
                                    <%	
                                    }
                                    %>                                    
                                </table>
                            </form>                            
                        </div>                        
                    </div>                    
                </div>
	<!-- Content -->
	<div class="container">
		<div class="row" style="height: 339px">			
			<div class="col-md-6 col-md-offset-3">
				<form role="form" method="post" action="AddProductServlet">
					<h3>THÊM SẢN PHẨM</h3>
					<div class="form-group">
						<label for="username">Mã sản phẩm</label> <input type="text"
							name="product_id" class="form-control">
					</div>
					<div class="form-group">
						<label for="username">Tên sản phẩm</label> <input type="text"
							name="product_name" class="form-control">
					</div>
					<div class="form-group">
						<label for="password">Giá</label><input type="number"
							size="4" class="input-text qty text form-control" title="Qty"
							value="1" min="0" step="1" name="product_price">
					</div>
					<div class="form-group">
						<label for="password">Giá Khuyến mãi</label><input type="number"
							size="4" class="input-text qty text form-control" title="Qty"
							value="1" min="0" step="1" name="product_price_promotion">
					</div>
					<div class="form-group">
						<label for="fullName">Mô tả </label>
						<textarea name="description" id=""txtDescription"" rows="10" cols="80">
              
            </textarea>
						<script>
							// Replace the <textarea id="editor1"> with a CKEditor
							// instance, using default configuration.
							CKEDITOR.replace('"txtDescription"');
						</script>
					</div>
					<div class="form-group">
						<label for="password">Mã mặt hàng </label><input type="number" size="4"
							name="product_category_id">
					</div>
					<div class="form-group">
						<label for="image">Hình ảnh</label> <input type="text" name="product_image"
							class="form-control">
					</div>					
					<p>
						<button class="btn btn-primary" type="submit">Thêm mới</button>
						<button class="btn btn-default" type="button">Reset</button>
					</p>

				</form>
			</div>
		</div>
	</div>
	<!-- End Content -->

	<div class="footer-top-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="footer-about-us">
						<h2>
							e<span>Electronics</span>
						</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Perferendis sunt id doloribus vero quam laborum quas alias
							dolores blanditiis iusto consequatur, modi aliquid eveniet
							eligendi iure eaque ipsam iste, pariatur omnis sint! Suscipit,
							debitis, quisquam. Laborum commodi veritatis magni at?</p>
						<div class="footer-social">
							<a href="#" target="_blank"><i class="fa fa-facebook"></i></a> <a
								href="#" target="_blank"><i class="fa fa-twitter"></i></a> <a
								href="#" target="_blank"><i class="fa fa-youtube"></i></a> <a
								href="#" target="_blank"><i class="fa fa-linkedin"></i></a> <a
								href="#" target="_blank"><i class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>

				<div class="col-md-3 col-sm-6">
					<div class="footer-menu">
						<h2 class="footer-wid-title">User Navigation</h2>
						<ul>
							<li><a href="#">My account</a></li>
							<li><a href="#">Order history</a></li>
							<li><a href="#">Wishlist</a></li>
							<li><a href="#">Vendor contact</a></li>
							<li><a href="#">Front page</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-3 col-sm-6">
					<div class="footer-menu">
						<h2 class="footer-wid-title">Categories</h2>
						<ul>
							<li><a href="#">Mobile Phone</a></li>
							<li><a href="#">Home accesseries</a></li>
							<li><a href="#">LED TV</a></li>
							<li><a href="#">Computer</a></li>
							<li><a href="#">Gadets</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-3 col-sm-6">
					<div class="footer-newsletter">
						<h2 class="footer-wid-title">Newsletter</h2>
						<p>Sign up to our newsletter and get exclusive deals you wont
							find anywhere else straight to your inbox!</p>
						<div class="newsletter-form">
							<form action="#">
								<input type="email" placeholder="Type your email"> <input
									type="submit" value="Subscribe">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End footer top area -->

	<div class="footer-bottom-area">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="copyright">
						<p>
							&copy; 2015 eElectronics. All Rights Reserved. Coded with <i
								class="fa fa-heart"></i> by <a href="http://wpexpand.com"
								target="_blank">WP Expand</a>
						</p>
					</div>
				</div>

				<div class="col-md-4">
					<div class="footer-card-icon">
						<i class="fa fa-cc-discover"></i> <i class="fa fa-cc-mastercard"></i>
						<i class="fa fa-cc-paypal"></i> <i class="fa fa-cc-visa"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End footer bottom area -->

	<!-- Latest jQuery form server -->
	<script src="https://code.jquery.com/jquery.min.js"></script>

	<!-- Bootstrap JS form CDN -->
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

	<!-- jQuery sticky menu -->
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.sticky.js"></script>

	<!-- jQuery easing -->
	<script src="js/jquery.easing.1.3.min.js"></script>

	<!-- Main Script -->
	<script src="js/main.js">
		
	</script>
	<script type="text/javascript">
		$(".product-remove").on("click", function() {

			var $killrow = $(this).parent('tr');
			$killrow.addClass("danger");
			$killrow.fadeOut(1000, function() {
				$(this).remove();
			});
		});
	</script>
</body>
</html>