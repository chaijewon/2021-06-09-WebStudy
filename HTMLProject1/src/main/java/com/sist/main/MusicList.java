package com.sist.main;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.dao.*;
@WebServlet("/MusicList")
public class MusicList extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전송 파일 지정 => HTML
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<link rel=stylesheet href=table.css>");
		out.println("</head>");
		out.println("<body>");
		out.println("<center>");
		out.println("<h1>뮤직 목록</h1>");
		out.println("<table width=1000 id=table_content>");
		out.println("<tr>");
		out.println("<th></th>");
		out.println("<th>노래명</th>");
		out.println("<th>가수명</th>");
		out.println("<th>앨범</th>");
		out.println("</tr>");
		// 실제 데이터 출력 
		// DAO연결 => 데이터 읽기
		MusicDAO dao=new MusicDAO();
		ArrayList<MusicVO> list=dao.musicListData();
		for(MusicVO vo:list)
		{
			out.println("<tr class=dataTr>");
			out.println("<td align=center><img src="+vo.getPoster()+" width=30 height=30></td>");
			out.println("<td><a href=MusicDetail?no="+vo.getNo()+">"+vo.getTitle()+"</a></td>");
			// 값을 전송 => URL을 이용해서 전송 => ?변수=값  , ?변수=값&변수=값....
			// 메모리 할당=> 톰캣 (서블릿 메모리 할당 => ?뒤에 있는 값을 전송)
			// ?뒤에 값을 보내는 방법 : GET 
			// 다른 파일로 데이터를 전송 : GET/POST
			// GET => doGet   POST => doPost  ====> doGet+doPost => service
			out.println("<td>"+vo.getSinger()+"</td>");
			out.println("<td>"+vo.getAlbum()+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		out.println("</center>");
		out.println("</body>");
		out.println("</html>");
	}

}












