<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/jsp/util/top.jsp"/>

<script>
    function checkAccount() {
        if(${accountErrorMsg != null}) {
            window.alert('${accountErrorMsg}');
            <%
                session.removeAttribute("accountErrorMsg");
            %>
        }
    }
</script>

<div class="preloader" style="display: none; font-family: 'Nanum Gothic', sans-serif">
    <img src="/assets/images/loader.png" class="preloader__image" alt="">
</div><!-- /.preloader -->

<div class="page-wrapper">
    <div class="site-header__header-one-wrap">
        <header class="main-nav__header-one"></header>
    </div>

    <section class="page-header" style="background-image: url(/assets/images/backgrounds/page-header-contact.jpg);">
        <div class="container">
            <h4 style="font-family: 'Nanum Gothic', sans-serif; text-align: center; padding-bottom: 7%; color: #fefefe ">곤포 사일리지 찾아보기</h4>
        </div>
    </section>

    <section class="contact_google_map_1">
        <div class="row">
            <div class="col-xl-12">
                <div class="showing-result-shorting" style="padding-bottom: 25px;">
                    <div class="right">
                        <div class="shorting" style="position: absolute;right: 0;width: 15%;margin: 1%;margin-right: 800px;">
                            <div class="dropdown bootstrap-select">
                                <select class="selectpicker" name="orderSelect" id="order" data-width="100%" tabindex="-98">
                                    <option value="" selected="selected">-선택-</option>
                                    <option value="unitP1">단가 낮은순</option>
                                    <option value="unitP2">단가 높은순</option>
                                    <option value="count1">개수 낮은순</option>
                                    <option value="count2">개수 높은순</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="map" style="outline-style: ridge; outline-width: thin; margin-left: 4%; margin-top: 2%; width:700px;height:1000px;font-family: 'Nanum Gothic', sans-serif">
            </div>

            <section class="cart" style="font-family: 'Nanum Gothic', sans-serif; width: 55%">
                <div class="sidebar-search-box" style="width: 250px;margin-left: 72%;">
                    <div class="search-form">
                        <input placeholder="판매자 검색" type="text" id="searchMemberId" style="height: 47.5px; width: 297.5px;">
                        <button onclick="initPage(),search()" style="padding-top: 10px; right: -40px; width: 40px; height: 45px;">
                            <i class="icon-magnifying-glass" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
                <div class="container">
                    <div class="row" style="margin-right: 4%; margin-top: 4%; height: 1000px; width: 1100px">
                        <div class="col-xl-12">
                            <table class="cart_table">
                                <thead class="cart_table_head">
                                <tr>
                                    <th colspan="1" style="text-align: center;font-family: 'Nanum Gothic', sans-serif; font-size: 20px">판매자</th>
                                    <th colspan="1" style="text-align: center;font-family: 'Nanum Gothic', sans-serif; font-size: 20px">무게</th>
                                    <th colspan="1" style="text-align: center;font-family: 'Nanum Gothic', sans-serif; font-size: 20px">개수</th>
                                    <th colspan="1" style="text-align: center;font-family: 'Nanum Gothic', sans-serif; font-size: 20px">단가</th>
                                    <th colspan="1" style="text-align: center;font-family: 'Nanum Gothic', sans-serif; font-size: 20px">가격</th>
                                    <th colspan="1" style="text-align: center;font-family: 'Nanum Gothic', sans-serif; font-size: 20px">비고</th>
                                </tr>
                                </thead>
                                <tbody id="silageList"  style="text-align: center"></tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row" style="float : none; margin:0 auto;">
                        <div class="col-xl-4" style="padding-left: 42.5%">
                            <div id="pagingHtml" style="justify-content: center; margin:4%;text-align:center;"></div>
                        </div>
                    </div>
                    <div class="row" style="justify-content: right">
                        <div class="col-xl-7">
                            <div class="button_box" style="margin-top:0%">
                                <script>
                                    checkAccount();
                                </script>
                                <a href="/bsa/silages/form">
                                    <button class="thm-btn checkout_btn" type="button" onclick="needLogin()" style="width: 400px;margin-top: 30px;margin-left: 0px;">내 곤포 사일리지 등록하기</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </section>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d0b4825b8dca8223449db80faff26514&libraries=services,clusterer,drawing"></script>
