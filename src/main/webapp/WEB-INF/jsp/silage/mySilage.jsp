<%--
  Created by IntelliJ IDEA.
  User: aaajd
  Date: 2021-11-27
  Time: 오후 4:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>내 곤포 사일리지</title>
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
                <th>번호</th>
                <th>상품번호</th>
                <th>구매자ID</th>
                <th>무게</th>
                <th>개수</th>
                <th>단가</th>
                <th>가격</th>
                <th>비고</th>
            </tr>
            <c:forEach items="${silages}" var="silage" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td><a href="/bsa/silages/${silage.silageCode}">${silage.silageCode}</a></td>
                    <td><input type="hidden" id="memberId" value="${silage.id}">${silage.id}</td>
                    <td>${silage.enrollDateTime}</td>
                    <td style="text-align: right">${silage.weight}</td>
                    <td style="text-align: right">${silage.count}</td>
                    <td style="text-align: right">${silage.unitPrice}</td>
                    <td style="text-align: right">${silage.unitPrice * silage.count}</td>
                    <td><input type="button" value="위치보기" onclick="viewLocation('${silage.id}')"></td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <script type="text/javascript">
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
</body>
</html>
