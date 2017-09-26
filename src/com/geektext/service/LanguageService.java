package com.geektext.service;

import java.util.List;

import com.geektext.form.Language;
 
public interface LanguageService {
	public Language getLanguage(String id); 
    public void addLanguage(Language language);
    public List<Language> listLanguage();
    public void removeLanguage(String id);
    
}