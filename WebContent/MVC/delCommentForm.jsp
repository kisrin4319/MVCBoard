<?xml version="1.0" encoding="euc-kr" ?>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>��ۻ���</title>
<link href = "./css/style.css" rel = "stylesheet" type ="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
</head>
<body>
	<div id = "wrap">
		<div id = "header"><h1>��ۻ���</h1></div>
		<form name ="delForm" action="delCommentPro.do" onsubmit="return deleteSave()">
			<input type="hidden" name = "content_num" value ="${content_num }" />
			<input type="hidden" name = "comment_num" value ="${comment_num }" />
			<div id = "content">
				<div class = "delForm">
				<p>��й�ȣ�� �Է��� �ּ���.</p>
				<dl>
					<dt>��й�ȣ</dt>
					<dd><input type ="password" name = "passwd" /></dd>
				</dl>
				</div>
			</div>
			<div id = "footer" class = "deleteBtn">
				<input type="submit" value = "����" />
				<input type="button" value = "���" onclick="javascript:window.location='${url}'" />
			</div>
		</form>
	</div>
</body>
</html>