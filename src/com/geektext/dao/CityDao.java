package com.geektext.dao;

import java.util.List;
import com.geektext.form.City;
 
public interface CityDao {
	public City getCity(City id);
    public void addCity(City city);
    public List<City> listCity();
    public void removeCity(City id);
    public List<City> paginate(int[] range);
    public boolean exist(City id);
}