<?xml version="1.0" encoding="euc-kr" ?>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>�Խ���</title>
<link href="./css/style.css" rel="stylesheet" type="text/css" />
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
				<input type="button" value ="�ۼ���" onclick="document.location.href='./updateForm.do?num=${article.num}&pageNum=${pageNum}'" /> <!-- updateForm.jsp�� �ش������� ���� -->
				<input type="button" value ="�ۻ���" onclick="document.location.href='./deleteForm.do?num=${article.num}&pageNum=${pageNum}'" /> <!-- deleteForm.jsp�� �ش������� ���� -->
				<input type="button" value ="��۾���" onclick="document.location.href='./writeForm.do?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}'" /> <!-- writeForm.jsp�� �ش������� ���� -->
				<input type="button" value ="�۸��" onclick="document.location.href='./list.do?pageNum=${pageNum}'" />
			</div>		
	</form>

<div class="commentWrap">
	<form method="post" action = "contentPro.do">
		<div class ="commentWrite">			
			<input type="hidden" name = "content_num" value ="${article.num }"/>
			<input type="hidden" name = "p_num" value ="${pageNum }"/>
			<input type="hidden" name = "comment_num" value ="${count+1 }"/>
			<p class = "writer">
				�ۼ���<input type="text" name = "commenter"/>
				��й�ȣ <input type="password" name = "passwd"/>
			</p>
			<div class = "commentCon">
				<textarea name="commentt"></textarea>
				<span><input type="submit" value = "Ȯ��"/></span>
			</div>
		</div>
	</form>
	
	<c:if test="${count >0 }">
	<div class ="commentList">	
		<p class = "count">�ڸ�Ʈ �� : ${count }</p>
		<ul>
			<c:forEach var = "comments" items = "${comments }">
			<li>
				<span class = "writer">${comments.commenter }</span>��
				<span class = "date">(${comments.reg_date })</span>
				<span class = "ip">����IP:${comments.ip }</span>
				<span class = "delBtn"><a href = "delCommentForm.do?ctn=${article.num }&cmn=${comments.comment_num}">X</a></span>
				<p>${comments.commentt}</p>
			</li>	
			</c:forEach>
			</ul>
		</div>
		</c:if>
	</div>
		<%--����¡!!! --%>
</div>
	<c:if test="${count >0 }">
		<c:if test ="${ startPage >5}">
			<a href = "content.do?num=${num }&pageNum=${pageNum}&cPageNum=${startPage -5}">[����]</a>
		</c:if>
		<c:forEach var = "i" begin = "${startPage}" end = "${endPage }" step="1">
			<a href="content.do?num=${num }&pageNum=${pageNum}&cPageNum=${i} ">[${i }]</a>
		</c:forEach>
		<c:if test ="${endPage < pageCount}">
			<a href = "content.do?num=${num }&pageNum=${pageNum}&cPageNum=${startPage +5}">[����]</a>
		</c:if>
	</c:if>
</body>
</html>