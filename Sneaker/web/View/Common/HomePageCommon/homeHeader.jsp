<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<header class="header-area bg-white">
    <div class="header-large-device section-padding-2">
        <div class="header-middle">
            <div class="container">
                <div class="border-bottom-1 header-top-ptb-4">
                    <div class="row align-items-center">
                        <div class="col-xl-4 col-lg-5">
                            <div class="search-wrap-2">
                                <form action="${pageContext.request.contextPath}/Product">
                                    <input type="text" hidden name="action" value="searchFilter">
                                    <input placeholder="Type anything & Hit enter" name="searchKey" type="text">
                                    <button class="button-search"><i class="icon-magnifier"></i></button>
                                </form>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-2">
                            <div class="logo text-center">
                                <a href="${pageContext.request.contextPath}/Home"><img style="width: 45%" src="${pageContext.request.contextPath}/assets/images/logo/clothing.jpg" alt="logo"></a>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-5">
                            <div class="header-top-right">
                                <div class="header-login-regi">
                                    <c:if test="${sessionScope.user==null}">
                                        <a href="${pageContext.request.contextPath}/View/User/loginRegister.jsp"><i class="icon-user"></i> Log In / Register</a>
                                    </c:if>
                                    <c:if test="${sessionScope.user!=null}">
                                        <div class="main-menu main-menu-padding-2 main-menu-center main-menu-font-width-400 main-menu-lh-4 main-menu-hover-semibold ">
                                            <nav>
                                                <ul>
                                                    <li><a class="active" href="${pageContext.request.contextPath}/user?action=accountDetail&id=${user.user_id}" ><i class="icon-user"></i> ${sessionScope.user.user_name} </a>
                                                        <ul class="sub-menu-style">
                                                            <li><a href="${pageContext.request.contextPath}/user?action=accountDetail&id=${user.user_id}"><i class="icon-folder-alt"></i> My Account </a></li>
                                                            <li><a href="${pageContext.request.contextPath}/user?action=logout"> <i class="icon-logout"></i>Logout</a></li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </div>

                                    </c:if>
                                </div>
                                <div class="header-cart-2" style="display: flex;align-items: center">
                                        <fmt:setLocale value = "en_US"/>
                                        <fmt:formatNumber  value="${cart.getTotalMoney()}" type="currency"></fmt:formatNumber> </a>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-bottom">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12">
                        <div class="main-menu main-menu-padding-2 main-menu-center main-menu-font-width-400 main-menu-lh-4 main-menu-hover-semibold main-menu-hover-border">
                            <nav>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/Home">HOME </a>
                                    </li>
                                    <li><a href="${pageContext.request.contextPath}/Product">SHOP </a>
                                    <li><a href="${pageContext.request.contextPath}/Cart">MY CART </a></li>
                                    <c:if test="${sessionScope.user.isAdmin}">
                                        <li><a href="${pageContext.request.contextPath}/dashboard">SHOP MANAGEMENT </a></li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-small-device small-device-ptb-1">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-5">
                    <div class="mobile-logo">
                        <a href="Home">
                            <img alt="" style="width:40%" src="${pageContext.request.contextPath}/assets/images/logo/clothing.png">
                        </a>
                    </div>
                </div>
                <div class="col-7">
                    <div class="header-action header-action-flex">
                        <div class="same-style-2 same-style-2-font-inc">
                            <a href="${pageContext.request.contextPath}/user?action=accountDetail?id=${user.user_id}"><i class="icon-user"></i></a>
                        </div>
                        <div class="same-style-2 same-style-2-font-inc header-cart" id="header_cart" style="align-items: center">
                            <a class="cart-active" href="#">
                                <i class="icon-basket-loaded"></i><span class="pro-count black">${sessionScope.cartSize}</span>
                            </a>
                        </div>
                        <div class="same-style-2 main-menu-icon">
                            <a class="mobile-header-button-active" href="#"><i class="icon-menu"></i> </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>