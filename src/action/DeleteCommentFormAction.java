package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteCommentFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String comment_num 	= request.getParameter("cmn");
		String content_num 	= request.getParameter("ctn");
		String p_num		= request.getParameter("p_num");
		String url			= "content.do?num="+content_num+"&pageNum="+p_num;
		
		request.setAttribute("comment_num", comment_num);
		request.setAttribute("content_num", content_num);
		request.setAttribute("p_num", p_num);
		request.setAttribute("url", url);
		return "/MVC/delCommentForm.jsp";
	}

}
