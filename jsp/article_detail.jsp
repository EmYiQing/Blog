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
    <link rel="stylesheet" href="css/edmure.css"/>
    <link rel="stylesheet" href="css/commons.css"/>
    <link rel="stylesheet" href="css/row-avatar.css"/>
    <link rel="stylesheet" href="css/home.css"/>
     <link rel="stylesheet" href="wangeditor/css/wangEditor.css"/>
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="plugins/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div class="pg-header">
    <div class="title"><s:property value="#article.author.username" />的文章</div>
    <div class="menu-list">
        <a class="menu-item" href="${pageContext.request.contextPath}/">首页</a>
        <s:if test="#session.user.u_id==#article.author.u_id">
        <a class="menu-item" href="${pageContext.request.contextPath}/ArticleAction_delete?article_id=<s:property value='#article.article_id'/>&user_id=<s:property value="#session.user.u_id"/>">删除本文章</a>
        </s:if>
    </div>
</div>
<div class="pg-body">
    <div class="body-menu">
        <div class="notice">
            <div class="notice-header">个人信息：</div>
            <div class="notice-body">
                <ul>
                    <li>用户名：<s:property value="#article.author.username" /></li>
                    <li>QQ号：<s:property value="#article.author.qq" /></li>
                </ul>
                <div>
                	<s:if test="#article.author">
                	<img src="imgs/avatar/<s:property value="#article.author.avatar"/>.jpg">
                    </s:if>
                    <s:else>
                    <img src="imgs/avatar/default.png">
                    </s:else>
                 <br><br>
                    <strong>用户等级:10</strong>
                    <br>
                    经验值：100/600
                </div>
            </div>
        </div>
    </div>
    <div class="body-content">
        <div class="art-title">
            <a><s:property value="#article.title" /></a>
        </div>
        <div id="show_box"></div>
        <div class="art-recommend clearfix">
            <div class="recommend">
                <a onclick="Good();" href="javascript:void(0);" class="up"
                   style="margin: 5px 10px;display: inline-block;padding: 5px 15px;border: 1px solid #dddddd;text-align: center;">
                    <i class="fa fa-thumbs-o-up fa-3" aria-hidden="true" style="font-size: 25px"></i>
                    <div><s:property value="#article.up_count" /></div>
                </a>
            <s:if test="#session.user.u_id==#article.author.u_id">
                    <div>
                        <a href="${pageContext.request.contextPath}/ArticleAction_edit?article_id=<s:property value='#article.article_id'/>&user_id=<s:property value="#session.user.u_id"/>">编辑文章</a>
                    </div>
              </s:if>
            </div>
        </div>
        <div class="art-tips clearfix">
            <div class="tips">
                <span class="ctime">创建时间：<s:property value="#article.create_time" /></span>
                <a class="author"><s:property value="#article.author.username" /></a>
                <span class="comment-count">评论<s:property value="#article.comment_count" /></span>
                <span class="read-count">阅读<s:property value="#article.read_count" /></span>
            </div>
        </div>
        <div id="AllanboltSignature">
            <div style="border-bottom: #e0e0e0 1px dashed; border-left: #e0e0e0 1px dashed; padding: 10px; font-family: 微软雅黑; font-size: 11px; border-top: #e0e0e0 1px dashed; border-right: #e0e0e0 1px dashed; "
                 id="PSignature">
                <div style="float:left;width:70px;">
                    <img src="imgs/o_Warning.png" style="width:65px;height:65px">
                </div>
                <div style="float:left;padding-top:10px;">

                    <div style="padding: 1px">作者：<a href="#" target="_blank"><s:property value="#article.author.username" /></a></div>
                    <div style="padding: 1px">出处：<a href="#" target="_blank">www.xuyiqing.top</a>
                    </div>
                    <div style="padding: 1px">本文版权归作者所有，欢迎转载，但未经作者同意必须保留此段声明，且在文章页面明显位置给出原文连接</div>
                </div>
                <div style="clear:both;"></div>
            </div>
        </div>
        <div class="art-comment">
            <div class="comment-title">
                评论:
            </div>
            <div class="comment-list">
                <s:iterator value="#comments" var="comment" status="sta">
                    <div class="comment-item">
                        <div class="reply-title clearfix">
                            <s:property value="#sta.index+1" />楼：
                            <br>
                            <div class="user-info">
                                <span>评论用户：<s:property value="#comment.user.username"/></span>
                                <span>评论时间：<s:property value="#comment.comment_time"/></span>
                            </div>

                            <br>
                        </div>
                        <div>
                            <div>
                                <strong><s:property value="#comment.content" /></strong>
                            </div>
                        </div>
                        <s:if test="#session.user.u_id==#comment.user.u_id">
                            <form id="cm" method="POST">
                                <input type="hidden" value="<s:property value="#comment.cid"/>" name="comment_cid"/>
                                <a onclick="Delete();" class="btn btn-warning">删除评论</a>
                            </form>
                        </s:if>
                    </div>
                </s:iterator>
            </div>
            <div class="comment-area">
                <form method="POST" id="fm">
                    <div class="reply-area" style="position: relative;">
                        <s:if test="#session.user==null">
                            <div style="text-align:center;line-height:200px;position: absolute;top:0;left:0;right:0;bottom: 0;background-color: rgba(255,255,255,.6)">
                                您需要登录后才可以回帖 <a href="/login/">登录</a> | <a href="/register/">立即注册</a>
                            </div>
                        </s:if>
                        <textarea name="content" style="width: 100%;height:200px;"></textarea>
                    </div>
                    <div>
                        <div class="reply-btn">
                            <a class="btn btn-primary" id="submit">发表回复</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="wangeditor/js/wangEditor.js"></script>
