<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>ACCOUNT - VIRUS SNEAKER</title>
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
                            <li class="active">my account </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="my-account-wrapper pt-120 pb-120">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="myaccount-page-wrapper">
                                <div class="row">
                                    <div class="col-lg-3 col-md-4">
                                        <div class="myaccount-tab-menu nav" role="tablist">
                                            <a href="#dashboad" ${accChangeMess!=null||passWrong!=null?'':'class="active"'} data-bs-toggle="tab"><i class="fa fa-dashboard"></i>
                                                Dashboard</a>
                                            <a href="#orders" data-bs-toggle="tab"><i class="fa fa-cart-arrow-down"></i> Orders</a>
                                            <a href="#account-info" data-bs-toggle="tab" ${accChangeMess!=null||passWrong!=null?'class="active"':''}><i class="fa fa-user"></i> Account Details</a>
                                            <a href="${pageContext.request.contextPath}/user?action=logout"><i class="fa fa-sign-out"></i> Logout</a>
                                        </div>
                                    </div>
                                    <div class="col-lg-9 col-md-8">
                                        <div class="tab-content" id="myaccountContent">
                                            <div class="tab-pane fade ${accChangeMess!=null||passWrong!=null?'':'show active'}" id="dashboad" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h3>Dashboard</h3>
                                                    <div class="welcome">
                                                        <p>Hello, <strong>${user.user_name}</strong> (If Not <strong>${user.user_name} !</strong><a href="login-register.html" class="logout"> Logout</a>)</p>
                                                    </div>

                                                    <p class="mb-0">From your account dashboard. you can easily check & view your recent orders, manage your shipping and billing addresses and edit your password and account details.</p>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="orders" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h3>Orders</h3>
                                                    <div class="myaccount-table table-responsive text-center">
                                                        <table class="table table-bordered">
                                                            <thead class="thead-light">
                                                                <tr>
                                                                    <th>Order</th>
                                                                    <th>Date</th>
                                                                    <th>Total</th>
                                                                    <th>Phone</th>
                                                                    <th>Payment Method</th>
                                                                    <th>Address</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${requestScope.orders}" var="o">
                                                                    <tr>
                                                                        <td>${o.id}</td>
                                                                        <td>${o.createdAt}</td>
                                                                        <td>
                                                                            <fmt:setLocale value = "en_US"/>
                                                                            <fmt:formatNumber  value="${o.amount}" type="currency"></fmt:formatNumber>
                                                                            </td>
                                                                            <td>${o.phone}</td>
                                                                        <td>${o.paymentMethod}</td>
                                                                        <td>${o.address}</td>
                                                                        <td><a href="#" onclick="getOrderModal(${o.id})" class="check-btn sqr-btn ">View</a></td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade ${accChangeMess!=null||passWrong!=null?'show active':''}" id="account-info" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h3>Account Details</h3>
                                                    <div class="account-details-form">
                                                        <form action="user" id="accountdetailsform">
                                                            <input hidden type="text" name="action" value="changeAccountDetail">
                                                            <div class="single-input-item">
                                                                <label for="display-name" class="required">Name</label>
                                                                <input type="text" name="name" value="${sessionScope.user.user_name}" readonly/>
                                                            </div>
                                                            <div class="single-input-item">
                                                                <label for="email" class="required">Email Address</label>
                                                                <input type="text" pattern="[^@\s]+@[^@\s]+\.[^@\s]+" title="Địa chỉ email không đúng định dạng" name="email" value="${sessionScope.user.user_email}" readonly/>
                                                            </div>
                                                            <div class="single-input-item">
                                                                <label for="email" class="required">Phone number</label>
                                                                <input type="phone" name="phone" value="${sessionScope.user.phone}" readonly/>
                                                            </div>
                                                            <div class="single-input-item">
                                                                <label for="address" class="required">Address</label>
                                                                <input type="address" name="address" value="${sessionScope.user.address}" readonly/>
                                                            </div>
                                                            <fieldset>
                                                                <legend>Password change</legend>
                                                                <div class="single-input-item">
                                                                    <label for="current-pwd" class="required">Current Password</label>
                                                                    <input type="password" minlength="5" id="curPass" name="current_pwd" required/>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-6">
                                                                        <div class="single-input-item">
                                                                            <label for="new-pwd" class="required">New Password</label>
                                                                            <input type="password" minlength="5" id="newpass" name="newpass" readonly/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="single-input-item">
                                                                            <label for="confirm-pwd" class="required">Confirm Password</label>
                                                                            <input type="password" minlength="5" id="newrepass" name="newrepass" readonly/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                            <div class="single-input-item">
                                                                <button type="button" class="check-btn sqr-btn " id="changeToggle">Changes Details</button>
                                                                <button type="submit" class="check-btn sqr-btn editButton" id="saveEdit" hidden>Save Changes</button>
                                                                <button type="reset" class="btn-cancel editButton" id="cancelEdit" hidden>Cancel</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="../Common/footer.jsp"></jsp:include>
            <c:if test="${accChangeMess!=null}">
                <jsp:include page="../Common/modalMessage.jsp"></jsp:include>
                    <script>
                        window.onload = () => {
                            $('#modalMessContent').text("${accChangeMess}");
                            const myModal = new bootstrap.Modal('#myMessModal');
                            myModal.show();
                        };
                </script>
            </c:if>
            <c:if test="${passWrong!=null}">
                <jsp:include page="../Common/modalMessage.jsp"></jsp:include>
                    <script>
                        window.onload = () => {
                            $('#modalMessContent').text("${passWrong}");
                            $('#modalMessContent').attr('class', 'alert alert-danger');
                            const myModal = new bootstrap.Modal('#myMessModal');
                            myModal.show();
                        };
                </script>
            </c:if>
            <div class="modal fade" id="myOrderModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document" style="max-width: 1550px; width: 1500px">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3>Order Details</h3>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
                        </div>
                        <div class="modal-body" id="modalOrderContent" >
                            <div class="table-content table-responsive cart-table-content" >
                                <table id="tableCont" style="width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>Image</th>
                                            <th>Product Name</th>
                                            <th>Until Price</th>
                                            <th>Size</th>
                                            <th>Color</th>
                                            <th>Qty</th>
                                            <th>Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tableBody">
                                        <c:forEach items="${requestScope.orderDetail}" var="od">
                                            <tr>
                                                <td class="product-thumbnail">
                                                    <a href="${pageContext.request.contextPath}/Product?productId=${od.product.productID}&action=productdetail">
                                                        <img src="${od.product.productImg}" alt=""></a>
                                                </td>
                                                <td class="product-name"><a href="${pageContext.request.contextPath}/Product?productId=${od.product.productID}&action=productdetail">
                                                        ${od.product.productName}</a></td>

                                                <td class="product-price-cart" >
                                                    <span class="amount ">${od.product.productPrice}</span>
                                                </td>
                                                <td class="product-size">
                                                    ${od.size}
                                                </td>
                                                <td class="product-color">
                                                    ${od.color}
                                                </td>
                                                <td class="product-quantity pro-details-quality">
                                                    ${od.quantity}
                                                </td>
                                                <td class="product-subtotal">
                                                    <fmt:setLocale value = "en_US"/>
                                                    <fmt:formatNumber  value="${od.quantity*od.product.getProductPriceFloat()}" type="currency"></fmt:formatNumber>
                                                    </td>
                                                </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
                        function getOrderModal(ID) {
                            $('#modalOrderContent').load("${pageContext.request.contextPath}/user?action=getOrderModal&id=" + ID + " #modalOrderContent");
                            $('#myOrderModal').modal('show');
                        }
                        $('#changeToggle').on('click', function () {
                            $('.editButton').attr('hidden', false);
                            $('#changeToggle').attr('hidden', true);
                            $('.account-details-form').find('input').attr('readonly', false);
                            $('.account-details-form').find('input[type=email]').attr('readonly', true);
                        });
                        $('#cancelEdit').on('click', function () {
                            $('.editButton').attr('hidden', true);
                            $('#changeToggle').attr('hidden', false);
                            $('.account-details-form').find('input').attr('readonly', true);
                        });

                        $('#newpass,#newrepass').on('keyup', function () {
                            $('.account-details-form').find('#newpass').attr('required', true);
                            $('.account-details-form').find('#newrepass').attr('required', true);
                            $('.account-details-form').find('#newrepass').get(0).setCustomValidity('');
                        });
                        $('#saveEdit').on('click', function () {
                            var pass = $('.account-details-form').find('#newpass').val();
                            var repass = $('.account-details-form').find('#newrepass').val();
                            if (pass !== repass) {
                                $('.account-details-form').find('#newrepass').get(0).setCustomValidity('Passwords do not match');
                                $('.account-details-form').find('#newrepass').get(0).reportValidity();

                            } else {
                                $('#saveEdit').click();
                            }
                        });

        </script>
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    </body>
</html>
