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
                    <td>${silage.weight}</td>
                    <td>${silage.count}</td>
                    <td>${silage.unitPrice}</td>
                    <td>${silage.unitPrice * silage.count}</td>
                    <td><input type="button" value="위치보기" onclick="viewLocation()"></td>
                </tr>
            </c:if>
        </c:forEach>
    </table>

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

        function viewLocation() {
            var xmlHttp = new XMLHttpRequest();
            var member = {
                memberId : document.getElementById("memberId").value
            };
            console.log(member);

            var parseMember = JSON.stringify(member);

            console.log(parseMember);

            xmlHttp.onreadystatechange = function () {
                if(this.readyState == 4 && this.status == 200) {
                    let location = xmlHttp.response;

                    console.log(location);
                }
            }

            xmlHttp.open('POST', 'http://localhost/silages');
            xmlHttp.responseType = 'json';
            xmlHttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
            xmlHttp.send(parseMember);

            <%--geocoder.addressSearch('${address}', function(result, status) {--%>

            <%--    // 정상적으로 검색이 완료됐으면--%>
            <%--    if (status === kakao.maps.services.Status.OK) {--%>

            <%--        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);--%>

            <%--        // 결과값으로 받은 위치를 마커로 표시합니다--%>
            <%--        var marker = new kakao.maps.Marker({--%>
            <%--            map: map,--%>
            <%--            position: coords--%>
            <%--        });--%>

            <%--        // 인포윈도우로 장소에 대한 설명을 표시합니다--%>
            <%--        var infowindow = new kakao.maps.InfoWindow({--%>
            <%--            content: '<div style="width:150px;text-align:center;padding:6px 0;">곤포 사일리지</div>'--%>
            <%--        });--%>
            <%--        infowindow.open(map, marker);--%>

            <%--        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다--%>
            <%--        map.setCenter(coords);--%>
            <%--    }--%>
            <%--});--%>
        }
    </script>
    <a href="/bsa/silages/form">곤포 사일리지 등록</a>
</body>
</html>
