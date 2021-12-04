<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<jsp:include page="/WEB-INF/jsp/util/top.jsp"/>
<div class="preloader" style="display: none;">
    <img src="assets/images/loader.png" class="preloader__image" alt="">
</div><!-- /.preloader -->
<div class="page-wrapper">
    <section class="page-header" style="background-image: url(/assets/images/backgrounds/page-header-contact.jpg);">
        <div class="container">
            <ul class="thm-breadcrumb list-unstyled" style="padding-top: 45%">
                <li></li>
                <li></li>
            </ul>
        </div>
    </section>

    <section class="contact-one">
        <div class="container">
            <div class="row">
                <div class="col-xl-7">
                    <div class="contact-one__form__wrap">
                        <div class="block-title text-left">
                            <h3>Login</h3>
                            <div class="leaf">
                                <img src="/assets/images/resources/leaf.png" alt="">
                            </div>
                            <div id="errorMsg" style="height: auto; width: 200px; color: red">
                                <c:if test="${sessionScope.loginErrorMsg != null}">
                                    ${sessionScope.loginErrorMsg}
                                </c:if>
                            </div>
                        </div>
                        <form name="loginForm" action="/bsa/login" method="POST" class="contact-one__form">
                            <div class="row low-gutters">
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input type="text" name="id" id="memberId" placeholder="아이디">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input type="password" name="password" id="memberPw" placeholder="비밀번호">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="input-group contact__btn">
                                        <button type="button" class="thm-btn contact-one__btn" onclick=check()>로그인</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div><!-- /.page-wrapper -->

<a href="#" data-target="html" class="scroll-to-target scroll-to-top" style="display: none;"><i class="fa fa-angle-up"></i></a>

<div class="side-menu__block">
    <div class="side-menu__block-overlay custom-cursor__overlay">
        <div class="cursor" style="top: 80px; left: 1233px;"></div>
        <div class="cursor-follower" style="top: 58px; left: 1211px;"></div>
    </div><!-- /.side-menu__block-overlay -->
    <div class="side-menu__block-inner  mCustomScrollbar _mCS_1 mCS_no_scrollbar"><div id="mCSB_1" class="mCustomScrollBox mCS-dark mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
        <div class="side-menu__top justify-content-end">

            <a href="#" class="side-menu__toggler side-menu__close-btn"><img src="/assets/images/shapes/close-1-1.png" alt="" class="mCS_img_loaded"></a>
        </div><!-- /.side-menu__top -->
        </div><!-- /.side-menu__content -->
    </div><div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-dark mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; height: 0px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div><!-- /.side-menu__block-inner -->
    <footer class="site-footer">
        <div class="site-footer_farm_image"><img src="/assets/images/resources/site-footer-farm.png" weight="auto" height="auto" alt="Farm Image"></div>
        <div class="container">
            <div class="row no-gutters">
                <div class="col-xl-3 col-lg-3 col-md-6">
                    <div class="footer-widget__column footer-widget__contact wow fadeInUp animated" data-wow-delay="400ms" style="visibility: visible; animation-delay: 400ms; animation-name: fadeInUp;">
                        <div class="footer-widget__title">
                            <h3>Contact</h3>
                        </div>
                        <div class="footer-widget_contact">
                            <p>충청남도 아산시 탕정면 선문로221번길 70<br>인문관, 406호</p>
                            <a href="aaajdh@naver.com">aaajdh@naver.com</a><br>
                            <a href="tel:010-8570-0116">010-8570-0116</a>
                            <div class="site-footer__social">
                                <a href="https://github.com/JangDongHo97/balesilage"><i class="fab fa-github"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6">
                    <div class="footer-widget__column footer-widget__about wow fadeInUp animated" data-wow-delay="100ms" style="visibility: visible; animation-delay: 100ms; animation-name: fadeInUp;">
                        <div class="footer-widget_about_text">
                            <h3 style="height: 145px";></h3>
                        </div>
                        <form>
                            <div class="footer-widget_contact">
                                <a href="whdhksrl455@naver.com">whdhksrl455@naver.com</a><br>
                                <a href="tel:010-7767-2257">010-7767-2257</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <div class="site-footer_bottom">
        <div class="container">
            <div class="site-footer_bottom_menu"></div>
        </div>
    </div>
</div><!-- /.side-menu__block -->



<script type="text/javascript">
    function check() {
        var id = document.getElementById("memberId").value;
        var pw = document.getElementById("memberPw").value;

        if(!id || !pw) {
            document.getElementById("errorMsg").innerHTML = "<font color='red'>로그인 정보를 입력해주세요. </font>";
        } else {
            loginForm.submit();
        }
    }

</script>

</body>
</html>