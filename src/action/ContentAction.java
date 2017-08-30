package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;
import board.CommentDBBean;
import board.CommentDataBean;

public class ContentAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		String cPageNum = request.getParameter("cPageNum");
		if(cPageNum == null){
			cPageNum = "1";
		}
		int pageSize = 5;
		int cCurrentPage = Integer.parseInt(cPageNum);
		int startRow = (cCurrentPage *5) -4;
		int endRow = cCurrentPage *pageSize;
		
		BoardDBBean dbPro = BoardDBBean.getInstance();
		BoardDataBean article = dbPro.getArticle(num);
		CommentDBBean cdb = CommentDBBean.getInstance();
		ArrayList<CommentDataBean> comments  = cdb.getComments(article.getNum(), startRow, endRow);
		int count = cdb.getCommentCount(article.getNum());
		
		int pageCount = count / pageSize +(count% pageSize ==0 ? 0:1);
		int startPage = (int)(cCurrentPage/5)*5 +1;
		int pageBlock = 5;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;
		//해당 뷰에서 사용할 속성
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("article", article);
		request.setAttribute("cPageNum", new Integer(cPageNum));
		request.setAttribute("comments", comments);
		request.setAttribute("count", count);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);

		return "/MVC/content.jsp";
	}

}
