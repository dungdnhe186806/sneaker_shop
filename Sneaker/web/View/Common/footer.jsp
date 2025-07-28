<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="footer-area bg-gray pb-30" style="padding-top: 60px ;padding-bottom: 0px">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="contact-info-wrap">
                    <div class="footer-logo">
                        <a href="#"><img style="width: 30%" src="${pageContext.request.contextPath}/assets/images/logo/clothing.jpg" alt="logo"></a>
                    </div>
                    <div class="single-contact-info">
                        <span>Our Location</span>
                        <p>Hoa Lac Hi-tech, km 29, Đại lộ, Thăng Long, Hà Nội</p>
                    </div>
                    <div class="single-contact-info">
                        <span>24/7 hotline:</span>
                        <p>(+84)12345678</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="footer-right-wrap">
                    <div class="footer-menu">
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
                    <div class="social-style-2 social-style-2-mrg">
                        <a href="#"><i class="social_twitter"></i></a>
                        <a href="#"><i class="social_facebook"></i></a>
                        <a href="#"><i class="social_googleplus"></i></a>
                        <a href="#"><i class="social_instagram"></i></a>
                        <a href="#"><i class="social_youtube"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>