<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>글수정</title>
<link href="./css/style.css" rel="stylesheet" type="text/css" >
<script type="text/javascript" src="./script/script.js" ></script>
</head>
<body>
<div id ="wrap">
	<div id = "header"><h1>글수정</h1></div>
		<form method="post" name="writeform" action="./updatePro.do?pageNum=${pageNum}" onsubmit="return writeSave()">
			<div id="content">
			<table>
				<colgroup>
					<col width= "20%"/>
					<col width = "*" />
				</colgroup>
				<tr>
					<th>작성자</th>
					<td>
					<input type="text" name="writer" value="${article.writer}" />
						<input type="hidden" name="num" value="${article.num}" />
					</td>
				</tr>
				<tr>
					<th>제 목</th>
					<td>
					<input type="text" name="subject" value="${article.subject}" /></td>
				</tr>
				<tr>
					<th>Email</th>
					<td align="left" width="330">
					<input type="text" size="40" maxlength="30" name="email" value="${article.email}" />
					</td>
				</tr>
				<tr>
					<th>내 용</th>
					<td><textarea name="content">${article.content}</textarea></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="passwd" /></td>
				</tr>
				</table>
			</div>
			<div id ="footer">
				<input type="submit" value="글수정" />
				<input type="reset"  value="다시작성" />
				<input type="button" value="목록보기" onclick="document.location.href='./list.do?pageNum=${pageNum}'" />
			</div>
		</form>
	</div>
</body>
</html>