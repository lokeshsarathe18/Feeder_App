<%-- 
    Document   : checkFacultyDuplicate
    Created on : Mar 23, 2018, 9:24:41 AM
    Author     : DELL
--%>
<%@page import="com.kulchuri.feeder.student.StudentDAOImp"%>

<%
    String data = request.getParameter("data");
    if (!new StudentDAOImp().checkStudentDuplicateInfo(data)) {
        out.println("already registered");
    } 
%>