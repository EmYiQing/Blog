package web.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import domain.Article;
import domain.Comment;
import service.ArticleService;
import service.impl.ArticleServiceImpl;


public class ArticleAction extends ActionSupport implements ModelDriven<Article> {
	private Article article = new Article();
	private ArticleService articleService = new ArticleServiceImpl();
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	public String detail() throws Exception{
		String[] article_ids = (String[]) ActionContext.getContext().getParameters().get("article_id");
		String article_id = article_ids[0];
		Article article = articleService.getArticleDetail(article_id);
		articleService.read(article_id);
		List<Comment> comments = articleService.getComment(article_id);
		ActionContext.getContext().put("article", article);
		ActionContext.getContext().put("comments", comments);
		return "toDetail";
	}
	
	public String write() throws Exception{
		String[] author_ids = (String[]) ActionContext.getContext().getParameters().get("author_id");
		String[] article_type_ids = (String[]) ActionContext.getContext().getParameters().get("article_type_id");
		String article_type_id = article_type_ids[0];
		String author_id = author_ids[0];
		Date date = new Date();
		SimpleDateFormat time = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String create_time = time.format(date);
		article.setCreate_time(create_time);
		article.setAuthor_id(author_id);
		article.setArticle_type_id(article_type_id);
		articleService.write(article);
		return "write";
	}
	
	public String manage() throws Exception{
		String[] u_ids = (String[]) ActionContext.getContext().getParameters().get("user_id");
		String u_id = u_ids[0];
		List<Article> articles =  articleService.getArticleByUid(u_id);
		ActionContext.getContext().put("articles", articles);
		return "manage";
		
	}
	
	public String delete() throws Exception{
		String[] article_ids = (String[]) ActionContext.getContext().getParameters().get("article_id");
		String article_id = article_ids[0];
		String[] u_ids = (String[]) ActionContext.getContext().getParameters().get("user_id");
		String u_id = u_ids[0];
		articleService.delete(article_id);
		List<Article> articles =  articleService.getArticleByUid(u_id);
		ActionContext.getContext().put("articles", articles);
		return "manage";
	}
	
	public String edit() throws Exception{
		String[] article_ids = (String[]) ActionContext.getContext().getParameters().get("article_id");
		String article_id = article_ids[0];
		Article article = articleService.getArticleDetail(article_id);
		ActionContext.getContext().put("article", article);
		return "edit";
	}
	
	@Override
	public Article getModel() {
		return article;
	}
	
}
