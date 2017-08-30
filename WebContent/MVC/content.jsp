<?xml version="1.0" encoding="euc-kr" ?>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>게시판</title>
<link href="./css/style.css" rel="stylesheet" type="text/css" />
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
				<input type="button" value ="글수정" onclick="document.location.href='./updateForm.do?num=${article.num}&pageNum=${pageNum}'" /> <!-- updateForm.jsp로 해당페이지 전달 -->
				<input type="button" value ="글삭제" onclick="document.location.href='./deleteForm.do?num=${article.num}&pageNum=${pageNum}'" /> <!-- deleteForm.jsp로 해당페이지 전달 -->
				<input type="button" value ="답글쓰기" onclick="document.location.href='./writeForm.do?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}'" /> <!-- writeForm.jsp로 해당페이지 전달 -->
				<input type="button" value ="글목록" onclick="document.location.href='./list.do?pageNum=${pageNum}'" />
			</div>		
	</form>

<div class="commentWrap">
	<form method="post" action = "contentPro.do">
		<div class ="commentWrite">			
			<input type="hidden" name = "content_num" value ="${article.num }"/>
			<input type="hidden" name = "p_num" value ="${pageNum }"/>
			<input type="hidden" name = "comment_num" value ="${count+1 }"/>
			<p class = "writer">
				작성자<input type="text" name = "commenter"/>
				비밀번호 <input type="password" name = "passwd"/>
			</p>
			<div class = "commentCon">
				<textarea name="commentt"></textarea>
				<span><input type="submit" value = "확인"/></span>
			</div>
		</div>
	</form>
	
	<c:if test="${count >0 }">
	<div class ="commentList">	
		<p class = "count">코멘트 수 : ${count }</p>
		<ul>
			<c:forEach var = "comments" items = "${comments }">
			<li>
				<span class = "writer">${comments.commenter }</span>님
				<span class = "date">(${comments.reg_date })</span>
				<span class = "ip">접속IP:${comments.ip }</span>
				<span class = "delBtn"><a href = "delCommentForm.do?ctn=${article.num }&cmn=${comments.comment_num}">X</a></span>
				<p>${comments.commentt}</p>
			</li>	
			</c:forEach>
			</ul>
		</div>
		</c:if>
	</div>
		<%--페이징!!! --%>
</div>
	<c:if test="${count >0 }">
		<c:if test ="${ startPage >5}">
			<a href = "content.do?num=${num }&pageNum=${pageNum}&cPageNum=${startPage -5}">[이전]</a>
		</c:if>
		<c:forEach var = "i" begin = "${startPage}" end = "${endPage }" step="1">
			<a href="content.do?num=${num }&pageNum=${pageNum}&cPageNum=${i} ">[${i }]</a>
		</c:forEach>
		<c:if test ="${endPage < pageCount}">
			<a href = "content.do?num=${num }&pageNum=${pageNum}&cPageNum=${startPage +5}">[다음]</a>
		</c:if>
	</c:if>
</body>
</html>