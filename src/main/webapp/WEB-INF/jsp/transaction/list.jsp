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
<jsp:include page="../util/top.jsp"/>
<div class="preloader" style="display: none;">
    <img src="assets/images/loader.png" class="preloader__image" alt="">
</div><!-- /.preloader -->

<div class="page-wrapper">
    <div class="site-header__header-one-wrap">
        <header class="main-nav__header-one"></header>
    </div>

    <section class="page-header" style="background-image: url(/assets/images/backgrounds/page-header-contact.jpg);">
    </section>

    <section class="cart">
        <div class="container" style="font-family: 'Nanum Gothic', sans-serif ">
            <div class="row" style="padding:0 0 20 20; margin-right: -25%; margin-left: -25%;">
                <h1 style="font-family: 'Nanum Gothic', sans-serif; color:black">거래 내역</h1>
                <hr>
                <br/>
            </div>
            <div class="row" style="margin-right: -25%; margin-left: -25%;">
                <div class="col-xl-12" style="padding-right: 5px;padding-left: 0px;">
                    <div class="input_box">
                        <div>
                            <table>
                                <tr>
                                    <td style="padding:0 10 0 10; color:black">
                                        거래 기간
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
                                        <input type="text" id="searchMemberId" placeholder="판매자ID 검색">
                                        <input type="button" value="검색" onclick="searchMember()">
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-right: -25%; margin-left: -25%;">
                <div class="col-xl-12" style="padding-right: 0px; padding-left: 0px">
                    <table class="cart_table">
                        <thead class="cart_table_head">
                        <tr style="padding:20 0 20 0; text-align: center">
                            <th style="font-family: 'Nanum Gothic', sans-serif">번호</th>
                            <th style="font-family: 'Nanum Gothic', sans-serif">상품 번호</th>
                            <th style="font-family: 'Nanum Gothic', sans-serif">구매자</th>
                            <th style="font-family: 'Nanum Gothic', sans-serif">판매자</th>
                            <th style="font-family: 'Nanum Gothic', sans-serif">은행명</th>
                            <th style="font-family: 'Nanum Gothic', sans-serif">계좌번호</th>
                            <th style="font-family: 'Nanum Gothic', sans-serif">거래일시</th>
                            <th style="font-family: 'Nanum Gothic', sans-serif">가격</th>
                            <th style="font-family: 'Nanum Gothic', sans-serif">입금확인</th>
                            <th style="font-family: 'Nanum Gothic', sans-serif">송금확인</th>
                            <th style="font-family: 'Nanum Gothic', sans-serif">비고</th>
                        </tr>
                        </thead>
                    </table>
                    <div id="silageList" style="position:relative; width:101.49%; height:80%; overflow-y:auto">
                        <table class="cart_table">
                            <tbody style="text-align: center">
                            <c:forEach items="${transactions}" var="transaction" varStatus="status">
                                <tr>
                                    <td class="colum_box" style="padding: 40 0 40 0">
                                        ${status.count}
                                    </td>
                                    <td class="title"  style="padding: 40 0 40 0">
                                        ${transaction.silageCode}
                                    </td>
                                    <td class="pro_price" style="padding: 40 0 40 0">
                                        ${transaction.id}
                                    </td>
                                    <td class="pro_qty" style="padding: 40 0 40 0">
                                        ${transaction.sellerId}
                                    </td>
                                    <td class="pro_qty" style="padding: 40 0 40 0">
                                        ${transaction.bankName}
                                    </td>
                                    <td class="pro_qty" style="padding: 40 0 40 0">
                                        ${transaction.accountNo}
                                    </td>
                                    <td class="pro_qty" style="padding: 40 0 40 0">
                                        ${transaction.transactionDateTime}
                                    </td>
                                    <td class="pro_qty" style="padding: 40 0 40 0">
                                        ${transaction.totalPrice}
                                    </td>
                                    <c:choose>
                                        <c:when test="${transaction.depositStatus}">
                                            <td class="pro_sub_total" style="padding: 40 0 40 0" id="statusDeposit${transaction.transactionCode}">
                                                <input type="button" style="color: red" value="취소" onclick="checkDeposit('${transaction.transactionCode}','${transaction.depositStatus}')">
                                            </td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="pro_sub_total" style="padding: 40 0 40 0" id="statusDeposit${transaction.transactionCode}">
                                                <input type="button" style="color: blue" value="확인" onclick="checkDeposit('${transaction.transactionCode}','${transaction.depositStatus}')">
                                            </td>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${transaction.remitStatus}">
                                            <td class="pro_sub_total" style="padding: 40 0 40 0" id="statusRemit${transaction.transactionCode}">
                                                <input type="button" style="color: red" value="취소" onclick="checkRemit('${transaction.transactionCode}','${transaction.remitStatus}')">
                                            </td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="pro_sub_total" style="padding: 40 0 40 0" id="statusRemit${transaction.transactionCode}">
                                                <input type="button" style="color: blue" value="확인" onclick="checkRemit('${transaction.transactionCode}','${transaction.remitStatus}')">
                                            </td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td class="pro_sub_total" style="padding: 40 0 40 0">
                                        <input type="button" value="거래 취소" onclick="cancleTransaction('${transaction.transactionCode}')">
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    </section>

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
                    script += "<table class=\"cart_table\">";
                    script += "    <tbody style=\"text-align: center\">";

                    for (var i = 0; i < storage.length; i++) {
                        script += "    <tr>";
                        script += "        <td class=\"colum_box\" style=\"padding: 40 0 40 0\">" + (i+1) + "</td>";
                        script += "        <td class=\"title\"  style=\"padding: 40 0 40 0\">" + storage[i].silageCode + "</td>";
                        script += "        <td class=\"pro_price\" style=\"padding: 40 0 40 0\">" + storage[i].id + "</td>";
                        script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + storage[i].sellerId + "</td>";
                        script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (storage[i].bankName) + "</td>";
                        script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (storage[i].accountNo) + "</td>";
                        script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (storage[i].transactionDateTime) + "</td>";
                        script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (storage[i].totalPrice) + "</td>";
                        if(storage[i].depositStatus) {
                            script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusDeposit" + storage[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: red\" value=\"취소\" onclick=\"checkDeposit(\'" + storage[i].transactionCode + "\',\'" + storage[i].depositStatus + "\')\">";
                            script += "        </td>";
                        } else {
                            script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusDeposit" + storage[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: blue\" value=\"확인\" onclick=\"checkDeposit(\'" + storage[i].transactionCode + "\',\'" + storage[i].depositStatus + "\')\">";
                            script += "        </td>";
                        }

                        if(storage[i].remitStatus) {
                            script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusRemit" + storage[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: red\" value=\"취소\" onclick=\"checkRemit(\'" + storage[i].transactionCode + "\',\'" + storage[i].remitStatus + "\')\">";
                            script += "        </td>";
                        } else {
                            script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusRemit" + storage[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: blue\" value=\"확인\" onclick=\"checkRemit(\'" + storage[i].transactionCode + "\',\'" + storage[i].remitStatus + "\')\">";
                            script += "        </td>";
                        }
                        script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\">";
                        script += "            <input type=\"button\" value=\"거래 취소\" onclick=\"cancleTransaction(\'" + (storage[i].transactionCode) + "\')\">";
                        script += "        </td>";
                        script += "    </tr>";
                    }
                    script += "    </tbody>";
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
                        depositScript += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusDeposit" + afterTransaction.transactionCode + "\">";
                        depositScript += "            <input type=\"button\" style=\"color: red\" value=\"취소\" onclick=\"checkDeposit(\'" + afterTransaction.transactionCode + "\',\'" + afterTransaction.depositStatus + "\')\">";
                        depositScript += "        </td>";
                    } else {
                        depositScript += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusDeposit" + afterTransaction.transactionCode + "\">";
                        depositScript += "            <input type=\"button\" style=\"color: blue\" value=\"확인\" onclick=\"checkDeposit(\'" + afterTransaction.transactionCode + "\',\'" + afterTransaction.depositStatus + "\')\">";
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
                        remitScript += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusRemit" + afterTransaction.transactionCode + "\">";
                        remitScript += "            <input type=\"button\" style=\"color: red\" value=\"취소\" onclick=\"checkRemit(\'" + afterTransaction.transactionCode + "\',\'" + afterTransaction.remitStatus + "\')\">";
                        remitScript += "        </td>";
                    } else {
                        remitScript += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusRemit" + afterTransaction.transactionCode + "\">";
                        remitScript += "            <input type=\"button\" style=\"color: blue\" value=\"확인\" onclick=\"checkRemit(\'" + afterTransaction.transactionCode + "\',\'" + afterTransaction.remitStatus + "\')\">";
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
                    script += "<table class=\"cart_table\">";
                    script += "    <tbody style=\"text-align: center\">";

                    for (var i = 0; i < storage.length; i++) {
                        script += "    <tr>";
                        script += "        <td class=\"colum_box\" style=\"padding: 40 0 40 0\">" + (i+1) + "</td>";
                        script += "        <td class=\"title\"  style=\"padding: 40 0 40 0\">" + storage[i].silageCode + "</td>";
                        script += "        <td class=\"pro_price\" style=\"padding: 40 0 40 0\">" + storage[i].id + "</td>";
                        script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + storage[i].sellerId + "</td>";
                        script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (storage[i].bankName) + "</td>";
                        script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (storage[i].accountNo) + "</td>";
                        script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (storage[i].transactionDateTime) + "</td>";
                        script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (storage[i].totalPrice) + "</td>";
                        if(storage[i].depositStatus) {
                            script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusDeposit" + storage[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: red\" value=\"취소\" onclick=\"checkDeposit(\'" + storage[i].transactionCode + "\',\'" + storage[i].depositStatus + "\')\">";
                            script += "        </td>";
                        } else {
                            script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusDeposit" + storage[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: blue\" value=\"확인\" onclick=\"checkDeposit(\'" + storage[i].transactionCode + "\',\'" + storage[i].depositStatus + "\')\">";
                            script += "        </td>";
                        }

                        if(storage[i].remitStatus) {
                            script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusRemit" + storage[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: red\" value=\"취소\" onclick=\"checkRemit(\'" + storage[i].transactionCode + "\',\'" + storage[i].remitStatus + "\')\">";
                            script += "        </td>";
                        } else {
                            script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusRemit" + storage[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: blue\" value=\"확인\" onclick=\"checkRemit(\'" + storage[i].transactionCode + "\',\'" + storage[i].remitStatus + "\')\">";
                            script += "        </td>";
                        }
                        script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\">";
                        script += "            <input type=\"button\" value=\"거래 취소\" onclick=\"cancleTransaction(\'" + (storage[i].transactionCode) + "\')\">";
                        script += "        </td>";
                        script += "    </tr>";
                    }
                    script += "    </tbody>";
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
</div>

<jsp:include page="../util/bottom.jsp"/>
