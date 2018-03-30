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
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="plugins/bootstrap/js/bootstrap.js"></script>
<style>
.bgimg {
	background-image: url(images/index.jpg);
	background-position: right;
	background-repeat: no-repeat;
	background-attachment: fixed;
}
</style>
<script type="text/javascript">
	function quit() {
	    var r=confirm("您确定要退出当前用户吗!");
	    if (r==true){
	    	 window.location = "${pageContext.request.contextPath}/UserAction_logout";
	    }
	}
</script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">一清论坛</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
                <s:if test="#currentId==null">
                    <li class="active"><a href="${pageContext.request.contextPath}/IndexAction_articleTypeList">全部</a></li>
                </s:if>
                <s:else>
                    <li><a href="${pageContext.request.contextPath}/IndexAction_articleTypeList">全部</a></li>
                </s:else>
				<s:iterator value="#list" var="type">
					<s:if test="#currentId==#type.article_type_id ">
					<li class="active"><a href="${pageContext.request.contextPath}/IndexAction_catagory?type_id=<s:property value="#type.article_type_id"/>"><s:property value="#type.name" /></a></li>
					</s:if>
					<s:else>
					<li><a href="${pageContext.request.contextPath}/IndexAction_catagory?type_id=<s:property value="#type.article_type_id"/>"><s:property value="#type.name" /></a></li>
					</s:else>
				</s:iterator>			
			</ul>

			<ul class="nav navbar-nav navbar-right ">
				<s:if test="#session.user">
					<li>当前用户：<s:property value="#session.user.username" />&nbsp&nbsp&nbsp&nbsp<i class="fa fa-pencil-square-o"
						style="padding-right: 0; padding-top: 18px"></i></li>
					<li><a
						href="${pageContext.request.contextPath}/write_article.jsp"
						style="padding-right: 50px">写文章</a></li>
					<li><a style="padding-left: 0; padding-right: 0;">·</a></li>
					<li><a
						href="${pageContext.request.contextPath}/ArticleAction_manage?user_id=<s:property value="#session.user.u_id"/>">文章管理</a></li>
					<li><a style="padding-left: 0; padding-right: 0;">·</a></li>
					<li><a
						href="${pageContext.request.contextPath}/user_info.jsp">个人信息</a></li>
					<li><a style="padding-left: 0; padding-right: 0;">|</a></li>
					<li><a href="javascript:void(0)" onclick="quit();">退出</a></li>
				</s:if>
			</ul>
		</div>
	</div>
	</nav>
	<div class="container bgimg">
		<div>
			<div class="col-md-8">
				<div class="article-list">
					<s:if test="#pageBean1!=null">
						<s:iterator value="#pageBean1.list" var="article">
						<div class="article-item clearfix">
							<h3>
								<a
									href="${pageContext.request.contextPath}/ArticleAction_detail?article_id=<s:property value='#article.article_id'/>"><s:property value='#article.title'/></a>
							</h3>
					    <div class="clearfix">
					    					    	<a class="avatar left" href="#">
                                <img src="imgs/avatar/<s:property value="#article.author.avatar"/>.jpg">
                            </a>
                            <s:property value="#article.summary" />
                        </div>
							<div class="footers">
								<a class="ele">
								作者：<s:property value="#article.author.username" />
								</a> <span>发布于<s:property value="#article.create_time" /></span> <a class="ele"> <i
									class="fa fa-commenting-o" aria-hidden="true"></i> <span>
									<s:property
											value="#article.comment_count" /></span>
								</a> <a class="ele"> <i class="fa fa-thumbs-o-up"
									aria-hidden="true"></i> <span><s:property value="#article.up_count" /></span>
								</a> <a class="ele"> <span>阅读次数：<s:property value="#article.read_count" /></span>
								</a>
							</div>
						</div>
					</s:iterator>
					</s:if>
					<s:else>
					<s:iterator value="#pageBean.list" var="article">
						<div class="article-item clearfix">
							<h3>
								<a
									href="${pageContext.request.contextPath}/ArticleAction_detail?article_id=<s:property value='#article.article_id'/>"><s:property value='#article.title'/></a>
							</h3>
					    <div class="clearfix">
					    	<a class="avatar left" href="#">
                                <img src="imgs/avatar/<s:property value="#article.author.avatar"/>.jpg">
                            </a>
                            <s:property value="#article.summary" />
                        </div>
							<div class="footers">
								<a class="ele">
								作者：<s:property value="#article.author.username" />
									<span><s:property value="#article." /></span>
								</a> <span>发布于<s:property value="#article.create_time" /></span> <a class="ele"> <i
									class="fa fa-commenting-o" aria-hidden="true"></i> <span><s:property
											value="#article.comment_count" /></span>
								</a> <a class="ele"> <i class="fa fa-thumbs-o-up"
									aria-hidden="true"></i> <span><s:property value="#article.up_count" /></span>
								</a> <a class="ele"> <span>阅读次数：<s:property value="#article.read_count" /></span>
								</a>
							</div>
						</div>
					</s:iterator>
					</s:else>
				</div>
				
				<s:if test="#pageBean1!=null">
				
				<div class="clearfix">
				
					<ul class="pagination"
						style="text-align: center; margin-top: 10px;">
						<!-- 上一页 -->
						<c:if test="${pageBean1.currentPage==1 }">
							<li class="disabled"><a href="javascript:void(0);"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:if test="${pageBean1.currentPage!=1 }">
							<li><a
								href="${pageContext.request.contextPath}/IndexAction_catagory?currentPage=${pageBean1.currentPage-1 }&type_id=<s:property value="#currentId"/>"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>

						<c:forEach begin="1" end="${pageBean1.totalPage }" var="page1">
							<c:if test="${page1==pageBean1.currentPage }">
								<li class="active"><a href="javascript:void(0);">${page1 }</a></li>
							</c:if>
							<c:if test="${page1!=pageBean1.currentPage }">
								<li><a
									href="${pageContext.request.contextPath}/IndexAction_catagory?currentPage=${page1}&type_id=<s:property value="#currentId"/>">${page1 }</a></li>
							</c:if>
						</c:forEach>


						<!-- 下一页 -->
						<c:if test="${pageBean1.currentPage==pageBean1.totalPage }">
							<li class="disabled"><a href="javascript:void(0);"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
						<c:if test="${pageBean1.currentPage!=pageBean1.totalPage }">
							<li><a
								href="${pageContext.request.contextPath}/IndexAction_catagory?currentPage=${pageBean1.currentPage+1 }&type_id=<s:property value="#currentId"/>"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
					</ul>
				</div>
				
				</s:if>
				
				<s:else>
				<div class="clearfix">
				
					<ul class="pagination"
						style="text-align: center; margin-top: 10px;">
						<!-- 上一页 -->
						<c:if test="${pageBean.currentPage==1 }">
							<li class="disabled"><a href="javascript:void(0);"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:if test="${pageBean.currentPage!=1 }">
							<li><a
								href="${pageContext.request.contextPath}/IndexAction_articleTypeList?currentPage=${pageBean.currentPage-1 }"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>

						<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
							<c:if test="${page==pageBean.currentPage }">
								<li class="active"><a href="javascript:void(0);">${page }</a></li>
							</c:if>
							<c:if test="${page!=pageBean.currentPage }">
								<li><a
									href="${pageContext.request.contextPath}/IndexAction_articleTypeList?currentPage=${page }">${page }</a></li>
							</c:if>
						</c:forEach>


						<!-- 下一页 -->
						<c:if test="${pageBean.currentPage==pageBean.totalPage }">
							<li class="disabled"><a href="javascript:void(0);"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
						<c:if test="${pageBean.currentPage!=pageBean.totalPage }">
							<li><a
								href="${pageContext.request.contextPath}/IndexAction_articleTypeList?currentPage=${pageBean.currentPage+1 }"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
					</ul>
				</div>
				</s:else>
				</div>

				<div class="col-md-4">
					<div class="panel panel-default hot-recommend">
						<div class="panel-heading">阅读排行				
				    </div>
						<div class="panel-body">
							<ul class="list-unstyled">
								<s:iterator value="hotArticleList" var="article" status="sta">
								<li><s:property value="#sta.index+1" />: 
								<a href="${pageContext.request.contextPath}/ArticleAction_detail?article_id=<s:property value='#article.article_id'/>"><s:property value="#article.title" /></a>
									<h6>阅读次数:<s:property value="#article.read_count" /></h6>
									<h6>作者:<s:property value="#article.author.username" /></h6>
								</li> 
								</s:iterator>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="position: fixed; bottom: 20px; right: 45%; color: grey">
			<span>计算机系1704许一清制作|QQ:2023503307</span>
		</div>
</body>
</html>