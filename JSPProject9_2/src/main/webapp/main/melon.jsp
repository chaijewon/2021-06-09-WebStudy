<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%--
      JSP(JDBC)    
      웹   ====> model1 (JSP=>JSP) => model2(MVC) => Framework(Spring)
      DataBase => JDBC (원시)      => DBCP        => ORM(MyBatis)
      Front ==> Jquery(Ajax)      => AJAX        => Vue/React
      // JSP가능,Spring가능 ,Mybatis가능 (자바기본,오라클 기본) , Vue/React => 학력무관 , 자바가능자 ,경력무관 (2200)
 --%>
<%
    MusicDAO dao=new MusicDAO();
    ArrayList<MelonVO> list=dao.melonListData();
    // <jsp:include> => JSP마다 따로 컴파일 => 실행된 HTML만 붙인다
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row {
   margin: 0px auto;
   width: 900px;
}
h1{
  text-align: center
}
</style>
</head>
<body>
  <div style="height:30px"></div>
  <div class="container">
   <h1>멜론뮤직 Top50</h1>
   <div class="row">
     <table class="table">
      <tr class="success">
       <th class="text-center">순위</th>
       <th class="text-center"></th>
       <th class="text-center">곡명</th>
       <th class="text-center">가수명</th>
      </tr>
      <%
          for(MelonVO vo:list)
          {
      %>
             <tr>
              <td class="text-center"><%=vo.getNo() %></td>
              <td class="text-center">
                <img src="<%=vo.getPoster() %>" width=35 height="35" class="img-rounded">
              </td>
              <%--
                forward , include => request에는 데이터를 공유 (include => main.jsp로 화면 이동을 한다)
                mode = main.jsp
                no = genie_detail.jsp
                
               --%>
              <td><a href="main.jsp?mode=6&no=<%=vo.getNo()%>"><%=vo.getTitle() %></a></td>
              <td><%=vo.getSinger() %></td>
             </tr>
      <%
          }
      %>
     </table>
   </div>
  </div>
</body>
</html>








