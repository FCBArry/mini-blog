package mini.admin.user.dao;

import mini.admin.user.domain.Admin;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;

public class AdminDao {
	@Resource
	private SessionFactory sessionFactory;

	public Admin find(String adminname, String adminpwd) {
		String hql = "from Admin where adminname=? and adminpwd=?";
		return (Admin) sessionFactory.getCurrentSession().createQuery(hql)
				.setParameter(0, adminname).setParameter(1, adminpwd)
				.uniqueResult();
	}
}
