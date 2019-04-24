package com.kulchuri.feeder.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class Feeder_DB implements FeerderDbData {

    private static Connection conn = null;

    private Feeder_DB() {
    }

    public static Connection getFeederDB() {
        if (conn == null) {
            try {
                Class.forName(DRIVER);
                conn = DriverManager.getConnection(URL, USER, PWD);
            } catch (Exception e) {
                System.out.println("Connection Failed:" + e);
            }
        }
        return conn;
    }

    public static void main(String[] args) {
        System.out.println(getFeederDB());
    }
}
