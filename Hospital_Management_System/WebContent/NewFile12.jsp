<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <h1>
      JasperReport Download Example
    </h1>
    <form name="jasper">
      <a href="<%=request.getContextPath()%>/InvoiceManagement?flag=invoicePdf&invoiceId=1">
        Generate Report
      </a>
      <br>
    </form>
</body>
</html>