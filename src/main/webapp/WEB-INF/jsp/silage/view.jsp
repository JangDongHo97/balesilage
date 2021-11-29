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
    <title>Title</title>
</head>
<body>

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
</body>
</html>
