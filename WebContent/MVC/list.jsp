<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href = "./css/style.css" rel = "stylesheet" type="text/css"/>
<title>게시판</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<h1>
				글목록(전체 글: <span class="count">${count }</span>)
			</h1>
		</div>
		<!-- 전체 글 갯수  -->
		
		<div id="content">
			<c:if test="${count == 0 }">
			<p class="noData">작성된 글이 없습니다.</p>
			</c:if>
			<c:if test="${count>0 }">
			<table class="ListForm">
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="15%" />
					<col width="20%" />
					<col width="9%" />
					<col width="15%" />
				</colgroup>
				<tr>
					<th>번 호</th>
					<th>제 목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조 회</th>
					<th>IP</th>
				</tr>
			
				<c:forEach var = "article" items = "${articleList }" >
				
				<tr class="listCon">				
					<td>
						<c:out value = "${number }" />
						<c:set var="number" value = "${number -1 }" />
					</td>					
					<td class="subject">				
					<c:if test ="${ article.re_level > 0}">
					&nbsp;&nbsp;<span class = "reply">&nbsp;[re]</span>
					</c:if>
					<c:if test=""></c:if>
					<a href="./content.do?num=${article.num }&pageNum=${currentPage}">${article.subject }</a>				
					<c:if test="${article.readcount>=20 }">
						<span class = "icoHot">Hit</span>
					</c:if>
					</td>
					<td>
						<a href="mailto:${article.email }">${article.writer }</a>
					</td>
					<td>${article.reg_date }</td>
					<td>${article.readcount }</td>
					<td>${article.ip }</td>
				</tr>
				</c:forEach>
			</table>		
		</c:if>
		<c:if test="${count>0 }">
			<c:set var = "pageCount" value = "${count / pageSize + (count %pageSize ==0 ? 0 :1)}" />
			<c:set var = "pageBlock" value = "${10 }" />
			<fmt:parseNumber var ="result" value = "${currentPage /10}" integerOnly="true" />
			<c:set var = "startPage" value = "${result*10 +1}" />
			<c:set var = "endPage" value = "${startPage +pageBlock-1 }" />
			<c:if test="${endPage > pageCount }">
				<c:set var ="endPage" value = "${pageCount }" />
			</c:if>
		
		</c:if>
			<div class="paging">
			
				<c:if test="${startPage >10 }">
					<a href="./list.do?pageNum=${startPage-10 }">[이전]</a>
				</c:if>
				<ol>	
					<c:forEach var = "i" begin = "${startPage }" end="${endPage }">
					<li><a href ="./list.do?pageNum=${i }">[${i }]</a></li>
					</c:forEach>					
				</ol>
				<c:if test="${endPage < pageCount }">
					<a href="./list.do?pageNum=${startPage+10 }">[다음]</a>
				</c:if>				
			</div>
		</div>
		
		<div id="footer">
			<input type ="button" value="글쓰기"	onclick="javascript:window.location.href='./writeForm.do'" />	
		</div>
	</div>
</body>
</html>