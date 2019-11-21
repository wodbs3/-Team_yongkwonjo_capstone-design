 package com.bu.bumoim;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bu.bumoim.dao.ChatDao;
import com.bu.bumoim.domain.Chat;

@WebService
public class ChatListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String listType = request.getParameter("listType");
		if(listType == null || listType.equals("")) response.getWriter();
		else if(listType.equals("today")) response.getWriter().write(getToday());
		
		
	}
	public String getToday() {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDao chatDao = new ChatDao();
		System.out.println("result ==== " + result);
		ArrayList<Chat> chatList = chatDao.getChatList(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		System.out.println("너의 값은 무엇이니 ?   " + chatList.size());
		for(int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
			if(i != chatList.size() - 1) result.append(",");
		}
		result.append("]}");
		return result.toString();
	}

}