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
<html>
<head>
    <title>곤포 사일리지 상세조회화면</title>
</head>
<body>
    <jsp:include page="../top/top.jsp"/>
    <form action="/bsa/silages" method="post">
        <input type="hidden" name="_method" value="delete">
        <input type="hidden" name="silageCode" value="${silage.silageCode}">
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
                <td>
                    ${silage.weight}
                </td>
            </tr>
            <tr>
                <td>
                    개수
                </td>
                <td>
                    ${silage.count}
                </td>
            </tr>
            <tr>
                <td>
                    단가
                </td>
                <td>
                    ${silage.unitPrice}
                </td>
            </tr>
            <tr>
                <td>
                    가격
                </td>
                <td>
                    ${silage.count * silage.unitPrice}
                </td>
            </tr>
        </table>
        <c:choose>
            <c:when test="${auth == 1}">
                <table>
                    <tr>
                        <td><a href="/bsa/silages"><input type="button" value="목록"></a></td>
                    </tr>
                </table>
            </c:when>
            <c:when test="${auth == silage.sellerCode}">
                <table>
                    <tr>
                        <td><button type="submit" formaction="/bsa/silages/${silage.silageCode}/form" formmethod="get">수정</button></td>
                        <td><input type="submit" value="삭제"></td>
                        <td><a href="/bsa/silages"><input type="button" value="목록"></a></td>
                    </tr>
                </table>
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
