<?xml version="1.0" encoding="euc-kr" ?>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>로그인</title>
<link href="./css/style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
</head>
<body>
<script type="text/javascript">
function begin() {
		document.myform.id.focus();
	}
	function checkIt() {
		if(!document.myform.id.value){
			alert("아이디를 입력하세요!");
			document.myform.id.focus();
			return false;
		}
		if(!document.myform.passwd.value){
			alert("비밀번호를 입력하세요!");
			document.myform.passwd.focus();
			return false;
		}
	}	
</script>
<div id="loginWrap">
	<h1>Member Login</h1>
	<form action="/logon/loginPro.do" method="post" name="myform" onsubmit="return checkIt();">
		<fieldset>
			<legend>로그인</legend>
			<dl>
				<dt>Id</dt>
				<dd><input type="text" name="id" maxlength="10" /></dd>
				<dt>Password</dt>
				<dd><input type="password" name="passwd" maxlength="10" /></dd>
			</dl>
			<div class="btnArea">
				<input type="submit" name="Submit" value="Ok" />
				<input type="reset" value="Reset" />
				<input type="button" value="Join" onclick="javascript:window.location='/logon/inputForm.do'" />
			</div>
		</fieldset>
	</form>
</div>
</body>
</html>