<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/jsp/util/top.jsp"/>

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
                        <div class="image_box"></div>
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
            <div id="map" style="margin: 40px; width:700px;height:800px;font-family: 'Nanum Gothic', sans-serif"></div>

            <section class="cart" style="font-family: 'Nanum Gothic', sans-serif">
                <div class="container">
                    <div class="row" style="margin: auto;height: 800px; width: 1100px">
                        <div class="col-xl-12">
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
                            </table>
                            <div style="position:relative; width:100%; height:700px; overflow-y:auto; overflow-x:auto;">
                                <table class="cart_table">
                                    <tbody>
                                    <c:forEach items="${silages}" var="silage">
                                        <c:if test="${fn:contains(silage.transactionStatus,'Y')}">
                                            <tr>
                                                <div><td style="text-align: center"><input type="hidden" id="memberId" value="${silage.id}">${silage.id}</td></div>
                                                <div><td style="text-align: right">${silage.weight}</td></div>
                                                <div><td style="text-align: right">${silage.count}</td></div>
                                                <div><td style="text-align: right">${silage.unitPrice}</td></div>
                                                <div><td style="text-align: right">${silage.unitPrice * silage.count}</td></div>
                                                <div class="row">
                                                    <td style="text-align: right"><input type="button" value="위치보기" onclick="viewLocation('${silage.id}')"><br>
                                                        <a href="/bsa/silages/${silage.silageCode}"><input type="button" value="상세조회"></a>
                                                    </td>
                                                </div>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-11">
                            <div class="button_box">
                                <a href="/bsa/silages/form"><button class="thm-btn checkout_btn" type="button" onclick=needLogin() style="width: 400px">내 곤포 사일리지 등록하기</button></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </section>

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

    <c:forEach items="${silages}" var="silage">
    geocoder.addressSearch('${silage.address}', function(result, status) {

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
                content: '<div style="width:150px;text-align:center;padding:6px 0;">${silage.id}</div>'
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

<jsp:include page="/WEB-INF/jsp/util/bottom.jsp"/>