<?xml version="1.0" encoding="euc-kr" ?>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ȸ�� Ż��</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
</head>
<body>
<div id="memberWrap">
		<div class="innerDiv">
			<h1>Member secession</h1>
			<c:if test ="${ check == 1}" >
				<c:remove var="memId" scope ="session" />
				
			<form action="/logon/main.do" name="userinput" method="post">
				<p class="desc">ȸ�������� �����Ǿ����ϴ�.</p>
				<div class="btnArea2">
					<input type="submit" value="Ok" class="btn" />
				</div>
			</form>
			</c:if>	
		<c:if test="${check == 0 }">
			<script type="text/javascript">
				alert("��й�ȣ�� ���� �ʽ��ϴ�.");
				history.go(-1);
			</script>
		</c:if>
		</div>
	</div>
</body>
</html>