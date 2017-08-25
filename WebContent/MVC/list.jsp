<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>�Խ���</title>
<link href="./style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="wrap">
		<div id="header">
			<h1>
				�۸��(��ü ��: <span class="count">${count }</span>)
			</h1>
		</div>
		<!-- ��ü �� ����  -->
		
		<div id="content">
			<c:if test="${count == 0 }">
			<p class="noData">�ۼ��� ���� �����ϴ�.</p>
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
					<th>�� ȣ</th>
					<th>�� ��</th>
					<th>�ۼ���</th>
					<th>�ۼ���</th>
					<th>�� ȸ</th>
					<th>IP</th>
				</tr>

				<tr class="listCon">
				<c:forEach var = "article" items = "${articleList }" >
					<td><c:out value = "${number }" />
						<c:set var="number" value = "${number -1 }" />
						</td>
					<td class="subject">
				
					<c:if test ="${ article.re_level > 0}">
					<img src="images/level.gif" width="${5*article.re_level }" height="16">
						<img src = "images/re.gif">
					</c:if>
					<c:if test="${article.re_level ==0 }">
						<img src="images/level.gif" width="${5*article.re_level }" height="16">
					</c:if>
					
					<a href="/MVC/content.do?num=${article.num }&pageNum=${currentPage}">
						${article.subject }</a>
					<c:if test="${article.readcount>=20 }">
						<img src="images/hot.gif" border ="0" height="16">
					</c:if>
				</td>
					<td align="center" width = "100">
						<a href="mailto:${article.email }">${article.writer }</a>
					</td>
					<td align="center" width="150">${article.readcount }</td>
					<td align="center" width ="100">${article.ip }</td>
				</c:forEach>
				</tr>
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
					<a href="/MVC/list.do?pageNum=${startPage-10 }">[����]</a>
				</c:if>
				<ol>	
					<c:forEach var = "i" begin = "${startPage }" end="${endPage }">
					<li><a href ="/MVC/list.do?pageNum=${i }">[${i }]</a></li>
					</c:forEach>					
				</ol>
				<c:if test="${endPage < pageCount }">
					<a href="/MVC/list.do?pageNum=${startPage+10 }">[����]</a>
				</c:if>				
			</div>
		</div>
		
		<div id="footer">
			<input type ="button" value="�۾���"	onclick="javascript:window.location.href='/MVC/writeForm.do'" />	
		</div>
	</div>
</body>
</html>