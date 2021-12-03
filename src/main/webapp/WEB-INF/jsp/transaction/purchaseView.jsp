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
<html>
<head>
    <title>구매 내역 상세 화면</title>
    <jsp:include page="../top/top.jsp"/>
</head>
<body>
    <h4>구매 내역</h4>
    <hr>
    <h6>구매 내역 상세 정보</h6>
    <form action="/bsa/transactions" method="post">
        <input type="hidden" name="_method" value="delete">
        <input type="hidden" name="transactionCode" value="${transaction.transactionCode}">
        <table>
            <tr>
                <td>구매 일시</td>
                <td>${transaction.transactionDateTime}</td>
            </tr>
            <tr>
                <td>판매자 ID</td>
                <td>${member.id}</td>
            </tr>
            <tr>
                <td>판매자 연락처</td>
                <td>${member.phone}</td>
            </tr>
            <tr>
                <td>판매자 주소</td>
                <td>${member.address}</td>
            </tr>
            <tr>
                <td>상품 번호</td>
                <td>${silage.silageCode}</td>
            </tr>
            <tr>
                <td>제조일자</td>
                <td>${silage.productionDate}</td>
            </tr>
            <tr>
                <td>무게</td>
                <td>${silage.weight}</td>
            </tr>
            <tr>
                <td>개수</td>
                <td>${silage.count}</td>
            </tr>
            <tr>
                <td>단가</td>
                <td>${silage.unitPrice}</td>
            </tr>
            <tr>
                <td>가격</td>
                <td>${transaction.totalPrice}</td>
            </tr>
        </table>

        <h4> 입금 계좌 (※ 입금하실 때 보내는 사람을 상품 번호로 바꿔주세요! </h4>
        <hr>

        <table>
            <tr>
                <td>은행명</td>
                <td>국민</td>
            </tr>
            <tr>
                <td>계좌번호</td>
                <td>9416004938034</td>
            </tr>
        </table>

        <c:if test="${transaction.remitStatus == false}">
            <input type="submit" value="구매 취소">
        </c:if>
        <a href="/bsa/purchases"><input type="button" value="목록"/></a>
    </form>

</body>
</html>
