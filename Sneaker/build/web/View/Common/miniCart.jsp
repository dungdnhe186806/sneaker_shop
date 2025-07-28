<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="sidebar-cart-active">
    <div class="sidebar-cart-all">
        <a class="cart-close" href="#"><i class="icon_close"></i></a>
        <div class="cart-content" id="miniCartContent">
            <h3>Shopping Cart</h3>
            <ul>
                <c:forEach items="${sessionScope.cart.items}" var="item">
                    <li class="single-product-cart">
                        <div class="cart-img">
                            <a href="#"><img src="${item.product.productImg}" alt=""></a>
                        </div>
                        <div class="cart-title">
                            <h4><a href="#">${item.product.productName}</a></h4>
                            <span> ${item.quantity} × ${item.product.getProductPrice()}	</span>
                        </div>
                        <div class="cart-delete">
                            <a href="#">×</a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
            <div class="cart-total">
                <h4>Subtotal: <span> 
                        <fmt:setLocale value = "en_US"/>
                        <fmt:formatNumber  value="${sessionScope.cart.getTotalMoney()}" type="currency"></fmt:formatNumber> </span></h4>
            </div>
            <div class="cart-checkout-btn">
                <a class="btn-hover cart-btn-style" href="${pageContext.request.contextPath}/Cart">view cart</a>
            </div>
        </div>
    </div>
</div>
