<?xml version="1.0" encoding="euc-kr" ?>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ID �ߺ�Ȯ��</title>
<link href="./css/style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
</head>
<body>
<div id="idCheck">
	<h1>ID �ߺ�Ȯ��</h1>

	<c:if test ="${check==1}">

	<form name = "checkForm" method="post" action="/logon/confirmId.do">
		<p class="desc"><strong>${id }</strong>��(��) �̹� ������� ���̵��Դϴ�.<br /></p>
		<div>
			<input type="text" name="id" maxlength="12" class="inputText" />
			<input type="submit" value="Check" class="btn" />
		</div>
	</form>
	</c:if>
	<c:if test="${check == -1 }">
	<p class ="desc">�Է��Ͻ�<strong>{$id}</strong>��(��) ����� �� �ִ� ���̵��Դϴ�.</p>
		<div><input type="button" value = "Close" onclick="setid()" class ="btn" /></div>
	</c:if>
</div>
<script type="text/javascript">
	function setid(){
	opener.document.userinput.id.value="${id}";
	self.close();
}
</script>
</body>
</html>