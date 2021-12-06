<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>곤포 사일리지 거래 서비스</title>
    <link rel="apple-touch-icon" sizes="180x180" href="/assets/images/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/assets/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/assets/images/favicons/favicon-16x16.png">
    <link rel="manifest" href="/assets/images/favicons/site.webmanifest">

    <!-- Fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <!-- Css-->
    <link rel="stylesheet" href="/assets/css/animate.min.css">
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/assets/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="/assets/css/swiper.min.css">
    <link rel="stylesheet" href="/assets/css/bootstrap-select.min.css">

    <link rel="stylesheet" href="/assets/css/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" href="/assets/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="/assets/css/vegas.min.css">
    <link rel="stylesheet" href="/assets/css/nouislider.min.css">
    <link rel="stylesheet" href="/assets/css/nouislider.pips.css">
    <link rel="stylesheet" href="/assets/css/agrikol_iconl.css">
    <link rel="stylesheet" href="/assets/css/jquery-ui.css">
    <link rel="stylesheet" href="/assets/css/jquery.bootstrap-touchspin.css">
    <!-- Template styles -->
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/responsive.css">


    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/js/owl.carousel.min.js"></script>
    <script src="/assets/js/waypoints.min.js"></script>
    <script src="/assets/js/jquery.counterup.min.js"></script>
    <script src="/assets/js/TweenMax.min.js"></script>
    <script src="/assets/js/wow.js"></script>
    <script src="/assets/js/jquery.magnific-popup.min.js"></script>
    <script src="/assets/js/jquery.ajaxchimp.min.js"></script>
    <script src="/assets/js/swiper.min.js"></script>
    <script src="/assets/js/typed-2.0.11.js"></script>
    <script src="/assets/js/vegas.min.js"></script>
    <script src="/assets/js/jquery.validate.min.js"></script>
    <script src="/assets/js/bootstrap-select.min.js"></script>
    <script src="/assets/js/countdown.min.js"></script>
    <script src="/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="/assets/js/bootstrap-datepicker.min.js"></script>
    <script src="/assets/js/nouislider.min.js"></script>
    <script src="/assets/js/isotope.js"></script>
    <script src="/assets/js/appear.js"></script>
    <script src="/assets/js/jquery-ui.js"></script>
    <script src="/assets/js/jquery.bootstrap-touchspin.js"></script>

    <!-- template scripts -->
    <script src="/assets/js/theme.js"></script>
