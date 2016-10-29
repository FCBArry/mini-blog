package mini.fans.service;

import java.util.List;

import javax.annotation.Resource;

import mini.fans.dao.FansDao;
import mini.fans.domain.Fans;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public class FansService {
	@Resource private FansDao fansDao;

	public List<Fans> findByMeid(String uid) {
		return fansDao.findByMeid(uid);
	}

	public List<Fans> findByUid(String uid) {
		return fansDao.findByUid(uid);
	}

	public int findMTONum(String uid) {
		return fansDao.findMTONum(uid);
	}

	public int findOTMNum(String uid) {
		return fansDao.findOTMNum(uid);
	}

	public boolean changeFan(Fans fans) {
		Fans _fans = fansDao.findbyMO(fans);
		if(_fans == null){
			fans.setIsfocus(1);
			fansDao.add(fans);
			return true;
		}
		if(_fans.getIsfocus() == 1){
			_fans.setIsfocus(0);
			fansDao.update(_fans);
			return false;
		}
		_fans.setIsfocus(1);
		fansDao.update(_fans);
		return true;
	}

	public boolean status(Fans fans) {
		Fans _fans = fansDao.findbyMO(fans);
		if(_fans == null)
			return false;
		if(_fans.getIsfocus() == 1)
			return true;
		return false;
	}
	
}
