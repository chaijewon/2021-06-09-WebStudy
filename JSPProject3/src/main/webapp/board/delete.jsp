<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 값을 받는다 (게시물번호) => detail.jsp에 보낸 데이터 
    String no=request.getParameter("no");
    // 오라클 => 공유된 데이터 
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
    width:350px;
}
h1{
  text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	// 데이터 유효성 검사 : jquery
	$('.btn-danger').click(function(){
		let pwd=$('#pwd').val();
		if(pwd.trim()==="")
		{
			$('#pwd').focus();
			return;
		}
		
		$('form').submit();
	})
})
</script>
</head>
<body>
  <div class="container">
   <h1>삭제하기</h1>
   <div class="row">
    <form method=post action="delete_ok.jsp">
     <table class="table">
      <tr>
       <td class="text-center">
       비밀번호:<input type=password name=pwd id="pwd" size=10 class="input-sm">
       <input type=hidden name=no value="<%=no%>">
       <!-- 화면에 출력하지 않는다 , 데이터 전송은 가능  -->
       </td>
      </tr>
      <tr>
        <td class="text-center">
          <input type=button value="삭제" class="btn btn-sm btn-danger">
          <input type=button value="취소" class="btn btn-sm btn-info"
           onclick="javascript:history.back()"
          >
        </td>
      </tr>
     </table>
     </form>
   </div>
  </div>
</body>
</html>






