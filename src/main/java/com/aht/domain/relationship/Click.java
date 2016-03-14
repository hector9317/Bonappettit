package com.aht.domain.relationship;

import org.neo4j.ogm.annotation.EndNode;
import org.neo4j.ogm.annotation.GraphId;
import org.neo4j.ogm.annotation.RelationshipEntity;
import org.neo4j.ogm.annotation.StartNode;

import com.aht.domain.Dish;
import com.aht.domain.User;

@RelationshipEntity(type = "CLICKED")
public class Click {
	@GraphId
	private Long id;
	@StartNode
	private User user;
	@EndNode
	private Dish dish;
	private int times;
	private String lastClick;

	public Click() { }

	public Click(User user, Dish dish, int times, String lastClick) {
		this.user = user;
		this.dish = dish;
		this.times = times;
		this.lastClick = lastClick;
		
		this.user.getClicks().add(this);
		this.dish.getClicks().add(this);
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

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public String getLastClick() {
		return lastClick;
	}

	public void setLastClick(String lastClick) {
		this.lastClick = lastClick;
	}
}
