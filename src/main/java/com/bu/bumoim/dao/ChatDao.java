package com.bu.bumoim.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.bu.bumoim.domain.Chat;

public class ChatDao {

		private Connection conn;
		
		public ChatDao() {
			try {
				String dbURL = "jdbc:mysql://database-1.csu1yuqbzcre.ap-northeast-2.rds.amazonaws.com:3306/bumoim?useSSL=false";
				String dbID = "root";
		        String dbPassword = "dpfflxm003";
		        Class.forName("com.mysql.jdbc.Driver");
		        conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public ArrayList<Chat> getChatList(String nowTime) {
			ArrayList<Chat> chatList = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String SQL = "SELECT * FROM bumoim.chat WHERE chatTime > ? ORDER BY chatTime";

			System.out.println("############################################3");
			System.out.println("여긴 select~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, nowTime);
				rs = pstmt.executeQuery();
				chatList = new ArrayList<Chat>();
				System.out.println("##########################3");
				System.out.println("chatList === " + chatList.toString());
				System.out.println("rs ====" + rs.toString());
				while(rs.next()) {
					
					Chat chat = new Chat();
					chat.setChatName(rs.getString("chatName"));
					chat.setChatContent(rs.getString("chatContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt").replaceAll(">", "&gt").replaceAll("\n", "<br>"));
					int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11,13));
					String timeType = "오전";
					if(Integer.parseInt(rs.getString("chatTime").substring(11,13)) >= 12) {
						timeType = "오후";
						chatTime -= 12;
					}
					
					chat.setChatTime(rs.getString("chatTime").substring(0,11) + " " + timeType + " " + chatTime + ":" + rs.getString("chatTime").substring(14, 16) + "");
					chatList.add(chat);
				}
			}catch (Exception e) {
				System.out.println("캐치캐치캐치캐치");
				e.printStackTrace();
			}finally {
				System.out.println("파이널트라이파이널트라이파이널트라이파이널트라이파이널트라이");
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
				} catch(Exception e) {
				e.printStackTrace();
				}
			}
			return chatList;
		}
		
		public int submit(String chatName, String chatContent) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			System.out.println("############################################3");
			System.out.println("여긴 insert~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			String SQL = "INSERT INTO bumoim.chat VALUES (?, ?, now())";
			try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, chatName);
				pstmt.setString(2, chatContent);
				return pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
				} catch(Exception e) {
				e.printStackTrace();
				}
			}
			return -1;
		}
}
