package mini.post.service;

import java.util.List;

import javax.annotation.Resource;

import mini.pager.PageBean;
import mini.post.dao.PostDao;
import mini.post.domain.Post;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class PostService {
	@Resource private PostDao postDao;

	public void add(Post post) {
		postDao.add(post);
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public Post findByPid(String pid) {
		return postDao.findByPid(pid);
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public PageBean<Post> findPostByUid(String uid, int pc) {
		return postDao.findPostByUid(uid, pc);
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public PageBean<Post> findByStatus(int status, int pc) {
		return postDao.findByStatus(status, pc);
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public PageBean<Post> findByTitle(String title, int pc) {
		return postDao.findByTitle(title, pc);
	}

	public int findPostNum(String uid) {
		return postDao.findPostNum(uid);
	}

	public void update(Post post) {
		postDao.update(post);
	}
	
	public List<Post> findHotZan() {
		return postDao.findHotZan();
	}

	public List<Post> findHotComment() {
		return postDao.findHotComment();
	}

	public PageBean<Post> findHot(int pc) {
		return postDao.findHot(pc);
	}

	public void delete(Post post) {
		postDao.delete(post);
	}

	public PageBean<Post> findAll(int pc) {
		return postDao.findAll(pc);
	}
	
}
