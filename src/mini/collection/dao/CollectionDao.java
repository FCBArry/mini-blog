package mini.collection.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import mini.collection.domain.Collection;
import mini.pager.Expression;
import mini.pager.PageBean;
import mini.pager.PageConstants;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

public class CollectionDao {
	@Resource
	private SessionFactory sessionFactory;

	public void update(Collection _collection) {
		sessionFactory.getCurrentSession().update(_collection);
	}

	public void add(Collection collection) {
		sessionFactory.getCurrentSession().save(collection);
	}

	public Collection findbyPU(Collection collection) {
		String hql = "from Collection where pid=? and uid=?";
		@SuppressWarnings("unchecked")
		List<Collection> list=sessionFactory.getCurrentSession().createQuery(hql).
			setParameter(0, collection.getPost().getPid()).
			setParameter(1, collection.getUser().getUid()).list();
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public PageBean<Collection> findByUid(String uid, int pc) {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("uid", "=", uid));
		return findByCriteria(exprList, pc);
	}
	
	/**
	 * 通用的查询方法
	 * 
	 * @param exprList
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	private PageBean<Collection> findByCriteria(List<Expression> exprList, int pc) {
		/*
		 * 1. 得到ps 2. 得到tr 3. 得到beanList 4. 创建PageBean，返回
		 */
		
		/*
		 * 1. 得到ps
		 */
		int ps = PageConstants.EVERY_PAGE_SIZE;// 每页记录数
		
		/*
		 * 2. 通过exprList来生成where子句
		 */
		StringBuilder whereSql = new StringBuilder(" where 1=1");
		List<Object> params = new ArrayList<Object>();// SQL中有问号，它是对应问号的值
		for (Expression expr : exprList) {
			/*
			 * 添加一个条件上， 1) 以and开头 2) 条件的名称 3) 条件的运算符，可以是=、!=、>、< ... is null，is
			 * null没有值 4) 如果条件不是is null，再追加问号，然后再向params中添加一与问号对应的值
			 */
			whereSql.append(" and ").append(expr.getName()).append(" ")
					.append(expr.getOperator()).append(" ");
			// where 1=1 and bid = ?
			if (!expr.getOperator().equals("is null")) {
				whereSql.append("?");
				params.add(expr.getValue());
			}
		}

		/*
		 * 3. 总记录数
		 */
		String hql = "select count(*) from Collection" + whereSql;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		for (int i = 0; i < params.size(); i++) {
			query.setParameter(i, params.get(i));
		}
		Number number = (Number) query.uniqueResult();
		int tr = number.intValue();// 得到了总记录数
		
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		hql = "from Collection" + whereSql;
		Query mquery = sessionFactory.getCurrentSession().createQuery(hql);
		for (int i = 0; i < params.size(); i++) {
			mquery.setParameter(i, params.get(i));
		}
		List<Collection> beanList = mquery.setFirstResult((pc - 1) * ps)
				.setMaxResults(ps).list();
		
		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<Collection> pb = new PageBean<Collection>();
		/*
		 * 其中PageBean没有url，这个任务由Servlet完成
		 */
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);

		return pb;
	}
	
}
