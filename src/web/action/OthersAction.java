package web.action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import service.ArticleService;
import service.impl.ArticleServiceImpl;
@SuppressWarnings("all")
public class OthersAction extends ActionSupport {
	
	ArticleService articleService = new ArticleServiceImpl();

	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	public String good(){
		String[] article_ids = (String[]) ActionContext.getContext().getParameters().get("article_id");
		String[] u_ids = (String[]) ActionContext.getContext().getParameters().get("user_id");
		String article_id = article_ids[0];
		String u_id = u_ids[0];
		articleService.good(article_id,u_id);
		return "good";
	}
	
	public String comment(){
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		String[] article_ids = (String[]) ActionContext.getContext().getParameters().get("article_id");
		String[] u_ids = (String[]) ActionContext.getContext().getParameters().get("user_id");
		String article_id = article_ids[0];
		String u_id = u_ids[0];
		String content = ServletActionContext.getRequest().getParameter("content");
		articleService.comment(content,article_id,u_id);
		return "reply";
	}
	
	public String deleteComment(){
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		String[] comment_cids = (String[]) ActionContext.getContext().getParameters().get("comment_cid");
		String comment_cid = comment_cids[0];
		articleService.deleteComment(comment_cid);
		return "delete";
	}
	
}
