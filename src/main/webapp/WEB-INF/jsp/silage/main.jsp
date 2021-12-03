<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/jsp/top/top.jsp"/>

<div class="preloader" style="display: none; font-family: 'Nanum Gothic', sans-serif">
    <img src="/assets/images/loader.png" class="preloader__image" alt="">
</div><!-- /.preloader -->

<div class="page-wrapper">
    <div class="site-header__header-one-wrap">
        <header class="main-nav__header-one"></header>
    </div>

    <section class="page-header" style="background-image: url(/assets/images/backgrounds/page-header-contact.jpg);">
        <div class="container">
            <ul class="thm-breadcrumb list-unstyled" style="padding-top: 30%">
                <li></li>
                <li></li>
            </ul>
        </div>
    </section>

    <section class="contact-one">
        <div class="container">
            <div class="row">
                <div class="col-xl-11" style="width: 300px">
                    <div class="have_questions">
                        <div class="image_box">

                        </div>
                        <div class="block-title text-center">
                            <p>우리 주변에</p>
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">곤포 사일리지 찾아보기</h3>
                            <div class="leaf">
                                <img src="/assets/images/resources/leaf.png" alt="">
                            </div>
                        </div>
                        <div class="have_questions_text"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="contact_google_map_1">
        <div class="row">
            <div id="map" style="width:800px;height:800px;font-family: 'Nanum Gothic', sans-serif"></div>

            <section class="cart" style="font-family: 'Nanum Gothic', sans-serif">
                <div class="container">
                    <div class="row" style="margin: 0 auto;height: 800px;">
                        <div class="col-xl-12">
                            <div class="cart_table_box">
                                <table class="cart_table">
                                    <thead class="cart_table_head">
                                    <tr>
                                        <th colspan="1" style="text-align: center;font-family: 'Nanum Gothic', sans-serif">판매자</th>
                                        <th colspan="1" style="text-align: center;font-family: 'Nanum Gothic', sans-serif">무게</th>
                                        <th colspan="1" style="text-align: center;font-family: 'Nanum Gothic', sans-serif">개수</th>
                                        <th colspan="1" style="text-align: center;font-family: 'Nanum Gothic', sans-serif">단가</th>
                                        <th colspan="1" style="text-align: center;font-family: 'Nanum Gothic', sans-serif">가격</th>
                                        <th colspan="1" style="text-align: center;font-family: 'Nanum Gothic', sans-serif">비고</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${silages}" var="silage">
                                        <c:if test="${fn:contains(silage.transactionStatus,'Y')}">
                                            <tr>
                                                <div><td style="text-align: center"><input type="hidden" id="memberId" value="${silage.id}">${silage.id}</td></div>
                                                <div><td style="text-align: right">${silage.weight}</td></div>
                                                <div><td style="text-align: right">${silage.count}</td></div>
                                                <div><td style="text-align: right">${silage.unitPrice}</td></div>
                                                <div><td style="text-align: right">${silage.unitPrice * silage.count}</td></div>
                                                <div><td style="text-align: right"><input type="button" value="위치보기" onclick="viewLocation('${silage.id}')"></td></div>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="button_box">
                                <a href="/bsa/silages/form"><button class="thm-btn checkout_btn" type="button">내 곤포 사일리지 등록하기</button></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </section>

    <footer class="site-footer">
        <div class="site-footer_farm_image"><img src="/assets/images/resources/site-footer-farm.png" alt="Farm Image"></div>
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
</div><!-- /.page-wrapper -->

<a href="#" data-target="html" class="scroll-to-target scroll-to-top" style="display: none;"><i class="fa fa-angle-up"></i></a>

