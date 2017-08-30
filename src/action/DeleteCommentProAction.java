package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommentDBBean;

public class DeleteCommentProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		
		int content_num = Integer.parseInt(request.getParameter("content_num"));
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		String pageNum = request.getParameter("p_num");
		String passwd = request.getParameter("passwd");
		
		CommentDBBean cmtPro = CommentDBBean.getInstance();
		int check = cmtPro.deleteComment(content_num, passwd, comment_num);
		
		request.setAttribute("content_num", content_num);
		request.setAttribute("comment_num", comment_num);
		request.setAttribute("check", check);
		
		return "/MVC/delCommentPro.jsp";
	}

}
