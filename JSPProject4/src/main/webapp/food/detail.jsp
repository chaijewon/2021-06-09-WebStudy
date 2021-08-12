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
   String addr1=vo.getAddress();
   addr1=addr1.substring(0,addr1.indexOf('지'));
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
      <div class="col-sm-7">
        <table class="table">
         <tr>
           <td colspan="2"><h3><%=vo.getName() %>&nbsp;<span style="color:orange"><%=vo.getScore() %></span></h3></td>
         </tr>
         <tr>
           <td width=20% class="text-right">주소</td>
           <td width=80%><%=vo.getAddress().substring(0,vo.getAddress().indexOf("지")) %>
             <br><sub style="color:gray"><%=vo.getAddress().substring(vo.getAddress().indexOf("지")) %></sub>
           </td>
         </tr>
         <tr>
           <td width=20% class="text-right">전화</td>
           <td width=80%><%= vo.getTel() %></td>
         </tr>
         <%
            if(!vo.getType().equals("no"))
            {
         %>
         <tr>
           <td width=20% class="text-right">음식종류</td>
           <td width=80%><%= vo.getType() %></td>
         </tr>
         <%
            }
            if(!vo.getPrice().equals("no"))
           {
         %>
         <tr>
           <td width=20% class="text-right">가격대</td>
           <td width=80%><%= vo.getPrice() %></td>
         </tr>
         <%
           }
            if(!vo.getParking().equals("no"))
            {
         %>
         <tr>
           <td width=20% class="text-right">주차</td>
           <td width=80%><%=vo.getParking() %></td>
         </tr>
         <%
            }
            if(!vo.getTime().equals("no"))
            {
         %>
         <tr>
           <td width=20% class="text-right">영업시간</td>
           <td width=80%><%=vo.getTime() %></td>
         </tr>
         <%
            }
         %>
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
             <a href="../main/main.jsp?cno=<%=vo.getCno() %>&mode=4" class="btn btn-sm btn-danger">목록</a>
           </td>
         </tr>
        </table>
      <div style="height:30px"></div>
      <div id="map" style="width:100%;height:350px;"></div>
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db0485ed4f0d0ece879a4510ed7f48e6&libraries=services"></script>
      <script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch("<%= addr1%>", function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=vo.getName()%></div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
		</script>
        
      </div>
      <div class="col-sm-5">
        <h3 style="color:orange">인근 맛집</h3>
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
                         <img src="<%=fvo.getPoster().substring(0,fvo.getPoster().indexOf("^")) %>" width=100%>
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








