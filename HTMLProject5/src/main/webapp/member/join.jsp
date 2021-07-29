<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#postBtn').click(function(){
		window.open("postfind.jsp","postfind","width=480,height=350,scrollbars=yes");
	})
})
</script>
</head>
<body>
   <center>
     <h1>회원가입</h1>
     <form method=post name="frm">
     <table id="table_content" width=450>
       <tr>
        <th width=20%>우편번호</th>
        <td width=80%>
          <input type=text size=7 readonly name="post1">-
          <input type=text size=7 readonly name="post2">
          <input type=button value="우편번호검색" id="postBtn">
        </td>
       </tr>
       <tr>
         <th width=20%>주소</th>
         <td width=80%>
          <input type=text name=addr size=50>
         </td>
       </tr>
     </table>
     </form>
   </center>
</body>
</html>