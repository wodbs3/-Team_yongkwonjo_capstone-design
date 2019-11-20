package com.bu.bumoim;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bu.bumoim.dao.ChatDao;

public class ChatSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html);charset=UTF-8");
		String chatName = request.getParameter("chatName");
		String chatContent = request.getParameter("chatContent");
		if(chatName == null || chatName.equals("") || chatContent == null || chatContent.contentEquals("")) {
			response.getWriter().write("0");
			
		}
		else {
			response.getWriter().write(new ChatDao().submit(chatName, chatContent) + "");
		}
	}

}
