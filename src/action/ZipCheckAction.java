package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDBBean;
import logon.ZipcodeBean;

public class ZipCheckAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");

		String check = request.getParameter("check");
		String area3 = request.getParameter("area3");
		LogonDBBean dbPro = LogonDBBean.getInstance();
		ArrayList<ZipcodeBean> zipcodeList = dbPro.zipcodeRead(area3);
		
		request.setAttribute("check", check);
		request.setAttribute("area3", area3);
		request.setAttribute("zipcodeList", zipcodeList);
		
		
		return "/logon/ZipCheck.jsp";
	}

}
