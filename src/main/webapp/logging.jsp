<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.logging.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logging Demo</title>
</head>
<body>
	<%
		Logger logger = Logger.getLogger(this.getClass().getName());
		logger.setLevel(Level.FINE);
		ConsoleHandler handler = new ConsoleHandler();
        // PUBLISH this level
        handler.setLevel(Level.FINER);
        logger.addHandler(handler);
	%>

	<c:forEach var="counter" begin="1" end="3" step="1">
		<c:out value="${counter}" />
		<%
			String message = "counter=" + pageContext.findAttribute("counter");
				logger.info(message);
				logger.severe(message);
				logger.warning(message);
		%>
	</c:forEach>
	<%
		try {
			// Simulating Exceptions
			throw new Exception("Simulating an exception");
		} catch (Exception ex) {
			logger.log(Level.SEVERE, ex.getMessage(), ex);
		}
		logger.info("This is a info-level message");
		logger.config("This is a config-level message");
		logger.fine("This is a fine-level message");
		logger.finer("This is a finer-level message");
		logger.finest("This is a finest-level message");
		System.out.println("Writing to System.out");
		System.err.println("Writing to System.err");
	%>
</body>
</html>
