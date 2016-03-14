package com.aht.domain.relationship;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.neo4j.ogm.annotation.EndNode;
import org.neo4j.ogm.annotation.GraphId;
import org.neo4j.ogm.annotation.RelationshipEntity;
import org.neo4j.ogm.annotation.StartNode;

import com.aht.domain.Dish;
import com.aht.domain.User;

@RelationshipEntity(type = "UPLOADED")
public class Upload {
	@GraphId
	private Long id;
	@StartNode
	private User user;
	@EndNode
	private Dish dish;
	private String on;

	public Upload() {
	}

	public Upload(User user, Dish dish) {
		this.user = user;
		this.dish = dish;
		this.on = getDate();
		
		this.user.getUploads().add(this);
		this.dish.getUploads().add(this);
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public static String getDate() {
		Date date = new Date();
		return new SimpleDateFormat("dd-MM-YYYY").format(date);
	}
}
