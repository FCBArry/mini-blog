package mini.post.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import mini.pager.Expression;
import mini.pager.PageBean;
import mini.pager.PageConstants;
import mini.post.domain.Post;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

public class PostDao {
	@Resource
	private SessionFactory sessionFactory;

	public void add(Post post) {
		sessionFactory.getCurrentSession().save(post);
	}

	/**
	 * 通用的查询方法
	 * 
	 * @param exprList
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	private PageBean<Post> findByCriteria(List<Expression> exprList, int pc) {
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
				if (expr.getName().equals("pstatus")
						|| expr.getName().equals("pzan")
						|| expr.getName().equals("pcomment"))
					params.add(Integer.parseInt(expr.getValue()));
				else
					params.add(expr.getValue());
			}
		}

		/*
		 * 3. 总记录数
		 */
		String hql = "select count(*) from Post" + whereSql;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		for (int i = 0; i < params.size(); i++) {
			query.setParameter(i, params.get(i));
		}
		Number number = (Number) query.uniqueResult();
		int tr = number.intValue();// 得到了总记录数

		/*
		 * 4. 得到beanList，即当前页记录
		 */
		hql = "from Post" + whereSql + " order by ptime";
		Query mquery = sessionFactory.getCurrentSession().createQuery(hql);
		for (int i = 0; i < params.size(); i++) {
			mquery.setParameter(i, params.get(i));
		}
		List<Post> beanList = mquery.setFirstResult((pc - 1) * ps)
				.setMaxResults(ps).list();

		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<Post> pb = new PageBean<Post>();
		/*
		 * 其中PageBean没有url，这个任务由Servlet完成
		 */
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);

		return pb;
	}

	public Post findByPid(String pid) {
		String hql = "from Post where pid=?";
		Post post = (Post) sessionFactory.getCurrentSession().createQuery(hql)
				.setParameter(0, pid).list().get(0);
		return post;
	}

	public PageBean<Post> findPostByUid(String uid, int pc) {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("uid", "=", uid));
		return findByCriteria(exprList, pc);
	}

	public PageBean<Post> findByStatus(int status, int pc) {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("pstatus", "=", status + ""));
		return findByCriteria(exprList, pc);
	}

	public PageBean<Post> findByTitle(String title, int pc) {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("ptitle", "like", "%" + title + "%"));
		exprList.add(new Expression("pstatus", "=", 1 + ""));
		return findByCriteria(exprList, pc);
	}

	public int findPostNum(String uid) {
		String hql = "select count(*) from Post where uid=?";
		Long numPost = (Long) sessionFactory.getCurrentSession()
				.createQuery(hql).setParameter(0, uid).uniqueResult();
		return numPost.intValue();
	}

	public void update(Post post) {
		sessionFactory.getCurrentSession().update(post);
	}

	public List<Post> findHotZan() {
		String hql = "from Post where pstatus=1 order by pzan desc";
		List<Post> postList = sessionFactory.getCurrentSession()
				.createQuery(hql).setFirstResult(0).setMaxResults(5).list();
		return postList;
	}

	public List<Post> findHotComment() {
		String hql = "from Post where pstatus=1 order by pcomment desc";
		List<Post> postList = sessionFactory.getCurrentSession()
				.createQuery(hql).setFirstResult(0).setMaxResults(5).list();
		return postList;
	}

	public PageBean<Post> findHot(int pc) {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("pzan", ">=", 2 + ""));
		exprList.add(new Expression("pcomment", ">=", 2 + ""));
		exprList.add(new Expression("pstatus", "=", 1 + ""));
		return findByCriteria(exprList, pc);
	}

	public void delete(Post post) {
		sessionFactory.getCurrentSession().delete(post);
	}

	public PageBean<Post> findAll(int pc) {
		List<Expression> exprList = new ArrayList<Expression>();
		return findByCriteria(exprList, pc);
	}
}
