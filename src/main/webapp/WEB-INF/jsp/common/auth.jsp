<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../util/top.jsp"/>

<div class="preloader" style="display: none;">
    <img src="/assets/images/loader.png" class="preloader__image" alt="">
</div><!-- /.preloader -->

<section class="page-header" style="background-image: url(/assets/images/backgrounds/page-header-contact.jpg);">

</section>

<section class="checkout">
    <form action="/bsa/auth" method="post" class="billing_details_form">
        <div class="container">
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="billing_title">
                        <h2 style="font-family: 'Nanum Gothic', sans-serif">계정 관리 권환 확인</h2>
                    </div>
                    <div class="billing_title">
                        <h4 style="font-family: 'Nanum Gothic', sans-serif">계정 관리의 권한을 확인하기 위해 자신의 비밀번호를 입력해주세요.</h4>
                    </div>
                    <div class="row">
                        <div class="col-xl-12" style="padding: 100 300 0 300">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">비밀번호</h3>
                            <div class="billing_input_box">
                                <input type="password" name="password" value="" id="password" style="width:100%" required="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-9" style="padding-right: 30px;">
                    <div class="place_order_btn" style="margin:10px;">
                        <a href="/bsa/silages" class="thm-btn" style="text-align: center;width: 250px;">취소</a>
                    </div><div class="place_order_btn" style="margin:10px">
                    <input type="submit" value="확인" class="thm-btn" style="width: 250px;">
                </div></div>
            </div>
        </div>
    </form>
</section>

<jsp:include page="../util/bottom.jsp"/>
