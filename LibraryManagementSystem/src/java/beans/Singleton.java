/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Yash Gaikwad
 */
public class Singleton {
    
    private static String dbURL = "jdbc:derby://localhost:1527/OnlineLibrary";
    private static String user = "abc";
    private static String pass = "abc";

    public Singleton() {
    }

    public static String getDbURL() {
        return dbURL;
    }

    public static void setDbURL(String dbURL) {
        Singleton.dbURL = dbURL;
    }

    public static String getUser() {
        return user;
    }

    public static void setUser(String user) {
        Singleton.user = user;
    }

    public static String getPass() {
        return pass;
    }

    public static void setPass(String pass) {
        Singleton.pass = pass;
    }
    
    
    
}
