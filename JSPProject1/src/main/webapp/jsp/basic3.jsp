<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <!-- HTML (구구단) -->
  <center>
    <table border=1 bordercolor=black width=500>
      <tr>
        <td align="center">2단</td>
        <td align="center">3단</td>
        <td align="center">4단</td>
        <td align="center">5단</td>
        <td align="center">6단</td>
        <td align="center">7단</td>
        <td align="center">8단</td>
        <td align="center">9단</td>
      </tr>
    </table>
    <!-- 자바 이용  -->
    <table border=1 bordercolor=black width=500>
      <tr>
      <%
         for(int i=2;i<=9;i++)
         {
      %>
            <td align="center"><%= i+"단" %></td>
      <%
         }
      %>
      </tr>
     <%
         for(int i=1;i<=9;i++)
         {
        	 // /**/
       %>
             <tr> <!--  -->
       <%
        	 for(int j=2;j<=9;j++)
        	 {
        %>
                <td align="center"><%= j+"*"+i+"="+(j*i) %> </td>   
        <%
        	 }
         %>
             </tr>
      <%
         }
      %>
    </table>
  </center>
</body>
</html>