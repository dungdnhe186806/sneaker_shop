<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
            </div>
            <div class="modal-body" id="modalContent">
                <div class="row">
                    <div class="col-lg-5 col-md-6 col-12 col-sm-12">
                        <div class="tab-content quickview-big-img">
                            <div id="pro-1" class="tab-pane fade show active">
                                <img src="${modalProduct.productImg}" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-6 col-12 col-sm-12">
                        <div class="product-details-content quickview-content">
                            <h2>${modalProduct.productName}</h2>
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
                                <span class="new-price">${modalProduct.getProductPrice()}</span>
                                <span class="old-price">${modalProduct.getProductPricePreSale()}</span>
                            </div>
                            <div class="pro-details-color-wrap">
                                <span>Color:</span>
                                <div class="pro-details-color-content">
                                    <div class="btn-group"  data-toggle="buttons" >
                                        <span class="glyphicon glyphicon-ok" style="color: #000" ></span>
                                        <c:forEach items="${ColorData}" var="c">
                                            <label class="btn" style="background-color: ${c.color}" id="ProdDetailColor">
                                                <input type="radio" name="colorOption" value="${c.color.trim()}" autocomplete="off" >
                                                <span style="color:  ${c.color.trim().equals("#white")?'black':'white'}">Z</span>
                                            </label>
                                        </c:forEach>
                                        <div class="text-danger" id="colorvalidate"></div>
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
                                        <div class="text-danger" id="sizevalidate" ></div>
                                    </div>
                                </div>
                            </div>
                            <div class="pro-details-quality ">
                                <span>Quantity:</span>
                                <div class="cart-plus-minus">
                                    <input class="cart-plus-minus-box" type="text" name="qtybutton" value="1" max="${modalProduct.productQuantity}" id="ProdDetailQuantity">
                                </div>
                            </div>
                            <div class="product-details-meta">
                                <ul>
                                    <li><span>Categories:</span><a href="${pageContext.request.contextPath}/Product?category_id=${modalProduct.cate.category_id}&action=listByCategory">
                                            ${modalProduct.cate.category_name}</a></li>
                                </ul>
                            </div>
                            <div class="pro-details-action-wrap">
                                <div class="pro-details-add-to-cart">
                                    <input type="text" hidden id="ProdDetailID" value="${modalProduct.productID}">
                                    <button type="submit" id="ModalAddToCart" >Add to cart</button>
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
    </div>
</div>

