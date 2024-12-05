\<%@ page language="java" contentType="text/html; charset=UTF-8"
          pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>删除联系人</title>
</head>
<body>
<h2>删除联系人</h2>
<c:if test="${deleted}">
    <h3>联系人删除成功。</h3>
</c:if>
<c:if test="${not deleted}">
    <h3>联系人删除失败。</h3>
</c:if>
<br>
<a href="listContacts">返回联系人列表</a>
</body>
</html>