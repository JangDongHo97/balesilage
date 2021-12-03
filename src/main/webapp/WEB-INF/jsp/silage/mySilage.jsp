<%--

  Created by IntelliJ IDEA.
  User: aaajd
  Date: 2021-11-27
  Time: 오후 4:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>내 곤포 사일리지</title>
</head>
<body>
<jsp:include page="../top/top.jsp"/>
<table>
    <tr>
        <td><input type="date" id="startDate">~<input type="date" id="endDate"><input type="button" value="검색" onclick="searchDateScope('${memberCode}')"></td>
    </tr>
</table>
    <div id="silageList">
        <table border="1">
            <tr>
                <th>번호</th>
                <th>상품번호</th>
                <th>등록 일시</th>
                <th>가격</th>
                <th>판매 상태</th>
            </tr>
            <c:forEach items="${silages}" var="silage" varStatus="status">
                <c:if test="${silage.sellerCode == memberCode}">
                    <tr>
                        <td>${status.count}</td>
                        <td><a href="/bsa/silages/${silage.silageCode}"/>${silage.silageCode}</td>
                        <td>${silage.enrollDateTime}</td>
                        <td style="text-align: right">${silage.unitPrice * silage.count}</td>
                        <c:if test="${fn:contains(silage.transactionStatus,'Y')}">
                            <td style="text-align: center">판매중</td>
                        </c:if>
                        <c:if test="${fn:contains(silage.transactionStatus,'N')}">
                            <td style="text-align: center">판매 완료</td>
                        </c:if>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </div>

    <script type="text/javascript">
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
                    console.log(storage);

                    var script = "";
                    script += "<table border='1' style='width: 100%;'>";
                    script += "    <tr>";
                    script += "        <th>번호</th>";
                    script += "        <th>상품번호</th>";
                    script += "        <th>등록 일시</th>";
                    script += "        <th>가격</th>";
                    script += "        <th>판매 상태</th>";
                    script += "    </tr>";

                    for (var i = 0; i < storage.length; i++) {
                        if(storage[i].sellerCode === memberCode) {
                            script += "    <tr>";
                            script += "        <td>" + (i+1) + "</td>";
                            script += "        <td><a href=\"/bsa/silages/" + storage[i].silageCode + "\">" + storage[i].silageCode + "</a></td>";
                            script += "        <td>" + storage[i].enrollDateTime + "</td>";
                            script += "        <td>" + (storage[i].count * storage[i].unitPrice) + "</td>";
                            if(storage[i].transactionStatus === 'Y'){
                                script += "        <td>판매중</td>";
                            } else {
                                script += "        <td>판매 완료</td>";
                            }
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
</body>
</html>
