package com.sist.main;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.dao.*;
// ALTER TABLE melon_music ADD CONSTRAINT mm_no_pk PRIMARY KEY(no);
@WebServlet("/MusicList")
public class MusicList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    // thread => 사용자마다 따로 수행 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// HTML 출력 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();// response => socket 
		
		// out=> 출력 => 브라우저가 읽어 간다 
		out.println("<html>"); // <html> JSP=VIEW(화면 출력용)
		out.println("<head>");
		out.println("<link rel=stylesheet href=table.css>");
		out.println("<style type=text/css>");
		out.println("@import url('https://fonts.googleapis.com/css2?family=Single+Day&display=swap');");
		out.println("*{font-family: 'Single Day', cursive;}");
		out.println(".a{text-align:center;}");
		out.println("img{width:30px;height:30px}");
		out.println("div{width:100%}");
		out.println("table{margin:0px auto}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1 style=\"text-align:center\">멜론 뮤직 Top100</h1>");
		out.println("<div>");
		out.println("<table id=table_content width=800>");
		out.println("<tr>");
		out.println("<th>순위</th>");
		out.println("<th></th>");
		out.println("<th>노래명</th>");
		out.println("</tr>");
		// 오라클에 있는 데이터 출력 
		MelonDAO dao=new MelonDAO();
		ArrayList<MelonVO> list=dao.musicListData();
	    for(MelonVO vo:list)
	    {
	    	out.println("<tr>");
	    	out.println("<td class=a>"+vo.getNo()+"</td>");
	    	out.println("<td class=a><img src="+vo.getPoster()+"></td>");
	    	out.println("<td><a href=MusicDetail?no="+vo.getNo()+">"+vo.getTitle()+"</a></td>");
		    out.println("</tr>");
	    }
	    out.println("</table>");
		out.println("</body>");
		out.println("</html>");
		
	}

}













