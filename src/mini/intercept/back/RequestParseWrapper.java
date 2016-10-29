package mini.intercept.back;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.multipart.JakartaMultiPartRequest;

public class RequestParseWrapper extends JakartaMultiPartRequest {
	
	@Override
	public void parse(HttpServletRequest arg0, String arg1) throws IOException {
		//这个类的作用是用自己定义的RequestParseWrapper来替代struts的吧web上传
		//给封装的类，这样struts对普通上上传就没有拦截了，parseRequest就能得到表单了
	}
	
}
