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
    <title>회원 수정 화면</title>
</head>
<body>
    <jsp:include page="../top/top.jsp"/>
    <table>
        <tr>
            <td colspan="15">곤포 사일리지 판매를 희망하는 경우, 은행명과 계좌번호를 입력해주세요</td>
        </tr>
    </table>
    <form action="/bsa/members/${member.memberCode}" method="POST">
        <input type="hidden" name="_method" value="put">
        <input type="hidden" name="memberId" value="${member.id}"/>
        <table>
            <tr>
                <td>ID: </td>
                <td>${member.id}</td>
            </tr>
            <tr>
                <td>PW: </td>
                <td>
                    <input type="password" name="password" value="${member.password}" required/>
                </td>
            </tr>
            <tr>
                <td>이름: </td>
                <td>
                    <input type="text" name="name" value="${member.name}" required/>
                </td>
            </tr>
            <tr>
                <td>전화번호: </td>
                <td>
                    <input type="text" name="phone" value="${member.phone}" required/>
                </td>
            </tr>
            <tr>
                <td>주소: </td>
                <td>
                    <textarea rows="4" cols="40" name="address" required> ${member.address} </textarea>
                </td>
            </tr>
            <tr>
                <td>은행명: </td>
                <td>
                    <input type="text" name="bankName" value="${account.bankName}"/>
                </td>
            </tr>
            <tr>
                <td>계좌번호: </td>
                <td>
                    <input type="text" name="accountNo" value="${account.accountNo}"/>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <input type=submit value="저장"/>
                </td>
                <td>
                    <a href="/bsa/silages"> <input type="button" value="취소"/> </a>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>