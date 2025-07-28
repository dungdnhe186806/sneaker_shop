<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html class="no-js" lang="en">



    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>PRODUCT - VIRUS SNEAKER</title>
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

        <style>
            .btn span.glyphicon {
                opacity: 0;
            }
            .btn.active span.glyphicon {
                opacity: 1;
            }
        </style>

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
                            <li class="active">product details </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="product-details-area pt-120 pb-115">
                <div class="container" >
                    <div class="row" >
                        <div class="col-lg-6 col-md-6" >
                            <div class="product-details-tab">
                                <div class="easyzoom-style easyzoom--overlay">
                                    <div class="easyzoom easyzoom--overlay">
                                        <a href="${requestScope.ProductData.productImg}">
                                            <img src="${requestScope.ProductData.productImg}" alt="" >
                                        </a>
                                    </div>
                                    <a class="easyzoom-pop-up img-popup" href="${requestScope.ProductData.productImg}"><i class="icon-size-fullscreen"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="product-details-content pro-details-content-mrg">
                                <h2>${requestScope.ProductData.productName}</h2>
                                <div class="product-ratting-review-wrap">
                                    <div class="product-ratting-digit-wrap">
                                        <div class="product-ratting">
                                            <i class="icon_star"></i>
                                            <i class="icon_star"></i>
                                            <i class="icon_star"></i>
                                            <i class="icon_star"></i>
                                            <i class="icon_star"></i>
                                        </div>
                                        <div class="product-digit">
                                            <span>5.0</span>
                                        </div>
                                    </div>
                                </div>
                                <p>Seamlessly predominate enterprise metrics without performance based process improvements.</p>
                                <div class="pro-details-price">
                                    <span class="new-price">${requestScope.ProductData.productPrice}</span>
                                    <span class="old-price">${requestScope.ProductData.getProductPricePreSale()}</span>
                                </div>
                                <div class="pro-details-color-wrap">
                                    <span>Color:</span>
                                    <div class="pro-details-color-content">
                                        <div class="btn-group"  data-toggle="buttons" >
                                            <span class="glyphicon glyphicon-ok" style="color: #000" ></span>
                                            <c:forEach items="${ColorData}" var="c">
                                                <label class="btn" style="background-color: ${c.color}" id="ProdDetailColor">
                                                    <input type="radio" name="colorOption" value="${c.color.trim()}" autocomplete="off" >
                                                    <span style="color:  ${c.color.trim().equals("white")?'black':'white'}">Z</span>
                                                </label>
                                            </c:forEach>
                                            <div id="colorvalidate" class="text-danger"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="pro-details-size">
                                    <span>Size:</span>
                                    <div class="pro-details-size-content">
                                        <div class="btn-group" id="ProdDetailSize">
                                            <c:forEach items="${SizeData}" var="s">
                                                <input type="radio" class="btn-check" id="${s.size}" name="sizeOption" value="${s.size}" autocomplete="off" />
                                                <label class="btn btn-default" for="${s.size}" style="font-size: 15px">${s.size}</label>
                                            </c:forEach>
                                            <div id="sizevalidate" class="text-danger"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="pro-details-quality">
                                    <span>Quantity:</span>
                                    <div class="cart-plus-minus">
                                        <input class="cart-plus-minus-box" type="text" name="qtybutton" value="1" max="${requestScope.ProductData.productQuantity}" id="ProdDetailQuantity">
                                    </div>
                                </div>
                                <div class="product-details-meta">
                                    <ul>
                                        <li><span>Categories:</span> <a href="#?cate=${requestScope.ProductData.cate.category_name}">${requestScope.ProductData.cate.category_name}</a></li>
                                    </ul>
                                </div>
                                <div class="pro-details-action-wrap">
                                    <div class="pro-details-add-to-cart">
                                        <input type="text" hidden id="ProdDetailID" value="${requestScope.ProductData.productID}">
                                        <button type="submit" id="AddToCartDetail" >Add to cart</button>
                                    </div>
                                    <div class="pro-details-action">
                                        <a title="Add to Wishlist" href="#"><i class="icon-heart"></i></a>
                                        <a class="social" title="Social" href="#"><i class="icon-share"></i></a>
                                        <div class="product-dec-social">
                                            <a class="facebook" title="Facebook" href="#"><i class="icon-social-facebook"></i></a>
                                            <a class="twitter" title="Twitter" href="#"><i class="icon-social-twitter"></i></a>
                                            <a class="instagram" title="Instagram" href="#"><i class="icon-social-instagram"></i></a>
                                            <a class="pinterest" title="Pinterest" href="#"><i class="icon-social-pinterest"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="description-review-wrapper pb-110" >
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="dec-review-topbar nav mb-45" role="tablist">
                                <a class="active" data-bs-toggle="tab" href="#des-details1" aria-selected="true" role="tab">Description</a>
                                <a data-bs-toggle="tab" href="#des-details2" aria-selected="false" role="tab" class="" tabindex="-1">Specification</a>
                                <a data-bs-toggle="tab" href="#des-details3" aria-selected="false" role="tab" class="" tabindex="-1">Meterials </a>
                            </div>
                            <div class="tab-content dec-review-bottom">
                                <div id="des-details1" class="tab-pane active show" role="tabpanel">
                                    <div class="description-wrap">
                                        <p>${requestScope.ProductData.productDescription}</p>
                                        <p>${requestScope.ProductData.productDescription}</p>
                                        <p>${requestScope.ProductData.productDescription}</p>

                                    </div>
                                </div>
                                <div id="des-details2" class="tab-pane" role="tabpanel">
                                    <div class="specification-wrap table-responsive">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="title width1">Name</td>
                                                    <td>Salwar Kameez</td>
                                                </tr>
                                                <tr>
                                                    <td class="title width1">SKU</td>
                                                    <td>0x48e2c</td>
                                                </tr>
                                                <tr>
                                                    <td class="title width1">Models</td>
                                                    <td>FX 829 v1</td>
                                                </tr>
                                                <tr>
                                                    <td class="title width1">Categories</td>
                                                    <td>Digital Print</td>
                                                </tr>
                                                <tr>
                                                    <td class="title width1">Size</td>
                                                    <td>60’’ x 40’’</td>
                                                </tr>
                                                <tr>
                                                    <td class="title width1">Brand </td>
                                                    <td>Individual Collections</td>
                                                </tr>
                                                <tr>
                                                    <td class="title width1">Color</td>
                                                    <td>Black, White</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div id="des-details3" class="tab-pane" role="tabpanel">
                                    <div class="specification-wrap table-responsive">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="title width1">Top</td>
                                                    <td>Cotton Digital Print Chain Stitch Embroidery Work</td>
                                                </tr>
                                                <tr>
                                                    <td class="title width1">Bottom</td>
                                                    <td>Cotton Cambric</td>
                                                </tr>
                                                <tr>
                                                    <td class="title width1">Dupatta</td>
                                                    <td>Digital Printed Cotton Malmal With Chain Stitch</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="related-product pb-115">
                <div class="container">
                    <div class="section-title mb-45 text-center">
                        <h2>Related Product</h2>
                    </div>
                    <div class="related-product-active">

                        <c:forEach items="${ProductByCategory}" var="p">
                            <div class="product-plr-1">
                                <div class="single-product-wrap">
                                    <div class="product-img product-img-zoom mb-15">
                                        <a href="${pageContext.request.contextPath}/Product?productId=${p.productID}&action=productdetail">
                                            <img src="${p.productImg}" alt="">
                                        </a>
                                        <div class="product-action-2 tooltip-style-2">
                                            <button title="Wishlist"><i class="icon-heart"></i></button>
                                        </div>
                                    </div>
                                    <div class="product-content-wrap-2 text-center">
                                        <h3><a href="${pageContext.request.contextPath}/Product?productId=${p.productID}&action=productdetail">${p.productName}</a></h3>
                                        <div class="product-price-2">
                                            <span>${p.getProductPrice()}</span>
                                        </div>
                                    </div>
                                    <div class="product-content-wrap-2 product-content-position text-center">

                                        <h3><a href="${pageContext.request.contextPath}/Product?productId=${p.productID}&action=productdetail">Basic Joggin Shorts</a></h3>
                                        <div class="product-price-2">
                                            <span>${p.getProductPrice()}</span>
                                        </div>
                                        <div class="pro-add-to-cart">
                                            <button title="Add to Cart" id="AddToCart">Add To Cart</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </div>
            </div>
            <jsp:include page="../Common/footer.jsp"></jsp:include>
            <jsp:include page="../Common/HomeProductModal.jsp"></jsp:include>

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
