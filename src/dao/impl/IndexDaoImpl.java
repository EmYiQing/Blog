package dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import dao.IndexDao;
import domain.Article;
import domain.Articletype;
@SuppressWarnings("all")
public class IndexDaoImpl extends HibernateDaoSupport implements IndexDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Articletype> getArticleType() {
		return (List<Articletype>) getHibernateTemplate().find("from Articletype");
	}

	@Override
	public List<Article> getArticle() {
		// TODO Auto-generated method stub
		return (List<Article>) getHibernateTemplate().find("from Article");
	}

	@Override
	public List<Article> getHotArticle() {
		String hql = "from Article order by read_count desc";
		return (List<Article>) getHibernateTemplate().find(hql);
	}

	@Override
	public List<Article> getArticleByCatagory(String id) {
		String hql = "from Article where article_type_id="+id;
		
		return (List<Article>) getHibernateTemplate().find(hql);
	}

	@Override
	public int getCount() {
		String hql = "select count(a) from Article a";
		List<Object> list = (List<Object>) getHibernateTemplate().find(hql);
		int count = new Long((long) list.get(0)).intValue();
		return count;
	}

	@Override
	public List<Article> fingArticleByPage(final int index, final int currentCount) {
		List<Article> list = getHibernateTemplate().execute(new HibernateCallback<List<Article>>() {
			@Override
			public List<Article> doInHibernate(Session session) throws HibernateException {
				String hql = "from Article";
				Query query = session.createQuery(hql);
				query.setFirstResult(index);
				query.setMaxResults(currentCount);
				List<Article> article = query.list();
				return article;
			}
		});
		return list;
	}

	@Override
	public List<Article> fingArticleByPage(final String type_id,final int index,final int currentCount) {
		List<Article> list = getHibernateTemplate().execute(new HibernateCallback<List<Article>>() {
			@Override
			public List<Article> doInHibernate(Session session) throws HibernateException {
				String hql = "from Article where article_type_id="+type_id;
				Query query = session.createQuery(hql);
				query.setFirstResult(index);
				query.setMaxResults(currentCount);
				List<Article> article = query.list();
				return article;
			}
		});
		return list;
	}

	@Override
	public int getCount(String type_id) {
		String hql = "select count(a) from Article a where article_type_id="+type_id;
		List<Object> list = (List<Object>) getHibernateTemplate().find(hql);
		int count = new Long((long) list.get(0)).intValue();
		return count;
	}

}
