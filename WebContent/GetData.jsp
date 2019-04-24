<%-- 
    Document   : GetData
    Created on : Mar 21, 2018, 9:39:43 AM
    Author     : DELL
--%>
<%
	if (request.getMethod().equalsIgnoreCase("post")) {
		String course1 = request.getParameter("course");
		String Mca[] = { "X", "Y", "Z" };
		String btech[] = { "CS", "IT", "EC", "ME", "CE", "CHE", "EE", "EX" };
		if (request.getParameter("course").equalsIgnoreCase("MCA")) {
			for (String s : Mca) {

				out.println("<option value=" + s + ">" + s + "</option>");
			}
		} else {
			for (String s : btech) {
				out.println("<option value=" + s + ">" + s + "</option>");
			}

		}
	}
	if (request.getMethod().equalsIgnoreCase("get")) {
		String course = request.getParameter("course");
		String be[] = { "1", "2", "3", "4", "5", "6", "7", "8" };
		String mca[] = { "1", "2", "3", "4", "5", "6" };
		if (course.equalsIgnoreCase("be")) {
			for (String sem : be) {
				out.println("<option value=" + sem + ">" + sem + "</option>");
			}
		} else {
			for (String sem : mca) {
				out.println("<option value=" + sem + ">" + sem + "</option>");
			}
		}
	}
%>