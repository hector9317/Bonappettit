package com.aht.dao.country;

import java.util.LinkedList;
import com.aht.model.Country;

public interface CountryDAO {
	public LinkedList<Country> retrieveAll();
}