</head>

    <%
    Object auth = session.getAttribute("memberCode");
    if(auth == null) {%>

<body style="font-family: 'Nanum Gothic', sans-serif";>
<div class="preloader" style="display: none;">
    <img src="/assets/images/loader.png" class="preloader__image" alt="">
</div><!-- /.preloader -->

<div class="page-wrapper">

    <div class="site-header__header-one-wrap">

        <div class="topbar-one">
            <div class="topbar_bg" style="background-image: url(/assets/images/shapes/header-bg.png)"></div>
            <div class="container">
                <div class="topbar-one__left">
                </div>
                <div class="topbar-one__middle">
                    <a href="/bsa/silages" class="main-nav__logo">
                        <img src="/assets/images/resources/logo.png" class="main-logo" alt="Awesome Image">
                    </a>
                </div>
                <div class="topbar-one__left">
                    <a href="/bsa/login"><span class="fa-stack fa-lg">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-flag fa-stack-1x fa-inverse"></i>
                    </span> 로그인 </a>

                    <a href="/bsa/members/form"><span class="fa-stack fa-lg">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-flag fa-stack-1x fa-inverse"></i>
                    </span> 회원가입 </a>

                </div>

                    </div>
                </div>
            </div>
        </div>

        <header class="main-nav__header-one">
            <nav class="header-navigation stricky original">
                <div class="container clearfix">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="main-nav__left">
                        <i class="fas fa-tractor fa-2x"></i>
                    </div>
                    <div class="main-nav__main-navigation">
                        <ul class=" main-nav__navigation-box">
                            <li class="dropdown">
                                <a href="/bsa/silages"> 메인 <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                            </li>
                            <li class="dropdown">
                                <a href="" onclick='needLogin()'> 등록 내역 <button class="dropdown-btn" style="font-size: 20px"><i class="fa fa-angle-right"></i></button></a>
                            </li>
                            <li class="dropdown">
                                <a href="" onclick='needLogin()'> 구매 내역 <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                            </li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                    <div class="main-nav__right">
                            <i class="fas fa-tractor fa-2x"></i>
                    </div>
                </div>
            </nav><nav class="header-navigation stricky stricked-menu">
            <div class="container clearfix">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="main-nav__left">
                    <i class="fas fa-tractor fa-2x"></i>
                </div>
                <div class="main-nav__main-navigation">
                    <ul class=" main-nav__navigation-box">
                        <li class="dropdown">
                            <a href="/bsa/silages"> 메인 <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                        </li>
                        <li class="dropdown">
                            <a href="" onclick='needLogin()'> 등록 내역 <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                        </li>
                        <li class="dropdown">
                            <a href="" onclick='needLogin()'> 구매 내역 <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
                <div class="main-nav__right">
                    <i class="fas fa-tractor fa-2x"></i>
                </div>
            </div>
        </nav>
        </header>
    </div>
</div><!-- /.page-wrapper -->

<a href="#" data-target="html" class="scroll-to-target scroll-to-top"><i class="fa fa-angle-up"></i></a>

<div class="side-menu__block">

    <div class="side-menu__block-overlay custom-cursor__overlay">
        <div class="cursor" style="top: 216px; left: 1631px;"></div>
        <div class="cursor-follower" style="top: 194px; left: 1609px;"></div>
    </div><!-- /.side-menu__block-overlay -->
    <div class="side-menu__block-inner  mCustomScrollbar _mCS_1 mCS_no_scrollbar"><div id="mCSB_1" class="mCustomScrollBox mCS-dark mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
        <div class="side-menu__top justify-content-end">

            <a href="#" class="side-menu__toggler side-menu__close-btn"><img src="/assets/images/shapes/close-1-1.png" alt="" class="mCS_img_loaded"></a>
        </div><!-- /.side-menu__top -->

        <nav class="mobile-nav__container">
            <!-- content is loading via js -->

            <ul class=" main-nav__navigation-box">
                <li class="dropdown">
                    <a href="/bsa/silages"> 메인 <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                </li>
                <li class="dropdown">
                    <a href="" onclick='needLogin()'> 등록 내역 <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                </li>
                <li class="dropdown">
                    <a href="" onclick='needLogin()'> 구매 내역 <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                </li>
            </ul>
        </nav>
        <div class="side-menu__sep"></div><!-- /.side-menu__sep -->
        <div class="side-menu__content">
        </div><!-- /.side-menu__content -->
    </div><div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-dark mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; height: 0px; top: 0px; display: block; max-height: 673px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div><!-- /.side-menu__block-inner -->
</div><!-- /.side-menu__block -->



    <%
    } else if(auth.equals(1)) {%>

<body style="font-family: 'Nanum Gothic', sans-serif";>>
<div class="preloader" style="display: none;">
    <img src="/assets/images/loader.png" class="preloader__image" alt="">
</div><!-- /.preloader -->

<div class="page-wrapper">

    <div class="site-header__header-one-wrap">

        <div class="topbar-one">
            <div class="topbar_bg" style="background-image: url(/assets/images/shapes/header-bg.png)"></div>
            <div class="container">
                <div class="topbar-one__left">
                </div>
                <div class="topbar-one__middle">
                    <a href="/bsa/silages" class="main-nav__logo">
                        <img src="/assets/images/resources/logo.png" class="main-logo" alt="Awesome Image">
                    </a>
                </div>
                <div class="topbar-one__left">

                    <a href="/bsa/logout"><span class="fa-stack fa-lg">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-flag fa-stack-1x fa-inverse"></i>
                    </span> 로그아웃 </a>

                </div>

            </div>
        </div>
    </div>
</div>

<header class="main-nav__header-one">
    <nav class="header-navigation stricky original">
        <div class="container clearfix">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="main-nav__left">
                <i class="fas fa-tractor fa-2x"></i>
            </div>
            <div class="main-nav__main-navigation">
                <ul class=" main-nav__navigation-box">
                    <li class="dropdown">
                        <a href="/bsa/silages"> 메인 <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                    </li>
                    <li class="dropdown">
                        <a href="/bsa/transactions"> 거래 내역 <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->

            <div class="main-nav__right">
                <i class="fas fa-tractor fa-2x"></i>
            </div>
        </div>
    </nav><nav class="header-navigation stricky stricked-menu">
    <div class="container clearfix">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="main-nav__left">
            <i class="fas fa-tractor fa-2x"></i>
        </div>
        <div class="main-nav__main-navigation">
            <ul class=" main-nav__navigation-box">
                <li class="dropdown">
                    <a href="/bsa/silages"> 메인 <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                </li>
                <li class="dropdown">
                    <a href="/bsa/transactions"> 거래 내역 <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
        <div class="main-nav__right">
            <i class="fas fa-tractor fa-2x"></i>
        </div>
    </div>
</nav>
</header>
</div>
</div><!-- /.page-wrapper -->

<a href="#" data-target="html" class="scroll-to-target scroll-to-top"><i class="fa fa-angle-up"></i></a>

<div class="side-menu__block">

    <div class="side-menu__block-overlay custom-cursor__overlay">
        <div class="cursor" style="top: 216px; left: 1631px;"></div>
        <div class="cursor-follower" style="top: 194px; left: 1609px;"></div>
    </div><!-- /.side-menu__block-overlay -->
    <div class="side-menu__block-inner  mCustomScrollbar _mCS_1 mCS_no_scrollbar"><div id="mCSB_2" class="mCustomScrollBox mCS-dark mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_2_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
        <div class="side-menu__top justify-content-end">

            <a href="#" class="side-menu__toggler side-menu__close-btn"><img src="/assets/images/shapes/close-1-1.png" alt="" class="mCS_img_loaded"></a>
        </div><!-- /.side-menu__top -->

        <nav class="mobile-nav__container">
            <!-- content is loading via js -->

            <ul class=" main-nav__navigation-box">
                <li class="dropdown">
                    <a href="/bsa/silages"> 메인 <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                </li>
                <li class="dropdown">
                    <a href="/bsa/transactions"> 거래 내역 <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                </li>
            </ul>
        </nav>
        <div class="side-menu__sep"></div><!-- /.side-menu__sep -->
        <div class="side-menu__content">
        </div><!-- /.side-menu__content -->
    </div><div id="mCSB_2_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-dark mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_2_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; height: 0px; top: 0px; display: block; max-height: 673px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div><!-- /.side-menu__block-inner -->
</div><!-- /.side-menu__block -->

    <%
    } else {%>

<body style="font-family: 'Nanum Gothic', sans-serif";>
<div class="preloader" style="display: none;">
    <img src="/assets/images/loader.png" class="preloader__image" alt="">
</div><!-- /.preloader -->

<div class="page-wrapper">

    <div class="site-header__header-one-wrap">

        <div class="topbar-one">
            <div class="topbar_bg" style="background-image: url(/assets/images/shapes/header-bg.png)"></div>
            <div class="container">
                <div class="topbar-one__left">
                </div>
                <div class="topbar-one__middle">
                    <a href="/bsa/silages" class="main-nav__logo">
                        <img src="/assets/images/resources/logo.png" class="main-logo" alt="Awesome Image">
                    </a>
                </div>
                <div class="topbar-one__left">

                    <a href="/bsa/auth"><span class="fa-stack fa-lg">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-flag fa-stack-1x fa-inverse"></i>
                    </span> 계정관리 </a>

                    <a href="/bsa/logout"><span class="fa-stack fa-lg">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-flag fa-stack-1x fa-inverse"></i>
                    </span> 로그아웃 </a>

        </div>
    </div>
    </div>
    <nav class="header-navigation stricky stricked-menu">
        <div class="container clearfix">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="main-nav__left">
                <i class="fas fa-tractor fa-2x"></i>
            </div>
            <div class="main-nav__main-navigation">
                <ul class=" main-nav__navigation-box">
                    <li class="dropdown"style=" margin-left: 0px;">
                        <a href="/bsa/silages"> 메인
                            <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button>
                        </a>
                    </li>
                    <li class="dropdown">
                        <a href="/bsa/silages/mine"style=" margin-left: 0px;"> 등록 내역
                            <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button>
                        </a>
                    </li>
                    <li class="dropdown">
                        <a href="/bsa/purchases"style=" margin-left: 0px;"> 구매 내역
                            <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button>
                        </a>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
            <div class="main-nav__right">
                <i class="fas fa-tractor fa-2x"></i>
            </div>
        </div>
    </nav>
</header>
</div>
</div><!-- /.page-wrapper -->

<a href="#" data-target="html" class="scroll-to-target scroll-to-top"><i class="fa fa-angle-up"></i></a>

<div class="side-menu__block">

    <div class="side-menu__block-overlay custom-cursor__overlay">
        <div class="cursor" style="top: 216px; left: 1631px;"></div>
        <div class="cursor-follower" style="top: 194px; left: 1609px;"></div>
    </div><!-- /.side-menu__block-overlay -->
    <div class="side-menu__block-inner  mCustomScrollbar _mCS_1 mCS_no_scrollbar">
        <div id="mCSB_3" class="mCustomScrollBox mCS-dark mCSB_vertical mCSB_inside" style="max-height: none;"
             tabindex="0">
            <div id="mCSB_3_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
                 style="position:relative; top:0; left:0;" dir="ltr">
                <div class="side-menu__top justify-content-end">

                    <a href="#" class="side-menu__toggler side-menu__close-btn"><img
                            src="/assets/images/shapes/close-1-1.png" alt="" class="mCS_img_loaded"></a>
                </div><!-- /.side-menu__top -->

                <nav class="mobile-nav__container">
                    <!-- content is loading via js -->

                    <ul class=" main-nav__navigation-box">
                        <li class="dropdown">
                            <a href="/bsa/silages"> 메인
                                <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button>
                            </a>
                        </li>
                        <li class="dropdown">
                            <a href="/bsa/silages/mine"> 등록 내역
                                <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button>
                            </a>
                        </li>
                        <li class="dropdown">
                            <a href="/bsa/purchases"> 구매 내역
                                <button class="dropdown-btn"><i class="fa fa-angle-right"></i></button>
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="side-menu__sep"></div><!-- /.side-menu__sep -->
                <div class="side-menu__content">
                </div><!-- /.side-menu__content -->
            </div>
            <div id="mCSB_3_scrollbar_vertical"
                 class="mCSB_scrollTools mCSB_1_scrollbar mCS-dark mCSB_scrollTools_vertical" style="display: none;">
                <div class="mCSB_draggerContainer">
                    <div id="mCSB_3_dragger_vertical" class="mCSB_dragger"
                         style="position: absolute; min-height: 30px; height: 0px; top: 0px; display: block; max-height: 673px;">
                        <div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
                    </div>
                    <div class="mCSB_draggerRail"></div>
                </div>
            </div>
        </div>
    </div><!-- /.side-menu__block-inner -->
</div><!-- /.side-menu__block -->

    <%
    }
%>

<script>
    function needLogin() {
        var memberCode = ${memberCode}
            console.log('@@@@@@@@@@@@@@@@@@@@@' + memberCode);

        if (memberCode == null) {
            window.alert("로그인을 먼저 해주세요");
        }
    }
</script>