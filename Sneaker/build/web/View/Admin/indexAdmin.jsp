<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mainAdmin.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <jsp:include page="../Common/AdminCommon/headerAdmin.jsp"></jsp:include>
        <jsp:include page="../Common/AdminCommon/sidebarAdmin.jsp"></jsp:include>
            <main class="app-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="app-title">
                            <ul class="app-breadcrumb breadcrumb">
                                <li class="breadcrumb-item"><a href="#"><b>Bảng điều khiển</b></a></li>
                            </ul>
                            <div id="clock"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="widget-small primary coloured-icon"><i class='icon bx bxs-user-account fa-3x'></i>
                                    <div class="info">
                                        <h4>Tổng khách hàng</h4>
                                        <p><b>${requestScope.user} khách hàng</b></p>
                                    <p class="info-tong">Tổng số khách hàng được quản lý.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="widget-small info coloured-icon"><i class='icon bx bxs-data fa-3x'></i>
                                <div class="info">
                                    <h4>Tổng sản phẩm</h4>
                                    <p><b>${requestScope.product} sản phẩm</b></p>
                                    <p class="info-tong">Tổng số sản phẩm được quản lý.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="widget-small warning coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
                                <div class="info">
                                    <h4>Tổng đơn hàng</h4>
                                    <p><b>${requestScope.orderCount} đơn hàng</b></p>
                                    <p class="info-tong">Tổng số hóa đơn bán hàng trong tháng.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="widget-small danger coloured-icon"><i class='icon bx bxs-error-alt fa-3x'></i>
                                <div class="info">
                                    <h4>Sắp hết hàng</h4>
                                    <p><b>${requestScope.low} sản phẩm</b></p>
                                    <p class="info-tong">Số sản phẩm cảnh báo hết cần nhập thêm.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="tile">
                                <h3 class="tile-title">Đơn hàng hôm nay</h3>
                                <div>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>ID đơn hàng</th>
                                                <th>Người dùng</th>
                                                <th>Tên Người nhận</th>
                                                <th>Số điện thoại</th>
                                                <th>Địa chỉ</th>
                                                <th>Ngày mua</th>
                                                <th>Tổng tiền</th>
                                                <th>Thanh Toán</th>
                                                <th>Chức năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.orderbyday}" var="o">
                                                <tr>
                                                    <td>${o.id}</td>
                                                    <td>${o.user==null?"Khách":o.user.user_name}</td>
                                                    <td>${o.name}</td>
                                                    <td>(+84)${o.phone}</td>
                                                    <td>${o.address}</td>
                                                    <td>${o.createdAt}</td>
                                                    <td>
                                                        <fmt:setLocale value = "en_US"/>
                                                        <fmt:formatNumber  value="${o.amount}"  type="currency"></fmt:formatNumber>
                                                    </td>
                                                    <td><span class="badge bg-success">${o.paymentMethod}</span></td>                                  
                                                    <td><a style=" color: rgb(245 157 57);background-color: rgb(251 226 197); padding: 5px;border-radius: 5px;" href="ordermanager?action=showdetail&order_id=${o.id}"><i class="fa"></i>Chi tiết đơn hàng</a></td>
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


            <div class="text-center" style="font-size: 13px">
                <p><b>Copyright
                        <script type="text/javascript">
                            document.write(new Date().getFullYear());
                        </script> Virus Sneaker SE1827 
                    </b></p>
            </div>
        </main>




        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-v3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/popper.min.js"></script>
        <script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/mainAdmin.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/pace.min.js"></script>


        <script type="text/javascript">
                            function time() {
                                var today = new Date();
                                var weekday = new Array(7);
                                weekday[0] = "Chủ Nhật";
                                weekday[1] = "Thứ Hai";
                                weekday[2] = "Thứ Ba";
                                weekday[3] = "Thứ Tư";
                                weekday[4] = "Thứ Năm";
                                weekday[5] = "Thứ Sáu";
                                weekday[6] = "Thứ Bảy";
                                var day = weekday[today.getDay()];
                                var dd = today.getDate();
                                var mm = today.getMonth() + 1;
                                var yyyy = today.getFullYear();
                                var h = today.getHours();
                                var m = today.getMinutes();
                                m = checkTime(m);
                                nowTime = h + ":" + m + "";
                                if (dd < 10) {
                                    dd = '0' + dd
                                }
                                if (mm < 10) {
                                    mm = '0' + mm
                                }
                                today = day + ', ' + dd + '/' + mm + '/' + yyyy;
                                tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                                        '</span>';
                                document.getElementById("clock").innerHTML = tmp;
                                clocktime = setTimeout("time()", "1000", "Javascript");

                                function checkTime(i) {
                                    if (i < 10) {
                                        i = "0" + i;
                                    }
                                    return i;
                                }
                            }
        </script>
    </body>

</html>
