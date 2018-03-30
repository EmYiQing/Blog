package dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import dao.ArticleDao;
import domain.Article;
import domain.Comment;
import domain.Up;

@SuppressWarnings("all")
public class ArticleDaoImpl extends HibernateDaoSupport implements ArticleDao {

	@Override
	public Article getArticleDetail(final String article_id) {
		String hql = "from Article where article_id=" + article_id;

		List<Article> articles = (List<Article>) getHibernateTemplate().find(hql);

		return articles.get(0);
	}

	public void count(final String article_id) {
		getHibernateTemplate().execute(new HibernateCallback<Object>() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				String sql = "update blog_article set read_count=read_count+1 where article_id=?";
				Query query = session.createSQLQuery(sql);
				query.setParameter(0, article_id);
				query.executeUpdate();
				return null;
			}
		});
	}

	@Override
	public Up findgood(String article_id, String u_id) {
		String hql = "from Up where article_id=" + article_id + "and user_id=" + u_id;
		List<Up> ups = (List<Up>) getHibernateTemplate().find(hql);
		if (ups != null) {
			return ups.get(0);
		}
		throw new RuntimeException();
	}

	@Override
	public void good(final String article_id, final String u_id) {
		getHibernateTemplate().execute(new HibernateCallback<Object>() {

			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				String sql = "insert into blog_up(article_id,user_id) values(?,?)";
				Query query = session.createSQLQuery(sql);
				query.setParameter(0, article_id);
				query.setParameter(1, u_id);
				query.executeUpdate();
				return null;

			}
		});

		getHibernateTemplate().execute(new HibernateCallback<Object>() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				String sql = "update blog_article set up_count=up_count+1 where article_id=?";
				Query query = session.createSQLQuery(sql);
				query.setParameter(0, article_id);
				query.executeUpdate();
				return null;
			}
		});
	}

	@Override
	public void saveComment(final String content, final String article_id, final String u_id) {
		getHibernateTemplate().execute(new HibernateCallback<Object>() {

			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				String sql = "insert into blog_comment (content,comment_time,article_id,user_id) values(?,?,?,?)";
				Query query = session.createSQLQuery(sql);
				query.setParameter(0, content);
				Date date = new Date();
				SimpleDateFormat time = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				String create_time = time.format(date);
				query.setParameter(1, create_time);
				query.setParameter(2, article_id);
				query.setParameter(3, u_id);
				query.executeUpdate();
				return null;
			}
		});

	}

	@Override
	public List<Comment> getComment(String article_id) {
		String hql = "from Comment where article_id=" + article_id;
		return (List<Comment>) getHibernateTemplate().find(hql);
	}

	@Override
	public void write(final Article article) {
		getHibernateTemplate().execute(new HibernateCallback<Article>() {

			@Override
			public Article doInHibernate(Session session) throws HibernateException {
				String sql = "insert into blog_article (title,summary,read_count,comment_count,up_count,create_time,article_type_id,article_author_id,article_detail) values(?,?,0,0,0,?,?,?,?)";
				Query query = session.createSQLQuery(sql);
				query.setParameter(0, article.getTitle());
				query.setParameter(1, article.getSummary());
				query.setParameter(2, article.getCreate_time());
				query.setParameter(3, article.getArticle_type_id());
				query.setParameter(4, article.getAuthor_id());
				query.setParameter(5, article.getArticle_detail());
				query.executeUpdate();
				return null;
			}
		});
	}

	@Override
	public void comment(final String article_id) {
		getHibernateTemplate().execute(new HibernateCallback<Object>() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				String sql = "update blog_article set comment_count=comment_count+1 where article_id=?";
				Query query = session.createSQLQuery(sql);
				query.setParameter(0, article_id);
				query.executeUpdate();
				return null;
			}
		});
	}

	@Override
	public void addcount(final Article article) {
		getHibernateTemplate().execute(new HibernateCallback<Object>() {

			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				String sql = "update blog_user set article_count=article_count+1 where u_id=?";
				Query query = session.createSQLQuery(sql);
				query.setParameter(0, article.getAuthor_id());
				query.executeUpdate();
				return null;
			}
		});

	}

	@Override
	public List<Article> getArticleByUid(String u_id) {
		String hql = "from Article where article_author_id=" + u_id;
		return (List<Article>) getHibernateTemplate().find(hql);
	}

	@Override
	public void delete(final String article_id) {

		getHibernateTemplate().execute(new HibernateCallback<Object>() {

			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				String sql = "delete from blog_up where article_id=?";
				Query query = session.createSQLQuery(sql);
				query.setParameter(0, article_id);
				query.executeUpdate();
				return null;
			}
		});
		getHibernateTemplate().execute(new HibernateCallback<Object>() {

			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				String sql = "delete from blog_comment where article_id=?";
				Query query = session.createSQLQuery(sql);
				query.setParameter(0, article_id);
				query.executeUpdate();
				return null;
			}
		});

		getHibernateTemplate().execute(new HibernateCallback<Object>() {

			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				String sql = "delete from blog_article where article_id=?";
				Query query = session.createSQLQuery(sql);
				query.setParameter(0, article_id);
				query.executeUpdate();
				return null;
			}
		});
	}

	@Override
	public void deleteComment(final String comment_cid, final String article_id) {
		getHibernateTemplate().execute(new HibernateCallback<Comment>() {

			@Override
			public Comment doInHibernate(Session session) throws HibernateException {
				String sql = "delete from blog_comment where cid=?";
				Query query = session.createSQLQuery(sql);
				query.setParameter(0, comment_cid);
				query.executeUpdate();
				return null;
			}
		});
		
		getHibernateTemplate().execute(new HibernateCallback<Object>() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				String sql = "update blog_article set comment_count=comment_count-1 where article_id=?";
				Query query = session.createSQLQuery(sql);
				query.setParameter(0, article_id);
				query.executeUpdate();
				return null;
			}
		});
	}

	@Override
	public List<Comment> getArticleIdByCid(String comment_cid) {
		String hql = "from Comment where cid="+comment_cid;
		return (List<Comment>) getHibernateTemplate().find(hql);
	}

}
