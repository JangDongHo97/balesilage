<%--
  Created by IntelliJ IDEA.
  User: aaajd
  Date: 2021-11-27
  Time: 오후 4:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>거래 내역</title>
</head>
<body>
    <jsp:include page="../top/top.jsp"/>
    <table>
        <tr>
            <td><input type="date" id="startDate">~<input type="date" id="endDate"><input type="button" value="검색" onclick="searchDateScope()"></td>
        </tr>
        <tr>
            <td><input type="text" id="sellerId" placeholder="판매자 ID"><input type="button" value="검색" onclick="searchMemberId()"></td>
        </tr>
    </table>
    <div id="silageList">
        <table border="1">
            <tr>
                <th>번호</th>
                <th>상품 번호</th>
                <th>구매자 ID</th>
                <th>판매자 ID</th>
                <th>은행명</th>
                <th>계좌번호</th>
                <th>거래 등록 일시</th>
                <th>가격</th>
                <th>입금 확인</th>
                <th>송금 확인</th>
                <th>비고</th>
            </tr>
            <c:forEach items="${transactions}" var="transaction" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${transaction.silageCode}</td>
                    <td>${transaction.id}</td>
                    <td>${transaction.sellerId}</td>
                    <td>${transaction.bankName}</td>
                    <td>${transaction.accountNo}</td>
                    <td>${transaction.transactionDateTime}</td>
                    <td>${transaction.totalPrice}</td>
                    <c:choose>
                        <c:when test="${transaction.depositStatus}">
                            <td id="statusDeposit${transaction.transactionCode}">
                                <input type="button" style="color: red" value="취소" onclick="checkDeposit('${transaction.transactionCode}','${transaction.depositStatus}')">
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td id="statusDeposit${transaction.transactionCode}">
                                <input type="button" style="color: blue" value="확인" onclick="checkDeposit('${transaction.transactionCode}','${transaction.depositStatus}')">
                            </td>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${transaction.remitStatus}">
                            <td id="statusRemit${transaction.transactionCode}">
                                <input type="button" style="color: red" value="취소" onclick="checkRemit('${transaction.transactionCode}','${transaction.remitStatus}')">
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td id="statusRemit${transaction.transactionCode}">
                                <input type="button" style="color: blue" value="확인" onclick="checkRemit('${transaction.transactionCode}','${transaction.remitStatus}')">
                            </td>
                        </c:otherwise>
                    </c:choose>
                    <td>
                        <input type="button" value="거래 취소" onclick="cancleTransaction('${transaction.transactionCode}')">
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>


    <script type="text/javascript">
        //json요청 결과
        var storage;

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
                    storage = xmlHttp.response;
                    console.log(storage);

                    var script = "";
                    script += "<table border='1' style='width: 100%;'>";
                    script += "    <tr>";
                    script += "        <th>번호</th>";
                    script += "        <th>상품 번호</th>";
                    script += "        <th>구매자 ID</th>";
                    script += "        <th>판매자 ID</th>";
                    script += "        <th>은행명</th>";
                    script += "        <th>계좌번호</th>";
                    script += "        <th>거래 등록 일시</th>";
                    script += "        <th>가격</th>";
                    script += "        <th>입금 확인</th>";
                    script += "        <th>송금 확인</th>";
                    script += "        <th>비고</th>";
                    script += "    </tr>";

                    for (var i = 0; i < storage.length; i++) {
                        script += "    <tr>";
                        script += "        <td>" + (i+1) + "</td>";
                        script += "        <td>" + storage[i].silageCode + "</td>";
                        script += "        <td>" + storage[i].id + "</td>";
                        script += "        <td>" + storage[i].sellerId + "</td>";
                        script += "        <td>" + (storage[i].bankName) + "</td>";
                        script += "        <td>" + (storage[i].accountNo) + "</td>";
                        script += "        <td>" + (storage[i].transactionDateTime) + "</td>";
                        script += "        <td>" + (storage[i].totalPrice) + "</td>";
                        if(storage[i].depositStatus) {
                            script += "        <td id=\"statusDeposit" + storage[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: red\" value=\"취소\" onclick=\"checkDeposit(\'" + storage[i].transactionCode + "\',\'" + storage[i].depositStatus + "\')\">";
                            script += "        </td>";
                        } else {
                            script += "        <td id=\"statusDeposit" + storage[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: blue\" value=\"확인\" onclick=\"checkDeposit(\'" + storage[i].transactionCode + "\',\'" + storage[i].depositStatus + "\')\">";
                            script += "        </td>";
                        }

                        if(storage[i].remitStatus) {
                            script += "        <td id=\"statusRemit" + storage[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: red\" value=\"취소\" onclick=\"checkRemit(\'" + storage[i].transactionCode + "\',\'" + storage[i].remitStatus + "\')\">";
                            script += "        </td>";
                        } else {
                            script += "        <td id=\"statusRemit" + storage[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: blue\" value=\"확인\" onclick=\"checkRemit(\'" + storage[i].transactionCode + "\',\'" + storage[i].remitStatus + "\')\">";
                            script += "        </td>";
                        }
                        script += "        <td>";
                        script += "            <input type=\"button\" value=\"거래 취소\" onclick=\"cancleTransaction(\'" + (storage[i].transactionCode) + "\')\">";
                        script += "        </td>";
                        script += "    </tr>";
                    }
                    script += "</table>";

                    inputJson.innerHTML = script;

                }
            };
            xmlHttp.open('POST', 'http://localhost/bsa/purchases',true);
            xmlHttp.responseType = 'json';
            xmlHttp.setRequestHeader("Content-Type","application/json;charset=UTF-8");
            xmlHttp.send(parseDateScope);
        }

        function checkDeposit(transCode, deposit){
            var xmlHttp = new XMLHttpRequest();
            var transaction = {
                transactionCode : transCode,
                depositStatus : deposit
            };
            var parseTransaction = JSON.stringify(transaction);

            var inputJson = document.getElementById("statusDeposit"+transCode);

            xmlHttp.onreadystatechange = function() {
                if(this.readyState == 4 && this.status == 200) {
                    var afterTransaction = xmlHttp.response;
                    var depositScript = "";

                    if(afterTransaction.depositStatus) {
                        depositScript += "        <td>";
                        depositScript += "            <input type=\"button\" style=\"color: red\" value=\"취소\" onclick=\"checkDeposit(\'" + afterTransaction.transactionCode + "\',\'" + afterTransaction.depositStatus + "\')\">"
                        depositScript += "        </td>";
                    } else {
                        depositScript += "        <td>";
                        depositScript += "            <input type=\"button\" style=\"color: blue\" value=\"확인\" onclick=\"checkDeposit(\'" + afterTransaction.transactionCode + "\',\'" + afterTransaction.depositStatus + "\')\">"
                        depositScript += "        </td>";
                    }

                    inputJson.innerHTML = depositScript;

                }
            };

            xmlHttp.open('PUT', 'http://localhost/bsa/transactions/deposit');
            xmlHttp.responseType = 'json';
            xmlHttp.setRequestHeader("Content-Type","application/json;charset=UTF-8");
            xmlHttp.send(parseTransaction);
        }

        function checkRemit(transCode, remit){
            var xmlHttp = new XMLHttpRequest();
            var transaction = {
                transactionCode : transCode,
                remitStatus : remit
            };
            var parseTransaction = JSON.stringify(transaction);

            var inputJson = document.getElementById("statusRemit"+transCode);

            xmlHttp.onreadystatechange = function() {
                if(this.readyState == 4 && this.status == 200) {
                    var afterTransaction = xmlHttp.response;
                    var remitScript = "";

                    if(afterTransaction.remitStatus) {
                        remitScript += "        <td>";
                        remitScript += "            <input type=\"button\" style=\"color: red\" value=\"취소\" onclick=\"checkRemit(\'" + afterTransaction.transactionCode + "\',\'" + afterTransaction.remitStatus + "\')\">"
                        remitScript += "        </td>";
                    } else {
                        remitScript += "        <td>";
                        remitScript += "            <input type=\"button\" style=\"color: blue\" value=\"확인\" onclick=\"checkRemit(\'" + afterTransaction.transactionCode + "\',\'" + afterTransaction.remitStatus + "\')\">"
                        remitScript += "        </td>";
                    }

                    inputJson.innerHTML = remitScript;

                }
            };

            xmlHttp.open('PUT', 'http://localhost/bsa/transactions/remit');
            xmlHttp.responseType = 'json';
            xmlHttp.setRequestHeader("Content-Type","application/json;charset=UTF-8");
            xmlHttp.send(parseTransaction);
        }

        function cancleTransaction(transCode) {
            var xmlHttp = new XMLHttpRequest();
            var transaction = {
                transactionCode : transCode
            };
            var parseTransaction = JSON.stringify(transaction);

            var inputJson = document.getElementById("silageList");

            xmlHttp.onreadystatechange = function() {
                if(this.readyState == 4 && this.status == 200) {
                    var storage = xmlHttp.response;
                    console.log(storage);

                    var script = "";
                    script += "<table border='1' style='width: 100%;'>";
                    script += "    <tr>";
                    script += "        <th>번호</th>";
                    script += "        <th>상품 번호</th>";
                    script += "        <th>구매자 ID</th>";
                    script += "        <th>판매자 ID</th>";
                    script += "        <th>은행명</th>";
                    script += "        <th>계좌번호</th>";
                    script += "        <th>거래 등록 일시</th>";
                    script += "        <th>가격</th>";
                    script += "        <th>입금 확인</th>";
                    script += "        <th>송금 확인</th>";
                    script += "        <th>비고</th>";
                    script += "    </tr>";

                    for (var i = 0; i < storage.length; i++) {
                        script += "    <tr>";
                        script += "        <td>" + (i+1) + "</td>";
                        script += "        <td>" + storage[i].silageCode + "</td>";
                        script += "        <td>" + storage[i].id + "</td>";
                        script += "        <td>" + storage[i].sellerId + "</td>";
                        script += "        <td>" + (storage[i].bankName) + "</td>";
                        script += "        <td>" + (storage[i].accountNo) + "</td>";
                        script += "        <td>" + (storage[i].transactionDateTime) + "</td>";
                        script += "        <td>" + (storage[i].totalPrice) + "</td>";
                        if(storage[i].depositStatus) {
                            script += "        <td id=\"statusDeposit" + storage[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: red\" value=\"취소\" onclick=\"checkDeposit(\'" + storage[i].transactionCode + "\',\'" + storage[i].depositStatus + "\')\">";
                            script += "        </td>";
                        } else {
                            script += "        <td id=\"statusDeposit" + storage[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: blue\" value=\"확인\" onclick=\"checkDeposit(\'" + storage[i].transactionCode + "\',\'" + storage[i].depositStatus + "\')\">";
                            script += "        </td>";
                        }

                        if(storage[i].remitStatus) {
                            script += "        <td id=\"statusRemit" + storage[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: red\" value=\"취소\" onclick=\"checkRemit(\'" + storage[i].transactionCode + "\',\'" + storage[i].remitStatus + "\')\">";
                            script += "        </td>";
                        } else {
                            script += "        <td id=\"statusRemit" + storage[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: blue\" value=\"확인\" onclick=\"checkRemit(\'" + storage[i].transactionCode + "\',\'" + storage[i].remitStatus + "\')\">";
                            script += "        </td>";
                        }
                        script += "        <td>";
                        script += "            <input type=\"button\" value=\"거래 취소\" onclick=\"cancleTransaction(\'" + (storage[i].transactionCode) + "\')\">";
                        script += "        </td>";
                        script += "    </tr>";
                    }
                    script += "</table>";

                    inputJson.innerHTML = script;
                }
            }

            xmlHttp.open('DELETE', 'http://localhost/bsa/transactions');
            xmlHttp.responseType='json';
            xmlHttp.setRequestHeader("Content-Type","application/json;charset=UTF-8");
            xmlHttp.send(parseTransaction);
        }
    </script>
</body>
</html>
