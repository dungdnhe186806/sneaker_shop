<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách sản phẩm | Quản trị Admin</title>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                nowTime = h + " giờ " + m + " phút " + s + " giây";
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
            function getModalProduct(ID) {
                $('#modalProductContent').load("${pageContext.request.contextPath}/productmanager?action=getModalProduct&id=" + ID + " #modalProductContent");
                $('#myModalProduct').modal('show');
            }

            var myApp = new function () {
                this.printTable = function () {
                    var tab = document.getElementById('sampleTable');
                    var win = window.open('', '', 'height=700,width=700');
                    win.document.write(tab.outerHTML);
                    win.document.close();
                    win.print();
                };
            };
            function readURL(input, thumbimage) {
                if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#thumbimage").attr('src', e.target.result);
                    };
                    reader.readAsDataURL(input.files[0]);
                } else {
                    $("#thumbimage").attr('src', input.value);
                }
                $("#thumbimage").show();
                $('.filename').text($("#uploadfile").val());
                $('.Choicefile').css('background', '#14142B');
                $('.Choicefile').css('cursor', 'default');
                $(".removeimg").show();
                $(".Choicefile").unbind('click');
            }
            $(document).ready(function () {
                $(".Choicefile").bind('click', function () {
                    $("#uploadfile").click();
                });
                $(".removeimg").click(function () {
                    $("#thumbimage").attr('src', '').hide();
                    $("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
                    $(".removeimg").hide();
                    $(".Choicefile").bind('click', function () {
                        $("#uploadfile").click();
                    });
                    $('.Choicefile').css('background', '#14142B');
                    $('.Choicefile').css('cursor', 'pointer');
                    $(".filename").text("");
                });
            });
            const inpFile = document.getElementById("inpFile");
            const loadFile = document.getElementById("loadFile");
            const previewContainer = document.getElementById("imagePreview");
            const previewImage = previewContainer.querySelector(".image-preview__image");
            const previewDefaultText = previewContainer.querySelector(".image-preview__default-text");
            const object = new ActiveXObject("Scripting.FileSystemObject");
            inpFile.addEventListener("change", function () {
                const file = this.files[0];
                if (file) {
                    const reader = new FileReader();
                    previewDefaultText.style.display = "none";
                    previewImage.style.display = "block";
                    reader.addEventListener("load", function () {
                        previewImage.setAttribute("src", this.result);
                    });
                    reader.readAsDataURL(file);
                }
            });
        </script>
        
        
    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <jsp:include page="../Common/AdminCommon/headerAdmin.jsp"></jsp:include>
        <jsp:include page="../Common/AdminCommon/sidebarAdmin.jsp"></jsp:include>
            <main class="app-content">
                <div class="app-title">
                    <ul class="app-breadcrumb breadcrumb side">
                        <li class="breadcrumb-item active"><a href="#"><b>Danh sách sản phẩm</b></a></li>
                    </ul>
                    <div id="clock"></div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="tile">
                            <div class="tile-body">
                                <div class="row element-button">
                                    <div class="col-sm-2">
                                        <a class="btn btn-add btn-sm" href="productmanager?action=insert" title="Thêm"><i class="fas fa-plus"></i>
                                            Tạo mới sản phẩm</a>
                                    </div>
                                    <div class="col-sm-2">
                                        <a class="btn btn-delete btn-sm print-file" type="button" title="In" onclick="myApp.printTable()"><i
                                                class="fas fa-print"></i> In dữ liệu</a>
                                    </div>
                                </div>
                                <form action="productmanager?action=updateproduct" method="POST">
                                    <table class="table table-hover table-bordered" id="sampleTable">
                                        <thead>
                                            <tr>
                                                <th>Mã sản phẩm</th>
                                                <th>Danh mục</th>
                                                <th>Tên sản phẩm</th>
                                                <th>Giá</th>
                                                <th>Size</th>
                                                <th>Màu</th>
                                                <th>Thông tin</th>
                                                <th>Số lượng</th>
                                                <th>Ảnh</th>
                                                <th>Chức năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${ProductData}" var="p">
                                            <tr>
                                                <td>${p.productID}</td>
                                                <td>${p.cate.category_name}</td>
                                                <td>${p.productName}</td>
                                                <td>${p.productPrice}</td>
                                                <td>
                                                    <c:forEach items="${p.size}" var="s">
                                                        ${s.size},   
                                                    </c:forEach>
                                                </td>
                                                <td>
                                                    <c:forEach items="${p.color}" var="c">
                                                        ${c.color},   
                                                    </c:forEach>
                                                </td>
                                                <td>${p.productDescription}</td>
                                                <td>${p.productQuantity}</td>
                                                <td><img src="${p.productImg}" alt="" width="100px;" onclick="this.requestFullscreen();"></td>

                                                <td>
                                                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" value="${p.productID}"><i
                                                            class="fas fa-trash-alt"></i>
                                                    </button>
                                                    <button class="btn btn-primary btn-sm edit" id="editButton" type="button" value="${p.productID}" onclick="getModalProduct(${p.productID})"
                                                            ><i class="fas fa-edit"></i>
                                                    </button>
                                                </td>
                                            </tr>

                                        </c:forEach>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="myModalProduct" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">

                        </div>
                        <div class="modal-body" id="modalProductContent">

                            <div class="row">
                                <div class="form-group  col-md-12">
                                    <span class="thong-tin-thanh-toan">
                                        <h5>Chỉnh sửa thông tin sản phẩm</h5>
                                    </span>
                                </div>
                            </div>
                            <form action="productmanager">
                                <input type="text" hidden name="action" value="updateProduct">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Mã sản phẩm </label>
                                        <input class="form-control" type="text" readonly name="product_id" value="${pModal.productID}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleSelect1" class="control-label">Danh mục</label>
                                        <select name="category_id" class="form-control" id="exampleSelect1">
                                            <option>-- Chọn danh mục --</option>
                                            <c:forEach items="${CategoryData}" var="cat">
                                                <option value="${cat.category_id}" ${cat.category_id==pModal.cate.category_id?'selected':''}>${cat.category_name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Tên sản phẩm</label>
                                        <input class="form-control" type="text" name="product_name" required value="${pModal.productName}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Giá</label>
                                        <input class="form-control" type="number" name="product_price" required value="${pModal.getProductPriceFloat()}" step="0.01" min="0">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Màu</label>
                                        <input class="form-control" name="product_color" type="text" value="<c:forEach items="${pModal.color}" var="c">${c.color},</c:forEach>">
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label class="control-label">Size</label>
                                            <input class="form-control" name="product_size" type="text" value="<c:forEach items="${pModal.size}" var="s">${s.size},</c:forEach>">
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label class="control-label">Thông tin</label>
                                            <input class="form-control" type="text" name="product_describe" value="${pModal.productDescription}">
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label class="control-label">Số lượng</label>
                                        <input class="form-control" type="text" name="product_quantity" value="${pModal.productQuantity}" min="1">
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label class="control-label">Ảnh sản phẩm</label>
                                        <div id="myfileupload">
                                            <input type="file" id="uploadfile" name="product_img" value="${pModal.productImg}" onchange="readURL(this);" />
                                        </div>
                                        <div id="thumbbox">
                                            <img height="450" width="400" alt="Thumb image" id="thumbimage" style="display: none" src="${pModal.productImg}"/>
                                            <a class="removeimg" href="javascript:"></a>
                                        </div>
                                        <div id="boxchoice">
                                            <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>
                                            <p style="clear:both"></p>
                                        </div>
                                    </div>

                                </div>
                                <BR>
                                <button class="btn btn-save" type="submit">Lưu lại</button>
                                <button type="button" class="btn btn-cancel" data-bs-dismiss="modal" aria-label="Close">Hủy bỏ<span aria-hidden="true"></span></button>
                                <BR>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>


        <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-v3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/mainAdmin.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/pace.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/dataTables.bootstrap.min.js"></script>

        <script>
                                                $('.trash').on("click", function () {
                                                    Swal.fire({
                                                        title: "Bạn có chắc muốn xóa sản phẩm này?",
                                                        text: "Bạn sẽ không thể quay lại!",
                                                        icon: "warning",
                                                        showCancelButton: true,
                                                        confirmButtonText: "Xóa!",
                                                        cancelButtonText: "Hủy!",
                                                        reverseButtons: true
                                                    }).then((result) => {
                                                        if (result.isConfirmed) {
                                                            Swal.fire({
                                                                title: "Đã Xóa!",
                                                                text: "Sản phẩm đã bị xóa.",
                                                                icon: "success"
                                                            });
                                                            deleteProduct($(this).closest('button').val());
                                                            deleteRow(this);
                                                        }
                                                    });
                                                });
                                                function deleteRow(r) {
                                                    var i = r.parentNode.parentNode.rowIndex;
                                                    document.getElementById("sampleTable").deleteRow(i);
                                                }

                                                function deleteProduct(ID) {
                                                    $.ajax({
                                                        url: "productmanager",
                                                        type: 'post',
                                                        data: {
                                                            id: ID,
                                                            action: "deleteProduct"
                                                        }
                                                    });
                                                }
        </script>
        <script type="text/javascript">$('#sampleTable').DataTable({"aaSorting": [[0, 'asc']]});</script>
    </body>

</html>