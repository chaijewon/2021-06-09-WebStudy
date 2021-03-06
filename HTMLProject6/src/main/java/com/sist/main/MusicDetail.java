package com.sist.main;

import java.io.*;
import java.util.ArrayList;

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
		// 오라클로부터 데이터를 받는다 
		ArrayList<MelonReplyVO> list=dao.replyListData(Integer.parseInt(no));
		out.println("<html>");
		out.println("<head>");
		out.println("<link rel=stylesheet href=table.css>");
		out.println("</head>");
		out.println("<body>");
		out.println("<center>");
		out.println("<h1>"+vo.getTitle()+"</h1>");
		out.println("<h3>"+vo.getSinger()+"</h3>");
		out.println("<embed src=http://youtube.com/embed/"+vo.getKey()+"  width=800 height=450></embed>");
		out.println("<table id=table_content width=800>");
		out.println("<tr>");
		out.println("<td align=right>");
		out.println("<a href=MusicList>목록</a></td>");
		out.println("</tr>");
		out.println("</table>");
		// 댓글 
		out.println("<div style=\"height:30px\"></div>");//inline style
		out.println("<table id=table_content width=800>");
		out.println("<tr><td>");
		for(MelonReplyVO mvo:list)
		{
			out.println("<table id=table_content width=800>");
			out.println("<tr>");
			out.println("<td>");
			out.println("<span style=\"color:blue\">"+mvo.getName()+"</span>");
			out.println("&nbsp;"+mvo.getDbday());
			out.println("</td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<td valign=top align=left height=150>");
			out.println("<pre style=\"white-space:pre-wrap;overflow-y:auto\">"+mvo.getMsg()+"</pre>");
			out.println("</td>");
			out.println("</tr>");
			out.println("</table>");
		}
		out.println("</td></tr>");
		out.println("</table>");
		out.println("<form method=post action=MusicDetail>");
		// MusicDetail로 데이터를 전송한다 => 호출하는 메소드 doPost
		// Web에서 데이터를 전송 => 사용자가 보낸 모든 데이터는 request안에 들어 온다 
		// request는 형식 Map
		/*
		 *    request.setAttribute("name","홍길동")
		 *    request.setAttribute("msg","댓글...");
		 *    request.setAttribute("no",1)
		 *    ====================================== tomcat
		 *    
		 *    ==> request.getParameter("name"); =>  홍길동 => servlet,JSP 동일하게 처리 JSTL
		 *    
		 *    구구단
		 *      <table>
		 *       <tr>
		 *         <%
		 *              for(int i=2;i<=9;i++)
		 *              {
		 *         %>
		 *                 <td><%= i+"단"%></td>
		 *         <%
		 *              }
		 *         %>
		 *       </tr>
		 *       <%
		 *           for(int i=1;i<=9;i++)
		 *           {
		 *       %>
		 *               <tr>
		 *       <%
		 *               for(int j=2;j<=9;j++)
		 *               {
		 *        %>
		 *        
		 *                  <td><%= j+"*"+i+"="+j*i%>
		 *        <%
		 *               }
		 *        %>
		 *               </tr>
		 *        <%
		 *               }
		 *        %>
		 *        
		 *        <c:forEach var="i" begin="1" end="9">
		 *          <tr>
		 *          <c:forEach var="j" begin="2" end="9">
		 *           <td>출력</td>
		 *          </c:forEach>
		 *          </tr>
		 *        </c:forEach> ==> spring
		 *       
		 */
		out.println("<table id=table_content width=800>");
		out.println("<tr>");
		out.println("<td>이름:");
		out.println("<input type=text name=name size=15></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td>");
		out.println("<input type=hidden name=no value="+vo.getNo()+">"); // 뮤직번호 (프로그래머가 알 수 있게 표시=> <input type=hidden>
		// hidden => 데이터가 전송이 가능 
		out.println("<textarea rows=5 cols=80 style=\"float:left\" name=msg></textarea>");
		// float:left   => button (<input type=submit>)
		out.println("<button style=\"width:100px;height:80px;background-color:blue;color:white;float:left;-webkit-border-radius:5px;margin-left:5px\">댓글쓰기</button>");
		out.println("</td>");
		out.println("</tr>");
		out.println("</table>");
		out.println("</form>");
		out.println("</center>");
		out.println("</body>");
		out.println("</html>");
		
		// a.common_sp_link img[src*=/recipe/] => src안에 /recipe/가 포함된 데이터만 가지고 온다 
		//                      src^=/aaa/
		//                      src$=
		
	}

	// 사용자가 넘겨준 데이터 받아서 처리하는 부분
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 데이터베이스 연동 
		try
		{
			// 한글 변환 
			request.setCharacterEncoding("UTF-8"); // 디코딩으로 받아서 처리 
			/*
			 *   한글 => 브라우저 
			 *          %ED%95%9C%EA%B8%80 => 인코딩
			 *          
			 *   브라우저로부터 데이터를 받는 경우 %ED%95%9C%EA%B8%80=>한글 => 디코딩
			 */
		}catch(Exception ex) {}
		// 사용자가 보내준 데이터를 받기 시작 
		// <input type=hidden name=no value="+vo.getNo()+">"
		String mno=request.getParameter("no");
		// <input type=text name=name size=15>
		String name=request.getParameter("name");
		// <textarea rows=5 cols=80 style=\"float:left\" name=msg>
		String msg=request.getParameter("msg");
		
		System.out.println("no="+mno);
		System.out.println("name="+name);
		System.out.println("msg="+msg);
		
		MelonReplyVO vo=new MelonReplyVO();
		vo.setMno(Integer.parseInt(mno));
		vo.setName(name);
		vo.setMsg(msg);
		
		// DAO로 전송 => 오라클에 추가 
		MelonDAO dao=new MelonDAO();
		dao.replyInsert(vo);
		
		// 이동  MusicDetail?no=1
		response.sendRedirect("MusicDetail?no="+mno); // MusicDetail => 댓글 출력 (새로고침)
		// web : 흐름  => 동작한 다음 어느 파일로 이동 할지 결정 
		/*
		 *   게시판 
		 *   =====
		 *      결과 출력 
		 *      =======
		 *         1. 목록    
		 *             => 삭제 => 목록 , 추가 => 목록 
		 *         2. 상세보기 
		 *             => 수정 => 상세보기 , 댓글 => 상세보기
		 *   회원 가입 => 메인 => 로그인 유도 
		 *   
		 *   영화예매 => 좌석 => 마이페이지 이동 
		 */
		
	}

}









