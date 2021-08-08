<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%--
       <% %> => 일반 자바 코딩 (HTML과 구분)
       <%= %>=> out.println() ==> 화면에 데이터를 출력 
       
       1. 지시자 : page,include,taglib
       2. 자바 vs HTML 구분
       3. 내장 객체 : request,response,cookie , session , exception,config,application,out,pageContext
       4. 에러처리 방법 
       5. 자바빈즈 
       6. 액션 태그 <jsp:~>
       7. 데이터베이스 => DAO
       8. EL/JSTL
       9. MVC => XML/Annotation => Controller 
 --%>
<!--  자바 코딩 -->
<%
    // 데이터베이스에서 값을 읽어 온다 (자바 문법)
    MelonDAO dao=new MelonDAO();
    ArrayList<MelonVO> list=dao.musicListData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px;
}
h1{
   text-align: center;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/*
 *    이벤트 
        => click (모든 태그에 적용),chang(<select>),keyup(<input>) , hover(모든 태그에 적용)
           태그.click(function(){
        	   처리 내용 (자바스크립트 문법 적용) => 연산자,제어문 , 내장함수 
        	   = 형변환 : Number() , String()...
        	   String 
        	   ======> 문자자르기 : substring(1,2) 
        	           공백문자 제거 : trim()
        	           위치찾기  : indexOf() , lastIndexOf()
           })
           태그.change(function(){
        	   처리 내용 
           })
           태그.hover(function(){
        	   처리 내용 
           })
           태그.keyup(function(){
        	   처리 내용 => 검색 
           })
      값을 읽어 오는 방법 
        => 태그.text() , 태그.attr(속성명) => 속성값을 읽어 온다 , 태그.val()=> 사용자 입력값을 받는다 
      값을 설정하는 방법 
        => 태그.text(값) , 태그.attr(속성명,값)  , 태그.val(값) => input타입에 값을 설정 
        => 태그.html(값) => HTML자체를 첨부
      태그를 가지고 오는 방법 
        => id(#),class(.),tab_name
 */
$(function(){
	$('.musics').css("cursor","pointer");
	$('.musics').click(function(){
		let key=$(this).attr("data");
		let url="http://youtube.com/embed/"+key
		$('#movie').attr("src",url)
	})
})
</script>
</head>
<body>
  <div class="container">
    <h1>멜론 Top100</h1>
    <div class="col-sm-8">
      <!-- 뮤직 목록 -->
      <table class="table table-hover">
        <tr class="danger">
          <th class="text-center"></th>
          <th class="text-center">곡명</th>
          <th class="text-center">가수명</th>
        </tr>
        <!-- 데이터 출력 부분  -->
        <%
           for(MelonVO vo:list)
           {
        %>
                <%-- 
                       <%= 출력내용; %> 
                       out.println(출력내용);
                 --%>
                <tr class="musics" data="<% out.println(vo.getKey());%>">
                  <td class="text-center"><img src="<%= vo.getPoster()%>" width=30 height=30></td>
                  <td><%= vo.getTitle() %></td>
                  <td><%= vo.getSinger() %></td>
                </tr>
        <%
           }
        %>
      </table>
    </div>
    <div class="col-sm-4">
      <!-- 상세보기 (동영상) -->
      <embed src="" width=350 height=300 id="movie">
    </div>
  </div>
</body>
</html>









