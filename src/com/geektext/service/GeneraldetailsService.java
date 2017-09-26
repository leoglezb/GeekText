package com.geektext.service;

import java.util.List;


import com.geektext.form.Generaldetails;
import com.geektext.form.MyList;
 
public interface GeneraldetailsService {
	public Generaldetails getDetail(Integer id); 
    public void addDetail(Generaldetails detail);
    public void updateDetail(Generaldetails detail);
    public MyList<Generaldetails> listDetails();
    public MyList<Generaldetails> listDetails(Integer page, Integer pageSize, String[] fieldFilter, Object[] valueFilter, String _orderField, String asc_desc, Integer numLinks);
    public void removeDetail(Integer id);
    public List<Generaldetails> paginate(int[] range);
    public Number count();
    public List<Generaldetails> select(String where, String[] orders);
    public List<Generaldetails> select(String where, String[] orders, int[] range);
}