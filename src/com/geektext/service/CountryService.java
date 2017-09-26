package com.geektext.service;

import java.util.List;

import com.geektext.form.Country;
 
public interface CountryService {
	public Country getCountry(String id);
    public void addCountry(Country country);
    public List<Country> listCountry();
    public void removeCountry(String id);
    public boolean exist(String id);
}