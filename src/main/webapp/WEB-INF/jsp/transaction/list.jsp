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
    <img src="/assets/images/loader.png" class="preloader__image" alt="">
</div><!-- /.preloader -->

<div class="page-wrapper">
    <div class="site-header__header-one-wrap">
        <header class="main-nav__header-one"></header>
    </div>

    <section class="page-header" style="background-image: url(/assets/images/backgrounds/page-header-contact.jpg);">
    </section>

    <section class="cart">
        <div class="col-xl-12">
            <h1 style="font-family: 'Nanum Gothic', sans-serif; color:black; margin: 2%; margin-left: 6%">거래 내역</h1>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="input_box">
                    <div class="row">
                        <div class="col-xl-9">
                            <table style="margin-left: 9%">
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
                                        <input type="button" value="검색" onclick="search()">
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-xl-3" data-wow-delay="0.1s" data-wow-duration="1200ms" style="visibility: visible; animation-duration: 1200ms; animation-delay: 0.1s; animation-name: fadeInUp; text-align: right">
                            <div class="sidebar-search-box" style="margin-right: 20%">
                                <div class="search-form">
                                    <input placeholder="ID 검색" type="text" id="searchMemberId">
                                    <button onclick="initPage(), search()"><i class="icon-magnifying-glass" aria-hidden="true"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" style="font-family: 'Nanum Gothic', sans-serif ">
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
                        <tbody id="silageList" style="text-align: center"></tbody>
                    </table>
                </div>
            </div>
            <div class="row" style="float : none; margin:0 auto;">
                <div class="col-xl-4" style="padding-left: 42.5%; padding-top: 5%">
                    <div id="pagingHtml" style="justify-content: center; margin:4% text-align:center;"></div>
                </div>
            </div>
        </div>
    </section>

    <script type="text/javascript">
        var storage;
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
                id: document.getElementById("searchMemberId").value
                ,startDate : document.getElementById("startDate").value
                , endDate : document.getElementById("endDate").value
                , pageNo : pageNo
            };

            $.ajax({
                url: "${pageContext.request.contextPath}/bsa/transactions/list",
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
                script += "    <tr>";
                script += "        <td class=\"colum_box\" style=\"padding: 40 0 40 0\">" + (i+1) + "</td>";
                script += "        <td class=\"title\"  style=\"padding: 40 0 40 0\">" + showData[i].silageCode + "</td>";
                script += "        <td class=\"pro_price\" style=\"padding: 40 0 40 0\">" + showData[i].id + "</td>";
                script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + showData[i].sellerId + "</td>";
                script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (showData[i].bankName) + "</td>";
                script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (showData[i].accountNo) + "</td>";
                script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (showData[i].transactionDateTime) + "</td>";
                script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + addFormat(showData[i].totalPrice) + " 원</td>";
                if(showData[i].depositStatus) {
                    script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusDeposit" + showData[i].transactionCode + "\">";
                    script += "            <input type=\"button\" style=\"color: red\" id=\"deposit" + showData[i].transactionCode + "\" value=\"취소\" onclick=\"checkDeposit(\'" + showData[i].transactionCode + "\',\'" + showData[i].depositStatus + "\')\">";
                    script += "        </td>";
                } else {
                    script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusDeposit" + showData[i].transactionCode + "\">";
                    script += "            <input type=\"button\" style=\"color: blue\" id=\"deposit" + showData[i].transactionCode + "\" value=\"확인\" onclick=\"checkDeposit(\'" + showData[i].transactionCode + "\',\'" + showData[i].depositStatus + "\')\">";
                    script += "        </td>";
                }

                if(showData[i].remitStatus) {
                    script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusRemit" + showData[i].transactionCode + "\">";
                    script += "            <input type=\"button\" style=\"color: red\" value=\"취소\" onclick=\"checkRemit(\'" + showData[i].transactionCode + "\',\'" + showData[i].remitStatus + "\')\">";
                    script += "        </td>";
                } else {
                    script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusRemit" + showData[i].transactionCode + "\">";
                    script += "            <input type=\"button\" style=\"color: blue\" value=\"확인\" onclick=\"checkRemit(\'" + showData[i].transactionCode + "\',\'" + showData[i].remitStatus + "\')\">";
                    script += "        </td>";
                }
                script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\">";
                script += "            <input type=\"button\" value=\"거래 취소\" onclick=\"cancleTransaction(\'" + (showData[i].transactionCode) + "\')\">";
                script += "        </td>";
                script += "    </tr>";
            }
            $("#pagingHtml").html(navigatorHtml);
            $("#silageList").html(script);
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
                        depositScript += "            <input type=\"button\" style=\"color: red\" id=\"deposit" + afterTransaction.transactionCode + "\" value=\"취소\" onclick=\"checkDeposit(\'" + afterTransaction.transactionCode + "\',\'" + afterTransaction.depositStatus + "\')\">";
                        depositScript += "        </td>";
                    } else {
                        depositScript += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusDeposit" + afterTransaction.transactionCode + "\">";
                        depositScript += "            <input type=\"button\" style=\"color: blue\" id=\"deposit" + afterTransaction.transactionCode + "\" value=\"확인\" onclick=\"checkDeposit(\'" + afterTransaction.transactionCode + "\',\'" + afterTransaction.depositStatus + "\')\">";
                        depositScript += "        </td>";
                    }
                    inputJson.innerHTML = depositScript;
                }
            };

            xmlHttp.open('PUT', '${pageContext.request.contextPath}/bsa/transactions/deposit');
            xmlHttp.responseType = 'json';
            xmlHttp.setRequestHeader("Content-Type","application/json;charset=UTF-8");
            xmlHttp.send(parseTransaction);
        }

        function checkRemit(transCode, remit){
            var depositStatus = document.getElementById("deposit"+transCode).value;

            if(depositStatus == '확인') {
                window.alert("입금 확인을 먼저 해주세요!")
            }

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

            xmlHttp.open('PUT', '${pageContext.request.contextPath}/bsa/transactions/remit');
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
                    var showData = xmlHttp.response;

                    var script = "";
                    for (var i = 0; i < showData.length; i++) {
                        script += "    <tr>";
                        script += "        <td class=\"colum_box\" style=\"padding: 40 0 40 0\">" + (i+1) + "</td>";
                        script += "        <td class=\"title\"  style=\"padding: 40 0 40 0\">" + showData[i].silageCode + "</td>";
                        script += "        <td class=\"pro_price\" style=\"padding: 40 0 40 0\">" + showData[i].id + "</td>";
                        script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + showData[i].sellerId + "</td>";
                        script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (showData[i].bankName) + "</td>";
                        script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (showData[i].accountNo) + "</td>";
                        script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (showData[i].transactionDateTime) + "</td>";
                        script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + addFormat(showData[i].totalPrice) + " 원</td>";
                        if(showData[i].depositStatus) {
                            script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusDeposit" + showData[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: red\" id=\"deposit" + showData[i].transactionCode + "\" value=\"취소\" onclick=\"checkDeposit(\'" + showData[i].transactionCode + "\',\'" + showData[i].depositStatus + "\')\">";
                            script += "        </td>";
                        } else {
                            script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusDeposit" + showData[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: blue\" id=\"deposit" + showData[i].transactionCode + "\" value=\"확인\" onclick=\"checkDeposit(\'" + showData[i].transactionCode + "\',\'" + showData[i].depositStatus + "\')\">";
                            script += "        </td>";
                        }

                        if(showData[i].remitStatus) {
                            script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusRemit" + showData[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: red\" value=\"취소\" onclick=\"checkRemit(\'" + showData[i].transactionCode + "\',\'" + showData[i].remitStatus + "\')\">";
                            script += "        </td>";
                        } else {
                            script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\" id=\"statusRemit" + showData[i].transactionCode + "\">";
                            script += "            <input type=\"button\" style=\"color: blue\" value=\"확인\" onclick=\"checkRemit(\'" + showData[i].transactionCode + "\',\'" + showData[i].remitStatus + "\')\">";
                            script += "        </td>";
                        }
                        script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\">";
                        script += "            <input type=\"button\" value=\"거래 취소\" onclick=\"cancleTransaction(\'" + (showData[i].transactionCode) + "\')\">";
                        script += "        </td>";
                        script += "    </tr>";
                    }
                    inputJson.innerHTML = script;
                }
            }

            xmlHttp.open('DELETE', '${pageContext.request.contextPath}/bsa/transactions');
            xmlHttp.responseType='json';
            xmlHttp.setRequestHeader("Content-Type","application/json;charset=UTF-8");
            xmlHttp.send(parseTransaction);
        }

        function addFormat(amount) {
            return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
        }
    </script>
</div>

<jsp:include page="../util/bottom.jsp"/>
