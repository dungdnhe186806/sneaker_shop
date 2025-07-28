<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html class="no-js" lang="zxx">



    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>SHOP - VIRUS SNEAKER</title>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
            function changeSort() {
                var sortBase = $('#sortselect');
                $.ajax({
                    url: "Product",
                    type: 'get',
                    data: {
                        sortBy: sortBase.val(),
                        action: "sortProduct"
                    },
                    success: function () {
                        $('#shop_area').load("${pageContext.request.contextPath}/Product?action=pagination&page=${page} #shop_area");
                        $('.topbarnav').load("${pageContext.request.contextPath}/Product?action=pagination&page=${page} .topbarnav");
                    }
                });
            }
            ;

            function ChangeView() {
                var viewAmound = $('#view');
                $.ajax({
                    url: "Product",
                    type: 'get',
                    data: {
                        numberPage: viewAmound.val(),
                        action: "pagination"
                    },
                    success: function () {
                        $('#shop_area').load("${pageContext.request.contextPath}/Product?action=pagination&page=${page} #shop_area");
                        $('.topbarnav').load("${pageContext.request.contextPath}/Product?action=pagination&page=${page} .topbarnav");
                        changeSort();
                    }
                });
            }
            ;

            function ChangeFilter() {
                var SearchKey = $('#searchKey').val();
                var ColorArr = getCheckedByName("color");
                var SizeArr = getCheckedByName("size");
                var Cate =${category_id1==null?0:category_id1};
                var Min = $('#minPrice').val();
                var Max = $('#maxPrice').val();

                $.ajax({
                    url: "Product",
                    type: 'get',
                    data: {
                        searchKey: SearchKey,
                        color: ColorArr.toString(),
                        size: SizeArr.toString(),
                        cateID: Cate,
                        priceMin: Min,
                        priceMax: Max,
                        action: "searchFilter"
                    },
                    success: function () {
                        $('#shop_area').load("${pageContext.request.contextPath}/Product?action=pagination&page=${page} #shop_area");
                        $('.topbarnav').load("${pageContext.request.contextPath}/Product?action=pagination&page=${page} .topbarnav");
                    }
                });
            }
            ;

            function getCheckedByName(name) {
                var chks = document.getElementsByName(name);
                var results = [];
                for (var i = 0; i < chks.length; i++) {
                    chks[i].checked ? results.push(chks[i].value) : "";
                }
                return results;
            }
            ;
            function getModalInfor(pID) {
                $('#myModal').modal('show');
                $('#modalContent').load("${pageContext.request.contextPath}/Product?action=getModalInfo&productID=" + pID + " #modalContent");
            }
            ;
        </script>
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
                            <li class="active">Shop</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="shop-area pt-120 pb-120 section-padding-2">
                <div class="container-fluid">
                    <div class="row flex-row-reverse">
                        <div class="col-lg-9">
                            <div class="shop-topbar-wrapper" >
                                <div class="shop-topbar-left">
                                    <div class="view-mode nav">
                                        <a class="active" href="#shop-1" data-bs-toggle="tab"><i class="icon-grid"></i></a>
                                        <a  href="#shop-2" data-bs-toggle="tab"><i class="icon-menu"></i></a>
                                    </div>
                                    <c:set value="${sessionScope.numberPage==null?12:sessionScope.numberPage}" var="munberPerPage"></c:set>
                                    <p class="topbarnav">Showing ${(page-1)*munberPerPage+1} - ${((page-1)*munberPerPage+munberPerPage)>ListSize?ListSize:((page-1)*munberPerPage+munberPerPage)} of ${ListSize} results</p>
                                </div>
                                <div class="product-sorting-wrapper" class="topbarnav">
                                    <div class="product-shorting shorting-style">
                                        <label>View :</label>
                                        <select name="view" id="view" onchange="ChangeView()">
                                            <option value="12" ${munberPerPage==12?'selected':''}> 12</option>
                                            <option value="16" ${munberPerPage==16?'selected':''}> 16</option>
                                            <option value="20" ${munberPerPage==20?'selected':''}> 20</option>
                                        </select>
                                    </div>
                                    <div class="product-show shorting-style">
                                        <label>Sort by :</label>
                                        <select name="sort" id="sortselect" onchange="changeSort()">
                                            <option value="default" ${sortBy.equals("default")?'selected':''}>Default</option>
                                            <option value="nameAZ" ${sortBy.equals("nameAZ")?'selected':''}> Name (A-Z)</option>
                                            <option value="nameZA" ${sortBy.equals("nameZA")?'selected':''}> Name (Z-A)</option>
                                            <option value="priceAcs" ${sortBy.equals("priceAcs")?'selected':''}> Price (Acs)</option>
                                            <option value="priceDec" ${sortBy.equals("priceDec")?'selected':''}> Price (Dec)</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="shop-bottom-area" id="shop_area">
                                <div class="tab-content jump">
                                    <c:if test="${ListSize==0}">
                                        <center><h3>Không tìm thấy sản phẩm!</h3></center>
                                        </c:if>


                                    <div id="shop-1" class="tab-pane active">
                                        <div class="row">
                                            <c:forEach items="${ProductData}" var="p">
                                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12">
                                                    <div class="single-product-wrap mb-35">
                                                        <div class="product-img product-img-zoom mb-15">
                                                            <a href="${pageContext.request.contextPath}/Product?productId=${p.productID}&action=productdetail">
                                                                <img src="${p.productImg}" alt="" style="height: 336px;">
                                                            </a>
                                                            <div class="product-action-2 tooltip-style-2">
                                                                <button title="Wishlist"><i class="icon-heart"></i></button>
                                                                <button title="Quick View" value="${p.productID}" data-bs-toggle="modal" data-bs-target="#myModal" onclick="getModalInfor(this.value)"><i class="icon-size-fullscreen icons"></i></button>
                                                            </div>
                                                        </div>
                                                        <div class="product-content-wrap-2 text-center">
                                                            <h3><a href="${pageContext.request.contextPath}/Product?productId=${p.productID}&action=productdetail">${p.productName}</a></h3>
                                                            <div class="product-price-2">
                                                                <span>${p.productPrice}</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-content-wrap-2 product-content-position text-center">

                                                            <h3><a href="${pageContext.request.contextPath}/Product?productId=${p.productID}&action=productdetail">${p.productName}</a></h3>
                                                            <div class="product-price-2">
                                                                <span>${p.productPrice}</span>
                                                            </div>
                                                            <div class="pro-add-to-cart">
                                                                <button title="Add to Cart" onclick="getModalInfor(${p.productID})">Add To Cart</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div id="shop-2" class="tab-pane ">
                                        <c:forEach items="${ProductData}" var="p">
                                            <div class="shop-list-wrap mb-30">
                                                <div class="row">
                                                    <div class="col-xl-4 col-lg-5 col-md-6 col-sm-6">
                                                        <div class="product-list-img">
                                                            <a href="${pageContext.request.contextPath}/Product?productId=${p.productID}&action=productdetail">
                                                                <img src="${p.productImg}" alt="Product Style" style="height: 280px;">
                                                            </a>
                                                            <div class="product-list-quickview">
                                                                <button title="Quick View" data-bs-toggle="modal" data-bs-target="#myModal"><i class="icon-size-fullscreen icons"></i></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-8 col-lg-7 col-md-6 col-sm-6">
                                                        <div class="shop-list-content">
                                                            <h3><a href="product-details.html">${p.productName}</a></h3>
                                                            <div class="pro-list-price">
                                                                <span class="new-price">${p.productPrice}</span>
                                                                <span class="old-price">${p.getProductPricePreSale()}</span>
                                                            </div>
                                                            <div class="product-list-rating-wrap">
                                                                <div class="product-list-rating">
                                                                    <i class="icon_star"></i>
                                                                    <i class="icon_star"></i>
                                                                    <i class="icon_star"></i>
                                                                    <i class="icon_star"></i>
                                                                    <i class="icon_star"></i>
                                                                </div>
                                                            </div>
                                                            <p>${p.productDescription}</p>
                                                            <div class="product-list-action">
                                                                <button title="Add To Cart"><i class="icon-basket-loaded"></i></button>
                                                                <button title="Wishlist"><i class="icon-heart"></i></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="pro-pagination-style text-center mt-10">
                                    <c:set var="page" value="${page}"/>
                                    <ul>
                                        <li><a class="prev" href="${pageContext.request.contextPath}/Product?action=pagination&page=${page==1?1:page-1}"><i class="icon-arrow-left"></i></a></li>
                                                <c:forEach begin="${1}" end="${num}" var="i">
                                            <li ><a class="${i==page?'active':''}" href="${pageContext.request.contextPath}/Product?action=pagination&page=${i}">${i}</a></li>
                                            </c:forEach>
                                        <li><a class="next" href="${pageContext.request.contextPath}/Product?action=pagination&page=${page+1}"><i class="icon-arrow-right"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="sidebar-wrapper sidebar-wrapper-mrg-right">
                                <div class="sidebar-widget mb-40">
                                    <h4 class="sidebar-widget-title">Search </h4>
                                    <div class="sidebar-search">
                                        <form class="sidebar-search-form" action="#">
                                            <input type="text" id="searchKey" placeholder="Search here..." onkeyup="ChangeFilter()">
                                            <button>
                                                <i class="icon-magnifier" onclick="ChangeFilter()"></i>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                                <div class="sidebar-widget shop-sidebar-border mb-35 pt-40">
                                    <h4 class="sidebar-widget-title">Categories </h4>
                                    <div class="shop-catigory">
                                        <ul>
                                            <li><a href="${pageContext.request.contextPath}/Product" style="font-size: 17px">All</a></li>
                                                <c:forEach items="${CategoryData}" var="cate">
                                                <li><a href="${pageContext.request.contextPath}/Product?category_id=${cate.category_id}&action=listByCategory">${cate.category_name}</a></li>
                                                </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <div class="sidebar-widget shop-sidebar-border mb-40 pt-40">
                                    <h4 class="sidebar-widget-title">Price Filter </h4>
                                    <div class="price-filter">
                                        <span>Range:  $0.00 - $200.00 </span>
                                        <div id="slider-range"></div>
                                        <div class="price-slider-amount">
                                            <div class="label-input">
                                                $<input type="text" id="minPrice" name="minPrice" oninput="this.style.width = this.value.length + 'ch'">&nbsp-
                                                $<input type="text" id="maxPrice" name="maxPrice" oninput="this.style.width = this.value.length + 'ch'">
                                            </div>
                                            <button type="button" onclick="ChangeFilter()">Filter</button>
                                        </div>
                                    </div>
                                </div>                               
                            </div>
                        </div>
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
