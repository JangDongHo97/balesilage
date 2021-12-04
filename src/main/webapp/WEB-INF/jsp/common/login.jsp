<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<jsp:include page="/WEB-INF/jsp/util/top.jsp"/>
<div class="preloader" style="display: none;">
    <img src="assets/images/loader.png" class="preloader__image" alt="">
</div><!-- /.preloader -->
<div class="page-wrapper">
    <section class="page-header" style="background-image: url(/assets/images/backgrounds/page-header-contact.jpg);">
        <div class="container">
            <ul class="thm-breadcrumb list-unstyled" style="padding-top: 45%">
                <li></li>
                <li></li>
            </ul>
        </div>
    </section>

    <section class="contact-one">
        <div class="container">
            <div class="row">
                <div class="col-xl-7">
                    <div class="contact-one__form__wrap">
                        <div class="block-title text-left">
                            <h3>Login</h3>
                            <div class="leaf">
                                <img src="/assets/images/resources/leaf.png" alt="">
                            </div>
                            <div id="errorMsg" style="height: auto; width: 200px; color: red">
                                <c:if test="${sessionScope.loginErrorMsg != null}">
                                    ${sessionScope.loginErrorMsg}
                                </c:if>
                            </div>
                        </div>
                        <form name="loginForm" action="/bsa/login" method="POST" class="contact-one__form">
                            <div class="row low-gutters">
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input type="text" name="id" id="memberId" placeholder="아이디">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input type="password" name="password" id="memberPw" placeholder="비밀번호">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="input-group contact__btn">
                                        <button type="button" class="thm-btn contact-one__btn" onclick=check()>로그인</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div><!-- /.page-wrapper -->

<script type="text/javascript">
    function check() {
        var id = document.getElementById("memberId").value;
        var pw = document.getElementById("memberPw").value;

        if(!id || !pw) {
            document.getElementById("errorMsg").innerHTML = "<font color='red'>로그인 정보를 입력해주세요. </font>";
        } else {
            loginForm.submit();
        }
    }

</script>

<jsp:include page="/WEB-INF/jsp/util/bottom.jsp"/>