<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 등록</title>
</head>
<body>
<center>
<h1>사진 등록</h1>
<hr>
<form action="upload.do" method = "post" enctype="multipart/form-data">
<table border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td bgcoler="orange" width="70">제목</td><td align ="left">
		<input type="text" name="title"/></td>
	</tr>
	<tr>
		<td bgcoler="orange">작성자</td><td align="left">
		<input type="text" name="writer" size="10"/></td>
	</tr>
	<tr>
		<td bgcoler="orange">내용</td><td align="left">
		<textarea name="content" cols="40" rows="10"></textarea></td>
	</tr>
	<tr>
		<td bgcoler="orange" width="70">업로드</td><td align ="left">
		<input type="file" name="uploadFile"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="새글 등록"/></td>
	</tr>
	
</table>
</form>
<hr>
</center>
</body>
</html>