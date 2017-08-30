<?xml version="1.0" encoding="euc-kr" ?>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check==1 }">
<script type="text/javascript">
	location.href = "list.do?pageNum=${pageNum}";
</script>
</c:if>
<c:if test="${check==0 }">
비밀번호가 다릅니다.
<br>
<a href="javascript:history.go(-1)">[글수정 폼으로 돌아가기]</a>
</c:if>