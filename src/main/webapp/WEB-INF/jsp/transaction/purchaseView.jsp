<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../util/top.jsp"/>

<div class="preloader" style="display: none;">
    <img src="/assets/images/loader.png" class="preloader__image" alt="">
</div><!-- /.preloader -->

<section class="page-header" style="background-image: url(/assets/images/backgrounds/page-header-contact.jpg);">
    <div class="container">

        <ul class="thm-breadcrumb list-unstyled">
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</section>

<section class="checkout">
    <form action="/bsa/transactions" method="post" class="billing_details_form">
        <input type="hidden" name="_method" value="delete">
        <input type="hidden" name="transactionCode" value="${transaction.transactionCode}">
        <div class="container">
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="billing_title">
                        <h2 style="font-family: 'Nanum Gothic', sans-serif">구매 내역</h2>
                        <hr>
                        <h6 style="font-family: 'Nanum Gothic', sans-serif">구매 내역 상세 정보</h6>
                    </div>
                    <div class="row">
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">구매일시</h3>
                            <div class="billing_input_box">
                                <input type="text" name="transactionDateTime" value="${transaction.transactionDateTime}" id="transactionDateTime"  readonly>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">판매자 아이디</h3>
                            <div class="billing_input_box">
                                <input type="text" name="sellerId" value="${member.id}" id="sellerId" readonly>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">판매자 연락처</h3>
                            <div class="billing_input_box">
                                <input type="text" name="phone" value="${member.phone}" id="phone" readonly>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">판매자 주소</h3>
                            <div class="billing_input_box">
                                <input type="text" name="address" value="${member.address}" id="address" readonly>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">상품번호</h3>
                            <div class="billing_input_box">
                                <input type="text" name="silageCode" value="${silage.silageCode}" id="silageCode" readonly>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">제조일자</h3>
                            <div class="billing_input_box">
                                <input type="text" name="productionDate" value="${silage.productionDate}" id="productionDate" readonly>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">무게</h3>
                            <div class="billing_input_box">
                                <input type="text" name="weight" value="${silage.weight}" id="weight" readonly>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">개수</h3>
                            <div class="billing_input_box">
                                <input type="text" name="count" value="${silage.count}" id="count" readonly>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">단가</h3>
                            <div class="billing_input_box">
                                <input type="text" name="unitPrice" value="${silage.unitPrice}" id="unitPrice" readonly>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">가격</h3>
                            <div class="billing_input_box">
                                <input type="text" name="totalPrice" value="${transaction.totalPrice}" id="totalPrice" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-12 col-lg-12">
                            <div class="billing_title" style="margin-top:10%; height: auto">
                                <h4 style="font-family: 'Nanum Gothic', sans-serif">입금 계좌(※ 입금하실 때 보내는 사람을 상품 번호로 바꿔주세요!)</h4>
                                <hr>
                            </div>
                            <div class="row">
                                <div class="col-xl-12">
                                    <h3 style="font-family: 'Nanum Gothic', sans-serif">은행명</h3>
                                    <div class="billing_input_box">
                                        <input type="text" name="bankName" value="국민" id="bankName"  readonly>
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <h3 style="font-family: 'Nanum Gothic', sans-serif">계좌번호</h3>
                                    <div class="billing_input_box">
                                        <input type="text" name="accoountNo" value="9416004938034" id="accoountNo" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="your_order">
                <div class="row">
                    <div class="col-xl-6 col-lg-6">
                        <div class="row" style="width: 210%">
                            <div class="col-sm-12">
                                <div class="place_order_btn" style="margin:10px">
                                    <a href="/bsa/purchases" class="thm-btn" style="text-align: center">목록</a>
                                </div>
                                <div class="place_order_btn" style="margin:10px">
                                    <c:if test="${transaction.remitStatus == false}">
                                        <input type="submit" value="구매취소" class="thm-btn">
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</section>

<a href="#" data-target="html" class="scroll-to-target scroll-to-top" style="display: none;"><i class="fa fa-angle-up"></i></a>

<div class="side-menu__block">
    <div class="side-menu__block-overlay custom-cursor__overlay">
        <div class="cursor" style="top: 23px; left: 1654px;"></div>
        <div class="cursor-follower" style="top: 1px; left: 1632px;"></div>
    </div><!-- /.side-menu__block-overlay -->
    <div class="side-menu__block-inner  mCustomScrollbar _mCS_1 mCS_no_scrollbar"><div id="mCSB_1" class="mCustomScrollBox mCS-dark mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
        <div class="side-menu__top justify-content-end">
            <a href="#" class="side-menu__toggler side-menu__close-btn"><img src="/assets/images/shapes/close-1-1.png" alt="" class="mCS_img_loaded"></a>
        </div><!-- /.side-menu__top -->

    </div><div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-dark mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; height: 0px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div><!-- /.side-menu__block-inner -->
</div><!-- /.side-menu__block -->

<jsp:include page="../util/bottom.jsp"/>