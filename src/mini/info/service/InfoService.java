package mini.info.service;

import javax.annotation.Resource;

import mini.info.dao.InfoDao;
import mini.info.domain.Info;
import mini.pager.PageBean;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public class InfoService {
	@Resource
	private InfoDao infoDao;

	public Info findByUid(String uid) {
		return infoDao.findByUid(uid);
	}

	public void add(Info info) {
		infoDao.add(info);
	}

	public void update(Info _info) {
		infoDao.update(_info);
	}

	public PageBean<Info> findFriend(Info info, int pc) {
		return infoDao.findFriend(info, pc);
	}
	
}
