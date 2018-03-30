package service;

import java.util.List;

import domain.Article;
import domain.Comment;

public interface ArticleService {

	Article getArticleDetail(String article_id);

	void good(String article_id, String u_id);

	void comment(String content, String article_id, String u_id);

	List<Comment> getComment(String article_id);

	void write(Article article);

	void read(String article_id);

	List<Article> getArticleByUid(String u_id);

	void delete(String article_id);

	void deleteComment(String comment_cid);


}
