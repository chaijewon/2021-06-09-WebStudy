package com.sist.main;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/*
 *   기능 => 화면에 출력 (service())
 *   기능 => 화면에 출력 , 입력후 요청 
 *           doGet()   doPost()  ===> 새로운 파일을 다시 만든다 
 */
import com.sist.dao.*;
@WebServlet("/MusicDetail")
public class MusicDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
    // 화면 출력 (GET)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 화면 UI
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String no=request.getParameter("no");
		MelonDAO dao=new MelonDAO();
		MelonVO vo=dao.melonDetailData(Integer.parseInt(no));
		out.println("<html>");
		out.println("<head>");
		out.println("<link rel=stylesheet href=table.css>");
		out.println("</head>");
		out.println("<body>");
		out.println("<center>");
		out.println("<h1>"+vo.getTitle()+"</h1>");
		out.println("<h3>"+vo.getSinger()+"</h3>");
		out.println("<embed src=http://youtube.com/embed/"+vo.getKey()+"  width=800 height=450></embed>");
		// 댓글 
		out.println("</center>");
		out.println("</body>");
		out.println("</html>");
		
	}

	// 사용자가 넘겨준 데이터 받아서 처리하는 부분
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 데이터베이스 연동 
	}

}









