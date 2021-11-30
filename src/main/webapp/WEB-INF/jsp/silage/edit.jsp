<%--
  Created by IntelliJ IDEA.
  User: aaajd
  Date: 2021-11-27
  Time: 오후 4:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/silages" method="post">
        <input type="hidden" name="_method" value="put">
        <input type="hidden" name="silageCode" value="${silage.silageCode}"/>
        <jsp:include page="../top/top.jsp"/>
        <table border="1">
            <tr>
                <td>제조일자</td>
                <td><input type="text" name="productionDate" value="${silage.productionDate}" required> ex) 20211121</td>
            </tr>
            <tr>
                <td>무게</td>
                <td><input type="text" name="weight" value="${silage.weight}" required> kg</td>
            </tr>
            <tr>
                <td>개수</td>
                <td><input type="text" name="count" id="count" value="${silage.count}" onkeyup="total();" required> 개</td>
            </tr>
            <tr>
                <td>단가</td>
                <td><input type="text" name="unitPrice" id="unitPrice" value="${silage.unitPrice}" onkeyup="total();" required> 원</td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input type="text" id="totalPrice" readonly> 원</td>
            </tr>
        </table>
        <table>
            <tr>
                <td><input type="submit" value="수정"></td>
                <td><a href="/bsa/silages"><input type="button" value="취소"></a></td>
            </tr>
        </table>
    </form>

    <script type="text/javascript">
        function total() {
            if(document.getElementById("count").value && document.getElementById("unitPrice").value) {
                document.getElementById("totalPrice").value
                    = parseInt(document.getElementById("count").value)
                    * parseInt(document.getElementById("unitPrice").value);
            }
        }
    </script>
</body>
</html>
