<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
   // food.jsp에서 전송된 no변수를 받는다 
   String no=request.getParameter("no");
   // no에 해당되는 맛집의 정보를 가지고 온다 
   OracleDAO dao=new OracleDAO();
   // 화면 출력 (HTML)
   FoodVO vo=dao.foodDetailData(Integer.parseInt(no)); // web , mobile => 전송된 데이터는 무조건 String이다  
   /*
        서대문구
   */
   String addr=vo.getAddress();
   addr=addr.substring(addr.indexOf(" ")+1);
   addr=addr.substring(0,addr.indexOf(" "));
   //System.out.println("addr="+addr);// 구 , 시
   ArrayList<FoodVO> list=dao.houseLocationData(addr);
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
    width:1200px;
}
h1{
  text-align: center;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <table class="table">
        <tr>
         <%
             StringTokenizer st=new StringTokenizer(vo.getPoster(),"^");
             while(st.hasMoreTokens())
             {
         %>
                <td>
                 <img src="<%=st.nextToken() %>" width=100%>
                </td>
         <%
             }
         %>
        </tr>
      </table>
    </div>
    <div class="row">
      <div class="col-sm-8">
        <table class="table">
         <tr>
           <td colspan="2"><h3><%=vo.getName() %>&nbsp;<span style="color:orange"><%=vo.getScore() %></span></h3></td>
         </tr>
         <tr>
           <td width=20% class="text-right">주소</td>
           <td width=80%><%=vo.getAddress() %></td>
         </tr>
         <tr>
           <td width=20% class="text-right">전화</td>
           <td width=80%><%= vo.getTel() %></td>
         </tr>
         <tr>
           <td width=20% class="text-right">음식종류</td>
           <td width=80%><%=vo.getType() %></td>
         </tr>
         <tr>
           <td width=20% class="text-right">가격대</td>
           <td width=80%><%=vo.getPrice() %></td>
         </tr>
         <tr>
           <td width=20% class="text-right">주차</td>
           <td width=80%><%=vo.getParking() %></td>
         </tr>
         <tr>
           <td width=20% class="text-right">영업시간</td>
           <td width=80%><%=vo.getTime() %></td>
         </tr>
         <tr>
           <td width=20% class="text-right">메뉴</td>
           <td width=80%>
             <ul>
	             <%
	                 if(!vo.getMenu().equals("no"))
	                 {
	                	 st=new StringTokenizer(vo.getMenu(),"원");
	                	 while(st.hasMoreTokens())
	                	 {
	             %>
	                        <li><%=st.nextToken() %></li>
	             <% 
	                	 }
	                 }
	             %>
             </ul>
           </td>
         </tr>
         <tr>
           <td colspan="2" class="text-right">
             맛있다(<%=vo.getGood() %>) &nbsp; 괜찮다(<%=vo.getSoso() %>) &nbsp; 별로(<%=vo.getBad() %>)
           </td>
         </tr>
         <tr>
           <td colspan="2" class="text-right">
             <a href="#" class="btn btn-sm btn-success">예약</a>
             <a href="#" class="btn btn-sm btn-info">찜</a>
             <a href="#" class="btn btn-sm btn-warning">리뷰</a>
             <a href="food.jsp?cno=<%=vo.getCno() %>" class="btn btn-sm btn-danger">목록</a>
           </td>
         </tr>
        </table>
      </div>
      <div class="col-sm-4">
        <table clas="table">
          <tr>
            <td>
              <% 
                 int i=0;
                 for(FoodVO fvo:list)
                 {
                	 
                	if(i>4) break;//5개 출력 
              %>
                    <table class="table">
                     <tr>
                       <td width=30% class="text-center" rowspan="4">
                         <img src="<%=fvo.getPoster().substring(0,fvo.getPoster().indexOf("^")) %>" width=90 height=90>
                       </td>
                       <td width=70%><%=fvo.getName() %>&nbsp;<span style="color:orange"><%=fvo.getScore() %></span></td>
                     </tr>
                     <tr>
                       <td width=70%>주소:<%=addr %></td>
                     </tr>
                     <tr>
                       <td width=70%>음식종류:<%=fvo.getType() %></td>
                     </tr>
                     <tr>
                       <td width=70%>가격대:<%=fvo.getPrice() %></td>
                     </tr>
                    </table>
              <%
                    i++;
                 }
              %>
            </td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</body>
</html>








