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
    <link rel="stylesheet" href="wangeditor/css/wangEditor.css"/>
    <link rel="stylesheet" href="css/commons.css"/>
    <link rel="stylesheet" href="css/backend.css"/>
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
     <script src="js/jquery.validate.min.js" type="text/javascript"></script>
</head>
<body>
<div class="pg-header">
    <div class="logo left" style="text-align: center;background-color: #1c5a9c;">
        <a href="javascript:void(0);" style="color: #ffffff;font-size:30px;font-weight: bold;text-decoration: none">
            一清论坛
        </a>
    </div>

    <div class="left-menu left">
        <a class="menu-item" href="${pageContext.request.contextPath}">首页</a>
        <a style="left: 500px;display: inline-block;padding: 0 30px">当前用户:<s:property value="#session.user.username" /></a>
    </div>

    <div class="right-menu right clearfix">

        <div class="user-info right">
            <a href="#" class="avatar">
                <img class="img-circle" src="imgs/avatar/default.png">
            </a>
            <div class="more-info">
                <a href="#" class="more-item">修改个人信息</a>
                <a href="${pageContext.request.contextPath}/UserAction_logout" class="more-item">注销</a>
            </div>
        </div>
        <a class="user-menu right">
               消息
            <i class="fa fa-commenting-o" aria-hidden="true"></i>
            <span class="badge bg-success">0</span>
        </a>
    </div>

</div>
<div class="pg-body">
    <div class="content" style="left: 10px">
        <div style="padding: 5px 8px;">
            <form id="articleForm" method="POST" action="${pageContext.request.contextPath}/ArticleAction_write?author_id=<s:property value="#session.user.u_id" />" name="articleForm">
                <div class="form-group">
                    <label for="title">标题</label>
                    <input type="text" class="form-control" name="title" id="title"/ value="<s:property value="#article.title" />">
                </div>
                <div class="form-group">
                    <label for="summary">简介</label>
                    <input type="text" class="form-control"  name="summary" id="summary" value="<s:property value="#article.summary" />"/>
                </div>
                <div class="form-group">
                    <label for="content">内容</label>
                    <textarea name="article_detail" style="width: 100%;height:500px" id="textarea1">
                    </textarea>
                </div>
                <div class="checkbox">
                    <label> 文章类型【必选】<br><br>
                        <input type="radio" value="1" name="article_type_id"> 学习<br><br>
                        <input type="radio" value="2" name="article_type_id"> 游戏<br><br>
                        <input type="radio" value="3" name="article_type_id"> 感情<br><br>
                        <input type="radio" value="4" name="article_type_id"> 生活<br><br>
                        <s:if test="#session.user.u_id==1">
                        <input type="radio" value="5" name="article_type_id"> VIP<br><br>
                        </s:if>
                    </label>
                </div>
                <div class="form-group">
                    <input type="button" class="btn btn-primary" value="保 存" onclick="defineSubmit(this)">
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="wangeditor/js/wangEditor.js"></script>
<script>
var html = '<s:property value="#article.article_detail" escape="false"/>';
$("#textarea1").html(html);	
	var editor = new wangEditor('textarea1');
	editor.create();
    function defineSubmit(btn) {
        document.articleForm.submit();
    }
</script>
</body>
</html>