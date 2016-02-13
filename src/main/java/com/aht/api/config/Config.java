package com.aht.api.config;

import java.sql.*;

/**
 * Created by azu on 30/10/15.
 */
public class Config {
    public static Connection connectToNeo4j(String username, String password) throws ClassNotFoundException, SQLException {
        Class.forName("org.neo4j.jdbc.Driver");
        return DriverManager.getConnection("jdbc:neo4j://localhost:7474/", username, password);
    }
}
