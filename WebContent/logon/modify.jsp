<?xml version="1.0" encoding="euc-kr" ?>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>정보수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<link href="./css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table>
	<tr>
		<td>
			<form name = "myform" action ="./modifyForm.do" method="post">
				<input type="hidden" name ="id" value ="${sessionScope.memId }" />
				<input type = "submit" value = "회원정보 수정" />			
			</form>
		</td>
		<td>
			<form name ="myform" action ="./deleteForm.do" method="post">
				<input type="hidden" name ="id" value ="${sessionScope.memId }" />
				<input type = "submit" value ="회원 탈퇴" />
			</form>
		</td>
		<td>
			<form name = "myform" action = "./main.do" method="post">
				<input type ="submit" value ="메인으로" />
			</form>
		</td>
	</tr>
</table>
</body>
</html>