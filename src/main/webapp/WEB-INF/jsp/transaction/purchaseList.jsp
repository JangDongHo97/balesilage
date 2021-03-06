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
                                            <input type="button" value="검색" onclick="search()">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-xl-3" data-wow-delay="0.1s" data-wow-duration="1200ms" style="visibility: visible; animation-duration: 1200ms; animation-delay: 0.1s; animation-name: fadeInUp; text-align: right">
                                <div class="sidebar-search-box">
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
                url: "${pageContext.request.contextPath}/bsa/purchases/list",
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
                script += "        <td class=\"title\" style=\"padding: 40 0 40 0\">" + showData[i].sellerId + "</td>";
                script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + showData[i].silageCode + "</td>";
                script += "        <td class=\"pro_price\" style=\"padding: 40 0 40 0\">" + showData[i].transactionDateTime + "</td>";
                script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\">" + addFormat(showData[i].totalPrice) + " 원</td>";
                script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\"><a href=\"/bsa/purchases/" + showData[i].transactionCode + "\"><input type=\"button\" value=\"상세 조회\"></a></td>";
                script += "    </tr>";
            }

            $("#pagingHtml").html(navigatorHtml);
            $("#silageList").html(script);
        }

        function addFormat(amount) {
            return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
        }
    </script>

<jsp:include page="../util/bottom.jsp"/>




