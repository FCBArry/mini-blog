package mini.user.service;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.Session;

import mini.pager.PageBean;
import mini.user.dao.UserDao;
import mini.user.domain.User;
import mini.user.service.exception.UserException;

import org.springframework.transaction.annotation.Transactional;

import cn.itcast.commons.CommonUtils;
import cn.itcast.mail.Mail;
import cn.itcast.mail.MailUtils;

@Transactional
public class UserService {
	@Resource
	private UserDao userDao;

	public void regist(User user) {
		user.setUid(CommonUtils.uuid());
		user.setStatus(false);
		user.setActivationCode(CommonUtils.uuid() + CommonUtils.uuid());

		userDao.add(user);

		Properties prop = new Properties();
		try {
			prop.load(this.getClass().getClassLoader()
					.getResourceAsStream("email_template.properties"));
		} catch (IOException e1) {
			throw new RuntimeException(e1);
		}

		String host = prop.getProperty("host");// 服务器主机名
		String name = prop.getProperty("username");// 登录名
		String pass = prop.getProperty("password");// 登录密码
		Session session = MailUtils.createSession(host, name, pass);

		String from = prop.getProperty("from");
		String to = user.getEmail();
		String subject = prop.getProperty("subject");
		String content = MessageFormat.format(prop.getProperty("content"),
				user.getActivationCode());

		Mail mail = new Mail(from, to, subject, content);
		try {
			MailUtils.send(session, mail);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	public boolean ajaxValidateLoginname(String loginname) {
		return userDao.ajaxValidateLoginname(loginname);
	}

	public boolean ajaxValidateEmail(String email) {
		return userDao.ajaxValidateEmail(email);
	}

	public void activatioin(String code) throws UserException {
		User user = userDao.findByCode(code);
		if (user == null)
			throw new UserException("无效的激活码！");
		if (user.isStatus())
			throw new UserException("您已经激活过了，不要二次激活！");
		user.setStatus(true);
		userDao.updateStatus(user);// 修改状态
	}

	public User login(User user) {
		return userDao.findByLoginnameAndLoginpass(user.getUsername(),
				user.getPassword());
	}

	public User findByUid(String otheruid) {
		return userDao.findByUid(otheruid);
	}

	public PageBean<User> findAll(int pc) {
		return userDao.findAll(pc);
	}

	public void delete(User user) {
		userDao.delete(user);
	}
}
