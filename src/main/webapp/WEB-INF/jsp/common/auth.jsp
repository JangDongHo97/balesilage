<%--
  Created by IntelliJ IDEA.
  User: aaajd
  Date: 2021-11-27
  Time: 오후 4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>계정 관리 권한 확인</title>
</head>
<body>
    <p>계정 관리의 권한을 확인하기 위해 자신의 비밀번호를 입력해주세요</p>
    <table>
        <tr>
            <td>PW : <input type="password" name="password"/> </td>
        </tr>
        <tr>
            <td><a href="bsa/auth"><input type="button" value="확인"></a></td>
            <td><a href="bsa/auth"><input type="button" value="취소"></a></td>
        </tr>
    </table>
</body>
</html>
