<?xml version="1.0" encoding="euc-kr" ?>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ȸ��Ż��</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<link href="./css/style.css" rel = "stylesheet" type="text/css" />
</head>
<script type="text/javascript">
	function begin() {
		document.myform.passwd.focus();
	}
	function checkIt() {
		if(!document.myform.passwd.value){
			alert("��й�ȣ�� �Է����� �����̽��ϴ�.");
			document.myform.passwd.focus();
			return false;
		}
	}
</script>
<body onload="begin()">
<div id="loginWrap">
	<h1>Member secession</h1>
	<form name="myform" action="/logon/deletePro.do" method="post" onsubmit="return checkIt()">
		<fieldset>
			<legend>ȸ��Ż��</legend>
			<dl>
				<dt>Id</dt>
				<dd><span class="spot">${member.id }</span></dd>
				<dt>Password</dt>
				<dd><input type="password" name="passwd" maxlength="10" /></dd>
			</dl>
			<div class="btnArea">
				<input type="submit" name="Submit" value="Ok" />
				<input type="button" value="Cancel" onclick="javascript:window.location='/logon/main.do'" />
			</div>
		</fieldset>
	</form>
</div>
</body>
</html>