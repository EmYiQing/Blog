package service.impl;

import java.util.List;

import dao.ArticleDao;
import domain.Article;
import domain.Comment;
import domain.Up;
import service.ArticleService;

public class ArticleServiceImpl implements ArticleService {

	private ArticleDao articleDao;

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}

	@Override
	public Article getArticleDetail(String article_id) {
		return articleDao.getArticleDetail(article_id);
		
	}

	@Override
	public void good(String article_id, String u_id) {
		Up up = null;
		try{
		up = articleDao.findgood(article_id,u_id);
		if(up.getNid()!=null){
			return;
		}
		}catch(Exception e){
			articleDao.good(article_id, u_id);
		}
	}

	@Override
	public void comment(String content, String article_id, String u_id) {
		articleDao.saveComment(content,article_id, u_id);
		articleDao.comment(article_id);
	}

	@Override
	public List<Comment> getComment(String article_id) {
		return articleDao.getComment(article_id);
		
	}

	@Override
	public void write(Article article) {
		articleDao.write(article);
		articleDao.addcount(article);
		
	}

	@Override
	public void read(String article_id) {
		articleDao.count(article_id);
		
	}

	@Override
	public List<Article> getArticleByUid(String u_id) {
		return articleDao.getArticleByUid(u_id);
	}

	@Override
	public void delete(String article_id) {
		articleDao.delete(article_id);
		
	}

	@Override
	public void deleteComment(String comment_cid) {
		List<Comment> comments = articleDao.getArticleIdByCid(comment_cid);
		String article_id = String.valueOf(comments.get(0).getArticle().getArticle_id());
		articleDao.deleteComment(comment_cid,article_id);
	}
	
}
