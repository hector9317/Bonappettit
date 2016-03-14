package com.aht.domain.relationship;

import org.neo4j.ogm.annotation.EndNode;
import org.neo4j.ogm.annotation.GraphId;
import org.neo4j.ogm.annotation.StartNode;
import org.neo4j.ogm.annotation.RelationshipEntity;

import com.aht.domain.User;

@RelationshipEntity(type = "NEIGHBOR")
public class Neighbor {
	@GraphId
	private Long id;
	@StartNode
	private User first;
	@EndNode
	private User second;
	private float value;

	public Neighbor() {
	}

	public Neighbor(User first, User second, float value) {
		this.first = first;
		this.second = second;
		this.value = value;
		
		this.first.getNeighbors().add(this);
		this.second.getNeighbors().add(this);
		
	}

	public Long getId() {
		return id;
	}

	public User getFirst() {
		return first;
	}

	public void setFirst(User first) {
		this.first = first;
	}

	public User getSecond() {
		return second;
	}

	public void setSecond(User second) {
		this.second = second;
	}

	public float getValue() {
		return value;
	}

	public void setValue(float value) {
		this.value = value;
	}
}
