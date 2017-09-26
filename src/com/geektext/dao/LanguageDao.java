package com.geektext.dao;

import java.util.List;

import com.geektext.form.Language;
 
public interface LanguageDao {
	public Language getLanguage(String id); 
    public void addLanguage(Language language);
    public List<Language> listLanguage();
    public void removeLanguage(String id);
    public List<Language> paginate(int[] range);
}