package mini.favour.dao;

import java.util.List;

import javax.annotation.Resource;

import mini.favour.domain.Favour;

import org.hibernate.SessionFactory;

public class FavourDao {
	@Resource
	private SessionFactory sessionFactory;

	public Favour findbyPU(Favour favour) {
		String hql = "from Favour where pid=? and uid=?";
		@SuppressWarnings("unchecked")
		List<Favour> list = sessionFactory.getCurrentSession().createQuery(hql)
				.setParameter(0, favour.getPost().getPid())
				.setParameter(1, favour.getUser().getUid()).list();
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public void add(Favour favour) {
		sessionFactory.getCurrentSession().save(favour);
	}

	public void update(Favour _favour) {
		sessionFactory.getCurrentSession().clear();
		sessionFactory.getCurrentSession().update(_favour);
	}

	public int findFavourNum(String uid) {
		String hql = "select count(*) from Favour where uid=? and fstatus=?";
		Long numFavour = (Long) sessionFactory.getCurrentSession()
				.createQuery(hql).setParameter(0, uid).setParameter(1, 1)
				.uniqueResult();
		return numFavour.intValue();
	}

}
