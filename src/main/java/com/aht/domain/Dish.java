package com.aht.domain;

import java.util.HashSet;
import java.util.Set;
import org.neo4j.ogm.annotation.GraphId;
import org.neo4j.ogm.annotation.NodeEntity;
import org.neo4j.ogm.annotation.Relationship;

import com.aht.domain.relationship.Click;
import com.aht.domain.relationship.Rate;
import com.aht.domain.relationship.Upload;

@NodeEntity
public class Dish {
	@GraphId
	private Long id;
	private String name;
	private String picture;
	private String description;
	@Relationship(type = "IS")
	private Set<Category> categories;
	@Relationship(type = "RATED", direction = Relationship.INCOMING)
	private Set<Rate> rates = new HashSet<Rate>();
	@Relationship(type = "CLICKED", direction = Relationship.INCOMING)
	private Set<Click> clicks = new HashSet<Click>();
	@Relationship(type = "UPLOADED", direction = Relationship.INCOMING)
	private Set<Upload> uploads = new HashSet<Upload>();

	public Long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<Category> getCategories() {
		return categories;
	}

	public void setCategories(Set<Category> categories) {
		this.categories = categories;
	}

	public Set<Rate> getRates() {
		return rates;
	}

	public void setRates(Set<Rate> rates) {
		this.rates = rates;
	}

	public Set<Click> getClicks() {
		return clicks;
	}

	public void setClicks(Set<Click> clicks) {
		this.clicks = clicks;
	}

	public Set<Upload> getUploads() {
		return uploads;
	}

	public void setUploads(Set<Upload> uploads) {
		this.uploads = uploads;
	}
}
