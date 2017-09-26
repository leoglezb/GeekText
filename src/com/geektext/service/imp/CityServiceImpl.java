package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import com.geektext.dao.CityDao;
import com.geektext.form.City;
import com.geektext.service.CityService;
 
@Service
public class CityServiceImpl implements CityService {
 
    @Autowired
    private CityDao CityDAO;
     
    @Transactional
    public City getCity(City id) {
        return CityDAO.getCity(id);
    }

    @Transactional
    public void addCity(City City) {
        CityDAO.addCity(City);
    }
 
    @Transactional
    public List<City> listCity() {
        return CityDAO.listCity();
    }
 
    @Transactional
    public void removeCity(City id) {
        CityDAO.removeCity(id);
    }
    @Transactional
    public boolean exist(City id){
    	return CityDAO.exist(id);
    }
}