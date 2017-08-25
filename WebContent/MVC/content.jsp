<?xml version="1.0" encoding="euc-kr" ?>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>게시판</title>
<link href="./MVC/style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
</head>
<body>
<div id="wrap">
		<div id="header"><h1>글보기</h1></div>
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
					<th>글번호</th>
					<td>${article.num}</td>
					<th>조회수</th>
					<td>${article.readcount}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${article.writer}</td>
					<th>작성일</th>
					<td>${article.reg_date}</td>
				</tr> 	
				<tr>
					<th>제목</th>
					<td colspan="3">${article.subject}</td>
				</tr>
				<tr>
					<th>내용</th>
						<td colspan="3"><textarea name="content">${article.content}</textarea></td>
				</tr>
				</table>
			</div>
			<div id = "footer">
				<input type="button" value ="글수정" onclick="document.location.href='/MVC/updateForm.do?num=${article.num}&pageNum=${pageNum}'" /> <!-- updateForm.jsp로 해당페이지 전달 -->
				<input type="button" value ="글삭제" onclick="document.location.href='deleteForm.jsp?num=${article.num}&pageNum=${pageNum}'" /> <!-- deleteForm.jsp로 해당페이지 전달 -->
				<input type="button" value ="답글쓰기" onclick="document.location.href='writeForm.jsp?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}'" /> <!-- writeForm.jsp로 해당페이지 전달 -->
				<input type="button" value ="글목록" onclick="document.location.href='list.jsp?pageNum=${pageNum}'" />
			</div>		
	</form>
</div>
</body>
</html>