package mini.collection.service;

import javax.annotation.Resource;

import mini.collection.dao.CollectionDao;
import mini.collection.domain.Collection;
import mini.favour.domain.Favour;
import mini.pager.PageBean;
import mini.post.domain.Post;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public class CollectionService {
	@Resource
	private CollectionDao collectionDao;

	public boolean changeCollection(Collection collection) {
		Collection _collection = collectionDao.findbyPU(collection);
		if(_collection == null){
			collection.setColstatus(1);
			collectionDao.add(collection);
			return true;
		}
		if(_collection.getColstatus() == 1){
			_collection.setColstatus(0);
			collectionDao.update(_collection);
			return false;
		}
		_collection.setColstatus(1);
		collectionDao.update(_collection);
		return true;
	}

	public boolean status(Collection collection) {
		Collection _collection = collectionDao.findbyPU(collection);
		if(_collection == null)
			return false;
		if(_collection.getColstatus() == 1)
			return true;
		return false;
	}

	public PageBean<Collection> findByUid(String uid, int pc) {
		return collectionDao.findByUid(uid, pc);
	}
	
}
