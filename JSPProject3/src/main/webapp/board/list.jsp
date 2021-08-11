<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
     
     String strPage=request.getParameter("page"); // page=> (이전) (다음)을 클릭시 page값을 받는다 
     // 처음에 구동 => 이전,다음을 클릭하지 못한다 => page가 null이 들어 온다 (null을 처리한다) => 500
     // list.jsp?page=  ====>  String strPage=request.getParameter("page"); strPage=""
     // list.jsp        ====>  String strPage=request.getParameter("page"); strPage=null
     // list.jsp?( )page( )=( )1 ==> String strPage=request.getParameter("page"); strPage=null
     //           page => " page"  ==> "1" " 1" => Integer.parseInt("page") => NumberFormatException
     if(strPage==null)
    	 strPage="1"; // 처음 코딩 => default 1페이지 설정 
     int curpage=Integer.parseInt(strPage); // 현재 보고 있는 페이지 
     
     // 오라클에서 데이터 읽기 
     BoardDAO dao=new BoardDAO();
     ArrayList<BoardVO> list=dao.boardListData(curpage);
     // 총페이지 받기 
     int totalpage=dao.boardTotalPage();
     /*
         HTML출력전에 
         1. 사용자 보낸 데이터를 받는다 (없는 경우 생략) String strPage=request.getParameter("page");
         2. DAO연결  BoardDAO dao=new BoardDAO();
         3. DAO에서 요청한 데이터 받기  ArrayList<BoardVO> list=dao.boardListData(curpage);
         4. 받은 데이터를 HTML을 이용해서 출력
            for(){
            	HTML에 출력 
            }
     */
     
     int count=dao.boardCount();
     count=count-((curpage*10)-(10));
     // 번호 출력은 => 게시물번호 출력이 아니고 => 일괄적 숫자 출력 (count(*))
     
    /*
          A a=new A();
          a=null;
          a=new A();
          
          list.jsp => new 새로운 객체가 생성 
          
          
    */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Single+Day&display=swap');
.container{
   margin-top: 30px;
   font-family: 'Single Day', cursive;
}
.row {
    margin: 0px auto;
    width:800px;
}
h1{
  text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#findBtn').click(function(){
		let ss=$('#ss').val();
		// 검색어가 입력이 되었는지 확인
		if(ss.trim()==="") // 사용자가 실수로 space를 공백이 들어간다 (값이 입력된것으로 확인) trim():좌우공백제거
		{
			$('#ss').focus();
			return; // 종료
		}
		$('form').submit(); // action에 있는 파일로 데이터를 전송한다 <input type=submit>
	})
})
</script>
</head>
<body>
  <div class="container">
   <h1>자유게시판</h1>
   <div class="row">
     <table class="table">
      <tr>
       <td>
         <a href="insert.jsp" class="btn btn-sm btn-primary">새글</a>
       </td>
      </tr>
     </table>
     <table class="table table-striped">
      <tr class="danger">
       <th width=10% class="text-center">번호</th>
       <th width=45% class="text-center">제목</th>
       <th width=15% class="text-center">이름</th>
       <th width=20% class="text-center">작성일</th>
       <th width=10% class="text-center">조회수</th>
      </tr>
      <!-- 값을 채운다 -->
      <%
          for(BoardVO vo:list)
          {
      %>
              <tr>
                <td width=10% class="text-center"><%=count-- %></td>
                <td width=45%><a href="detail.jsp?no=<%=vo.getNo()%>"><%=vo.getSubject() %></a>
                  <%
                      String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                      String dbday=vo.getRegdate().toString(); // yyyy-MM-dd
                      if(today.equals(dbday))
                      {
                  %>
                         &nbsp;<sup style="color:red">new</sup>
                  <%
                      }
                  %>
                </td>
                <%--
                     jsp ==> jsp로 데이터 전송 
                     받는파일명?변수=값 
                     =======
                     list.jsp ====> detail.jsp ===> 번호전송
                     detail.jsp?no=1
                     detail.jsp?no=1&page=1  ==> 보내는 데이터가 2개 이상   &로 구분해서 보낸다 
                 --%>
                <td width=15% class="text-center"><%=vo.getName() %></td>
                <td width=20% class="text-center"><%=vo.getRegdate().toString() %></td>
                <td width=10% class="text-center"><%=vo.getHit() %></td>
              </tr>
      <%
          }
      %>
     </table>
     <table class="table">
       <tr>
         <td>
          <%--
              버튼 클릭 
           --%>
             <form method=post action="find.jsp">
	           <select name=fs class="input-sm">
	            <option value="name">이름</option>
	            <%-- value가 있는 경우에는 value값이 넘어간다 , value가 없는 경우 태그와 태그사이의 값이 넘어간다--%>
	            <option value="subject">제목</option>
	            <option value="content">내용</option>
	           </select>
	           <input type=text name=ss size=15 class="input-sm" id="ss">
	           <input type=button value="찾기" class="btn btn-sm btn-primary" id="findBtn">
            </form>
         </td>
         <td class="text-right">
           <a href="list.jsp?page=<%=curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-danger">이전</a>
             <%=curpage %> page / <%=totalpage %> pages
           <a href="list.jsp?page=<%= curpage<totalpage?curpage+1:curpage %>" class="btn btn-sm btn-success">다음</a>
         </td>
       </tr>
     </table>
   </div>
  </div>
</body>
</html>







