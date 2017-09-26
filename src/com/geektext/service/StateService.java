package com.geektext.service;

import java.util.List;

import com.geektext.form.State;
 
public interface StateService {
	public State getState(String id);
    public void addState(State state);
    public List<State> listState();
    public void removeState(String id);
    public boolean exist(String id);
    
}