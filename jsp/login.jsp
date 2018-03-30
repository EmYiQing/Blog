<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/font-awesome.css"/>
    <link rel="stylesheet" href="css/edmure.css"/>
    <link rel="stylesheet" href="css/commons.css"/>
    <link rel="stylesheet" href="css/account.css"/>
    <style>
        .bgimg {
           background-image: url(images/timg.jpg);
           background-repeat:no-repeat ;
           background-size:100% 100%; 
           background-attachment: fixed;
        }
        .c1{
        	color:white;
        }
    </style>
</head>
<body background="images\timg.jpg" class="bgimg">
<div class="login" style="background-color:white; background:rgba(0,0,0,0.5);">
    <div style="font-size: 25px; font-weight: bold;text-align: center;" class="c1">
        用户登陆
    </div>
    <form id="fm" method="POST" action="${pageContext.request.contextPath}/UserAction_login">
        <div class="form-group">
            <label for="username"class="c1">用户名</label>
            <input type="text" class="form-control" name="username" placeholder="请输入用户名">
        </div>
        <div class="form-group">
            <label for="password"class="c1">密码</label>
            <input type="password" class="form-control" name="u_password" placeholder="请输入密码">
        </div>
        
        <div class="form-group">
            <label for="password"class="c1">验证码</label>

            <div class="row">
                <div class="col-xs-7">
                    <input type="text" class="form-control" name="checkCode" placeholder="请输入验证码">
                </div>
                <div class="col-xs-5">
                    <img src="${pageContext.request.contextPath}/CheckImgAction.action" onclick="this.src='CheckImgAction.action?'+ Math.random()" title="点击图片刷新验证码"/>
                </div>
            </div>

        </div>
        <div class="checkbox">
			<font color="red" ><s:property value="exception.message" /> </font><br/>
            <div class="right">
                <a href="${pageContext.request.contextPath}/register.jsp" class="c1"><strong>还没有账号？点击注册?</strong></a><br/><br/>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-3">
                <input type="submit" class="btn btn-default" value="登 陆">
            </div>
        </div>

    </form>
</div>
</body>
</html>