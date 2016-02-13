package com.aht.api.engine;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by azu on 27/10/15.
 */
public class ItemRecommender {

    public ResultSet getRecommendationsForItem(long id,int numberOfRecommendations, Connection con){
        ResultSet rs = null;
        try(Statement stmt = con.createStatement()){
            rs = stmt.executeQuery("MATCH (d1:Dish)-[s:SAME_CATEGORIES]-(reco:Dish) "+
                    "WHERE id(d1)="+id+" "+
                    "WITH     reco, s.similarity AS sim " +
                    "ORDER BY sim DESC LIMIT "+numberOfRecommendations+" " +
                    "RETURN   reco");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public ResultSet getItemBasedRecommendations(LinkedList<Long> ids, LinkedList<Integer> visualisations, int numberOfRecommendations, Connection con){
        ResultSet rs = null;
        int totalVisualisations = 0;
        for(Integer v: visualisations){
            totalVisualisations += v;
        }
        int[] quantity = new int[visualisations.size()];
        for(int i=0; i < visualisations.size(); i++){
            float percentage = 1 + visualisations.get(i) / totalVisualisations;
            quantity[i] = Math.round(numberOfRecommendations * percentage);
        }
        String query = "MATCH (d1:Dish)-[s:SAME_CATEGORIES]-(reco:Dish) WHERE id(d1)="+ids.get(0)+" WITH d1,reco, s.similarity AS sim ORDER BY sim DESC LIMIT "+quantity[0]+" RETURN reco ";
        if(visualisations.size() > 1){
            for(int i=1; i < visualisations.size(); i++){
                query += "UNION\n MATCH (d1:Dish)-[s:SAME_CATEGORIES]-(reco:Dish) WHERE id(d1)="+ids.get(i)+" WITH d1,reco, s.similarity AS sim ORDER BY sim DESC LIMIT "+quantity[i]+" RETURN reco ";
            }
        }
        try(Statement stmt = con.createStatement()){
            rs = stmt.executeQuery(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public ResultSet selectItemLike(String query, int items, Connection con) throws SQLException {
        ResultSet rs = null;
        try(Statement stmt = con.createStatement()){
            rs = stmt.executeQuery("MATCH (dish:Dish) WHERE dish.name =~ '(?i).*"+query+".*' return dish limit "+items+" ");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public ResultSet getUserNeighbors(int userID, Connection con) throws SQLException {
        ResultSet rs = null;
        try(Statement stmt = con.createStatement()){
            rs = stmt.executeQuery("MATCH (u:User {userID = "+userID+"}) return u;");
        } catch (SQLException e){
            e.printStackTrace();
        }
        return rs;
    }

    public ResultSet getRecommendationsByUser(int userID, Connection con) throws SQLException {
        ResultSet rs = null;
        try(Statement stmt = con.createStatement()){
            rs = stmt.executeQuery("MATCH    (b:User)-[r:RATED]->(m:Dish), (b)-[s:NEIGHBOR]-(a:User {userID: "+userID+"})\n" +
                    "WHERE    NOT((a)-[:RATED]->(m))\n" +
                    "WITH     m, s.similarity AS similarity, r.rating AS rating\n" +
                    "ORDER BY m.name, similarity DESC\n" +
                    "WITH     m.name AS dish, COLLECT(rating)[0..3] AS ratings\n" +
                    "WITH     dish, REDUCE(s = 0, i IN ratings | s + i)*1.0 / SIZE(ratings) AS reco\n" +
                    "ORDER BY reco DESC\n" +
                    "RETURN   dish AS Dish, reco AS Recommendation;");
        } catch (SQLException e){
            e.printStackTrace();
        }
        return rs;
    }

}
