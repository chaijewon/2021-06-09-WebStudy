package com.sist.main;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BoardInsert")
public class BoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 화면 출력 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String html="<!DOCTYPE html>\r\n"
				+ "<html>\r\n"
				+ "<head>\r\n"
				+ "<meta charset=\"UTF-8\">\r\n"
				+ "<title>Insert title here</title>\r\n"
				+ "<link rel=\"stylesheet\" href=\"table.css\">\r\n"
				+ "</head>\r\n"
				+ "<body>\r\n"
				+ "   <center>\r\n"
				+ "     <h1>글쓰기</h1>\r\n"
				+ "     <form method=post action=\"BoardInsert\">\r\n"
				+ "     <table id=\"table_content\" width=600>\r\n"
				+ "       <tr>\r\n"
				+ "         <th width=20% align=right>이름</th>\r\n"
				+ "         <td width=80%>\r\n"
				+ "           <input type=text name=name size=20>\r\n"
				+ "         </td>\r\n"
				+ "       </tr>\r\n"
				+ "       \r\n"
				+ "       <tr>\r\n"
				+ "         <th width=20% align=right>이메일</th>\r\n"
				+ "         <td width=80%>\r\n"
				+ "           <input type=text name=email size=50>\r\n"
				+ "         </td>\r\n"
				+ "       </tr>\r\n"
				+ "       \r\n"
				+ "       <tr>\r\n"
				+ "         <th width=20% align=right>제목</th>\r\n"
				+ "         <td width=80%>\r\n"
				+ "           <input type=text name=subject size=50>\r\n"
				+ "         </td>\r\n"
				+ "       </tr>\r\n"
				+ "       \r\n"
				+ "       <tr>\r\n"
				+ "         <th width=20% align=right>내용</th>\r\n"
				+ "         <td width=80%>\r\n"
				+ "           <textarea rows=\"10\" cols=\"55\" name=content></textarea>\r\n"
				+ "         </td>\r\n"
				+ "       </tr>\r\n"
				+ "       \r\n"
				+ "       <tr>\r\n"
				+ "         <th width=20% align=right>비밀번호</th>\r\n"
				+ "         <td width=80%>\r\n"
				+ "           <input type=password name=pwd size=10>\r\n"
				+ "         </td>\r\n"
				+ "       </tr>\r\n"
				+ "       \r\n"
				+ "       <tr>\r\n"
				+ "         <td colspan=\"2\" align=center>\r\n"
				+ "           <input type=submit value=\"글쓰기\">\r\n"
				+ "           <input type=button value=\"취소\"\r\n"
				+ "             onclick=\"javascript:history.back()\"\r\n"
				+ "           >\r\n"
				+ "         </td>\r\n"
				+ "       </tr>\r\n"
				+ "       \r\n"
				+ "     </table>\r\n"
				+ "     </form>\r\n"
				+ "   </center>\r\n"
				+ "</body>\r\n"
				+ "</html>\r\n"
				+ "";
		out.println(html);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 처리 => INSERT 처리 , UPDATE 처리
	}

}
