<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
     String no=request.getParameter("no");
     //mode 를 받아서 사용 
     MusicDAO dao=new MusicDAO();
     MelonVO vo=dao.melonDetailData(Integer.parseInt(no));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row {
   margin: 0px auto;
   width: 700px;
}
h1{
  text-align: center
}
</style>
</head>
<body>
   <div class="container">
     <h1>&lt;<%= vo.getTitle() %>&gt; 상세보기</h1>
     <div class="row">
       <table class="table">
         <tr>
          <td class="text-center">
           <embed src="http://youtube.com/embed/<%=vo.getKey() %>" width=700 height=350>
          </td>
         </tr>
         <tr>
           <td>곡명:<%=vo.getTitle() %></td>
         </tr>
         <tr>
           <td>가수명:<%=vo.getSinger() %></td>
         </tr>
         <tr>
           <td>앨범:<%=vo.getAlbum() %></td>
         </tr>
         <tr>
           <td class="text-right">
            <a href="main.jsp?mode=2" class="btn btn-sm btn-primary">목록</a>
           </td>
         </tr>
       </table>
     </div>
   </div>
</body>
</html>
