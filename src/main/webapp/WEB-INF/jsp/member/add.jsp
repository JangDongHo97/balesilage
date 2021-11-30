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
        <table>
            <tr>
                <td> <a href ="/bsa/silages">메인</a></td>
                <td><input type="text" value="         등록 내역" onclick="needLogin()"></td>
                <td><input type="text" value="         구매 내역" onclick="needLogin()"></td>
                <td><a href="/login"><input type="button" value="로그인"></a></td>
                <td><a href="/members/form"><input type="button" value="회원가입"></a></td>
            </tr>
        </table>
        <form action="/members" method="POST">
            <table>
                <tr>
                    <td>ID: </td>
                    <td>
                        <input type="text" name="id" required/>
                    </td>
                    <td colspan="10"><div id="errorMsg"></div></td>
                </tr>
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
