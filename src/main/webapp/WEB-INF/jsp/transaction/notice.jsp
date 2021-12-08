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
    <form name="noticeForm" action="/bsa/transactions" method="post">
        <input type="hidden" name="silageCode" value="${transaction.silageCode}"/>
        <input type="hidden" name="sellerCode" value="${transaction.sellerCode}"/>
        <input type="hidden" name="buyerCode" value="${transaction.buyerCode}"/>
        <input type="hidden" name="bankName" value="${transaction.bankName}"/>
        <input type="hidden" name="accountNo" value="${transaction.accountNo}"/>
        <input type="hidden" name="totalPrice" value="${transaction.totalPrice}"/>
        <div class="container">
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="billing_title">
                        <h2 style="font-family: 'Nanum Gothic', sans-serif">입금 안내 화면</h2>
                        <h5 style="font-family: 'Nanum Gothic', sans-serif; margin-top:10px">입금하실 때 '받는 통장 메모/표시'에 상품번호를 입력해주세요</h5>
                        <h5 style="font-family: 'Nanum Gothic', sans-serif">'확인'을 누르시면 거래 등록이 완료됩니다</h5>
                    </div>
                    <div class="row">
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">상품번호</h3>
                            <div class="billing_input_box">
                                <input type="text" name="silageCode" value="${transaction.silageCode}" id="silageCode"  readonly>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">가격</h3>
                            <div class="billing_input_box">
                                <input type="text" name="totalPrice" value="${transaction.totalPrice}" id="totalPrice" readonly>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">은행명</h3>
                            <div class="billing_input_box">
                                <input type="text"  value="국민" readonly>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">계좌번호</h3>
                            <div class="billing_input_box">
                                <input type="text" value="94160200050173" readonly>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <div class="billing_input_box">
                                <input type="checkbox" name="check" value="1"> 위 내용을 확인 했습니다(필수)
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
                                    <input type="button" value="확인" onclick="chk()" class="thm-btn">
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

<script type="text/javascript">
    function chk() {
        var form = document.noticeForm;
        if(!form.check.checked) {
            form.check.focus();
            alert("입금 안내를 확인해주세요");
            return false;
        }
        alert("거래 등록이 완료되었습니다")
        form.submit();
    }
</script>

<jsp:include page="../util/bottom.jsp"/>