<%--
  Created by IntelliJ IDEA.
  User: aaajd
  Date: 2021-11-27
  Time: 오후 4:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/silages" method="post">
        <table border="1">
            <tr>
                <td>제조일자</td>
                <td><input type="text" name="productionDate" placeholder="8자리로 입력해 주세요."> ex) 20211121</td>
            </tr>
            <tr>
                <td>무게</td>
                <td><input type="text" name="weight" placeholder="무게를 입력해주세요."></td>
            </tr>
            <tr>
                <td>개수</td>
                <td><input type="text" name="count" placeholder="개수를 입력해주세요."></td>
            </tr>
            <tr>
                <td>단가</td>
                <td><input type="text" name="unitPrice" placeholder="단가를 입력해주세요."></td>
            </tr>
        </table>
        <input type="submit" value="등록">
    </form>

</body>
</html>
