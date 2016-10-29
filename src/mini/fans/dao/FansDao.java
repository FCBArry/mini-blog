package mini.fans.dao;

import java.util.List;

import javax.annotation.Resource;

import mini.fans.domain.Fans;
import mini.post.domain.Post;

import org.hibernate.SessionFactory;

public class FansDao {
	@Resource
	private SessionFactory sessionFactory;

	public List<Fans> findByMeid(String uid) {
		String hql = "from Fans where meuid=? and isfocus =?";
		List<Fans> fans = sessionFactory.getCurrentSession().createQuery(hql)
				.setParameter(0, uid).setParameter(1, 1).list();
		return fans;
	}

	public List<Fans> findByUid(String uid) {
		String hql = "from Fans where otheruid=? and isfocus =?";
		List<Fans> fans = sessionFactory.getCurrentSession().createQuery(hql)
				.setParameter(0, uid).setParameter(1, 1).list();
		return fans;
	}

	public int findMTONum(String uid) {
		String hql = "select count(*) from Fans where meuid=? and isfocus=?";
		Long numFans = (Long) sessionFactory.getCurrentSession()
				.createQuery(hql).setParameter(0, uid).setParameter(1, 1)
				.uniqueResult();
		return numFans.intValue();
	}

	public int findOTMNum(String uid) {
		String hql = "select count(*) from Fans where otheruid=? and isfocus=?";
		Long numFans = (Long) sessionFactory.getCurrentSession()
				.createQuery(hql).setParameter(0, uid).setParameter(1, 1)
				.uniqueResult();
		return numFans.intValue();
	}

	public Fans findbyMO(Fans fans) {
		String hql = "from Fans where meuid=? and otheruid=?";
		@SuppressWarnings("unchecked")
		List<Fans> list = sessionFactory.getCurrentSession().createQuery(hql)
				.setParameter(0, fans.getUserMe().getUid())
				.setParameter(1, fans.getUserOther().getUid()).list();
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public void add(Fans fans) {
		sessionFactory.getCurrentSession().save(fans);
	}

	public void update(Fans _fans) {
		sessionFactory.getCurrentSession().update(_fans);
	}

}
