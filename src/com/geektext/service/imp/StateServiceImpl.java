package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import com.geektext.dao.StateDao;
import com.geektext.form.State;
import com.geektext.service.StateService;
 
@Service
public class StateServiceImpl implements StateService {
 
    @Autowired
    private StateDao StateDAO;
     
    @Transactional
    public State getState(String id) {
        return StateDAO.getState(id);
    }

    @Transactional
    public void addState(State State) {
        StateDAO.addState(State);
    }
 
    @Transactional
    public List<State> listState() {
        return StateDAO.listState();
    }
 
    @Transactional
    public void removeState(String id) {
        StateDAO.removeState(id);
    }

    @Transactional
    public boolean exist(String id) {
        return StateDAO.exist(id);
    }

}