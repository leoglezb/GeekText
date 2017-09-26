package com.geektext.form;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbl_languages")
public class Language {
	@Id
    @Column(name="id")
    private String id;

    @Column(name="descrip")
    private String descrip;
	
    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDescrip() {
		return descrip;
	}

	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}
}
