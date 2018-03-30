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
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
    <style>
        .bgimg {
           background-image: url(images/regist.jpg);
           background-repeat:no-repeat ;
           background-size:100% 100%; 
           background-attachment: fixed;
        }
        .c1{
        	color:white;
        }
        .error{
	color:red
		}
    </style>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <script type="text/javascript">
	$(function(){
		$("#myform").validate({
			rules:{
				"username":{
					"required":true,
				},
				"u_password":{
					"required":true,
					"rangelength":[6,12]
				},
				"confirm_password":{
					"required":true,
					"rangelength":[6,12],
					"equalTo":"#password"
				},
				"qq":{
					"required":true,
					"rangelength":[6,12],
				},
				"checkCode":{
					"required":true,
				},
			},
			messages:{
				"username":{
					"required":"用户名不能为空",
				},
				"u_password":{
					"required":"密码不能为空",
					"rangelength":"密码长度6-12位"
				},
				"confirm_password":{
					"required":"密码不能为空",
					"rangelength":"密码长度6-12位",
					"equalTo":"两次密码不一致"
				},
				"qq":{
					"required":"QQ不能为空",
					"rangelength":"密码长度6-12位"
				},
				"checkCode":{
					"required":"验证码不能为空",
				},
			}
		});
	});
	</script>
</head>
<body background="images\regist.jpg" class="bgimg">
<div class="register" style="background-color:white; background:rgba(0,0,0,0.5);">
    <div style="font-size: 25px; font-weight: bold;text-align: center;" class="c1">
        用户注册
    </div>
    <form id="myform" method="POST" action="${pageContext.request.contextPath}/RegistAction_regist">
        <div class="form-group">
            <label for="username"class="c1">用户名</label>
            <input type="text" class="form-control" name="username" id="username" placeholder="请输入用户名">
        </div>
         <div class="form-group">
            <label for="qq"class="c1">QQ号</label>
            <input type="text" class="form-control" name="qq" placeholder="请输入QQ号" id="qq">
        </div>
        <div class="form-group">
            <label for="password"class="c1">密码</label>
            <input type="password" class="form-control" name="u_password" id="password" placeholder="请输入密码">
        </div>
        <div class="form-group">
            <label for="confirm_password"class="c1">确认密码</label>
            <input type="password" class="form-control" name="confirm_password" placeholder="请重新输入密码" id="confirm_password">
        </div>
        <div class="form-group">
            <label for="password"class="c1">验证码</label>

            <div class="row">
                <div class="col-xs-7">
                    <input type="text" class="form-control" name="checkCode" id="check_code" placeholder="请输入验证码">
                </div>
                <div class="col-xs-5">
                     <img src="${pageContext.request.contextPath}/CheckImgAction.action" onclick="this.src='CheckImgAction.action?'+ Math.random()" title="点击图片刷新验证码"/>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-xs-3">
                <input type="submit" class="btn btn-default"class="c1" value="注 册"/>
            </div>
			<font color="red" ><s:property value="exception.message" /> </font><br/>
        </div>
       <div><br><div class="col-xs-12"><a href="${pageContext.request.contextPath}/login.jsp" style="color:white">已有账号，点击返回登录页面</a></div></div>


    </form>
</div>
</body>
</html>