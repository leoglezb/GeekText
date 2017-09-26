package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import com.geektext.dao.GeneraldetailsDao;
import com.geektext.form.Generaldetails;
import com.geektext.form.MyList;
import com.geektext.service.GeneraldetailsService;
 
@Service
@Transactional
public class GeneraldetailsServiceImpl implements GeneraldetailsService {
 
    @Autowired
    private GeneraldetailsDao generaldetailsDAO;
     
    public Generaldetails getDetail(Integer id) {
        return generaldetailsDAO.getDetail(id);
    }

    public void addDetail(Generaldetails detail) {
    	generaldetailsDAO.addDetail(detail);
    }

    public void updateDetail(Generaldetails detail) {
    	generaldetailsDAO.updateDetail(detail);
    }

    
    public MyList<Generaldetails> listDetails() {
        return generaldetailsDAO.listDetails();
    }

    public MyList<Generaldetails> listDetails(Integer page, Integer pageSize, String[] fieldFilter, Object[] valueFilter, String _orderField, String asc_desc, Integer numLinks) {
        return generaldetailsDAO.listDetails(page, pageSize, fieldFilter, valueFilter, _orderField, asc_desc, numLinks);
    }
    
    public void removeDetail(Integer id) {
    	generaldetailsDAO.removeDetail(id);
    }

    public List<Generaldetails> paginate(int[] range) {
        return generaldetailsDAO.paginate(range);
    }

    public Number count(){
    	return generaldetailsDAO.count();
    }
    public List<Generaldetails> select(String where, String[] orders){
    	return generaldetailsDAO.select(where, orders);
    }
    public List<Generaldetails> select(String where, String[] orders, int[] range){
    	return generaldetailsDAO.select(where, orders, range);
    }
}