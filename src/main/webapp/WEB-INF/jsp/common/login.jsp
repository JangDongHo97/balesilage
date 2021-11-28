<%--
  Created by IntelliJ IDEA.
  User: aaajd
  Date: 2021-11-27
  Time: 오후 4:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>로그인 화면</title>
    </head>
    <body>
        <table>
            <form action="/login" method="POST">
                <tr>
                    <td>ID : <input type="text" name="id"/> </td>
                </tr>
                <tr>
                    <td>PW : <input type="password" name="password"/> </td>
                </tr>
                <tr>
                    <td> <input type="submit" value="로그인"/> </td>
                </tr>
                <tr>
                    <td> <a href="/members/form"> <input type="button" value="회원가입"/> </a> </td>
                </tr>
            </form>
        </table>
    </body>
</html>
