package com.geektext.dao;

import java.util.List;

import com.geektext.form.Publisher;

public interface PublisherDao {
	public Publisher getPublisher(Publisher id);
    public void addPublisher(Publisher publisher);
    public List<Publisher> listPublisher();
    public void removePublisher(Publisher id);
    public List<Publisher> paginate(int[] range);
    public boolean exist(Publisher id);
}
