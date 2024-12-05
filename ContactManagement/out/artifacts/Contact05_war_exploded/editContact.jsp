<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑联系人</title>
    <style>
        /* 设置整体样式 */
        h2{
            color: #ffffff;
        }
        body {
            font-family: Arial, sans-serif; /* 设置字体 */
            margin-top: 50px; /* 顶部外边距 */
            text-align: center; /* 文本居中 */
            background-image: url("images/background4.jpg");
        }

        /* 设置表单样式 */
        form {
            width: 300px; /* 表单宽度 */
            margin: 0 auto; /* 表单居中 */
            padding: 20px; /* 添加表单内边距 */
            background-color: rgba(255, 255, 255, 0.3); /* 设置背景颜色，这里使用了半透明的白色 */
            border-radius: 5px; /* 表单边框圆角 */
        }

        /* 设置输入框和按钮样式 */
        input[type="text"],
        input[type="date"],
        input[type="submit"] {
            width: 100%; /* 输入框和按钮宽度填满表单 */
            padding: 10px; /* 内边距 */
            font-size: 18px; /* 字号 */
            margin-top: 15px; /* 上下边距 */
            box-sizing: border-box; /* 修复边距和内边距的盒模型问题 */
        }

        /* 设置按钮样式 */
        input[type="submit"] {
            cursor: pointer; /* 鼠标悬停时显示手型光标 */
        }

        /* 设置超链接样式 */
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
            background: #3ca5f5;     /*超链接背景颜色*/
            border-color: #fff#aaa#aaa#fff;
            zoom: 1;      /*解决IE浏览器无法显示问题*/
        }
    </style>
</head>
<body>
<h2>编辑联系人</h2>
<form action="${pageContext.request.contextPath }/editContact" method="post">
    <input type="hidden" name="id" value="${contact.id}">
    姓名：<input type="text" name="name" value="${contact.name }"><br>
    性别：<input type="radio"style="zoom:1.5;" name="gender" value="男" ${contact.gender == '男'?'checked':'' }> 男
    <input type="radio"style="zoom:1.5;" name="gender" value="女" ${contact.gender == '女'?'checked':'' }> 女<br><br>
    生日：<input type="date" name="birthday" id="birthday" value="${contact.birthday}"><br><br>
    电话：<input type="text" name="phone" value="${contact.phone }"><br>
    <input type="submit" value="更新">
</form>
<br>
<a href="listContacts">返回联系人列表</a>
</body>
</html>
