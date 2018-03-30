package dao;

import java.util.List;

import domain.Article;
import domain.Articletype;

public interface IndexDao {

	List<Articletype> getArticleType();

	List<Article> getArticle();

	List<Article> getHotArticle();

	List<Article> getArticleByCatagory(String id);

	int getCount();

	List<Article> fingArticleByPage(int index, int currentCount);

	List<Article> fingArticleByPage(String type_id, int index, int currentCount);

	int getCount(String type_id);

}
