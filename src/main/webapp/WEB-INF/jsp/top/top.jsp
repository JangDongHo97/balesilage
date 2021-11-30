<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2021-11-30
  Time: 오후 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<%
    Object auth = session.getAttribute("memberCode");
    if(auth == null) {%>
        <table>
            <tr>
                <td><a href="/bsa/silages"><input type="button" value="메인"></a></td>
                <td><a href="/bsa/searchMySilage"><input type="button" value="등록 내역"></a></td>
                <td><a href="/bsa/purchases"><input type="button" value="구매 내역"></a></td>

                <td><a href="/login"><input type="button" value="로그인"></a></td>
                <td><a href="/members/form"><input type="button" value="회원가입"></a></td>
            </tr>
        </table>

<%
    } else if(auth.equals(1)) {%>
        <table>
            <tr>
                <td><a href="/bsa/silages"><input type="button" value="메인"></a></td>
                <td><a href="/bsa/transactions"><input type="button" value="거래 내역"></a></td>

                <td><a href="/logout"><input type="button" value="로그아웃"></a></td>
            </tr>
        </table>
<%
    } else {%>
        <table>
            <tr>
                <td><a href="/bsa/silages"><input type="button" value="메인"></a></td>
                <td><a href="/bsa/searchMySilage"><input type="button" value="등록 내역"></a></td>
                <td><a href="/bsa/purchases"><input type="button" value="구매 내역"></a></td>

                <td><a href="/auth"><input type="button" value="계정 관리"></a></td>
                <td><a href="/logout"><input type="button" value="로그아웃"></a></td>
            </tr>
        </table>
<%
    }
%>
</body>
</html>
