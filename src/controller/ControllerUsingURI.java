package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import action.NullAction;

public class ControllerUsingURI extends HttpServlet {

	private Map commandMap = new HashMap<>(); //명령어와 명령어 처리 클래스를 쌍으로 저장	
	//명령어와 처리클래스가 매핑되어 있는 properties 파일을 읽어서 Map 객체인 commandMap 에 저장
	//명령어와 처리클래스가 매핑되어 있는 properties 파일은 Command.properties파일
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("configFile"); //web.xml에서 propertyConfig에 해당하는 init-param의 값을 읽어옴 
		Properties pr = new Properties(); //명령어와 처리클래스의 매핑정보를 저장할 Properties객체 생성
		FileInputStream f = null;
		try {
			String configFilePath = config.getServletContext().getRealPath(props);
			f = new FileInputStream(configFilePath); //Command.properties파일의 내용을 읽어옴
			pr.load(f);
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if(f!=null) try {f.close(); } catch (IOException ex) {}
		}
		Iterator keyIter = pr.keySet().iterator(); //Iterator객체는 Enumeration객체를 확장시킨 개념의 객체
		while(keyIter.hasNext()) {
			String command = (String)keyIter.next();
			String className = pr.getProperty(command);
			try {
				Class commandClass = Class.forName(className); //해당 문자열을 클래스로 만든다.
				Object commandInstance = commandClass.newInstance(); //해당클래스의 객체를 생성
				commandMap.put(command, commandInstance); //Map 객체인 commandMap에 객체 저장
			} catch (ClassNotFoundException e) {
				throw new ServletException(e);
			} catch (InstantiationException e) {
				throw new ServletException(e);
			} catch (IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request,response);
	}

	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		CommandAction com = null;
		try {
			String command = request.getRequestURI();
			if(command.indexOf(request.getContextPath())==0) {
				command = command.substring(request.getContextPath().length());
			}
			com = (CommandAction) commandMap.get(command);
			if(com == null) {
				com = new NullAction();
			}
			view = com.requestPro(request,response);
		} catch (Throwable e) {
			throw new ServletException(e);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
	}

}
