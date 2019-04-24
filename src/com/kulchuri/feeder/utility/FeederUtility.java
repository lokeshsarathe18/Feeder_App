package com.kulchuri.feeder.utility;

import java.util.ArrayList;
import java.util.HashMap;

final public class FeederUtility {

	private FeederUtility() {
	}

	public static HashMap<String, String> getColleges() {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("0103", "LNCT");
		hm.put("0157", "LNCTS");
		hm.put("0176", "LNCTE");
		return hm;
	}

	public static ArrayList<Integer> getSemesters() {
		ArrayList<Integer> al = new ArrayList<>();
		al.add(1);
		al.add(2);
		al.add(3);
		al.add(4);
		al.add(5);
		al.add(6);
		al.add(7);
		al.add(8);
		return al;
	}

	public static ArrayList<Integer> getExperience() {
		ArrayList<Integer> al = new ArrayList<>();
		al.add(1);
		al.add(2);
		al.add(3);
		al.add(4);
		al.add(5);
		al.add(6);
		al.add(7);
		al.add(8);
		al.add(9);
		al.add(10);
		al.add(11);
		al.add(12);
		al.add(13);
		al.add(14);
		al.add(15);
		return al;
	}

	public static ArrayList<Integer> getBELactures() {
		ArrayList<Integer> al = new ArrayList<>();
		al.add(1);
		al.add(2);
		al.add(3);
		al.add(4);
		al.add(5);
		al.add(6);
		al.add(7);
		al.add(8);
		return al;
	}

	public static ArrayList<Integer> getMCALactures() {
		ArrayList<Integer> al = new ArrayList<>();
		al.add(1);
		al.add(2);
		al.add(3);
		al.add(4);
		al.add(5);
		al.add(6);

		return al;
	}

	public static ArrayList<String> getCourses() {
		ArrayList<String> al = new ArrayList<>();
		al.add("BE");
		al.add("MCA");
		al.add("MBA");
		al.add("M.Tech");
		al.add("B.Pharma");
		al.add("M.Pharma");
		return al;
	}

	public static ArrayList<String> getCategories() {
		ArrayList<String> al = new ArrayList<>();
		al.add("GN");
		al.add("OBC");
		al.add("ST");
		al.add("SC");
		al.add("Other");
		return al;
	}

	public static ArrayList<String> getBloodGroups() {
		ArrayList<String> al = new ArrayList<>();
		al.add("A+");
		al.add("AB+");
		al.add("B+");
		al.add("O+");
		al.add("O-");
		return al;
	}

	public static ArrayList<String> getBranches() {
		ArrayList<String> al = new ArrayList<>();
		al.add("CS");
		al.add("IT");
		al.add("EC");
		al.add("ME");
		al.add("CE");
		al.add("CHE");
		al.add("EE");
		al.add("EX");
		return al;
	}

	public static ArrayList<String> getSection() {
		ArrayList<String> al = new ArrayList<>();
		al.add("A");
		al.add("B");
		al.add("C");
		al.add("D");

		return al;
	}

	public static ArrayList<String> getSubject() {
		ArrayList<String> al = new ArrayList<>();
		al.add("OS");
		al.add("CN");
		al.add("DS");
		al.add("DCOM");

		return al;
	}
}
