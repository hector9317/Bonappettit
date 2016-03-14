package com.aht.domain.relationship;

import java.util.Date;
import com.aht.domain.Dish;
import com.aht.domain.User;
import java.text.SimpleDateFormat;
import org.neo4j.ogm.annotation.EndNode;
import org.neo4j.ogm.annotation.GraphId;
import org.neo4j.ogm.annotation.RelationshipEntity;
import org.neo4j.ogm.annotation.StartNode;

@RelationshipEntity(type = "RATED")
public class Rate {
	@GraphId
	private Long id;
	@StartNode
	private User user;
	@EndNode
	private Dish dish;
	private String on;
	private float rating;

	public Rate() { }

	public Rate(User user, Dish dish, float rating) {
		this.user = user;
		this.dish = dish;
		this.on = getDate();
		this.rating = rating;
		
		this.dish.getRates().add(this);
		this.user.getRates().add(this);
	}

	public Long getId() {
		return id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Dish getDish() {
		return dish;
	}

	public void setDish(Dish dish) {
		this.dish = dish;
	}

	public String getOn() {
		return on;
	}

	public void setOn(String on) {
		this.on = on;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public static String getDate() {
		Date date = new Date();
		return new SimpleDateFormat("dd-MM-YYYY").format(date);
	}
}
