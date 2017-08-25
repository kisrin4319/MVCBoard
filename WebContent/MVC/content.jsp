<?xml version="1.0" encoding="euc-kr" ?>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>�Խ���</title>
<link href="./MVC/style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
</head>
<body>
<div id="wrap">
		<div id="header"><h1>�ۺ���</h1></div>
		<form>
			<div id= "content">
			<table>
				<colgroup>
					<col width="20%" />
					<col width="*" />
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tr>
					<th>�۹�ȣ</th>
					<td>${article.num}</td>
					<th>��ȸ��</th>
					<td>${article.readcount}</td>
				</tr>
				<tr>
					<th>�ۼ���</th>
					<td>${article.writer}</td>
					<th>�ۼ���</th>
					<td>${article.reg_date}</td>
				</tr> 	
				<tr>
					<th>����</th>
					<td colspan="3">${article.subject}</td>
				</tr>
				<tr>
					<th>����</th>
						<td colspan="3"><textarea name="content">${article.content}</textarea></td>
				</tr>
				</table>
			</div>
			<div id = "footer">
				<input type="button" value ="�ۼ���" onclick="document.location.href='/MVC/updateForm.do?num=${article.num}&pageNum=${pageNum}'" /> <!-- updateForm.jsp�� �ش������� ���� -->
				<input type="button" value ="�ۻ���" onclick="document.location.href='deleteForm.jsp?num=${article.num}&pageNum=${pageNum}'" /> <!-- deleteForm.jsp�� �ش������� ���� -->
				<input type="button" value ="��۾���" onclick="document.location.href='writeForm.jsp?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}'" /> <!-- writeForm.jsp�� �ش������� ���� -->
				<input type="button" value ="�۸��" onclick="document.location.href='list.jsp?pageNum=${pageNum}'" />
			</div>		
	</form>
</div>
</body>
</html>