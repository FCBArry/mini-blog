package mini.comment.service;

import javax.annotation.Resource;

import mini.comment.dao.CommentDao;
import mini.comment.domain.Comment;
import mini.pager.PageBean;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public class CommentService {
	@Resource private CommentDao commentDao;

	public void add(Comment comment) {
		commentDao.add(comment);
	}

	public PageBean<Comment> findByPid(String pid, int pc) {
		return commentDao.findByPid(pid, pc);
	}

	public int findCommentNum(String uid) {
		return commentDao.findCommentNum(uid);
	}

	public void delete(Comment comment) {
		commentDao.delete(comment);
	}

	public PageBean<Comment> findAll(int pc) {
		return commentDao.findAll(pc);
	}

	public Comment findByCid(String cid) {
		return commentDao.findByCid(cid);
	}
	
}
