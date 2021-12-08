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

    <section class="cart" style="padding:50 0 120">
        <div class="container" style="font-family: 'Nanum Gothic', sans-serif">
            <div class="row" style="padding:0 0 20 20">
                <h2 style="font-family: 'Nanum Gothic', sans-serif; color:black">구매 내역</h2>
                <hr>
                <br/>
            </div>
            <div class="row" >
                <div class="col-xl-12">
                    <div class="input_box">
                        <div class="row">
                            <div class="col-xl-9">
                                <table>
                                    <tr>
                                        <td style="padding:0 10 0 10; color:black">
                                            구매 기간
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
                            </div>
                            <div class="col-xl-3" data-wow-delay="0.1s" data-wow-duration="1200ms" style="visibility: visible; animation-duration: 1200ms; animation-delay: 0.1s; animation-name: fadeInUp; text-align: right">
                                <div class="sidebar-search-box">
                                    <form class="search-form" action="#">
                                        <input placeholder="ID 검색" type="text" id="searchMemberId">
                                        <button type="submit" onclick="searchMember()"><i class="icon-magnifying-glass" aria-hidden="true"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <table class="cart_table">
                        <thead class="cart_table_head">
                        <tr style="padding:20 0 20 0; text-align: center">
                            <th style="font-family: 'Nanum Gothic', sans-serif">번호</th>
                            <th style="font-family: 'Nanum Gothic', sans-serif">판매자</th>
                            <th style="font-family: 'Nanum Gothic', sans-serif">상품 번호</th>
                            <th style="font-family: 'Nanum Gothic', sans-serif">구매 일시</th>
                            <th style="font-family: 'Nanum Gothic', sans-serif">가격</th>
                            <th style="font-family: 'Nanum Gothic', sans-serif">비고</th>
                        </tr>
                        </thead>
                    </table>
                    <div id="silageList" style="position:relative; width:101.5%; height:120%; overflow-y:auto; overflow-x:auto;">
                        <table class="cart_table">
                            <tbody style="text-align: center">
                            <c:forEach items="${transactions}" var="transaction" varStatus="status">
                                <tr>
                                    <td class="colum_box" style="padding: 40 0 40 0">
                                            ${status.count}
                                    </td>
                                    <td class="title"  style="padding: 40 0 40 0">
                                            ${transaction.sellerId}
                                    </td>
                                    <td class="pro_qty" style="padding: 40 0 40 0">
                                            ${transaction.silageCode}
                                    </td>
                                    <td class="pro_price" style="padding: 40 0 40 0">
                                            ${transaction.transactionDateTime}
                                    </td>
                                    <td class="pro_sub_total" style="padding: 40 0 40 0">
                                            ${transaction.totalPrice}
                                    </td>
                                    <td class="pro_sub_total" style="padding: 40 0 40 0">
                                        <a href="/bsa/purchases/${transaction.transactionCode}"><input type="button" value="상세 조회"></a>
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

                    var script = "";
                    script += "<table class=\"cart_table\">";
                    script += "    <tbody style=\"text-align: center\">";

                    for (var i = 0; i < storage.length; i++) {
                        script += "    <tr>";
                        script += "        <td class=\"colum_box\" style=\"padding: 40 0 40 0\">" + (i+1) + "</td>";
                        script += "        <td class=\"title\" style=\"padding: 40 0 40 0\">" + storage[i].sellerId + "</td>";
                        script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + storage[i].silageCode + "</td>";
                        script += "        <td class=\"pro_price\" style=\"padding: 40 0 40 0\">" + storage[i].transactionDateTime + "</td>";
                        script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\">" + (storage[i].totalPrice) + "</td>";
                        script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\"><a href=\"/bsa/purchases/" + storage[i].transactionCode + "\"><input type=\"button\" value=\"상세 조회\"></a></td>";
                        script += "    </tr>";
                    }

                    script += "    </tbody>";
                    script += "</table>";

                    inputJson.innerHTML = script;

                }
            };
            xmlHttp.open('POST', 'http://localhost/bsa/purchases');
            xmlHttp.responseType = 'json';
            xmlHttp.setRequestHeader("Content-Type","application/json;charset=UTF-8");
            xmlHttp.send(parseDateScope);
        }

        function searchMember() {
            var recentMemberCode = ${memberCode};

            var searchMemberId = {
                id : document.getElementById("searchMemberId").value
            };

            var parseSearchMember = JSON.stringify(searchMemberId);

            var xmlHttp = new XMLHttpRequest();

            var inputJson = document.getElementById("silageList");

            xmlHttp.onreadystatechange = function() {
                if(this.readyState == 4 && this.status == 200) {
                    let storage = xmlHttp.response;

                    var script = "";
                    script += "<table class=\"cart_table\">";
                    script += "    <tbody style=\"text-align: center\">";

                    for (var i = 0; i < storage.length; i++) {
                        script += "    <tr>";
                        script += "        <td class=\"colum_box\" style=\"padding: 40 0 40 0\">" + (i+1) + "</td>";
                        script += "        <td class=\"title\" style=\"padding: 40 0 40 0\">" + storage[i].sellerId + "</td>";
                        script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + storage[i].silageCode + "</td>";
                        script += "        <td class=\"pro_price\" style=\"padding: 40 0 40 0\">" + storage[i].transactionDateTime + "</td>";
                        script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\">" + (storage[i].totalPrice) + "</td>";
                        script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\"><a href=\"/bsa/purchases/" + storage[i].transactionCode + "\"><input type=\"button\" value=\"상세 조회\"></a></td>";
                        script += "    </tr>";
                    }

                    script += "    </tbody>";
                    script += "</table>";

                    inputJson.innerHTML = script;
                }
            };
            xmlHttp.open('POST', 'http://localhost/bsa/purchases/member');
            xmlHttp.responseType = 'json';
            xmlHttp.setRequestHeader("Content-Type","application/json;charset=UTF-8");
            xmlHttp.send(parseSearchMember);
        }

    </script>
</div>

<jsp:include page="../util/bottom.jsp"/>




