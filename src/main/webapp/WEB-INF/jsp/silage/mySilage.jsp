<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--

  Created by IntelliJ IDEA.
  User: aaajd
  Date: 2021-11-27
  Time: 오후 4:07
  To change this template use File | Settings | File Templates.
--%>
    <jsp:include page="../util/top.jsp"/>
    <div class="preloader" style="display: none;">
        <img src="/assets/images/loader.png" class="preloader__image" alt="">
    </div><!-- /.preloader -->

    <div class="page-wrapper">
        <div class="site-header__header-one-wrap">
            <header class="main-nav__header-one"></header>
        </div>

        <section class="page-header" style="background-image: url(/assets/images/backgrounds/page-header-contact.jpg);">
            <div class="container">

                <ul class="thm-breadcrumb list-unstyled">
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
        </section>

        <section class="cart" style="padding:50 0 120">
            <div class="container">
                <div class="row" >
                    <div class="col-xl-12">
                        <div class="input_box">
                            <div>
                                <table>
                                    <tr>
                                        <td style="padding:0 10 0 10; color:black">
                                            등록 기간
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
                                            <select name="transactionStatusSelect" id="status">
                                                <option value="">판매상태</option>
                                                <option value="Y">판매중</option>
                                                <option value="N">판매 완료</option>
                                            </select>
                                        </td>
                                    </tr>
                                </table>
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
                                <th style="font-family: 'Nanum Gothic', sans-serif">상품번호</th>
                                <th style="font-family: 'Nanum Gothic', sans-serif">등록일시</th>
                                <th style="font-family: 'Nanum Gothic', sans-serif">가격</th>
                                <th style="font-family: 'Nanum Gothic', sans-serif">판매상태</th>
                            </tr>
                            </thead>
                        </table>
                        <div id="silageList" style="position:relative; width:101.5%; height:550px; overflow-y:auto; overflow-x:auto;">
                            <table class="cart_table">
                                <tbody style="text-align: center">
                                    <c:forEach items="${silages}" var="silage" varStatus="status">
                                        <c:if test="${silage.sellerCode == memberCode}">
                                            <tr>
                                                <td class="colum_box" style="padding: 40 0 40 0">
                                                        ${status.count}
                                                </td>
                                                <td class="title" style="padding: 40 0 40 0">
                                                    <a href="/bsa/silages/${silage.silageCode}">${silage.silageCode}</a>
                                                </td>
                                                <td class="pro_price">
                                                        ${silage.enrollDateTime}
                                                </td>
                                                <td class="pro_qty" style="padding: 40 0 40 0">
                                                        ${silage.unitPrice * silage.count}
                                                </td>
                                                <c:if test="${fn:contains(silage.transactionStatus,'Y')}">
                                                    <td style="padding: 40 0 40 0">판매중</td>
                                                </c:if>
                                                <c:if test="${fn:contains(silage.transactionStatus,'N')}">
                                                    <td style="padding: 40 0 40 0">판매 완료</td>
                                                </c:if>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    <script type="text/javascript">
        var selectEvent = document.getElementById("status");
        selectEvent.addEventListener('change',searchStatus);

        var RecentMemberCode = ${memberCode};

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
                        if(storage[i].sellerCode == memberCode) {
                            script += "    <tr>";
                            script += "        <td class=\"colum_box\" style=\"padding: 40 0 40 0\">" + (i+1) + "</td>";
                            script += "        <td class=\"title\" style=\"padding: 40 0 40 0\"><a href=\"/bsa/silages/" + storage[i].silageCode + "\">" + storage[i].silageCode + "</a></td>";
                            script += "        <td class=\"pro_price\" style=\"padding: 40 0 40 0\">" + storage[i].enrollDateTime + "</td>";
                            script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (storage[i].count * storage[i].unitPrice) + "</td>";
                            if(storage[i].transactionStatus === 'Y'){
                                script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\">판매중</td>";
                            } else {
                                script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\">판매 완료</td>";
                            }
                            script += "    </tr>";
                        }
                    }
                    script += "    </tbody>";
                    script += "</table>";

                    inputJson.innerHTML = script;

                }
            };
            xmlHttp.open('POST', 'http://localhost/bsa/silages');
            xmlHttp.responseType = 'json';
            xmlHttp.setRequestHeader("Content-Type","application/json;charset=UTF-8");
            xmlHttp.send(parseDateScope);
        }


        function searchStatus(){
            var status = {
                transactionStatus : document.getElementById("status").value
            }

            var jsonStatus = JSON.stringify(status);

            var xmlHttp = new XMLHttpRequest();

            var inputJson = document.getElementById("silageList");

            xmlHttp.onreadystatechange = function() {
                if(this.readyState == 4 && this.status == 200) {
                    let storage = xmlHttp.response;

                    var script = "";
                    script += "<table class=\"cart_table\">";
                    script += "    <tbody style=\"text-align: center\">";

                    for (var i = 0; i < storage.length; i++) {
                        if(storage[i].sellerCode == RecentMemberCode) {
                            script += "    <tr>";
                            script += "        <td class=\"colum_box\" style=\"padding: 40 0 40 0\">" + (i+1) + "</td>";
                            script += "        <td class=\"title\" style=\"padding: 40 0 40 0\"><a href=\"/bsa/silages/" + storage[i].silageCode + "\">" + storage[i].silageCode + "</a></td>";
                            script += "        <td class=\"pro_price\" style=\"padding: 40 0 40 0\">" + storage[i].enrollDateTime + "</td>";
                            script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (storage[i].count * storage[i].unitPrice) + "</td>";
                            if(storage[i].transactionStatus === 'Y'){
                                script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\">판매중</td>";
                            } else {
                                script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\">판매 완료</td>";
                            }
                            script += "    </tr>";
                        }
                    }
                    script += "    </tbody>";
                    script += "</table>";

                    inputJson.innerHTML = script;

                }
            };
            xmlHttp.open('POST', 'http://localhost/bsa/silages/status');
            xmlHttp.responseType = 'json';
            xmlHttp.setRequestHeader("Content-Type","application/json;charset=UTF-8");
            xmlHttp.send(jsonStatus);
        }
    </script>

<jsp:include page="../util/bottom.jsp"/>
