<%--
  Created by IntelliJ IDEA.
  User: aaajd
  Date: 2021-11-27
  Time: 오후 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>입금 안내 화면</title>
    <script type="text/javascript">
        function chk() {
            var form = document.noticeForm;
            if(!form.check.checked) {
                form.check.focus();
                alert("입금 안내를 확인해주세요");
                return false;
            }
            alert("거래 등록이 완료되었습니다")
            form.submit();
        }
    </script>
    <jsp:include page="../top/top.jsp"/>
</head>
<body>
    <form name="noticeForm" action="/bsa/transactions" method="post">
        <input type="hidden" name="silageCode" value="${transaction.silageCode}"/>
        <input type="hidden" name="sellerCode" value="${transaction.sellerCode}"/>
        <input type="hidden" name="buyerCode" value="${transaction.buyerCode}"/>
        <input type="hidden" name="bankName" value="${transaction.bankName}"/>
        <input type="hidden" name="accountNo" value="${transaction.accountNo}"/>
        <input type="hidden" name="totalPrice" value="${transaction.totalPrice}"/>
        <hr>※안내※<hr>
        <h5>입금하실 때 '받는 통장 메모/표시'에 상품번호를 입력해주세요</h5>
        <h5>'확인'을 누르시면 거래 등록이 완료됩니다</h5>
        <table>
            <tr>
                <td>상품번호</td>
                <td>${transaction.silageCode}</td>
            </tr>
            <tr>
                <td>가격</td>
                <td>${transaction.totalPrice}</td>
            </tr>
            <tr>
                <td>은행명</td>
                <td>국민</td>
            </tr>
            <tr>
                <td>계좌번호</td>
                <td>9416-02-00-050-173</td>
            </tr>
            <tr>
                <td colspan="10"><input type="checkbox" name="check" value="1"> 위 내용을 확인 했습니다(필수) </td>
            </tr>
            <tr>
                <td colspan="10"><input type="button" value="확인" onclick=chk()></td>
                <td ></td>
            </tr>
        </table>
    </form>
</body>
</html>
