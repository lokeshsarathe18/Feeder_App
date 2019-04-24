package com.kulchuri.feeder.subject;

import java.io.Serializable;

public class SubjectBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int sid, sem;
	private String branch, sname;

	public SubjectBean() {
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getSem() {
		return sem;
	}

	public void setSem(int sem) {
		this.sem = sem;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

}
