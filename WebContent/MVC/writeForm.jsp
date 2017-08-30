<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판</title>
<link href="./style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="MVC/script.js"></script>
</head>
<body>
	<div id="wrap">
		<div id ="header"><h1>글작성</h1></div>
		<form method="post" name="writeform" action="./writePro.do" onsubmit="return writeSave()">
			<input type="hidden" name="num" value="${num }">
			<input type="hidden" name="ref" value="${ref }">
			<input type="hidden" name="re_step" value="${re_step }">
			<input type="hidden" name="re_level" value="${re_level }">
				<div id="content">
				
			<table>
				<colgroup>
					<col width ="20%" />
					<col width="*" />
				</colgroup>
				<tr>
					<td align="right" colspan="2">
					<a href = "/MVC/list.do">글목록</a>
					</td>
				</tr>
				<tr>
					<th>이 름</th>
					<td>
						<input type="text" size="10" maxlength="10"	name="writer">
					</td>
				</tr>
				<tr>
					<th>제 목</th>
					<td>
						<c:if test="${num==0 }"> 
							<input type="text" name="subject" />
						</c:if>
						<c:if test ="${num!=0 }">
						<input type="text" name="subject" value="[re]" />
					</c:if>
					</td>
				</tr>
				<tr>
					<th>Email</th>
					<td>
						<input type="text" name="email" />
					</td>
				</tr>
				<tr>
					<th>내 용</th>
					<td><textarea name="content"></textarea></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="passwd"></td>
				</tr>
				</table>
			</div>
				<div id = "footer">
					<input type="submit" value="글쓰기" />
					<input type="reset" value="다시작성" />
					<input type="button" value="목록보기" OnClick="window.location='./list.do'" />
				</div>
			</form>
		</div>
</body>
</html>