<div class="side-menu__block">
    <div class="side-menu__block-overlay custom-cursor__overlay">
        <div class="cursor" style="top: 24px; left: 1263px;"></div>
        <div class="cursor-follower" style="top: 2px; left: 1241px;"></div>
    </div><!-- /.side-menu__block-overlay -->
    <div class="side-menu__block-inner  mCustomScrollbar _mCS_1 mCS_no_scrollbar"><div id="mCSB_1" class="mCustomScrollBox mCS-dark mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
        <div class="side-menu__top justify-content-end">

            <a href="#" class="side-menu__toggler side-menu__close-btn"><img src="/assets/images/shapes/close-1-1.png" alt="" class="mCS_img_loaded"></a>
        </div><!-- /.side-menu__top -->


        <div class="side-menu__sep"></div><!-- /.side-menu__sep -->
        <div class="side-menu__content">
            <p><a href="aaajdh@naver.com">aaajdh@naver.com</a> <br> <a href="tel:010-8570-0116">010-8570-0116</a></p>

        </div><!-- /.side-menu__content -->
    </div><div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-dark mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; height: 0px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div><!-- /.side-menu__block-inner -->
</div><!-- /.side-menu__block -->


<%--지도 조회--%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d0b4825b8dca8223449db80faff26514&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'),
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667),
            level: 8
        };

    var map = new kakao.maps.Map(mapContainer, mapOption);

    var geocoder = new kakao.maps.services.Geocoder();

    <c:forEach items="${addresses}" var="address">
    geocoder.addressSearch('${address}', function(result, status) {

        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">곤포 사일리지</div>'
            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        }
    });
    </c:forEach>

    function viewLocation(x) {
        var xmlHttp = new XMLHttpRequest();
        var member = {
            id : x
        };

        var parseMember = JSON.stringify(member);
        var silageLocation;

        xmlHttp.onreadystatechange = function () {
            if(this.readyState == 4 && this.status == 200) {
                let location = xmlHttp.response;

                silageLocation = location.address;

                geocoder.addressSearch(silageLocation, function(result, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === kakao.maps.services.Status.OK) {

                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                        map.setCenter(coords);
                    }
                });
            }
        }

        xmlHttp.open('POST', 'http://localhost/bsa/silages/place');
        xmlHttp.responseType = 'json';
        xmlHttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        xmlHttp.send(parseMember);

        console.log(typeof silageLocation)


    }

    function searchDateScope() {
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
                script += "<table border='1' style='width: 100%;'>";
                script += "    <tr>";
                script += "        <th>일련번호</th>";
                script += "        <th>판매자id</th>";
                script += "        <th>등록 일시</th>";
                script += "        <th>무게</th>";
                script += "        <th>개수</th>";
                script += "        <th>단가</th>";
                script += "        <th>가격</th>";
                script += "        <th>비고</th>";
                script += "    </tr>";

                for (var i = 0; i < storage.length; i++) {
                    if(storage[i].transactionStatus == 'Y'){
                        script += "    <tr>";
                        script += "        <td><a href=\"/bsa/silages/" + storage[i].silageCode + "\">" + storage[i].silageCode + "</a></td>";
                        script += "        <td>" + storage[i].id + "</td>";
                        script += "        <td>" + storage[i].enrollDateTime + "</td>";
                        script += "        <td>" + storage[i].weight + "</td>";
                        script += "        <td>" + storage[i].count + "</td>";
                        script += "        <td>" + storage[i].unitPrice + "</td>";
                        script += "        <td>" + (storage[i].count * storage[i].unitPrice) + "</td>";
                        script += "        <td><input type=\"button\" value=\"위치보기\" onclick=\"viewLocation(\'" + storage[i].id + "\')\"></td>";
                        script += "    </tr>";
                    }
                }
                script += "</table>";

                inputJson.innerHTML = script;

            }
        };
        xmlHttp.open('POST', 'http://localhost/bsa/silages');
        xmlHttp.responseType = 'json';
        xmlHttp.setRequestHeader("Content-Type","application/json;charset=UTF-8");
        xmlHttp.send(parseDateScope);
    }
</script>
</body></html>