<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="en">



    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>CART - VIRUS SNEAKER</title>
        <meta name="robots" content="noindex, follow" />
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/logo/clothing.jpg">
        <link id="contextPathHolder" data-contextPath="${pageContext.request.contextPath}"/>
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
                            <li class="active"> Cart Page </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="cart-main-area pt-115 pb-120">
                <div class="container" style="max-width: 95%">
                    <h3 class="cart-page-title">Your cart items</h3>
                    <div class="row">
                        <div class=" col-9">
                            <form action="#">
                                <div class="table-content table-responsive cart-table-content" >
                                    <table id="tableCont">
                                        <thead>
                                            <tr>
                                                <th>Image</th>
                                                <th>Product Name</th>
                                                <th>Until Price</th>
                                                <th>Size</th>
                                                <th>Color</th>
                                                <th>Qty</th>
                                                <th>Subtotal</th>
                                                <th>action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tableBody">
                                            <c:forEach items="${sessionScope.cart.items}" var="i">
                                                <tr>
                                                    <td class="product-thumbnail">
                                                        <a href="${pageContext.request.contextPath}/Product?productId=${i.product.productID}&action=productdetail">
                                                            <img src="${i.product.productImg}" alt=""></a>
                                                    </td>
                                                    <td class="product-name"><a href="${pageContext.request.contextPath}/Product?productId=${i.product.productID}&action=productdetail">
                                                            ${i.product.productName}</a></td>

                                                    <td class="product-price-cart" >
                                                        <span class="amount ">$${i.product.getProductPriceFloat()}</span>
                                                        <input type="hidden" id="productPriceCart" value="${i.product.getProductPriceFloat()}">
                                                    </td>
                                                    <td class="product-size">

                                                        <select name="size" style="width: 40px; height: 40px" class="dropdown-item">
                                                            <c:forEach items="${i.getAllSize()}" var="s">
                                                                <option value="${s.size}" ${i.size.equals(s.size)?'selected':''}>${s.size}</option>
                                                            </c:forEach>
                                                        </select>

                                                    </td>
                                                    <td class="product-color">
                                                        <select name="color" class="dropdown-item-text dropdown-center" style="width: 90px; height: 40px" >
                                                            <c:forEach items="${i.getAllColor()}" var="c">
                                                                <option value="${c.color}" ${i.color.equals(c.color)?'selected':''} style="background: ${c.color}">
                                                                    ${c.color}
                                                                <div style="width: 20px;height: 20px;background:${c.color}"></div>
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    <td class="product-quantity pro-details-quality">
                                                        <div class="cart-plus-minus">
                                                            <input class="cart-plus-minus-box" type="text" name="qtybutton" max="${i.product.getProductQuantity()}" value="${i.quantity}">
                                                        </div>
                                                    </td>
                                                    <td class="product-subtotal">
                                                        <input type="hidden" value="${i.quantity*i.product.getProductPriceFloat()}" class="product_subtotal">
                                                        <fmt:setLocale value = "en_US"/>
                                                        <fmt:formatNumber  value="${i.quantity*i.product.getProductPriceFloat()}" type="currency"></fmt:formatNumber>
                                                        </td>
                                                        <td class="product-remove">
                                                            <input type="hidden" id="productIDInput" value="${i.product.productID}">
                                                        <div class="DeleteFromCart"><i class="icon_close"></i></div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="cart-shiping-update-wrapper">
                                            <div class="cart-shiping-update">
                                                <a href="${pageContext.request.contextPath}/Home">Continue Shopping</a>
                                            </div>
                                            <div class="cart-clear">
                                                <a href="${pageContext.request.contextPath}/Cart?action=clearCart">Clear Cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-3">
                            <div class="grand-totall" id="cartGrandTotal">
                                <form id="shipFeeForm" action="Order" method="post">
                                    <div class="title-wrap">
                                        <h4 class="cart-bottom-title section-bg-gary-cart">Cart Total</h4>
                                    </div>
                                    <h5>Total products <span id="beforeCheckOutPricetext">
                                            <input type="hidden"  id="beforeCheckOut" value="${sessionScope.cart.getTotalMoney()}">
                                            <fmt:setLocale value = "en_US"/>
                                            <fmt:formatNumber  value="${sessionScope.cart.getTotalMoney()}" type="currency"></fmt:formatNumber>
                                            </span></h5>
                                        <div class="total-shipping">
                                            <h5>Total shipping</h5>

                                            <ul id="shipFee">
                                                <li><input type="radio" name="shipFee"  value="20"> Standard <span>$20.00</span></li>
                                                <li><input type="radio" name="shipFee" value="30"> Express <span>$30.00</span></li>
                                            </ul>
                                            <p id="shippingMess" hidden="true" class="alert-danger">Please choose one of the shipping methods!</p>
                                        </div>
                                        <h4 class="grand-totall-title">Grand Total <span id="checkOutPrice">
                                                <input type="hidden" id="checkOutPriceInput" value="${sessionScope.cart.getTotalMoney()}">
                                            <fmt:setLocale value = "en_US"/>
                                            <fmt:formatNumber  value="${sessionScope.cart.getTotalMoney()}" type="currency"></fmt:formatNumber></span></h4>
                                        <a href="#" id="checkOutButton">Proceed to Checkout</a>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <jsp:include page="../Common/footer.jsp"></jsp:include>
            <c:if test="${modalMess!=null}">
                <jsp:include page="../Common/modalMessage.jsp"></jsp:include>
                    <script>
                        window.onload = () => {
                            $('#modalMessContent').attr("class", "alert alert-danger");
                            $('#modalMessContent').text("${requestScope.modalMess}");
                            $('#myModelTitle').text("${requestScope.modalTitle}");
                            const myModal = new bootstrap.Modal('#myMessModal');
                            myModal.show();
                        };
                </script>
            </c:if>
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
