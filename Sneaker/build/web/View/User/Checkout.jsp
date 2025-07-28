<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="en">



    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>CHECKOUT - VIRUS SNEAKER</title>
        <meta name="robots" content="noindex, follow" />
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo/clothing.jpg">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/simple-line-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/elegant.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/linear-icon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/nice-select.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/easyzoom.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/slick.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/magnific-popup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/jquery-ui.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

    </head>

    <body>

        <div class="main-wrapper">
            <jsp:include page="../Common/headerFull.jsp"></jsp:include>
            <jsp:include page="../Common/mobileMenu.jsp"></jsp:include>
            <jsp:include page="../Common/miniCart.jsp"></jsp:include>
                <div class="breadcrumb-area bg-gray">
                    <div class="container">
                        <div class="breadcrumb-content text-center">
                            <ul>
                                <li>
                                    <a href="${pageContext.request.contextPath}/Home">Home</a>
                            </li>
                            <li class="active">Checkout </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="checkout-main-area pt-120 pb-120">
                <div class="container">
                    <div class="customer-zone mb-20">
                        <p class="cart-page-title">Returning customer? <a class="checkout-click1" href="#">Click here to login</a></p>
                        <div class="checkout-login-info">
                            <p>If you have shopped with us before, please enter your details in the boxes below. If you are a new customer, please proceed to the Billing & Shipping section.</p>

                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <div class="sin-checkout-login">
                                        <label>Username or email address <span>*</span></label>
                                        <input type="text" name="user-name">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="sin-checkout-login">
                                        <label>Passwords <span>*</span></label>
                                        <input type="password" name="user-password">
                                    </div>
                                </div>
                            </div>
                            <div class="button-remember-wrap">
                                <button class="button" type="submit">Login</button>
                                <div class="checkout-login-toggle-btn">
                                    <input type="checkbox">
                                    <label>Remember me</label>
                                </div>
                            </div>
                            <div class="lost-password">
                                <a href="#">Lost your password?</a>
                            </div>

                            <div class="checkout-login-social">
                                <span>Login with:</span>
                                <ul>
                                    <li><a href="#">Facebook</a></li>
                                    <li><a href="#">Twitter</a></li>
                                    <li><a href="#">Google</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="checkout-wrap pt-30">
                        <form action="Order" id="orderForm">
                            <input type="text" hidden value="createOrder" name="action">
                            <div class="row">
                                <c:if test="${sessionScope.user == null}">
                                    <div class="col-lg-7">
                                        <div class="billing-info-wrap mr-50">
                                            <h3>Billing Details</h3>
                                            <div class="row">

                                                <div class="col-lg-12">
                                                    <div class="billing-info mb-20">
                                                        <label>Name <abbr class="required" title="required">*</abbr></label>
                                                        <input type="text" name="name" required="true">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="billing-info mb-20">
                                                        <label>Street Address <abbr class="required" title="required">*</abbr></label>
                                                        <input class="billing-address" name="address" placeholder="Your Address" type="text" required="true">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12">
                                                    <div class="billing-info mb-20">
                                                        <label>Phone <abbr class="required" title="required">*</abbr></label>
                                                        <input type="text" name="phone" placeholder="Your Phone Number" required="true">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12">
                                                    <div class="billing-info mb-20">
                                                        <label>Email Address <abbr class="required" title="required">*</abbr></label>
                                                        <input type="text" name="email"  placeholder="Your Email"  required="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="additional-info-wrap">
                                                <label>Order notes</label>
                                                <textarea placeholder="Notes about your order, e.g. special notes for delivery. " name="note"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.user != null}">
                                    <div class="col-lg-7">
                                        <div class="billing-info-wrap mr-50">
                                            <h3>Billing Details</h3>
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="billing-info mb-20">
                                                        <label>Name <abbr class="required" title="required">*</abbr></label>
                                                        <input type="text" name="name" value="${sessionScope.user.user_name}" required="true">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="billing-info mb-20">
                                                        <label>Street Address <abbr class="required" title="required">*</abbr></label>
                                                        <input class="billing-address" name="address" placeholder="Your Address" type="text" value="${sessionScope.user.address}" required="true">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12">
                                                    <div class="billing-info mb-20">
                                                        <label>Phone <abbr class="required" title="required">*</abbr></label>
                                                        <input type="text" name="phone" placeholder="Your Phone Number" value="${sessionScope.user.phone}" required="true" pattern="[0]{1}[0-9]{9}">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12">
                                                    <div class="billing-info mb-20">
                                                        <label>Email Address <abbr class="required" title="required">*</abbr></label>
                                                        <input type="text" pattern="[^@\s]+@[^@\s]+\.[^@\s]+" title="Địa chỉ email không đúng định dạng" name="email" placeholder="Your Email" value="${sessionScope.user.user_email}" required="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="additional-info-wrap">
                                                <label>Order notes</label>
                                                <textarea placeholder="Notes about your order, e.g. special notes for delivery. " name="note"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <div class="col-lg-5">
                                    <div class="your-order-area">
                                        <h3>Your order</h3>
                                        <div class="your-order-wrap gray-bg-4">
                                            <div class="your-order-info-wrap">
                                                <div class="your-order-info">
                                                    <ul>
                                                        <li>Product <span>Total</span></li>
                                                    </ul>
                                                </div>
                                                <div class="your-order-middle">
                                                    <ul>
                                                        <c:forEach items="${sessionScope.cart.items}" var="i">
                                                            <li>${i.product.productName} X ${i.quantity}
                                                                <span>
                                                                    <fmt:setLocale value = "en_US"/>
                                                                    <fmt:formatNumber  value="${i.product.getProductPriceFloat() * i.quantity}"  type="currency"></fmt:formatNumber>
                                                                    </span></li>
                                                            </c:forEach>


                                                    </ul>
                                                </div>
                                                <div class="your-order-info order-subtotal">
                                                    <ul>
                                                        <li>Subtotal <span>
                                                                <fmt:setLocale value = "en_US"/>
                                                                <fmt:formatNumber  value="${sessionScope.cart.getTotalMoney()}"  type="currency"></fmt:formatNumber>
                                                                </span></li>
                                                        </ul>
                                                    </div>
                                                    <div class="your-order-info order-shipping">
                                                        <ul>
                                                            <li>Shipping <p>
                                                                <fmt:setLocale value = "en_US"/>
                                                                <fmt:formatNumber  value="${requestScope.shipFee}"  type="currency"></fmt:formatNumber>
                                                                </p>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="your-order-info order-total">
                                                        <ul>
                                                            <li>Total <span>
                                                                <fmt:setLocale value = "en_US"/>
                                                                <fmt:formatNumber  value="${sessionScope.cart.getTotalMoney()+requestScope.shipFee}"  type="currency"></fmt:formatNumber>
                                                                <input type="hidden" value="${sessionScope.cart.getTotalMoney()+requestScope.shipFee}" name="totalAmount">
                                                            </span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="payment-method">
                                                <div class="pay-top sin-payment">
                                                    <input id="payment_method_1" class="input-radio" type="radio" value="Direct Bank Transfer" checked="checked" name="payMethod">
                                                    <label for="payment_method_1"> Direct Bank Transfer </label>
                                                    <div class="payment-box payment_method_bacs">
                                                        <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference.</p>
                                                    </div>
                                                </div>
                                                <div class="pay-top sin-payment">
                                                    <input id="payment-method-2" class="input-radio" type="radio" value="Check payments" name="payMethod">
                                                    <label for="payment-method-2">Check payments</label>
                                                    <div class="payment-box payment_method_bacs">
                                                        <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference.</p>
                                                    </div>
                                                </div>
                                                <div class="pay-top sin-payment">
                                                    <input id="payment-method-3" class="input-radio" type="radio" value="Cash on delivery" name="payMethod">
                                                    <label for="payment-method-3">Cash on delivery </label>
                                                    <div class="payment-box payment_method_bacs">
                                                        <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference.</p>
                                                    </div>
                                                </div>
                                                <div class="pay-top sin-payment sin-payment-3">
                                                    <input id="payment-method-4" class="input-radio" type="radio" value="PayPal" name="payMethod">
                                                    <label for="payment-method-4">PayPal <img alt="" src="assets/images/icon-img/payment.png"><a href="#">What is PayPal?</a></label>
                                                    <div class="payment-box payment_method_bacs">
                                                        <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="Place-order">
                                            <a href="#" onclick="document.getElementById('orderFormSubmit').click()">Place Order</a>
                                            <input type="submit" id="orderFormSubmit" hidden>
                                        </div>
                                    </div>
                                </div>
                            </div>                   
                        </form>
                    </div>
                </div>
            </div>
            <jsp:include page="../Common/footer.jsp"></jsp:include>
            </div>

            <script src="${pageContext.request.contextPath}/assets/js/vendor/modernizr-3.11.7.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-v3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-migrate-v3.3.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/slick.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/jquery.syotimer.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/jquery.nice-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/wow.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/jquery-ui.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/magnific-popup.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/sticky-sidebar.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/easyzoom.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/scrollup.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/ajax-mail.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    </body>
</html>
