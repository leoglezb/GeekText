package com.geektext.dao;

import java.util.List;

import com.geektext.form.Country;
 
public interface CountryDao {
	public Country getCountry(String id);
    public void addCountry(Country country);
    public List<Country> listCountry();
    public void removeCountry(String id);
    public List<Country> paginate(int[] range);
    public boolean exist(String id);
}