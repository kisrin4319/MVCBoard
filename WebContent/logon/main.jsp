<?xml version="1.0" encoding="euc-kr" ?>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<link href="./css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<c:if test="${empty sessionScope.memId }">
<div id="LoginWrap">
       <h1>Member Login</h1>
       <form name="inform" method="post" action="./loginPro.do" onSubmit="return checkIt();">
          <fieldset>
             <legend>로그인</legend>
             <dl>
             <dt>Id</dt>
                <dd>
                   <input type="text" name="id" maxlength="10" />
                </dd>
                <dt>Password</dt>
                <dd>
                   <input type="password" name="passwd" maxlength="10" />
                </dd>
             </dl>
             <div class="btnArea">
                <input type ="submit" name  = "Submit" value="Ok" />
                <input type ="button" value = "Join" onclick="javascript:window.location='./inputForm.do'" />
                <input type ="button" value = "Find id" onclick="javascript:window.location='./findIdForm.do'" />
                <input type ="button" value = "Find pw" onclick="javascript:window.location='./findPwForm.do'" />
             </div>
          </fieldset>
       </form>
    </div>
</c:if>
<c:if test="${!empty sessionScope.memId }">
    <!-- after login -->
    <div id="LoginWrap">
       <h1>Hello World!</h1>
       <div class="afterLogin">
          <p>
             <strong>${ sessionScopte.memId}</strong>님 환영합니다.
          </p>
       <form action="./logout.do" method="post">
             <div class="btnArea">
                <input type ="submit" name = "Submit" value="Logout" />
                <input type ="button" value = "Modify" onclick="javascript:window.location='./modifyForm.do'" />
             </div>
          </form>
    </div>
 </c:if>
</body>
</html>