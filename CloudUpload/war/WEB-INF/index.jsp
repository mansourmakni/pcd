<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.blobstore.*"%>
<%@ page import="cloudupload.Upload"%>
<!--gmail -->
<%@ page import="com.google.appengine.api.users.*" %>
<% UserService userService = UserServiceFactory.getUserService(); %>

<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>

<!DOCTYPE html>
<html lang="en">
  <head>
<%@ include file="Head.jsp" %>
  </head>
<body>

<div id="header">
<jsp:include page="Header.jsp" />
</div>
<!-- Header End====================================================================== -->
<div id="carouselBlk">
	<jsp:include page="Carousel.jsp" />
</div>
<div id="mainBody">
	<div class="container">
	<div class="row">
<!-- Sidebar ================================================== -->
<%@ include file="Sidebar.jsp" %>	
<!-- Sidebar end=============================================== -->
		<div class="span9">		
			<%@ include file="Featured.jsp" %>	
		<h4>Latest Products </h4>

					<ul class="thumbnails">
						<%
			    List<Upload> uploads = (List<Upload>) request.getAttribute("uploads");
			  if (uploads.size() == 0) {
				    %>
						<li class="span3">
							<div class="thumbnail">
								<a href=""><img src="" alt="" /></a>
								<div class="caption">
									<h5>doesn't work on localhost</h5>
									<p>Aucune icône uploadée ou vous etes on localhost</p>
									<h4 style="text-align: center">
										<a class="btn" href=""> <i class="icon-zoom-in"></i></a> <a
											class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a>
										<a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>
							</div>
						</li>
						<%
							}
								else {
								int i = 0;
							    for (Upload upload : uploads) {
									if ((i % 3) == 0) {
						%>

						<li class="span3">
							<div class="thumbnail">
								<%
									}
								%>
								<a href="product_details.jsp"><img
									src="<%=upload.getUrl()%>" alt="" /></a>
								<div class="caption">
									<h5><%=upload.getTitle()%></h5>
									<p>
										<%=upload.getDescription()%>
									</p>

									<h4 style="text-align: center">
										<a class="btn" href="product_details.jsp"> <i
											class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to
											<i class="icon-shopping-cart"></i>
										</a> <a class="btn btn-primary" href="#">$222.00</a>
									</h4>
								</div>

								<%
									if ((i % 3) == 2 || i == uploads.size() - 1) {
								%>
							</div>
						</li>
						<%			}
						i++;
					}
			    }%>

					</ul>

				</div>
		</div>
	</div>
</div>
<!-- Footer ================================================================== -->
<%@ include file="Footer.jsp" %>		
<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>
	
	<script src="themes/js/bootshop.js"></script>
    <script src="themes/js/jquery.lightbox-0.5.js"></script>
	
	<!-- Themes switcher section ============================================================================================= -->
	<%@ include file="ThemeSwitcher.jsp" %>	
<span id="themesBtn"></span>
</body>
</html>