package com.geektext.dao;

import java.util.List;

import com.geektext.form.State;
 
public interface StateDao {
	public State getState(String id);
    public void addState(State state);
    public List<State> listState();
    public void removeState(String id);
    public List<State> paginate(int[] range);
    public boolean exist(String id);
}