package com.aht.domain;

import java.util.Set;
import java.util.HashSet;

import com.aht.domain.relationship.Click;
import com.aht.domain.relationship.Neighbor;
import com.aht.domain.relationship.Rate;
import com.aht.domain.relationship.Upload;

import org.neo4j.ogm.annotation.GraphId;
import org.neo4j.ogm.annotation.NodeEntity;
import org.neo4j.ogm.annotation.Relationship;

@NodeEntity
public class User {
	@GraphId
	private Long id;
	private String name;
	private String lastName;
	private String lastNameII;
	private String username;
	private String password;
	private String gender;
	private String nationality;
	private String birthDate;
	private String email;
	private String since;
	@Relationship(type = "RATED")
	private Set<Rate> rates = new HashSet<Rate>();
	@Relationship(type = "CLICKED")
	private Set<Click> clicks = new HashSet<Click>();
	@Relationship(type = "UPLOADED")
	private Set<Upload> uploads = new HashSet<Upload>();
	@Relationship(type = "NEIGHBOR")
	private Set<Neighbor> neighbors = new HashSet<Neighbor>();

	public Long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getLastNameII() {
		return lastNameII;
	}

	public void setLastNameII(String lastNameII) {
		this.lastNameII = lastNameII;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSince() {
		return since;
	}

	public void setSince(String since) {
		this.since = since;
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

	public Set<Neighbor> getNeighbors() {
		return neighbors;
	}

	public void setNeighbors(Set<Neighbor> neighbors) {
		this.neighbors = neighbors;
	}
}
