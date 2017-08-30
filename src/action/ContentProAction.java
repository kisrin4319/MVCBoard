package action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommentDBBean;
import board.CommentDataBean;

public class ContentProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		CommentDataBean cmt = new CommentDataBean();
		/*cmt.setComment_num(Integer.parseInt(request.getParameter("comment_num")));
		cmt.setContent_num(Integer.parseInt(request.getParameter("content_num")));
		
	*/
		cmt.setComment_num(Integer.parseInt(request.getParameter("comment_num")));
		cmt.setContent_num(Integer.parseInt(request.getParameter("content_num")));
		cmt.setCommenter(request.getParameter("commenter"));
		cmt.setCommentt(request.getParameter("commentt"));
		cmt.setPasswd(request.getParameter("passwd"));
		cmt.setReg_date(new Timestamp(System.currentTimeMillis()));
		cmt.setIp(request.getRemoteAddr());
		
		CommentDBBean comt = CommentDBBean.getInstance();
		comt.insertComment(cmt);
		
		String content_num 	= request.getParameter("content_num");
		String p_num		= request.getParameter("p_num");
		String url			= "content.do?num="+content_num+"&pageNum="+p_num;
		request.setAttribute("content_num", content_num);
		request.setAttribute("p_num", p_num);
		request.setAttribute("url", url);
		return "/MVC/contentPro.jsp";
		
	}

}
