<?xml version="1.0" encoding="euc-kr" ?>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>우편번호 검색</title>
<link href="css/popup.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function dongCheck() {
		if (document.zipForm.area3.value == "") {
			alert("동이름을 입력하세요.");
			document.zipForm.area3.focus();
			return;
		}
		document.zipForm.submit();
	}
	function sendAddress(zipcode, area1, area2, area3, area4) {
		var address = area1 + " " + area2 + " " + area3 + " " + area4;
		opener.document.userinput.zipcode.value = zipcode;
		opener.document.userinput.address.value = address;
		self.close();
	}
</script>
</head>
<body>
	<div id="zipCheck">
		<h1>우편번호 검색</h1>
		<form name="zipForm" method="post" action="ZipCheck.do">
			<p class="desc">
				동이름 입력: <input type="text" name="area3" />
			</p>
			<div>
				<input type="button" value="검색" onclick="dongCheck();" /> <input
					type="hidden" name="check" value="n" />
			</div>
		</form>
		<c:if test="${check == 'n' }">
			<c:if test="${empty zipcodeList }">
				<p class="desc">검색된 결과가 없습니다.</p>
			</c:if>
			<c:if test="${!empty zipcodeList }">
				<div class="spot">
					<ul>
						<c:forEach var="list" items="${zipcodeList }">
							<li>
							<a href="javascript:sendAddress('${list.zipcode }','${list.area1 }','${list.area2 }','${list.area3 }','${list.area4 }')">
									${list.zipcode }&nbsp;${list.area1 }&nbsp;${list.area2 }&nbsp;${list.area3 }&nbsp;${list.area4 }
							</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>
		</c:if>
	</div>
</body>
</html>