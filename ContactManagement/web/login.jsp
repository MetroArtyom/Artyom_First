<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <style>
        /* 设置整体样式 */
        body {
            font-family: Arial, sans-serif; /* 设置字体 */
            font-size: 16px; /* 设置基础字号 */
            text-align: center; /* 文本居中 */
            margin-top: 100px; /* 顶部外边距，使页面内容不紧贴顶部 */
            background-image: url('images/background.jpg'); /* 添加背景图片 */
            background-size: cover; /* 背景图片覆盖整个容器 */
            background-position: center; /* 背景图片居中 */
            background-repeat: no-repeat; /* 背景图片不重复 */
            background-attachment: fixed;
        }

        /* 设置message样式 */
        .message {
            font-size: 20px; /* 增大字号 */
            color: red; /* 字体颜色 */
            margin-bottom: 20px; /* 添加底部外边距 */
            padding: 10px; /* 添加内边距 */
            background-color: rgba(255, 255, 255, 0.8); /* 设置背景颜色，这里使用了半透明的白色 */
        }

        /* 设置表单样式 */
        form {
            width: 300px; /* 表单宽度 */
            margin-top: 125px; /* 表单居中 */
            margin-left: auto;
            margin-right: auto;
            padding: 20px; /* 添加表单内边距 */
            background-color: rgba(255, 255, 255, 0.8); /* 设置背景颜色，这里使用了半透明的白色 */
            border-radius: 5px; /* 表单边框圆角 */
        }

        /* 设置输入框和按钮样式 */
        input[type="text"],
        input[type="password"],
        input[type="submit"],
        input[type="button"] {
            width: 100%; /* 输入框和按钮宽度填满表单 */
            padding: 10px; /* 内边距 */
            font-size: 18px; /* 字号 */
            margin-top: 15px; /* 上下边距 */
            box-sizing: border-box; /* 修复边距和内边距的盒模型问题 */
        }

        /* 设置按钮样式 */
        input[type="submit"],
        input[type="button"] {
            cursor: pointer; /* 鼠标悬停时显示手型光标 */
        }
    </style>
</head>
<body>
<h2>用户登录</h2>
<% if (request.getAttribute("message") != null) { %>
<div class="message">
    ${message}
</div>
<% } %>
<form action="login" method="post">
    用户名：<input type="text" name="username"><br>
    密码：<input type="password" name="password"><br>
    <input type="submit" value="登录">
    <input type="button" value="注册" onclick="location.href='register.jsp';">
</form>
</body>
</html>