<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      response : 응답처리 , 서버에서 화면 이동 
                          ===============
                          로그인처리 => 서버에서 메인이동 
                          글쓰기 => 목록이동 
                          예매 => 마이페이지 
                          삭제 => 목록이동 
                          수정 => 내용보기 
                => 응답처리 
                   ======
                   1. HTML을 전송한다 (******) : 브라우저 화면에 출력 
                   2. Cookie를 보낸다
                   3. 파일을 보낸다 (파일다운로드)
      ==> HttpServletResponse => 생성 내장 객체 (이미 생성된 객체명)
      ==> 1. setHeader() : 다운로드시에 한번 사용 (데이터 전송 전에 보낸다) : 파일명, 파일크기 =>파일 다이얼로그창을 보여준다 
          2. sendRedirect() : 서버에서 다른 파일로 이동 => GET
          3. setCookie() 
          4. setContentType() => XML/HTML
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>