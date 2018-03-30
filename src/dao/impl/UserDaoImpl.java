package dao.impl;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import dao.UserDao;
import domain.User;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
	@Override
	public User getByUsername(final String username) {
		// HQL方式查询
		return getHibernateTemplate().execute(new HibernateCallback<User>() {
			@Override
			public User doInHibernate(Session session) throws HibernateException {
				String hql = "from User where username = ? ";
				Query query = session.createQuery(hql);
				query.setParameter(0, username);
				User user = (User) query.uniqueResult();
				return user;
			}
		});
	}

	@Override
	public void save(User user) {
		user.setArticle_count(0);
		user.setAvatar("default");
		getHibernateTemplate().save(user);
	}

	@Override
	public void setAvatarByUid(final String u_id, final String file1FileName) {
		getHibernateTemplate().execute(new HibernateCallback<User>() {

			@Override
			public User doInHibernate(Session session) throws HibernateException {
				String sql = "update blog_user set avatar=? where u_id=?";
				Query query = session.createSQLQuery(sql);
				query.setParameter(0, file1FileName);
				query.setParameter(1, u_id);
				query.executeUpdate();
				return null;
			}
		});
	}

}
