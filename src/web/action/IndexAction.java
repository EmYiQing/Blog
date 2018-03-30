package web.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import domain.Article;
import domain.Articletype;
import domain.PageBean;
import service.IndexService;

@SuppressWarnings("all")
public class IndexAction extends ActionSupport {
	
	private IndexService indexService;
	
	private String currentPagestr;
	
	private String[] article_type_id;
	
	public void setArticle_type_id(String[] article_type_id) {
		this.article_type_id = article_type_id;
	}

	public String articleTypeList() throws Exception{
		List<Articletype> article_type_list = indexService.getArticleType();
		ActionContext.getContext().put("list",article_type_list );
		
		String[] current = (String[]) ActionContext.getContext().getParameters().get("currentPage");
		try{
			currentPagestr = current[0];
		}catch(Exception e){
			currentPagestr = "1";
		}
		int currentPage = Integer.parseInt(currentPagestr);
		int currentCount = 12;
		PageBean pageBean = indexService.findArticle(currentPage,currentCount);
		ActionContext.getContext().put("pageBean", pageBean);
		
		/*
		List<Article> articles = indexService.getArticle();
		ActionContext.getContext().put("articleList", articles);
		*/
		
		List<Article> hotArticles = indexService.getHotArticle();
		ActionContext.getContext().put("hotArticleList", hotArticles);
		return "list";
	}
	
	public String catagory() throws Exception{
		List<Articletype> article_type_list = indexService.getArticleType();
		ActionContext.getContext().put("list",article_type_list );
		article_type_id = (String[]) ActionContext.getContext().getParameters().get("type_id");
		String type_id ;
	    type_id = article_type_id[0];

		
		String[] current = (String[]) ActionContext.getContext().getParameters().get("currentPage");
		try{
			currentPagestr = current[0];
		}catch(Exception e){
			currentPagestr = "1";
		}
		int currentPage = Integer.parseInt(currentPagestr);
		int currentCount = 12;
		PageBean pageBean = indexService.findArticleByType(type_id,currentPage,currentCount);
		ActionContext.getContext().put("pageBean1", pageBean);
		
		/*
		List<Article> theList = indexService.getArticleByCatagory(type_id);
		ActionContext.getContext().put("theList", theList);
		*/
		
		ActionContext.getContext().put("currentId", type_id);
		List<Article> hotArticles = indexService.getHotArticle();
		ActionContext.getContext().put("hotArticleList", hotArticles);
		return "list";
	}

	public String getCurrentPagestr() {
		return currentPagestr;
	}

	public void setCurrentPagestr(String currentPagestr) {
		this.currentPagestr = currentPagestr;
	}

	public void setIndexService(IndexService indexService) {
		this.indexService = indexService;
	}
	
	
}
