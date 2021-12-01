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
        <title>회원가입</title>
        <script language="javascript">
            function needLogin()
            {
                alert("로그인 해주세요");
            }
        </script>
    </head>
    <body>
    <jsp:include page="../top/top.jsp"/>
        <table>
            <h4>회원가입</h4>
            <hr>
            <tr>
                <td>곤포 사일리지 판매를 희망하는 경우, 은행명과 계좌번호를 입력해주세요</td>
            </tr>
        </table>
        <form action="/members" method="POST">
            <table>
                <h4>회원 정보 입력</h4>
                <hr>
                    <td>ID: </td>
                    <td>
                        <input type="text" name="id" required/>
                    </td>
                    <td colspan="10"><div id="errorMsg"></div></td>
                </hr>
                <tr>
                    <td>PW: </td>
                    <td>
                        <input type="password" name="password" required/>
                    </td>
                </tr>
                <tr>
                    <td>이름: </td>
                    <td>
                        <input type="text" name="name" required/>
                    </td>
                </tr>
                <tr>
                    <td>전화번호: </td>
                    <td>
                        <input type="text" name="phone" required/>
                    </td>
                </tr>
                <tr>
                    <td>주소: </td>
                    <td>
                        <textarea rows="4" cols="40" name="address" required></textarea>
                    </td>
                </tr>
                <tr>
                    <td>은행명: </td>
                    <td>
                        <input type="text" name="bankName"/>
                    </td>
                </tr>
                <tr>
                    <td>계좌번호: </td>
                    <td>
                        <input type="text" name="accountNo"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type=submit value="회원가입"/>
                    </td>
                    <td>
                        <a href="/bsa/silages"> <input type="button" value="취소"/> </a>
                    </td>
                </tr>
            </table>
        </form>
        <script>
            var error = document.getElementById("errorMsg").innerHTML="<font color=red>${sessionScope.enrollErrorMsg}</font>";
        </script>
    </body>
</html>
