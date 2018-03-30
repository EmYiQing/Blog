package service.impl;

import java.util.List;

import dao.IndexDao;
import domain.Article;
import domain.Articletype;
import domain.PageBean;
import service.IndexService;
@SuppressWarnings("all")
public class IndexServiceImpl implements IndexService {

	private IndexDao indexDao;
	
	@Override
	public List<Articletype> getArticleType() {
		return indexDao.getArticleType();
	}

	public void setIndexDao(IndexDao indexDao) {
		this.indexDao = indexDao;
	}

	@Override
	public List<Article> getArticle() {
		
		return indexDao.getArticle();
	}

	@Override
	public List<Article> getHotArticle() {
		List<Article> list = indexDao.getHotArticle();
		if (list.size()<11) {
			return list;
		}
		list = list.subList(0, 10);
		return list;
	}

	@Override
	public List<Article> getArticleByCatagory(String id) {
		
		return indexDao.getArticleByCatagory(id);
	}

	@Override
	public PageBean findArticle(int currentPage, int currentCount) {
		PageBean<Article> pageBean = new PageBean<Article>();
		pageBean.setCurrentPage(currentPage);
		pageBean.setCurrentCount(currentCount);
		int totalCount = 0;
		try {
			totalCount = indexDao.getCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / currentCount);
		pageBean.setTotalPage(totalPage);
		
		int index = (currentPage - 1) * currentCount;
		List<Article> list = null;
		try {
			list = indexDao.fingArticleByPage(index, currentCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public PageBean findArticleByType(String type_id, int currentPage, int currentCount) {
		PageBean<Article> pageBean = new PageBean<Article>();
		pageBean.setCurrentPage(currentPage);
		pageBean.setCurrentCount(currentCount);
		int totalCount = 0;
		try {
			totalCount = indexDao.getCount(type_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / currentCount);
		pageBean.setTotalPage(totalPage);

		int index = (currentPage - 1) * currentCount;
		List<Article> list = null;
		try {
			list = indexDao.fingArticleByPage(type_id,index, currentCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
		pageBean.setList(list);
		
		return pageBean;
	}

}
