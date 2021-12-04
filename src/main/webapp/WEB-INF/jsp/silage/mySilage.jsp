<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--

  Created by IntelliJ IDEA.
  User: aaajd
  Date: 2021-11-27
  Time: 오후 4:07
  To change this template use File | Settings | File Templates.
--%>
    <jsp:include page="../top/top.jsp"/>
    <div class="preloader" style="display: none;">
        <img src="/assets/images/loader.png" class="preloader__image" alt="">
    </div><!-- /.preloader -->

    <div class="page-wrapper">
        <div class="site-header__header-one-wrap">
            <header class="main-nav__header-one"></header>
        </div>

        <section class="page-header" style="background-image: url(/assets/images/backgrounds/page-header-contact.jpg);">
            <div class="container">

                <ul class="thm-breadcrumb list-unstyled">
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
        </section>

        <section class="cart" style="padding:50 0 120">
            <div class="container">
                <div class="row" >
                    <div class="col-xl-12">
                        <div class="input_box">
                            <div>
                                <table>
                                    <tr>
                                        <td style="padding:0 10 0 10; color:black">
                                            등록 기간
                                        </td>
                                        <td>
                                            <input type="date" id="startDate">
                                        </td>
                                        <td style="padding:0 10 0 10; color:black">
                                            ~
                                        </td>
                                        <td>
                                            <input type="date" id="endDate">
                                        </td>
                                        <td>
                                            <input type="button" value="검색" onclick="searchDateScope('${memberCode}')">
                                        </td>
                                    </tr>
                                </table>
                                <table align="right">
                                    <tr>
                                        <td>
                                            <select name="transactionStatusSelect" id="status">
                                                <option value="">판매상태</option>
                                                <option value="Y">판매중</option>
                                                <option value="N">판매 완료</option>
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-12">
                        <table class="cart_table">
                            <thead class="cart_table_head">
                            <tr style="padding:20 0 20 0; text-align: center">
                                <th style="font-family: 'Nanum Gothic', sans-serif">번호</th>
                                <th style="font-family: 'Nanum Gothic', sans-serif">상품번호</th>
                                <th style="font-family: 'Nanum Gothic', sans-serif">등록일시</th>
                                <th style="font-family: 'Nanum Gothic', sans-serif">가격</th>
                                <th style="font-family: 'Nanum Gothic', sans-serif">판매상태</th>
                            </tr>
                            </thead>
                        </table>
                        <div id="silageList" style="position:relative; width:101.5%; height:550px; overflow-y:auto; overflow-x:auto;">
                            <table class="cart_table">
                                <tbody style="text-align: center">
                                    <c:forEach items="${silages}" var="silage" varStatus="status">
                                        <c:if test="${silage.sellerCode == memberCode}">
                                            <tr>
                                                <td class="colum_box" style="padding: 40 0 40 0">
                                                        ${status.count}
                                                </td>
                                                <td class="title" style="padding: 40 0 40 0">
                                                    <a href="/bsa/silages/${silage.silageCode}">${silage.silageCode}</a>
                                                </td>
                                                <td class="pro_price">
                                                        ${silage.enrollDateTime}
                                                </td>
                                                <td class="pro_qty" style="padding: 40 0 40 0">
                                                        ${silage.unitPrice * silage.count}
                                                </td>
                                                <c:if test="${fn:contains(silage.transactionStatus,'Y')}">
                                                    <td style="padding: 40 0 40 0">판매중</td>
                                                </c:if>
                                                <c:if test="${fn:contains(silage.transactionStatus,'N')}">
                                                    <td style="padding: 40 0 40 0">판매 완료</td>
                                                </c:if>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <footer class="site-footer">
            <div class="site-footer_farm_image"><img src="assets/images/resources/site-footer-farm.png" alt="Farm Image"></div>
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="footer-widget__column footer-widget__about wow fadeInUp animated" data-wow-delay="100ms" style="visibility: visible; animation-delay: 100ms; animation-name: fadeInUp;">
                            <div class="footer-widget__title">
                                <h3>About</h3>
                            </div>
                            <div class="footer-widget_about_text">
                                <p>Lorem ipsum dolor sit amet, adipiscing elit. Nulla placerat posuere dui. Pellentesque
                                    venenatis sem non lacus ac auctor.</p>
                            </div>
                            <form>
                                <div class="footer_input-box">
                                    <input type="Email" placeholder="Email Address">
                                    <button type="submit" class="button"><i class="fa fa-check"></i></button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-2 col-md-6">
                        <div class="footer-widget__column footer-widget__link wow fadeInUp animated" data-wow-delay="200ms" style="visibility: visible; animation-delay: 200ms; animation-name: fadeInUp;">
                            <div class="footer-widget__title">
                                <h3>Explore</h3>
                            </div>
                            <ul class="footer-widget__links-list list-unstyled">
                                <li><a href="about.html">About Us</a></li>
                                <li><a href="service.html">Services</a></li>
                                <li><a href="projects.html">Our Projects</a></li>
                                <li><a href="farmers.html">Meet the Farmers</a></li>
                                <li><a href="news.html">Latest News</a></li>
                                <li><a href="contact.html">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="footer-widget__column footer-widget__news wow fadeInUp animated" data-wow-delay="300ms" style="visibility: visible; animation-delay: 300ms; animation-name: fadeInUp;">
                            <div class="footer-widget__title">
                                <h3>News</h3>
                            </div>
                            <ul class="footer-widget__news list-unstyled">
                                <li>
                                    <div class="footer-widget__news_image">
                                        <img src="assets/images/resources/footer-1-img-1.jpg" alt="">
                                    </div>
                                    <div class="footer-widget__news_text">
                                        <p><a href="news_detail.html"> Learn 10 Best Tips for New Formers</a></p>
                                    </div>
                                    <div class="footer-widget__news_date_box">
                                        <p>30 Oct, 2019</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="footer-widget__news_image">
                                        <img src="assets/images/resources/footer-1-img-2.jpg" alt="">
                                    </div>
                                    <div class="footer-widget__news_text">
                                        <p><a href="news_detail.html">Farmer Sentiment Darkens Hopes Fade</a></p>
                                    </div>
                                    <div class="footer-widget__news_date_box">
                                        <p>30 Oct, 2019</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="footer-widget__column footer-widget__contact wow fadeInUp animated" data-wow-delay="400ms" style="visibility: visible; animation-delay: 400ms; animation-name: fadeInUp;">
                            <div class="footer-widget__title">
                                <h3>Contact</h3>
                            </div>
                            <div class="footer-widget_contact">
                                <p>66 Broklyn Street, New Town<br>DC 5752, New Yrok</p>
                                <a href="mailto:needhelp@agrikol.com">needhelp@agrikol.com</a><br>
                                <a href="tel:666-888-0000">666 888 0000</a>
                                <div class="site-footer__social">
                                    <a href="#"><i class="fab fa-facebook-square"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                    <a href="#"><i class="fab fa-dribbble"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <div class="site-footer_bottom">
            <div class="container">
                <div class="site-footer_bottom_copyright">
                    <p>@ All copyright 2020, <a href="#">Layerdrops.com</a></p>
                </div>
                <div class="site-footer_bottom_menu">
                    <ul class="list-unstyled">
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms of Use</a></li>
                    </ul>
                </div>
            </div>
        </div>




    </div><!-- /.page-wrapper -->


    <a href="#" data-target="html" class="scroll-to-target scroll-to-top" style="display: none;"><i class="fa fa-angle-up"></i></a>


    <div class="side-menu__block">


        <div class="side-menu__block-overlay custom-cursor__overlay">
            <div class="cursor active" style="top: 320px; left: 1499px;"></div>
            <div class="cursor-follower active" style="top: 298px; left: 1477px;"></div>
        </div><!-- /.side-menu__block-overlay -->
        <div class="side-menu__block-inner  mCustomScrollbar _mCS_1 mCS_no_scrollbar"><div id="mCSB_1" class="mCustomScrollBox mCS-dark mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
            <div class="side-menu__top justify-content-end">

                <a href="#" class="side-menu__toggler side-menu__close-btn"><img src="assets/images/shapes/close-1-1.png" alt="" class="mCS_img_loaded"></a>
            </div><!-- /.side-menu__top -->


            <nav class="mobile-nav__container">
                <!-- content is loading via js -->

                <ul class=" main-nav__navigation-box">
                    <li class="dropdown">
                        <a href="index.html">Home<button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                        <ul>
                            <li><a href="index.html">Home 01</a></li>
                            <li><a href="index2.html">Home 02</a></li>
                            <li><a href="index3.html">Home 03</a></li>
                            <li><a href="index4.html">Home 04</a></li>
                            <li><a href="index5.html">Home 05</a></li>
                            <li class="dropdown"><a href="#">Header Versions<button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                                <ul>
                                    <li><a href="index.html">Header 01</a></li>
                                    <li><a href="index2.html">Header 02</a></li>
                                    <li><a href="index3.html">Header 03</a></li>
                                    <li><a href="index4.html">Header 04</a></li>
                                    <li><a href="index5.html">Header 05</a></li>
                                </ul><!-- /.sub-menu -->
                            </li>
                        </ul><!-- /.sub-menu -->
                    </li>
                    <li class="dropdown">
                        <a href="service.html">Services<button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                        <ul>
                            <li><a href="service.html">Services</a></li>
                            <li><a href="service-detail.html">Services Detail</a></li>
                        </ul><!-- /.sub-menu -->
                    </li>
                    <li class="dropdown">
                        <a href="projects.html">Our Projects<button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                        <ul>
                            <li><a href="projects.html">Projects</a></li>
                            <li><a href="projects_detail.html">Projects Detail</a></li>
                        </ul><!-- /.sub-menu -->
                    </li>
                    <li class="dropdown current">
                        <a href="#">Shop<button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                        <ul>
                            <li><a href="product.html">Products</a></li>
                            <li><a href="product-detail.html">Product Detail</a></li>
                            <li><a href="cart.html">Cart</a></li>
                            <li><a href="checkout.html">Checkout</a></li>
                        </ul><!-- /.sub-menu -->
                    </li>
                    <li class="dropdown">
                        <a href="#">Pages<button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                        <ul>
                            <li><a href="about.html">About</a></li>
                            <li><a href="why_choose_us.html">Why Choose Us</a></li>
                            <li><a href="farmers.html">Farmers</a></li>
                            <li><a href="gallery.html">Gallery</a></li>
                        </ul><!-- /.sub-menu -->
                    </li>
                    <li class="dropdown">
                        <a href="#">News<button class="dropdown-btn"><i class="fa fa-angle-right"></i></button></a>
                        <ul>
                            <li><a href="news.html">News</a></li>
                            <li><a href="news_detail.html">News Details</a></li>
                        </ul><!-- /.sub-menu -->
                    </li>
                    <li>
                        <a href="contact.html">Contact</a>
                    </li>
                </ul>
            </nav>
            <div class="side-menu__sep"></div><!-- /.side-menu__sep -->
            <div class="side-menu__content">
                <p><a href="mailto:needhelp@tripo.com">needhelp@tripo.com</a> <br> <a href="tel:888-999-0000">888 999
                    0000</a></p>
                <div class="side-menu__social">
                    <a href="#"><i class="fab fa-facebook-square"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-pinterest-p"></i></a>
                </div>
            </div><!-- /.side-menu__content -->
        </div><div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-dark mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; height: 0px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div><!-- /.side-menu__block-inner -->
    </div><!-- /.side-menu__block -->



    <div class="search-popup">
        <div class="search-popup__overlay custom-cursor__overlay">
            <div class="cursor active" style="top: 320px; left: 1499px;"></div>
            <div class="cursor-follower active" style="top: 298px; left: 1477px;"></div>
        </div><!-- /.search-popup__overlay -->
        <div class="search-popup__inner">
            <form action="#" class="search-popup__form">
                <input type="text" name="search" placeholder="Type here to Search....">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div><!-- /.search-popup__inner -->
    </div><!-- /.search-popup -->

    <script type="text/javascript">
        var selectEvent = document.getElementById("status");
        selectEvent.addEventListener('change',searchStatus);

        var RecentMemberCode = ${memberCode};

        function searchDateScope(memberCode) {
            var xmlHttp = new XMLHttpRequest();
            var dateScope = {
                startDate : document.getElementById("startDate").value
                , endDate : document.getElementById("endDate").value
            };
            var parseDateScope = JSON.stringify(dateScope);

            var inputJson = document.getElementById("silageList");

            xmlHttp.onreadystatechange = function() {
                if(this.readyState == 4 && this.status == 200) {
                    let storage = xmlHttp.response;

                    var script = "";
                    script += "<table class=\"cart_table\">";
                    script += "    <tbody style=\"text-align: center\">";

                    for (var i = 0; i < storage.length; i++) {
                        if(storage[i].sellerCode == memberCode) {
                            script += "    <tr>";
                            script += "        <td class=\"colum_box\" style=\"padding: 40 0 40 0\">" + (i+1) + "</td>";
                            script += "        <td class=\"title\" style=\"padding: 40 0 40 0\"><a href=\"/bsa/silages/" + storage[i].silageCode + "\">" + storage[i].silageCode + "</a></td>";
                            script += "        <td class=\"pro_price\" style=\"padding: 40 0 40 0\">" + storage[i].enrollDateTime + "</td>";
                            script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (storage[i].count * storage[i].unitPrice) + "</td>";
                            if(storage[i].transactionStatus === 'Y'){
                                script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\">판매중</td>";
                            } else {
                                script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\">판매 완료</td>";
                            }
                            script += "    </tr>";
                        }
                    }
                    script += "    </tbody>";
                    script += "</table>";

                    inputJson.innerHTML = script;

                }
            };
            xmlHttp.open('POST', 'http://localhost/bsa/silages');
            xmlHttp.responseType = 'json';
            xmlHttp.setRequestHeader("Content-Type","application/json;charset=UTF-8");
            xmlHttp.send(parseDateScope);
        }


        function searchStatus(){
            var status = {
                transactionStatus : document.getElementById("status").value
            }

            var jsonStatus = JSON.stringify(status);

            var xmlHttp = new XMLHttpRequest();

            var inputJson = document.getElementById("silageList");

            xmlHttp.onreadystatechange = function() {
                if(this.readyState == 4 && this.status == 200) {
                    let storage = xmlHttp.response;

                    var script = "";
                    script += "<table class=\"cart_table\">";
                    script += "    <tbody style=\"text-align: center\">";

                    for (var i = 0; i < storage.length; i++) {
                        if(storage[i].sellerCode == RecentMemberCode) {
                            script += "    <tr>";
                            script += "        <td class=\"colum_box\" style=\"padding: 40 0 40 0\">" + (i+1) + "</td>";
                            script += "        <td class=\"title\" style=\"padding: 40 0 40 0\"><a href=\"/bsa/silages/" + storage[i].silageCode + "\">" + storage[i].silageCode + "</a></td>";
                            script += "        <td class=\"pro_price\" style=\"padding: 40 0 40 0\">" + storage[i].enrollDateTime + "</td>";
                            script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (storage[i].count * storage[i].unitPrice) + "</td>";
                            if(storage[i].transactionStatus === 'Y'){
                                script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\">판매중</td>";
                            } else {
                                script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\">판매 완료</td>";
                            }
                            script += "    </tr>";
                        }
                    }
                    script += "    </tbody>";
                    script += "</table>";

                    inputJson.innerHTML = script;

                }
            };
            xmlHttp.open('POST', 'http://localhost/bsa/silages/status');
            xmlHttp.responseType = 'json';
            xmlHttp.setRequestHeader("Content-Type","application/json;charset=UTF-8");
            xmlHttp.send(jsonStatus);
        }
    </script>
</body>
</html>
