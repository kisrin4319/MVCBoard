<?xml version="1.0" encoding="euc-kr" ?>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ȸ����������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<link href="./css/style.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">

function checkIt() {
	var userinput = eval("document.userinput");
	if(!userinput.passwd.value){
		alert("��й�ȣ�� �Է��ϼ���.");
		return false;
	}
	if(userinput.passwd.value!= userinput.passwd2.value){
		alert("��й�ȣ�� ���� �ʽ��ϴ�.");
		return false;
	}
	if(!userinput.name.value){
		alert("����� �̸��� �Է��ϼ���.");
		return false;
	}
	if(!userinput.jumin1.value || !userinput.jumin2.value){
		alert("�ֹε�Ϲ�ȣ�� �Է��ϼ���.");
		return false;
	}
}
//�����ȣ üũ
function zipCheck(){
	url = "ZipCheck.do?check=y";
	open(url,"post","toolbar=no ,width=500 ,height=300 ,directories=no,status=yes,scrollbars=yes,menubar=no");
	}
</script>
<body>
<div id="joinWrap">
	<h1>Modify</h1>
	<form action="./modifyPro.do" name = "userinput" method="post" onsubmit="return checkIt()">
<table>
			<colgroup>
				<col width="25%" />
				<col width="*" />
			</colgroup>
			<tr>
				<th><span class="star">*</span>���̵�</th>
				<td>${member.id }</td>
				<input type ="hidden" name = "id" value ="${sessionScope.memId }" />
			</tr>
			<tr>
				<th><span class="star">*</span>��й�ȣ</th>
				<td><input type="password" name="passwd" maxlength="10" value="${member.passwd }" /></td>
			</tr>
			<tr>
				<th><span class="star">*</span>�̸�</th>
				<td><input type="text" name="name" maxlength="10" value="${member.name }" /></td>
			</tr>
			<tr>
				<th><span class="star">*</span>�ֹε�Ϲ�ȣ</th>
				<td>
					${member.jumin1 } - ${member.jumin2}
				</td>
			</tr>
			<tr>
				<th>�ּ�</th>
				<td>
					<input type="text" name="zipcode" maxlength="7" value="${member.zipcode }" class="w50" />
					<span class="zipCheck"><input type="button" onclick="zipCheck()" /></span>
					<span class="addr"><input type="text" name="address" maxlength="70" value="${ member.address}" class="w300" /></span>
				</td>
			</tr>
			<tr>
				<th>E-Mail</th>
				<td>
					<c:if test ="${empty member.email }">
						<input type="text" name="email" maxlength="50" class="w300" />
					</c:if>
					
					<c:if test="${!empty member.email }">
					 	<input type="text" name="email" maxlength="50" value="${member.email }" class="w300" />
					</c:if>
				</td>
			</tr>
			<tr>
				<th>Blog</th>
				<td>
					<c:if test ="${empty member.blog }">
						<input type="text" name="blog" maxlength="50" class="w300" />
					</c:if>
					<c:if test ="${!empty member.blog }">
					 	<input type="text" name="blog" maxlength="50" value="${member.blog }" class="w300" />
					</c:if>
				</td>
			</tr>
		</table>
		<div class="btnArea">
			<input type="submit" value="Ok" />
			<input type="button" value="Cancel" onclick="javascript:window.location='./main.do'" />
			<input type="button" value="Member secession" onclick="javascript:window.location='./deleteForm.do'" />
		</div>
	</form>
	</div>
</body>
</html>