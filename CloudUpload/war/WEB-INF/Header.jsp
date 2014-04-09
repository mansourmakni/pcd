<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.blobstore.*"%>
<%@ page import="cloudupload.Upload"%>
<!--gmail -->
<%@ page import="com.google.appengine.api.users.*" %>
<% UserService userService = UserServiceFactory.getUserService(); %>



<div class="container">
<div id="welcomeLine" class="row">
	<div class="span6">Welcome!<strong> <% if (userService.getCurrentUser() == null) { }
else { %>
<%= userService.getCurrentUser().getNickname() %>
<% } %> </strong></div>
	<div class="span6">
	<div class="pull-right">
		<a href="product_summary.jsp"><span class="">Fr</span></a>
		<a href="product_summary.jsp"><span class="">Es</span></a>
		<span class="btn btn-mini">En</span>
		<a href="product_summary.jsp"><span>&pound;</span></a>
		<span class="btn btn-mini">$155.00</span>
		<a href="product_summary.jsp"><span class="">$</span></a>
		<a href="product_summary.jsp"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> [ 3 ] Itemes in your cart </span> </a> 
	</div>
	</div>
</div>
<!-- Navbar ================================================== -->
<div id="logoArea" class="navbar">
<a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
</a>
  <div class="navbar-inner">
    <a class="brand" href="index.jsp"><img src="themes/images/logo.png" alt="Bootsshop"/></a>
		<form class="form-inline navbar-search" method="post" action="products.jsp" >
		<input id="srchFld" class="srchTxt" type="text" />
		  <select class="srchTxt">
			<option>All</option>
			<option>CLOTHES </option>
			<option>FOOD AND BEVERAGES </option>
			<option>HEALTH & BEAUTY </option>
			<option>SPORTS & LEISURE </option>
			<option>BOOKS & ENTERTAINMENTS </option>
		</select> 
		  <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
    </form>
    <ul id="topMenu" class="nav pull-right">
	 <li class=""><a href="special_offer.jsp">Specials Offer</a></li>
	 <li class=""><a href="admin.jsp">Admin</a></li>
	 <li class=""><a href="contact.jsp">Contact</a></li>
	 <li class="">
	 <% if (userService.getCurrentUser() == null) { %>
<p><a href="<%= userService.createLoginURL("/admin.jsp") %> " ><span class="btn btn-large btn-success">Login</span></a></p>
<% }
else { %>
<p><a href="<%= userService.createLogoutURL("/") %> " ><span class="btn btn-large btn-success">Logout</span></a></p>
<% } %>
	 	 </li>
    </ul>
  </div>
</div>
</div>