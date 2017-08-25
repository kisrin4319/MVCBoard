<?xml version="1.0" encoding="euc-kr" ?>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<c:if test="${check==1 }">
	<c:set var = "memId" value = "${id }" scope = "session"/>
	<meta http-equiv="Refresh" content = "0;url=./main.do" />
</c:if>
<c:if test="${check==0 }">
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${check==-1 }">
	<script>
		alert("아이디가 맞지 않습니다.");
		history.go(-1);
	</script>
</c:if>