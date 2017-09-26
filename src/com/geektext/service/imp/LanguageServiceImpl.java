package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import com.geektext.dao.LanguageDao;
import com.geektext.form.Language;
import com.geektext.service.LanguageService;
 
@Service
public class LanguageServiceImpl implements LanguageService {
 
    @Autowired
    private LanguageDao LanguageDAO;
     
    @Transactional
    public Language getLanguage(String id) {
        return LanguageDAO.getLanguage(id);
    }

    @Transactional
    public void addLanguage(Language Language) {
        LanguageDAO.addLanguage(Language);
    }
 
    @Transactional
    public List<Language> listLanguage() {
        return LanguageDAO.listLanguage();
    }
 
    @Transactional
    public void removeLanguage(String id) {
        LanguageDAO.removeLanguage(id);
    }
}