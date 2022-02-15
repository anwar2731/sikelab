/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package akses;


/**
 *
 * @author ToniAfriantoni
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Akses{
    private Connection con;
    private Statement stmt;
    private ResultSet resultSet;
    private PreparedStatement preparedStatement;
    private String dsn;
    private String login;
    private String pwd;

    public Akses(String dsn, String login, String pwd) {
        this.dsn = dsn;
        this.login = login;
        this.pwd = pwd;
    }

    public Akses() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public Connection connect()throws ClassNotFoundException,SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dsn,login,pwd);
        stmt=con.createStatement();
        return con;
    }
    public int executeUpdate(String str) throws SQLException{
        return stmt.executeUpdate(str);
    }
    public ResultSet executeQuery(String str)throws SQLException{
        resultSet=stmt.executeQuery(str);
        return resultSet;
    }
    public void disconnect()throws SQLException{
        if(resultSet!=null)resultSet.close();
       if(stmt!=null) stmt.close();
       if(con!=null) con.close();
    }
    public ResultSet getResultSet(){
        return resultSet;
    }
    public Statement getStatement(){
        return stmt;
    }
    public PreparedStatement getPreparedStatement(String str) throws SQLException{
        preparedStatement=con.prepareStatement(str);
        return preparedStatement;
    }
}