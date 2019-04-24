<%-- 
    Document   : checkFacultyDuplicate
    Created on : Mar 23, 2018, 9:24:41 AM
    Author     : DELL
--%>
<%@page import="com.kulchuri.feeder.faculty.FacultyDAOImp"%>
<%
    String data = request.getParameter("data");
    if (!new FacultyDAOImp().checkFacultyDuplicateInfo(data)) {
        out.println("already registered");
    } 
%>