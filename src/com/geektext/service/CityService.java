package com.geektext.service;

import java.util.List;

import com.geektext.form.City;

 
public interface CityService {
	public City getCity(City id);
    public void addCity(City city);
    public List<City> listCity();
    public void removeCity(City id);
    public boolean exist(City id);   
}