<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 30px;
}
.row {
    margin: 0px auto;
    width:600px;
}
h1{
  text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#writeBtn').click(function(){
		// 오라클 NOT NULL일 경우에만 처리
		let name=$('#name').val();
		if(name.trim()==="") // space => 공백  => 공백제거 (trim())
		{
			$('#name').focus();
			return; // click함수 종료
		}
		let subject=$('#subject').val()
		if(subject.trim()==="")
		{
			$('#subject').focus();
			return;
		}
		
		let content=$('#content').val();
		if(content.trim()==="")
		{
			$('#content').focus();
			return;
		}
		
		let pwd=$('#pwd').val();
		if(pwd.trim()==="")
		{
			$('#pwd').focus();
			return;
		}
		
		// 전체가 입력된 상태 
		$('form').submit(); // 데이터를 action에 등록한 파일로 전송 
	})
})
</script>
</head>
<%--
       => 폼 (입력폼) => 자신을 호출하면 안된다 (검색:데이터 한개)
       처리 순서 
       =======
       HTML 우선순위가 아니다 
       Java가 우선순위 
       
       입력폼 ==> 입력된 데이터를 받아서 오라클 
       ====     =======================
       insert.jsp       insert_ok.jsp
       update.jsp       update_ok.jsp
       delete.jsp       delete_ok.jsp
       =============================== 한번에 처리 (Ajax)
       
 --%>
<body>
  <div class="container">
   <h1>수정하기</h1>
   <div class="row">
     <form method="post" action="update_ok.jsp">
     <table class="table">
       <tr>
        <th width=15% class="text-right success">이름</th>
        <td width=85%>
          <input type=text name=name id=name size=15 class="input-sm">
          <%-- 
              name : 자바에서 값을 받을때 구분된 속성 
              id : 자바스크립트 , CSS
           --%>
        </td>
       </tr>
       
       <tr>
        <th width=15% class="text-right success">제목</th>
        <td width=85%>
          <input type=text name=subject id=subject size=50 class="input-sm">
        </td>
       </tr>
       
       <tr>
        <th width=15% class="text-right success">내용</th>
        <td width=85%>
          <textarea rows="8" cols="55" name=content id=content></textarea>
        </td>
       </tr>
       
       
       <tr>
        <th width=15% class="text-right success">비밀번호</th>
        <td width=85%>
          <input type=password name=pwd id=pwd size=10 class="input-sm">
        </td>
       </tr>
       
       <tr>
         <td colspan="2" class="text-center">
           <input type=button class="btn btn-sm btn-primary" id="writeBtn" value="수정">
           <input type=button class="btn btn-sm btn-primary" value="취소" 
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
