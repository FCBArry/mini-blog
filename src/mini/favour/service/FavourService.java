package mini.favour.service;

import javax.annotation.Resource;

import mini.favour.dao.FavourDao;
import mini.favour.domain.Favour;
import mini.post.dao.PostDao;
import mini.post.domain.Post;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public class FavourService {
	@Resource private FavourDao favourDao;
	@Resource private PostDao postDao;
	
	public boolean changeFavour(Favour favour) {
		Favour _favour = favourDao.findbyPU(favour);
		Post post = favour.getPost();
		
		if(_favour == null){
			favour.setFstatus(1);
			favourDao.add(favour);
			
			post.setPzan(post.getPzan() + 1);//赞加一
			postDao.update(post);
			
			return true;
		}
		if(_favour.getFstatus() == 1){
			_favour.setFstatus(0);
			favourDao.update(_favour);
			
			post.setPzan(post.getPzan() - 1);//赞减一
			postDao.update(post);
			
			return false;
		}
		_favour.setFstatus(1);
		favourDao.update(_favour);
		
		post.setPzan(post.getPzan() + 1);//赞加一
		postDao.update(post);
		
		return true;
	}

	public boolean status(Favour favour) {
		Favour _favour = favourDao.findbyPU(favour);
		if(_favour == null)
			return false;
		if(_favour.getFstatus() == 1)
			return true;
		return false;
	}

	public int findFavourNum(String uid) {
		return favourDao.findFavourNum(uid);
	}
	
}
