<%--
  Created by IntelliJ IDEA.
  User: aaajd
  Date: 2021-11-27
  Time: 오후 4:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>곤포 사일리지 상세조회화면</title>
</head>
<body>
    <jsp:include page="../util/top.jsp"/>
    <form action="/bsa/silages" method="post">
        <input type="hidden" name="_method" value="delete">
        <input type="hidden" name="silageCode" value="${silage.silageCode}">
        <h4>곤포 사일리지 정보</h4>
        <hr>
        <table border="1">
            <tr>
                <td>
                    상품 번호
                </td>
                <td>
                    ${silage.silageCode}
                </td>
            </tr>
            <tr>
                <td>
                    판매자 아이디
                </td>
                <td>
                    ${silage.id}
                </td>
            </tr>
            <tr>
                <td>
                    등록 일시
                </td>
                <td>
                    ${silage.enrollDateTime}
                </td>
            </tr>
            <tr>
                <td>
                    제조 일자
                </td>
                <td>
                    ${silage.productionDate}
                </td>
            </tr>
            <tr>
                <td>
                    무게
                </td>
                <td style="text-align: right">
                    ${silage.weight}
                </td>
            </tr>
            <tr>
                <td>
                    개수
                </td>
                <td style="text-align: right">
                    ${silage.count}
                </td>
            </tr>
            <tr>
                <td>
                    단가
                </td>
                <td style="text-align: right">
                    ${silage.unitPrice}
                </td>
            </tr>
            <tr>
                <td>
                    가격
                </td>
                <td style="text-align: right">
                    ${silage.count * silage.unitPrice}
                </td>
            </tr>
        </table>
        <c:if test="${not empty transaction}">
            <h4>곤포 사일리지 거래 정보</h4>
            <hr>
            <table border="1">
                <tr>
                    <td>거래 번호</td>
                    <td>${transaction.transactionCode}</td>
                </tr>
                <tr>
                    <td>구매자 아이디</td>
                    <td>${transaction.id}</td>
                </tr>
                <tr>
                    <td>거래 일시</td>
                    <td>${transaction.transactionDateTime}</td>
                </tr>
            </table>
        </c:if>

        <c:choose>
            <c:when test="${auth == 1}">
                <table>
                    <tr>
                        <td><a href="/bsa/silages"><input type="button" value="목록"></a></td>
                    </tr>
                </table>
            </c:when>
            <c:when test="${auth == silage.sellerCode}">
                <c:if test="${fn:contains(silage.transactionStatus,'Y')}">
                    <table>
                        <tr>
                            <td><a href="/bsa/silages/form/${silage.silageCode}"><input type="button" value="수정"></a></td>
                            <td><input type="submit" value="삭제"></td>
                            <td><a href="/bsa/silages"><input type="button" value="목록"></a></td>
                        </tr>
                    </table>
                </c:if>
                <c:if test="${fn:contains(silage.transactionStatus,'N')}">
                    <table>
                        <tr>
                            <td><a href="/bsa/silages/mine"><input type="button" value="목록"></a></td>
                        </tr>
                    </table>
                </c:if>
            </c:when>
            <c:otherwise>
                <table>
                    <tr>
                        <td><a href="/bsa/purchases/notice/${silage.silageCode}"><input type="button" value="구매"/></a></td>
                        <td><a href="/bsa/silages"><input type="button" value="목록"></a></td>
                    </tr>
                </table>
            </c:otherwise>
        </c:choose>
    </form>
</body>
</html>
