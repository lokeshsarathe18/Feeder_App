package com.kulchuri.feeder.login;

import java.io.Serializable;

public class LoginDTO implements Serializable {

    private String uname, type,pwd;

    public LoginDTO() {
    }

    public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

}
