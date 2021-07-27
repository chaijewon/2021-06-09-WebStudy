package com.sist.main;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.sist.dao.*;
// JSP실행 => setvlet변경 => 컴파일
@WebServlet("/MusicDetail")
public class MusicDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		// <a href=MusicDetail?no=1>
		//1. MusicList 에서 보내준 no값을 받는다 
		MusicDAO dao=new MusicDAO();
		String no=request.getParameter("no"); // no=1 사용자가 선택된 값을 가지고 온다 (무조건 String)
		MusicVO vo=dao.musicDetailData(Integer.parseInt(no));
		out.println("<html>");
		out.println("<body>");
		out.println("<center>");
		out.println("<h1>"+vo.getTitle()+"</h1>");
		out.println("<h3>"+vo.getSinger()+"</h3>");
		out.println("<embed src=http://youtube.com/embed/"+vo.getKey()+" width=700 height=350>");// 동영상 실행 할때 사용 => <video>사용 할 수 없다 => 파일이 있는 경우 
		 // Youtube(Streaming Service)에 가지고 오는 실행 (embed,iframe:보안(VueJS,ReactJS))
		out.println("<a href=MusicList>목록</a>");
		out.println("</center>");
		out.println("</body>");
		out.println("</html>");
	
	}

}







