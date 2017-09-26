package com.geektext.form;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
 
@Entity
@Table(name="tbl_cities")
public class City implements Serializable {
     
	private static final long serialVersionUID = -7308718486494402788L;

	@Id
    @Column(name="id")
    private String id;
    
    @Id 
    @Column(name="id_state")
    private String id_state;
 
    @Column(name="descrip")
    private String descrip;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getId_state() {
		return id_state;
	}

	public void setId_state(String id_state) {
		this.id_state = id_state;
	}

	public String getDescrip() {
		return descrip;
	}

	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}
}