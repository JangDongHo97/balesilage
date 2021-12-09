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
    <form action="/bsa/silages" method="post" class="billing_details_form">
        <div class="container">
                <div class="row">
                    <div class="col-xl-12 col-lg-12">
                        <div class="billing_title">
                            <h2 style="font-family: 'Nanum Gothic', sans-serif; margin-left: 110px;">곤포 사일리지 정보 입력</h2>

                        </div>
                        <div class="row">
                            <div class="col-xl-5">
                                <h3 style="font-family: 'Nanum Gothic', sans-serif;margin-left: 110px;">제조일자</h3>
                                <div class="billing_input_box" style="height: 60px;width: 80%;margin-bottom: 20px;margin-left: 110px;">
                                    <input type="date" name="productionDate" value="" id="productionDate" placeholder="날짜를 입력해주세요" required>
                                </div>
                            </div>
                            <div class="col-xl-5">
                                <h3 style="font-family: 'Nanum Gothic', sans-serif;margin-left: 110px;">무게</h3>
                                <div class="billing_input_box" style="height: 60px;width: 80%;margin-bottom: 20px;margin-left: 110px;">
                                    <input type="text" name="weight" value="" id="weight" placeholder="무게를 입력해주세요" required>
                                </div>
                            </div>
                            <div class="col-xl-5">
                                <h3 style="font-family: 'Nanum Gothic', sans-serif; margin-left: 110px; margin-top: 10px;">개수</h3>
                                <div class="billing_input_box" style="height: 60px;width: 80%;margin-bottom: 20px;margin-left: 110px;">
                                    <input type="text" name="count" value="" id="count" placeholder="개수를 입력해주세요" onkeyup="total();" required>
                                </div>
                            </div>
                            <div class="col-xl-5">
                                <h3 style="font-family: 'Nanum Gothic', sans-serif; margin-left: 110px; margin-top: 10px;">단가</h3>
                                <div class="billing_input_box" style="height: 60px;width: 80%;margin-bottom: 20px;margin-left: 110px;">
                                    <input type="text" name="unitPrice" value="" id="unitPrice" placeholder="단가를 입력해주세요" onkeyup="total();" required>
                                </div>
                            </div>
                            <div class="col-xl-5">
                                <h3 style="font-family: 'Nanum Gothic', sans-serif; margin-left: 110px; margin-top: 10px;">가격</h3>
                                <div class="billing_input_box" style="height: 60px;width: 80%;margin-bottom: 20px;margin-left: 110px;">
                                    <input type="text" name="totalPrice" id="totalPrice" placeholder="개수와 단가를 입력해주세요" readonly>
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
                                    <input type="submit" value="등록" class="thm-btn">
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
        function total() {
            if(document.getElementById("count").value && document.getElementById("unitPrice").value) {
                document.getElementById("totalPrice").value
                    = parseInt(document.getElementById("count").value)
                    * parseInt(document.getElementById("unitPrice").value);
            }
        }
    </script>

<jsp:include page="../util/bottom.jsp"/>