<script type="text/javascript">
var html = '<s:property value="#article.article_detail" escape="false"/>';
$("#show_box").html(html);	
    $(function () {
         Reply();
     });
                       
    function Reply() {
        $('#submit').click(function () {
            $.ajax({
                url: '${pageContext.request.contextPath}/OthersAction_comment?article_id=<s:property value="#article.article_id"/>&user_id=<s:property value="#session.user.u_id"/>',
                type: 'POST',
                data: $('#fm').serialize(),
                success: function () {
                    location.reload();
                }
            })
        })
    }
    function Delete() {
        $.ajax({
            url: '${pageContext.request.contextPath}/OthersAction_deleteComment',
            type: 'POST',
            data: $('#cm').serialize(),
            success: function () {
                location.reload();
            }
        })
    }
    function Good() {
        $.ajax({
            url: '${pageContext.request.contextPath}/OthersAction_good?article_id=<s:property value="#article.article_id"/>&user_id=<s:property value="#session.user.u_id"/>',
            type: 'GET',
            success: function (arg) {
                if (arg.status) {
                    location.reload();
                } else {
                    window.alert("点赞成功");
                    location.reload();
                }
            }
        })
    }
    function ReplyComment(nid) {
        $("#" + "reply" + nid).parent().parent().removeAttr('style');
        $("#" + "cancel" + nid).removeAttr('style');
        $("#" + "reply_1" + nid).attr('style', "display:none;")
    }
    function CancelReply(nid) {
        $("#" + "reply" + nid).parent().parent().attr('style', "display:none;");
        $("#" + "cancel" + nid).attr('style', "display:none;");
        $("#" + "reply_1" + nid).removeAttr('style');
    }
    function ReplySubmit(a, b, c) {
        $.ajax({
            url: "/comment-reply/" +a+ "/"+ b + "/" + c,
            type: 'POST',
            data: $("#" + "fm" + b).serialize(),
            success: function (arg) {
                window.alert("回复成功");
                location.reload();
            }
        })
    }
</script>
</body>
</html>