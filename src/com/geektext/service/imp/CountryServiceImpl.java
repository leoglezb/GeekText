package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import com.geektext.dao.CountryDao;
import com.geektext.form.Country;
import com.geektext.service.CountryService;
 
@Service
public class CountryServiceImpl implements CountryService {
 
    @Autowired
    private CountryDao CountryDAO;
     
    @Transactional
    public Country getCountry(String id) {
        return CountryDAO.getCountry(id);
    }

    @Transactional
    public void addCountry(Country country) {
        CountryDAO.addCountry(country);
    }
 
    @Transactional
    public List<Country> listCountry() {
        return CountryDAO.listCountry();
    }
 
    @Transactional
    public void removeCountry(String id) {
        CountryDAO.removeCountry(id);
    }
    
    @Transactional
    public boolean exist(String id) {
        return CountryDAO.exist(id);
    }
    
}