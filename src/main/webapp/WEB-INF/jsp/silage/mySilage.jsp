<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <div class="row" style="padding:0 0 20 20">
                    <h2 style="font-family: 'Nanum Gothic', sans-serif; color:black">등록 내역</h2>
                    <hr>
                    <br>
                </div>
                <div class="row" >
                    <div class="col-xl-12">
                        <div class="input_box">
                            <div class="row">
                                <div class="col-xl-6">
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
                                                <input type="button" value="검색" onclick="search()">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-xl-6">
                                    <div class="showing-result-shorting">
                                        <div class="shorting" style="position: absolute; right: 4%; width: 15%; margin: 1%; margin-right: 40%;">
                                            <div class="dropdown bootstrap-select">
                                                <select class="selectpicker" name="transactionStatusSelect" id="status" data-width="100%" tabindex="-98">
                                                    <option value="" selected="selected">판매상태</option>
                                                    <option value="Y">판매중</option>
                                                    <option value="N">판매완료</option>
                                                </select>
                                            </div>
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
                                    <th style="font-family: 'Nanum Gothic', sans-serif">상품번호</th>
                                    <th style="font-family: 'Nanum Gothic', sans-serif">등록일시</th>
                                    <th style="font-family: 'Nanum Gothic', sans-serif">가격</th>
                                    <th style="font-family: 'Nanum Gothic', sans-serif">판매상태</th>
                                </tr>
                            </thead>
                            <tbody id="silageList"  style="text-align: center"></tbody>
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
            var selectEvent = document.getElementById("status");
            selectEvent.addEventListener('change', initPage);
            selectEvent.addEventListener('change', search);

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
                    transactionStatus: document.getElementById("status").value
                    ,startDate : document.getElementById("startDate").value
                    , endDate : document.getElementById("endDate").value
                };

                console.log(searchKeyword);

                $.ajax({
                    url: "${pageContext.request.contextPath}/bsa/silages/mine",
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
                    script += "        <td class=\"title\" style=\"padding: 40 0 40 0\"><a href=\"/bsa/silages/" + showData[i].silageCode + "\">" + showData[i].silageCode + "</a></td>";
                    script += "        <td class=\"pro_price\" style=\"padding: 40 0 40 0\">" + showData[i].enrollDateTime + "</td>";
                    script += "        <td class=\"pro_qty\" style=\"padding: 40 0 40 0\">" + (showData[i].count * showData[i].unitPrice) + "</td>";
                    if(showData[i].transactionStatus === 'Y'){
                        script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\">판매중</td>";
                    } else {
                        script += "        <td class=\"pro_sub_total\" style=\"padding: 40 0 40 0\">판매 완료</td>";
                    }
                    script += "    </tr>";
                }

                $("#pagingHtml").html(navigatorHtml);
                $("#silageList").html(script);
            }
        </script>

<jsp:include page="../util/bottom.jsp"/>
