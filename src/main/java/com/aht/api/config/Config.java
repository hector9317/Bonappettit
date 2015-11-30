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

    public boolean createSimilarityDishes(Connection con) {
        // Querying
        try (Statement stmt = con.createStatement()) {
            ResultSet rs = stmt.executeQuery("MATCH (d1:Dish)-[x:IS]->(c1:Category)<-[y:IS]-(d2:Dish) WITH  d1,d2,count(c1) as categories MERGE (d1)-[s:SAME_CATEGORIES]-(d2) SET s.similarity = categories;");

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

}
