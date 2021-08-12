<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.*,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
     String path="/application/web.xml";
     char[] buffer=new char[1024];
     int len=-1;
     int i=0;
     URL url=application.getResource(path);
     try
     {
    	 InputStreamReader fr=new InputStreamReader(url.openStream(),"UTF-8");
    	 while((i=fr.read(buffer))!=-1)
    	 {
    		 out.println(new String(buffer,0,i));
    	 }
     }catch(Exception ex){ex.printStackTrace();}
  %>
</body>
</html>