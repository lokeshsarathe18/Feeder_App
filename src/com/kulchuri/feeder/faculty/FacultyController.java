package com.kulchuri.feeder.faculty;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig(maxFileSize = 567898989)
@WebServlet(name = "FacultyController", urlPatterns = {"/FacultyController"})
public class FacultyController extends HttpServlet {

    RequestDispatcher rd;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FacultyDTO fdto=new FacultyDTO();
        FacultyDAO fdao=new FacultyDAOImp();
        PrintWriter pw = response.getWriter();
		String opn = request.getParameter("opn");
        fdto.setAddress(request.getParameter("address"));
        fdto.setBgroup(request.getParameter("bgroup"));
        fdto.setCertification(request.getParameter("certfication"));
        fdto.setCity(request.getParameter("city"));
        fdto.setDob(request.getParameter("dob"));
        fdto.setDoj(request.getParameter("doj"));
        fdto.setEmail(request.getParameter("email"));
        fdto.setEmpid(request.getParameter("empid"));
        fdto.setExperiance(Float.parseFloat(request.getParameter("experience")));
        fdto.setGender(request.getParameter("gender"));
        fdto.setGmno(request.getParameter("gmno"));
        fdto.setGname(request.getParameter("gname"));
        String arr[] = request.getParameterValues("hobby");
        String hobby = "";
        for (String s : arr) {
            hobby = hobby + s + ",";
        }
        fdto.setHobby(hobby);
        fdto.setMno(request.getParameter("mno"));
        fdto.setName(request.getParameter("name"));
        fdto.setPassword(request.getParameter("pwd"));
       
        fdto.setPincode(Integer.parseInt(request.getParameter("pincode")));
        fdto.setQualification(request.getParameter("qualification"));
        fdto.setState(request.getParameter("state"));
        if (opn.equalsIgnoreCase("register")) {
        	 InputStream photo = request.getPart("photo").getInputStream();
            if (fdao.addFaculty(fdto,photo)) {
				rd = request.getRequestDispatcher("admin_viewAllFaculty.jsp");
				rd.forward(request, response);
			} else {
				rd = request.getRequestDispatcher("admin_addFaculty.jsp");
				rd.forward(request, response);
			}

		} else if (opn.equalsIgnoreCase("update")) {
			
			String eno = request.getParameter("eno");
			fdto.setEno(Integer.parseInt(eno));
			if (fdao.updateFaculty(fdto)) {
				rd = request.getRequestDispatcher("admin_viewAllFaculty.jsp");
				rd.forward(request, response);
			} else {
				rd = request.getRequestDispatcher("faculty_info.jsp");
				rd.include(request, response);
			}
		}
     
       }
    }
