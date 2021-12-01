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
    <title>회원 조회 화면</title>
</head>
<body>
<table>
    <tr>
        <td colspan="5"> <a href ="/bsa/silages">메인</a></td>
        <td colspan="5"><a href="bsa/silages/mine"><input type="text" value="등록 내역"></a></td>
        <td colspan="5"><a href="bsa/purchase"><input type="text" value="구매 내역"></a></td>
        <td><a href="bsa/auth"><input type="button" value="계정관리"></a></td>
        <td><a href="/logout"><input type="button" value="로그아웃"></a></td>
    </tr>
</table>
    <form action="/members" method="POST">
        <table>
            <tr>
                <td>ID: </td>
                <td>
                    ${member.id}
                </td>
            </tr>
            <tr>
                <td>PW: </td>
                <td>
                    ${member.password}
                </td>
            </tr>
            <tr>
                <td>이름: </td>
                <td>
                    ${member.name}
                </td>
            </tr>
            <tr>
                <td>전화번호: </td>
                <td>
                    ${member.phone}
                </td>
            </tr>
            <tr>
                <td>주소: </td>
                <td>
                    ${member.address}
                </td>
            </tr>
            <tr>
                <td>은행명: </td>
                <td>
                    ${account.bankName}
                </td>
            </tr>
            <tr>
                <td>계좌번호: </td>
                <td>
                    ${account.accountNo}
                </td>
            </tr>
            <tr>
                <td>
                    <input type=submit value="수정"/>
                </td>
                <td>
                    <a href="/bsa/silages"> <input type="button" value="취소"/> </a>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>