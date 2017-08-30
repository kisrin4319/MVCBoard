<?xml version="1.0" encoding="euc-kr" ?>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<c:if test="${check eq 1 }">
	<script type ="text/javascript">
		location.href = "content.do?num=${content_num}&pageNum=${comment_num}";
	</script>
</c:if>
<c:if test="${check ne 1 }">
<script type = "text/javascript">
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
</script>
</c:if>