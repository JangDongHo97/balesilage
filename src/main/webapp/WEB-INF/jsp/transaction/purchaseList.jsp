<%--
  Created by IntelliJ IDEA.
  User: aaajd
  Date: 2021-11-27
  Time: 오후 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>구매 내역</title>
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
                <th>판매자 ID</th>
                <th>상품 번호</th>
                <th>구매 일시</th>
                <th>가격</th>
                <th>비고</th>
            </tr>
            <c:forEach items="${transactions}" var="transaction" varStatus="status">
                <c:if test="${transaction.buyerCode == memberCode}">
                    <tr>
                        <td>${status.count}</td>
                        <td>${transaction.sellerId}</td>
                        <td>${transaction.silageCode}</td>
                        <td>${transaction.transactionDateTime}</td>
                        <td>${transaction.totalPrice}</td>
                        <td><a href="/bsa/purchases/${transaction.transactionCode}"><input type="button" value="상세 조회"></a></td>
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
                    script += "        <th>판매자 ID</th>";
                    script += "        <th>상품 번호</th>";
                    script += "        <th>구매 일시</th>";
                    script += "        <th>가격</th>";
                    script += "        <th>비고</th>";
                    script += "    </tr>";

                    for (var i = 0; i < storage.length; i++) {
                        if(storage[i].buyerCode === memberCode) {
                            script += "    <tr>";
                            script += "        <td>" + (i+1) + "</td>";
                            script += "        <td>" + storage[i].sellerId + "</td>";
                            script += "        <td>" + storage[i].silageCode + "</td>";
                            script += "        <td>" + storage[i].transactionDateTime + "</td>";
                            script += "        <td>" + (storage[i].totalPrice) + "</td>";
                            script += "        <td>" + (storage[i].totalPrice) + "</td>";
                            script += "        <td><a href=\"/bsa/purchases/" + storage[i].transactionCode + "><input type=\"button\" value=\"상세 조회\"></a></td>";
                            script += "    </tr>";
                        }
                    }
                    script += "</table>";

                    inputJson.innerHTML = script;

                }
            };
            xmlHttp.open('POST', 'http://localhost/bsa/purchases');
            xmlHttp.responseType = 'json';
            xmlHttp.setRequestHeader("Content-Type","application/json;charset=UTF-8");
            xmlHttp.send(parseDateScope);
        }
    </script>
</body>
</html>
