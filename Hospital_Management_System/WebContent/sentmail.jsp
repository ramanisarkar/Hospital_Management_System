<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/Message" method="post">
to <input type="text" name="to">
subject<input type="text" name="subject">
message<input type="text" name="message">
your email id =<input type="text" name="user">
your email id =<input type="text" name="pass">
<input type="submit">
</form>
</body>
</html>