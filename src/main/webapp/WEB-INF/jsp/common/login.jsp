<%--
  Created by IntelliJ IDEA.
  User: aaajd
  Date: 2021-11-27
  Time: 오후 4:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <title>로그인 화면</title>
        <script language="javascript">
            function needLogin()
            {
                alert("로그인 해주세요");
            }
        </script>
    </head>
    <body>
        <table>
            <tr>
                <td> <a href ="/bsa/silages">메인</a></td>
                <td><input type="text" value="         등록 내역" onclick="needLogin()"></td>
                <td><input type="text" value="         구매 내역" onclick="needLogin()"></td>
            </tr>
        </table>
        <table>
            <form action="/login" method="POST">
                <tr>
                    <td>ID : <input type="text" name="id"/> </td>
                </tr>
                <tr>
                    <td>PW : <input type="password" name="password"/> </td>
                </tr>
                <tr><td><div id="errorMsg"></div></td></tr>
                <tr>
                    <td> <input type="submit" value="로그인"/> </td>
                </tr>
                <tr>
                    <td> <a href="/members/form"> <input type="button" value="회원가입"/> </a> </td>
                </tr>
            </form>
        </table>
    <script>
        var error = document.getElementById("errorMsg").innerHTML="<font color=red>${sessionScope.loginErrorMsg}</font>";
    </script>
    </body>
</html>