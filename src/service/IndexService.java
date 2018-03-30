package service;

import java.util.List;

import domain.Article;
import domain.Articletype;
import domain.PageBean;
@SuppressWarnings("all")
public interface IndexService {

	List<Articletype> getArticleType();

	List<Article> getArticle();

	List<Article> getHotArticle();

	List<Article> getArticleByCatagory(String id);
	
	PageBean findArticleByType(String type_id, int currentPage, int currentCount);

	PageBean findArticle(int currentPage, int currentCount);

}
