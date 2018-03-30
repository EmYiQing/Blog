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
    .conditions a{
        display: inline-block;
        padding: 2px 5px;
        margin-left: 5px;
    }
    .conditions a.active{
        background-color: #b35215;
        color: #ffffff;
    }
    </style>
</head>
<body>
<div class="pg-header">
    <div class="logo left" style="text-align: center;background-color: #1c5a9c;">
        <a href="#" style="color: #ffffff;font-size:30px;font-weight: bold;text-decoration: none">
            文章管理
        </a>
    </div>

    <div class="left-menu left">
        <a class="menu-item" href="${pageContext.request.contextPath}/">首页</a>
    </div>
</div>
<div class="pg-body">
    <div class="content" style="left: 5px">
    <ol class="breadcrumb" style="margin-bottom: 0;">
        <li><a href="#">文章管理</a></li>
        <li>当前用户： <s:property value="#session.user.username" /></li>
    </ol>
    <div>
        <div class="clearfix"
             style="height: 36px;line-height: 35px;padding: 0 15px;border-top: 1px solid #dddddd;background-color: #f1f0f0">
            <a href="${pageContext.request.contextPath}/write_article.jsp">
                <i class="fa fa-plus-circle" aria-hidden="true"></i>
                创建新文章
            </a>
        </div>

        <table class="table table-bordered">
            <thead>
            <tr>
                <th>文章标题</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="#articles" var="article">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/ArticleAction_detail?article_id=<s:property value='#article.article_id'/>"> <s:property value="#article.title" /></a></td>
                    <td>
                        <a class="btn btn-danger btn-xs" href="${pageContext.request.contextPath}/ArticleAction_delete?article_id=<s:property value='#article.article_id'/>&user_id=<s:property value="#session.user.u_id"/>">
                            <i class="fa fa-times" aria-hidden="true"></i>
                            删除
                        </a>
                        <a class="btn btn-primary btn-xs" href="${pageContext.request.contextPath}/ArticleAction_edit?article_id=<s:property value='#article.article_id'/>&user_id=<s:property value="#session.user.u_id"/>">
                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                            编辑
                        </a>
                    </td>
                <td>
                    阅读数： <s:property value="#article.read_count" />|
                    点赞数： <s:property value="#article.up_count" />|
                    评论数： <s:property value="#article.comment_count" />
                </td>
                </tr>
            </s:iterator>
            </tbody>
        </table>
    </div>
    </div>
</div>
</body>
</html>