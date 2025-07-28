<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer class="footer-area pt-85 bg-white pb-90">
    <div class="container">
        <div class="footer-top text-center">
            <div class="footer-menu footer-menu-hover-border">
                <nav>
                    <ul>
                        <li><a class="active" href="${pageContext.request.contextPath}/Home">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/Product">Shop</a></li>
                        <li><a href="${pageContext.request.contextPath}/Cart">Product </a></li>
                            <c:if test="${sessionScope.user.isAdmin}">
                            <li><a href="${pageContext.request.contextPath}/dashboard">SHOP MANAGEMENT </a></li>
                            </c:if>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="footer-middle footer-middle-mrg">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="social-style-3-wrap xs-center">
                        <span>follow us</span>
                        <div class="social-style-1">
                            <a href="#"><i class="icon-social-twitter"></i></a>
                            <a href="#"><i class="icon-social-facebook"></i></a>
                            <a href="#"><i class="icon-social-instagram"></i></a>
                            <a href="#"><i class="icon-social-youtube"></i></a>
                            <a href="#"><i class="icon-social-pinterest"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="contact-info-wrap-2 text-center">
                        <div class="footer-logo footer-logo-mrg">
                            <a href="#"><img style="width: 60%" src="${pageContext.request.contextPath}/assets/images/logo/clothing.jpg" alt="logo"></a>
                        </div>
                        <p>Hoa Lac Hi-tech , km 29, Đại lộ, Thăng Long, Hà Nội</p>
                        <p>(+84)123456789</p>                
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom copyright text-center">
            <p>Copyright © 2025 GROUP 5</p>
        </div>
    </div>
</footer>
