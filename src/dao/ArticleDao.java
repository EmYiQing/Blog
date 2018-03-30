package dao;

import java.util.List;

import domain.Article;
import domain.Comment;
import domain.Up;

public interface ArticleDao {

	Article getArticleDetail(String article_id);

	Up findgood(String article_id, String u_id);

	void good(String article_id, String u_id);

	void saveComment(String content, String article_id, String u_id);

	List<Comment> getComment(String article_id);

	void write(Article article);
	
	void comment(String article_id);
	
	void count(String article_id);

	void addcount(Article article);

	List<Article> getArticleByUid(String u_id);

	void delete(String article_id);

	void deleteComment(String comment_cid, String article_id);

	List<Comment> getArticleIdByCid(String comment_cid);

}
