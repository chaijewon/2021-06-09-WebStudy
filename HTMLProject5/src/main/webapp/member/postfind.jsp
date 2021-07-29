<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<%
   // 자바 코딩 
   ZipcodeDAO dao=new ZipcodeDAO();
   String dong=request.getParameter("dong");
   ArrayList<ZipcodeVO> list=null;
   if(dong!=null)
   {
	   list=dao.postFind(dong);
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
function ok(zip,addr)
{
	 opener.frm.post1.value=zip.substring(0,3);
	 opener.frm.post2.value=zip.substring(4,7);
	 opener.frm.addr.value=addr;
	 self.close();
}
</script>
</head>
<body>
  <center>
    <h3>우편번호 검색</h3>
    <table id="table_content" width=420>
     <tr>
       <td>
       <form method=post action="postfind.jsp">
         입력:<input type=text name=dong size=15>
         <input type=submit value="우편번호찾기">
       </form>
       </td>
     </tr>
    </table>
    <table id="table_content" width=420>
    <tr>
      <th>우편번호</th>
      <th>주소</th>
    </tr>
    <%
        if(list!=null)
        {
        	for(ZipcodeVO vo:list)
        	{
    %>
                 <tr>
                   <td><%= vo.getZipcode() %></td>
                   <td><a href="javascript:ok('<%= vo.getZipcode() %>','<%= vo.getSido()+" "+vo.getGugun()+" "+vo.getDong()+" "+ vo.getBunji()%>')"><%= vo.getSido()+" "+vo.getGugun()+" "+vo.getDong()+" "+ vo.getBunji()%></a></td>
                 </tr>
    <%
        	}
        }
    %>
    </table>
  </center>
</body>
</html>








