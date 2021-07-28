package com.sist.main;

import java.io.*;
import java.text.SimpleDateFormat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// ArrayList => java.util
// 데이터베이스 연결 => com.sist.dao
import java.util.*;
import com.sist.dao.*;

@WebServlet("/BoardList")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전송 (브라우저 => text/html(html) , text/xml (xml), text/plain(json=> restful))
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
        		+ "     <h1>자유 게시판</h1>\r\n"
        		+ "     <table id=\"table_content\" width=800>\r\n"
        		+ "       <tr>\r\n"
        		+ "         <td>\r\n"
        		+ "           <a href=\"BoardInsert\">새글</a>\r\n"
        		+ "         </td>\r\n"
        		+ "       </tr>\r\n"
        		+ "     </table>\r\n"
        		+ "     <div style=\"height:390px\">"
        		+ "     <table id=\"table_content\" width=800>\r\n"
        		+ "       <tr>\r\n"
        		+ "         <th width=10%>번호</th>\r\n"
        		+ "         <th width=45%>제목</th>\r\n"
        		+ "         <th width=15%>이름</th>\r\n"
        		+ "         <th width=20%>작성일</th>\r\n"
        		+ "         <th width=10%>조회수</th>\r\n"
        		+ "       </tr>";
		out.println(html);
		// 오라클로 부터 데이터 가지고 오기 
		BoardDAO dao=new BoardDAO();
		String strPage=request.getParameter("page");
		if(strPage==null)
			strPage="1";//default => 사용자가 페이지를 선택할 수 없기 때문에
		int curpage=Integer.parseInt(strPage);
		ArrayList<BoardVO> list=dao.boardListData(curpage);
		int totalpage=dao.boardTotalPage();
		for(BoardVO vo:list)
		{
		  out.println("<tr>");
		  out.println("<td width=10% align=center>"+vo.getNo()+"</td>");
		  out.println("<td width=45%>"+vo.getSubject());
		  String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());//오늘 날짜
		  String dbday=vo.getRegdate().toString();//데이터에 있는 날짜
		  if(today.equals(dbday))
		  {
			  out.println("&nbsp;<sup><font color=red>new</font></sup>");
		  }
		  out.println("</td>");
		  out.println("<td width=15% align=center>"+vo.getName()+"</td>");
		  out.println("<td width=20% align=center>"+vo.getRegdate().toString()+"</td>");
		  out.println("<td width=10% align=center>"+vo.getHit()+"</td>");
		  out.println("</tr>");
		}
		
		html="</table></div>\r\n"
				+ "     <table id=\"table_content\" width=800>\r\n"
				+ "       <tr>\r\n"
				+ "        <td align=left>\r\n"
				+ "         Search:\r\n"
				+ "           <select name=fs>\r\n"
				+ "            <!-- \r\n"
				+ "               fs => <option value=\"name\">이름</option> => column명\r\n"
				+ "               value가 있는 경우에는  fs=name\r\n"
				+ "             -->\r\n"
				+ "            <option value=\"name\">이름</option>\r\n"
				+ "            <option value=\"subject\">제목</option>\r\n"
				+ "            <option value=\"content\">내용</option>\r\n"
				+ "           </select>\r\n"
				+ "           <input type=text name=ss size=15>\r\n"
				+ "           <input type=submit value=\"찾기\">\r\n"
				+ "        </td>\r\n"
				+ "        <td align=right>\r\n"
				+ "         <a href=BoardList?page="+(curpage>1?curpage-1:curpage)+">이전</a>&nbsp;"
				+            curpage+" page / "+totalpage+" pages &nbsp;\r\n"
				+ "          <a href=BoardList?page="+(curpage<totalpage?curpage+1:curpage)+">다음</a>"
				+ "        </td>\r\n"
				+ "       </tr>\r\n"
				+ "     </table>\r\n"
				+ "   </center>\r\n"
				+ "</body>\r\n"
				+ "</html>";
		out.println(html);
		
	}

}











