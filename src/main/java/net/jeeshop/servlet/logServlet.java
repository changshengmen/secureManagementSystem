package net.jeeshop.servlet;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class logServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(logServlet.class);

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qs = URLDecoder.decode( request.getQueryString(), "utf-8");
		String [] attrs = qs.split("&");
		StringBuffer sb = new StringBuffer();
		for(String attr : attrs){
			String [] kv = attr.split("=");
			sb.append((kv.length == 2 ? kv[1] : "") + "|");
		}
		sb.append(request.getRemoteAddr());
		String log = sb.toString();
		logger.info(log);
		System.out.print(log);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
