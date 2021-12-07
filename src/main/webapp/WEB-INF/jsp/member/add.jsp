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
        <div class="container">
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="billing_title">
                        <h2 style="font-family: 'Nanum Gothic', sans-serif">회원 정보 입력</h2>
                    </div>
                    <div class="billing_title">
                        <h4 style="font-family: 'Nanum Gothic', sans-serif">곤포 사일리지 판매를 희망하는 경우, 은행명과 계좌번호를 입력해주세요</h4>
                    </div>
                    <div class="row">
                        <div class="col-xl-8">
                            <div style="width: 300px" >
                                <h3 style="font-family: 'Nanum Gothic', sans-serif">아이디</h3>
                            </div>
                            <div class="billing_input_box">
                                <input type="text" name="id" value="" id="id" placeholder="아이디는 유일해야합니다" required>
                            </div>
                        </div>
                        <div class="col-xl-3" id="errorMsg" style="margin-top: 65px; margin-left: 10px"></div>
                        <div class="col-xl-8">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">비밀번호</h3>
                            <div class="billing_input_box">
                                <input type="password" name="password" value="" id="password" required>
                            </div>
                        </div>
                        <div class="col-xl-8">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">이름</h3>
                            <div class="billing_input_box">
                                <input type="text" name="name" value="" id="name" required>
                            </div>
                        </div>
                        <div class="col-xl-8">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">전화번호</h3>
                            <div class="billing_input_box">
                                <input type="text" name="phone" value="" id="phone" placeholder="하이픈(-)을 뺴고 입력해주세요" required>
                            </div>
                        </div>
                        <div class="col-xl-8">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">주소</h3>
                            <div class="billing_input_box">
                                <input type="text" name="address" value="" id="address" placeholder="상세주소를 제외한 도로명주소까지만 써주세요" required>
                            </div>
                        </div>
                        <div class="col-xl-8">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">은행명</h3>
                            <div class="billing_input_box">
                                <input type="text" name="bankName" value="" id="bankName">
                            </div>
                        </div>
                        <div class="col-xl-8">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">계좌번호</h3>
                            <div class="billing_input_box">
                                <input type="text" name="accountNo" value="" id="accountNo" placeholder="하이픈(-)을 뺴고 입력해주세요">
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
                            <div class="place_order_btn" style="margin:10px;">
                                <a href="/bsa/silages" class="thm-btn" style="text-align: center; padding-left: 68.5px; padding-right: 68.5px;">
                                    취소
                                </a>
                            </div>
                            <div class="place_order_btn" style="margin:10px;">
                                <input type="submit" value="회원가입" class="thm-btn">
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
    var error = document.getElementById("errorMsg").innerHTML="<font color=red>${sessionScope.enrollErrorMsg}</font>";
</script>

<jsp:include page="../util/bottom.jsp"/>