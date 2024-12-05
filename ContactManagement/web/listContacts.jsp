<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>联系人管理</title>
    <style>
        h2{
            color: #ffffff;
        }
        /* 设置整体样式 */
        body {
            font-family: Arial, sans-serif; /* 设置字体 */
            margin-top: 50px; /* 顶部外边距 */
            text-align: center; /* 文本居中 */
        }
        table tr:nth-child(odd)
        {
            background: rgb(68,94,137);
        }
        /*设置偶数行颜色*/
        table tr:nth-child(even)
        {
            background: rgb(60,82,118);
        }
        /* 设置表格样式 */
        table {
            width: 80%; /* 表格宽度 */
            margin: 0 auto; /* 表格居中 */
            border-collapse: collapse; /* 边框合并 */
        }

        /* 设置表格边框和背景颜色 */
        table, th, td {
            border: 5px solid rgba(187, 187, 187, 0.37); /* 边框样式 */
        }
        th, td {
            padding: 10px; /* 单元格内边距 */
            text-align: center; /* 文本左对齐 */
        }
        th {
            color: #FFFFFF;
            background-color: #587AB3;
            font-size: 20px;/* 表头背景颜色 */
        }
        td{
            color:#9DB5DB;
        }

        /* 设置表单样式 */
        form {
            display: inline-block; /* 使表单元素水平排列 */
            margin-bottom: 10px; /* 添加底部外边距 */
        }

        /* 设置输入框和按钮样式 */
        input[type="text"],
        input[type="submit"] {
            padding: 10px; /* 输入框和按钮内边距 */
            font-size: 16px; /* 字号 */
            color:#ffffff;
            background-color: #3ca5f5;
        }
        input[type="text"]{
            background-color:#364662 ;
            color: #ffffff;
        }

        /* 设置分页链接样式 */
        .pagination {
            text-align: center; /* 分页链接居中 */
            margin-top: 10px; /* 分页顶部外边距 */
        }
        .pagination a {
            text-decoration: none; /* 去除下划线 */
            color: #ffffff; /* 链接颜色 */
        }
        .pagination a:hover {
            color: #3ca5f5; /* 鼠标悬停时颜色变化 */
        }
        a:hover{
            color: green;
            background: transparent;
            border-color: #bbb#fff#fff#aaa;
        }   /*鼠标经过超链接的样式*/
        a{/*完全清除超链接下划线效果*/
            text-decoration: none;
            border:solid 1px;
            padding: 0.4em 0.8em;
            color: #ffffff;
            background: #3ca5f5;    /*超链接背景颜色*/
            border-color: #fff#aaa#aaa#fff;
            zoom: 1;      /*解决IE浏览器无法显示问题*/
        }
        body {
            font-family: Arial, sans-serif; /* 设置字体 */
            font-size: 16px; /* 设置基础字号 */
            text-align: center; /* 文本居中 */
            margin-top: 100px; /* 顶部外边距，使页面内容不紧贴顶部 */
            background: #364662;

            /*background-image: url('images/background.jpg'); !* 添加背景图片 *!*/
            /*background-size: cover; !* 背景图片覆盖整个容器 *!*/
            /*background-position: center; !* 背景图片居中 *!*/
            /*background-repeat: no-repeat; !* 背景图片不重复 *!*/
            /*background-attachment: fixed;*/
        }

    </style>
</head>
<body>
<h2>联系人列表</h2>

<table>
    <tr>
        <th colspan="8">
            <form action="${pageContext.request.contextPath }/listContacts" method="post">
                姓名:<input type="text" name="username" value="${searchUsername}">
                <input type="submit" value="搜索">
            </form>
        </th>
    </tr>
    <tr>
        <th>ID</th>
        <th>姓名</th>
        <th>性别</th>
        <th>生日</th>
        <th>电话</th>
        <th>操作</th>
    </tr>
    <c:forEach var="contact" items="${contacts}">
        <tr>
            <td>${contact.id}</td>
            <td>${contact.name}</td>
            <td>${contact.gender}</td>
            <td><fmt:formatDate value="${contact.birthday}" pattern="yyyy-MM-dd"/></td>
            <td>${contact.phone}</td>
            <td>
                <a href="toEdit?id=${contact.id}">编辑</a>
                <a href="deleteContact?id=${contact.id}">删除</a>
            </td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="8" class="pagination">
            <a href="listContacts?page=1">首页</a>
            <a href="listContacts?page=${(page-1)>0?page-1:1}">上一页</a>
            <a href="listContacts?page=${(page+1)>totalPage?totalPage:page+1}">下一页</a>
            <a href="listContacts?page=${totalPage}">尾页</a>
            当前第${page}页，共${totalPage}页，共${totalCount}条记录
        </td>
    </tr>
</table>
<br>
<a href="addContact.jsp">新增联系人</a>
<br>
<br>
<a href="index.jsp">退出登录</a>

</body>
</html>