<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<main>
<%!
public boolean nvl(String msg){
	return msg == null || msg.trim().equals("")?true:false;
}

public String showPen(int year, int month, int day) {
	String s = "";
	String url = "calwrite.do";
	String image = "<img src='image/pen.gif'>";
	s = String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>",
			url, year, month, day, image);
	
	return s;
}

public String two(String msg) {
	return msg.trim().length()<2?"0"+msg:msg.trim();
}

%>

<h1>일정</h1>

<%
Calendar cal = Calendar.getInstance();
cal.set(Calendar.DATE, 1);

String syear = (String)request.getAttribute("year");
String smonth = (String)request.getAttribute("month");

int year = cal.get(Calendar.YEAR);
if(!nvl(syear)) {
	year = Integer.parseInt(syear);
}
int month = cal.get(Calendar.MONTH) + 1;
if(!nvl(smonth)) {
	month = Integer.parseInt(smonth);
}

if(month < 1) {
	month = 12;
	year--;
}
if(month > 12) {
	month = 1;
	year++;
}

cal.set(year, month-1, 1);

int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

String wdate = (year - 1) + "" + month;

String pp = String.format("<a href='%s?year=%d&month=%d'><img src='image/left.gif'></a>",
"calendar.do", year - 1, month);

String p = String.format("<a href='%s?year=%d&month=%d'><img src='image/prec.gif'></a>",
"calendar.do", year, month - 1);

String n = String.format("<a href='%s?year=%d&month=%d'><img src='image/next.gif'></a>",
"calendar.do", year, month + 1);

String nn = String.format("<a href='%s?year=%d&month=%d'><img src='image/last.gif'></a>",
"calendar.do", year + 1, month);


%>

<div align="center">
<table border="1">
<col width="100"><col width="100"><col width="100"><col width="100">
<col width="100"><col width="100"><col width="100">

<tr height="100">
<td colspan="7" align="center"><%=pp %><%=p %>
<font color="black" style="font-size: 20">
<%=String.format("%d년&nbsp;&nbsp;%d월", year, month) %> </font>
<%=n %><%=nn %>
</td>
</tr>



<tr height="100">
<td align="center">일</td>
<td align="center">월</td>
<td align="center">화</td>
<td align="center">수</td>
<td align="center">목</td>
<td align="center">금</td>
<td align="center">토</td>
</tr>

<tr height="100" align="left" valing="top">
<%
for (int i = 1; i < dayOfWeek; i++) {
	%>
	<td>&nbsp;</td>
	<%
}

int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
for(int i = 1; i <= lastDay; i++) {
	%>
	
	<td>
	일정
	</td>
	
	<%
	if((i + dayOfWeek - 1)%7 == 0) { 
	%>
	</tr>
	<tr height="100" align="left" valign="top">
	<%
   }
}
for(int i = 0; i < (7-(dayOfWeek + lastDay - 1)%7)%7; i++) {
	%>
	<td>i</td>
	<%
}
%>
</tr>

</table>
</div>
</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>