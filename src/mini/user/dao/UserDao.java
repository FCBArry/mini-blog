package mini.user.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import mini.pager.Expression;
import mini.pager.PageBean;
import mini.pager.PageConstants;
import mini.user.domain.User;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

public class UserDao {
	@Resource private SessionFactory sessionFactory;
	
	/**
	 * 通用的查询方法
	 * 
	 * @param exprList
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	private PageBean<User> findByCriteria(List<Expression> exprList, int pc) {
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
		String hql = "select count(*) from User" + whereSql;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		for (int i = 0; i < params.size(); i++) {
			query.setParameter(i, params.get(i));
		}
		Number number = (Number) query.uniqueResult();
		int tr = number.intValue();// 得到了总记录数

		/*
		 * 4. 得到beanList，即当前页记录
		 */
		hql = "from User" + whereSql;
		Query mquery = sessionFactory.getCurrentSession().createQuery(hql);
		for (int i = 0; i < params.size(); i++) {
			mquery.setParameter(i, params.get(i));
		}
		List<User> beanList = mquery.setFirstResult((pc - 1) * ps)
				.setMaxResults(ps).list();

		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<User> pb = new PageBean<User>();
		/*
		 * 其中PageBean没有url，这个任务由Servlet完成
		 */
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);

		return pb;
	}
	
	public boolean ajaxValidateLoginname(String loginname) {
		String hql = "select count(*) from User where username=?";
		Number number = (Number)sessionFactory.getCurrentSession().createQuery(hql).
				setParameter(0, loginname).list().get(0);
		return number.intValue() == 0;
	}

	public boolean ajaxValidateEmail(String email) {
		String hql = "select count(*) from User where email=?";
		Number number = (Number)sessionFactory.getCurrentSession().createQuery(hql).
				setParameter(0, email).list().get(0);
		//另一种写法
		/*int count=(Integer) sessionFactory.getCurrentSession().createQuery(hql).
				setParameter(0, email).uniqueResult();*/
		return number.intValue() == 0;
	}

	public void add(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	public User findByCode(String code) {
		String hql = "from User where activationCode = ?";
		@SuppressWarnings("unchecked")
		List<User> list=sessionFactory.getCurrentSession().createQuery(hql).
				setParameter(0, code).list();
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public void updateStatus(User user) {
		sessionFactory.getCurrentSession().update(user);
	}

	public User findByLoginnameAndLoginpass(String username, String password) {
		String hql = "from User where username=? and password=?";
		@SuppressWarnings("unchecked")
		List<User> list=sessionFactory.getCurrentSession().createQuery(hql).
			setParameter(0, username).setParameter(1, password).list();
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public User findByUid(String otheruid) {
		String hql = "from User where uid = ?";
		@SuppressWarnings("unchecked")
		List<User> list=sessionFactory.getCurrentSession().createQuery(hql).
				setParameter(0, otheruid).list();
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public PageBean<User> findAll(int pc) {
		List<Expression> exprList = new ArrayList<Expression>();
		return findByCriteria(exprList, pc);
	}

	public void delete(User user) {
		sessionFactory.getCurrentSession().delete(user);
	}
	
}
