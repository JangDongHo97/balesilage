<%--
  Created by IntelliJ IDEA.
  User: aaajd
  Date: 2021-11-27
  Time: 오후 4:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>곤포 사일리지 목록</title>
</head>
<body>
    <jsp:include page="../top/top.jsp"/>
    <table>
        <tr>
            <td><input type="date" id="startDate">~<input type="date" id="endDate"><input type="button" value="검색" onclick="searchDateScope()"></td>
        </tr>
    </table>
    <div id="silageList">
        <table border="1">
            <tr>
                <th>일련번호</th>
                <th>판매자id</th>
                <th>등록 일시</th>
                <th>무게</th>
                <th>개수</th>
                <th>단가</th>
                <th>가격</th>
                <th>비고</th>
            </tr>
            <c:forEach items="${silages}" var="silage">
                <c:if test="${fn:contains(silage.transactionStatus,'Y')}">
                    <tr>
                        <td><a href="/bsa/silages/${silage.silageCode}"/>${silage.silageCode}</td>
                        <td><input type="hidden" id="memberId" value="${silage.id}">${silage.id}</td>
                        <td>${silage.enrollDateTime}</td>
                        <td style="text-align: right">${silage.weight}</td>
                        <td style="text-align: right">${silage.count}</td>
                        <td style="text-align: right">${silage.unitPrice}</td>
                        <td style="text-align: right">${silage.unitPrice * silage.count}</td>
                        <td><input type="button" value="위치보기" onclick="viewLocation('${silage.id}')"></td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </div>

    <div id="map" style="width:500px;height:400px;"></div>
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
            console.log(member);

            var parseMember = JSON.stringify(member);
            var silageLocation;

            console.log(parseMember);

            xmlHttp.onreadystatechange = function () {
                if(this.readyState == 4 && this.status == 200) {
                    let location = xmlHttp.response;

                    silageLocation = location.address;

                    geocoder.addressSearch(silageLocation, function(result, status) {
                        // 정상적으로 검색이 완료됐으면
                        if (status === kakao.maps.services.Status.OK) {
                            console.log('여기 들어옴');

                            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                            console.log(result[0].y);
                            console.log(result[0].x);

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
                    console.log(storage);

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
                        script += "    <tr>";
                        script += "        <td><a href=\"/bsa/silages/" + storage[i].silageCode + "\">" + storage[i].silageCode + "</a></td>";
                        script += "        <td>" + storage[i].id + "</td>";
                        script += "        <td>" + storage[i].enrollDateTime + "</td>";
                        script += "        <td>" + storage[i].weight + "</td>";
                        script += "        <td>" + storage[i].count + "</td>";
                        script += "        <td>" + storage[i].unitPrice + "</td>";
                        script += "        <td>" + (storage[i].count * storage[i].unitPrice) + "</td>";
                        script += "        <td><input type=\"button\" value=\"위치보기\" onclick=\"viewLocation()\"></td>";
                        script += "    </tr>";
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
    <a href="/bsa/silages/form">곤포 사일리지 등록</a>
</body>
</html>
