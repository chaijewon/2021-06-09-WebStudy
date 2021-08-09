<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
<style type="text/css">
#container{
  width:100%;
  margin-top: 30px;
}
h1{
    text-align: center;
}
table {
    margin: 0px auto;
    width:400px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	// 유효성 검사 (JavaScript) => 회원가입,로그인,글쓰기 , 수정 , 삭제 , 회원탈퇴 , ID찾기,결제
	$('#btn').click(function(){
		let len=$('input[type=checkbox]:checked').length;
		if(len===0)
		{
			alert("취미 선택하세요");
			return;
		}
		$('form').submit();
	})
})
</script>
</head>
<!-- 
  http://localhost:8080/JSPProject2/jsp/output.jsp?name=%ED%99%8D%EA%B8%B8%EB%8F%99&sex=%EB%82%A8%EC%9E%90&addr=%EC%84%9C%EC%9A%B8%EC%8B%9C+%EB%A7%88%ED%8F%AC%EA%B5%AC&tel1=010&tel2=2222-2222&hobby=%EA%B2%8C%EC%9E%84&hobby=%EB%82%9A%EC%8B%9C&content=1111
 
  보내는 경우
  홍길동 ==> %ED%99%8D%EA%B8%B8%EB%8F%99 (인코딩)
  받는 경우
  %ED%99%8D%EA%B8%B8%EB%8F%99 ==> 홍길동 (디코딩)  ==> GET / POST
  
  네트워크 => 전송시에 1byte => 한글(2byte) => byte형식으로 변환 =:> 인코딩 
            수신시에 1byte=>2byte로 묶어서 받는다 => 디코딩 
            
            브라우저 : C언어로 제작 (char=> 1byte)
                               =============== ASC
                                char=>2byte 
                               =============== Unicode 
                               UTF-8  => Unicode TransFor Format(1->2byte로 변경)
 -->
<body>
    <!--  input2에 입력한 데이터 ==> output에 받아서 출력 (request)
          한글 처리 : GET,POST => 처리방식이 틀리다
          
          http://localhost/JSPProject2/jsp/input2.jsp => 80은 출력하지 않는다 (port를 제거)
     -->
     <div id="container">
       <h1>개인 정보</h1>
       <!-- 
          데이터 전송 방식 
          GET : URL뒤에 ?데이터 전송 
          http://localhost/JSPProject2/jsp/output.jsp?name=%ED%99%8D%EA%B8%B8%EB%8F%99&sex=%EB%82%A8%EC%9E%90&addr=%EC%84%9C%EC%9A%B8%EC%8B%9C+%EB%A7%88%ED%8F%AC%EA%B5%AC&tel1=010&tel2=2222-2222&hobby=%EB%93%B1%EC%82%B0&hobby=%EA%B2%8C%EC%9E%84&content=1111
          보안 취약 => 단순한 검색 , 페이지번호 , 영화번호 
          <a> , location.href="" , sendRedirect() => GET(무조건) => ?에 값을 보낸다 
          선택 : GET/POST => <form>
          POST : <form> , ajax : 내부 네트워크를 통해서 전송 (보안) 
          =====  전송할 데이터가 많은 경우(회원가입 , 글쓰기 , 파일전송) , 보안이 필요한 경우(로그인 , 아이디중복체크) 
        -->
       <form method="get" action="output.jsp"><!-- method를 지정하지 않는 경우 : GET(default) -->
       <table class="table_content">
        <tr>
         <th width=25%>이름</th>
         <td width=75%><input type=text name=name id=name size=15></td>
        </tr>
        <tr>
          <th width=25%>성별</th>
          <td width=75%>
            <input type=radio name=sex checked value="남자">남자<!-- 라디오,체크박스는 반드시 value="" -->
            <input type=radio name=sex value="여자">여자<!-- name이 동일해야 그룹이 설정(그룹설정 이유=> 한개만 선택) -->
          </td>
        </tr>
        <tr>
          <th width=25%>주소</th>
          <td width=75%>
           <input type=text name=addr size=25>
          </td>
        </tr>
        <tr>
          <th width=25%>전화</th>
          <td width=75%>
            <select name=tel1>
              <option>010</option>
              <option>011</option>
              <option>017</option>
            </select>
            <input type=text name=tel2 size=15>
          </td>
        </tr>
        <tr>
          <th width=25%>취미</th>
          <td width=75%>
            <!-- checkbox => 한번에 받는다 => 반드시 name값이 동일  -->
            <input type="checkbox" name=hobby value="등산">등산
            <input type="checkbox" name=hobby value="게임">게임
            <input type="checkbox" name=hobby value="낚시">낚시
            <input type="checkbox" name=hobby value="여행">여행
            <input type="checkbox" name=hobby value="독서">독서
          </td>
        </tr>
        <tr>
          <th width=25%>소개</th>
          <td width=75%>
            <textarea rows="5" cols="30" name=content></textarea>
          </td>
        </tr>
        <tr>
          <td colspan="2" align=center>
            <input type=button id="btn" value=전송>
            <!-- <button>,<input type=submit>, <input type=image> : submit처리  -->
            <!-- 
                  자바,오라클 , HTML , CSS , JavaScript(Jquery) ==> JSP
             -->
          </td>
        </tr>
       </table>
       </form>
     </div>
</body>
</html>









