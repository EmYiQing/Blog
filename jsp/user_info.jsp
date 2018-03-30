<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.css"/>
    <link rel="stylesheet" href="css/commons.css"/>
    <link rel="stylesheet" href="css/backend.css"/>
    <style>
        .form-horizontal .control-label {
            padding-top: 7px;
            margin-bottom: 0;
            text-align: right;
        }

        .avatar-container {
            height: 200px;
            width: 200px;
            padding: 2px;
            border: 1px solid #dddddd;
            position: relative;
        }

        .avatar-container img {
            height: 100%;
            width: 100%;
            border: 0;
            overflow: hidden;
        }

        .avatar-container .text {
            text-align: center;
        }

        .avatar-container .img-file {
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            opacity: 0;
            position: absolute;
            z-index: 102;
        }
    </style>
</head>
<body>
<div class="pg-header">
    <div class="logo left" style="text-align: center;background-color: #1c5a9c;">
        <a href="#" style="color: #ffffff;font-size:30px;font-weight: bold;text-decoration: none">
            个人信息
        </a>
    </div>

    <div class="left-menu left">
        <a class="menu-item" href="${pageContext.request.contextPath}/">首页</a>
    </div>
    <div class="right-menu right clearfix">
        <div class="user-info right">
            <a href="${pageContext.request.contextPath}/UserAction_logout" class="more-item">注销</a>
        </div>
    </div>
</div>
<div class="pg-body">
    <div class="content" style="left: 5px">
        <ol class="breadcrumb">
            <li class="active">用户信息</li>
            <li>当前用户：<s:property value="#session.user.username"/></li>
        </ol>
        <div>
            <div class="row" style="position: relative;">
                  <form class="form-horizontal">
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label class="col-xs-2 control-label">用户名</label>
                            <div class="col-xs-5">
                                <p class="form-control-static"><s:property value="#session.user.username"/></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-2 control-label">发表文章个数</label>
                            <div class="col-xs-4">
                                 <p class="form-control-static"><s:property value="#session.user.article_count"/></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-2 control-label">QQ</label>
                            <div class="col-xs-4">
                                 <p class="form-control-static"><s:property value="#session.user.qq"/></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-2 control-label">密码(MD5加密)</label>
                            <div class="col-xs-4">
                                <p class="form-control-static"><s:property value="#session.user.u_password"/></p>
                            </div>
                        </div>
                        </div>
                        </form>
                <div style="position: absolute;" class="col-xs-offset-7 col-xs-5">
                                                        您的头像：<img id="previewImg" src="imgs/avatar/<s:property value="#session.user.avatar"/>.jpg"
                                     style="border-radius: 50%;">
                    </div>
                </div>
            </div>
                        <div style="margin-left: 150px">
                        <form action="${pageContext.request.contextPath }/UploadAction_avatar?user_id=<s:property value="#session.user.u_id"/>" method="post" enctype="multipart/form-data">
                        	选择头像：<input type="file" name="file1"/>
                        <input type="submit" value="上传头像">
         			    </form>
         			    </div>
        </div>
    </div>

</body>
</html>