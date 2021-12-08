<%--
  Created by IntelliJ IDEA.
  User: aaajd
  Date: 2021-11-27
  Time: 오후 4:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<section class="checkout">
    <form action="/bsa/silages" method="post" class="billing_details_form">
        <input type="hidden" name="_method" value="put">
        <input type="hidden" name="silageCode" value="${silage.silageCode}"/>
        <jsp:include page="../util/top.jsp"/>
        <div class="container">
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="billing_title">
                        <h2 style="font-family: 'Nanum Gothic', sans-serif">곤포 사일리지 수정</h2>
                        <hr>
                    </div>
                    <div class="row">
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">제조일자*</h3>
                            <div class="billing_input_box">
                                <input type="date" name="productionDate" value="${silage.productionDate}" required>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">무게*</h3>
                            <div class="billing_input_box">
                                <input type="text" name="weight" value="${silage.weight}" style="text-align: right"
                                       required>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">개수*</h3>
                            <div class="billing_input_box">
                                <input type="text" name="count" id="count" value="${silage.count}"
                                       style="text-align: right" onkeyup="total();" required>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">단가*</h3>
                            <div class="billing_input_box">
                                <input type="text" name="unitPrice" id="unitPrice" value="${silage.unitPrice}"
                                       style="text-align: right" onkeyup="total();" required>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <h3 style="font-family: 'Nanum Gothic', sans-serif">가격</h3>
                            <div class="billing_input_box">
                                <td><input type="text" id="totalPrice" style="text-align: right" readonly></td>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="your_order">
                <div class="row">
                    <div class="col-xl-6 col-lg-6">
                        <div class="row" style="width: 210%">
                            <div class="col-sm-3">

                            </div>
                            <div class="col-sm-3">

                            </div>
                            <div class="col-sm-3">
                                <div class="place_order_btn" style="margin:10px">
                                    <input class="thm-btn" type="submit" value="수정">
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="place_order_btn" style="margin:10px; float:left">
                                    <input class="thm-btn" type="submit" value="삭제">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </form>
</section>

<script type="text/javascript">
    function total() {
        if (document.getElementById("count").value && document.getElementById("unitPrice").value) {
            document.getElementById("totalPrice").value
                = parseInt(document.getElementById("count").value)
                * parseInt(document.getElementById("unitPrice").value);
        }
    }
</script>

<jsp:include page="../util/bottom.jsp"/>