<script>
    var mapContainer = document.getElementById('map'),
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667),
            level: 7
        };

    var map = new kakao.maps.Map(mapContainer, mapOption);
    var geocoder = new kakao.maps.services.Geocoder();

    var firstPlace;

    if(${member.address != null}) {
        geocoder.addressSearch('${member.address}', function (result, status) {
            if(status === kakao.maps.services.Status.OK) {
                firstPlace = new kakao.maps.LatLng(result[0].y, result[0].x);
            }
        });
    }

    <c:forEach items="${silages}" var="silage">
    geocoder.addressSearch('${silage.address}', function(result, status) {
        if (status === kakao.maps.services.Status.OK && ${fn:contains(silage.transactionStatus,'Y')} ) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">${silage.id}</div>'
            });
            infowindow.open(map, marker);

            if(${member.address == null}) {
                map.setCenter(coords);
            } else {
                map.setCenter(firstPlace);
            }
        }
    });
    </c:forEach>

</script>
<script>
    var selectEvent = document.getElementById("order");
    selectEvent.addEventListener('change', initPage);
    selectEvent.addEventListener('change', search);

    var pageNo = 0;
    search();

    function initPage() {
        pageNo = 0;
    }

    function changePage(pageButtonId) {
        pageNo = parseInt(pageButtonId);

        search();
    }

    function search() {
        var searchKeyword = {
            pageNo : pageNo
            , id : document.getElementById("searchMemberId").value
            , orderStandard : document.getElementById("order").value
        };

        $.ajax({
            url: "${pageContext.request.contextPath}/bsa/silages/list",
            type: "POST",
            data: JSON.stringify(searchKeyword),
            headers: {"Content-Type": "application/json;charset=UTF-8"},
            success: function (rows) {
                drawTable(rows);
            }
        })
    }

    function drawTable(rows) {
        var showData = rows.silages;
        var navigatorHtml = rows.navigator;

        var script = "";

        for (var i = 0; i < showData.length; i++) {

            if (showData[i].transactionStatus == 'Y') {
                script += "    <tr>";
                script += "        <div><td style=\"text-align: center\"><input type=\"hidden\" id=\"memberId\" value=\"" + showData[i].id + "\">" + showData[i].id + "</td></div>";
                script += "        <div><td style=\"text-align: right\">" + showData[i].weight + " kg</td></div>";
                script += "        <div><td style=\"text-align: right\">" + showData[i].count + "</td></div>";
                script += "        <div><td style=\"text-align: right\">" + addFormat(showData[i].unitPrice) + " 원</td></div>";
                script += "        <div><td style=\"text-align: right\">" + addFormat(showData[i].count * showData[i].unitPrice) + " 원</td></div>";
                script += "        <div class=\"row\" style=\"text-align: center\">";
                script += "            <td style=\"text-align: right\"><input type=\"button\" value=\"위치보기\" onclick=\"viewLocation(\'" + showData[i].id + "\')\"><br>";
                script += "                <a href=\"/bsa/silages/" + showData[i].silageCode + "\" onclick=needLogin()><input type=\"button\" value=\"상세조회\" ></a>";
                script += "            </td>";
                script += "        </div>";
                script += "    </tr>";
            }

        }
        $("#pagingHtml").html(navigatorHtml);
        $("#silageList").html(script);
    }

    function addFormat(amount) {
        return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
    }
</script>
<script>


    function viewLocation(x) {
        var xmlHttp = new XMLHttpRequest();
        var member = {
            id: x
        };

        var parseMember = JSON.stringify(member);
        var silageLocation;

        xmlHttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                let location = xmlHttp.response;

                silageLocation = location.address;

                geocoder.addressSearch(silageLocation, function (result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                        map.setCenter(coords);
                    }
                });
            }
        }

        xmlHttp.open('POST', '${pageContext.request.contextPath}/bsa/silages/place');
        xmlHttp.responseType = 'json';
        xmlHttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        xmlHttp.send(parseMember);
    }
</script>

<jsp:include page="/WEB-INF/jsp/util/bottom.jsp"/>