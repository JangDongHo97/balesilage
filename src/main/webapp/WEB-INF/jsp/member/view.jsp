<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    <form action="/bsa/members" method="post" class="billing_details_form">
        <input type="hidden" name="_method" value="delete">
        <input type="hidden" name="memberCode" value="${member.memberCode}"/>
        <div class="container">
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="billing_title">
                        <h2 style="font-family: 'Nanum Gothic', sans-serif">회원 정보 조회</h2>
                    </div>
                    <div class="row">
                        <div class="col-xl-12">
                            <h4 style="font-family: 'Nanum Gothic', sans-serif">아이디</h4>
                            <div class="billing_input_box">
                                <input type="text" name="id" value="${member.id}" id="id"  readonly>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <h4 style="font-family: 'Nanum Gothic', sans-serif">비밀번호</h4>
                            <div class="billing_input_box">
                                <input type="text" name="password" value="${member.password}" id="password" readonly>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <h4 style="font-family: 'Nanum Gothic', sans-serif">이름</h4>
                            <div class="billing_input_box">
                                <input type="text" name="name" value="${member.name}" id="name" readonly>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <h4 style="font-family: 'Nanum Gothic', sans-serif">전화번호</h4>
                            <div class="billing_input_box">
                                <input type="text" name="phone" value="${member.phone}" id="phone" readonly>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <h4 style="font-family: 'Nanum Gothic', sans-serif">주소</h4>
                            <div class="billing_input_box">
                                <input type="text" name="address" value="${member.address}" id="address" readonly>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <h4 style="font-family: 'Nanum Gothic', sans-serif">은행명</h4>
                            <div class="billing_input_box">
                                <input type="text" name="bankName" value="${account.bankName}" id="bankName" readonly>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <h4 style="font-family: 'Nanum Gothic', sans-serif">계좌번호</h4>
                            <div class="billing_input_box">
                                <input type="text" name="accountNo" value="${account.accountNo}" id="accountNo" readonly>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="your_order">
            <div class="row">
                <div class="col-xl-6 col-lg-6">
                    <div class="row" style="width: 175%">
                        <div class="col-sm-12">
                            <div class="place_order_btn" style="margin:10px">
                                <a href="/bsa/silages" class="thm-btn" style="text-align: center">취소</a>
                            </div>
                            <div class="place_order_btn" style="margin:10px">
                                <a href="/bsa/members/form/${member.memberCode}" class="thm-btn" style="text-align: center">수정</a>
                            </div>
                            <div class="place_order_btn" style="margin:10px">
                                <input type="submit" value="회원탈퇴" class="thm-btn" style="padding-left: 31px; padding-right: 31px">
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