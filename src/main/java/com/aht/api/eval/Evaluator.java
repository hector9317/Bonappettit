package com.aht.api.eval;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by azu on 29/11/15.
 */
public class Evaluator {
    public boolean setItemSimilarity(Connection con, long id) {
        // Querying
        try (Statement stmt = con.createStatement()) {
            ResultSet rs = stmt.executeQuery("MATCH (d1:Dish)-[x:IS]->(c1:Category)<-[y:IS]-(d2:Dish) WHERE id(d1)="+id+" WITH  d1,d2,count(c1) as categories MERGE (d1)-[s:SAME_CATEGORIES]-(d2) SET s.similarity = categories;");

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }
}
