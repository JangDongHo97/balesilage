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
    <form action="/auth" method=post>
        <table>
            <tr>
                <td>PW : <input type="password" name="password"/> </td>
            </tr>
        </table>
        <table>
            <tr>
                <td><input type="submit" value="확인"></td>
                <td><a href="bsa/silages"><input type="button" value="취소"></a></td>
            </tr>
        </table>
    </form>
</body>
</html>
