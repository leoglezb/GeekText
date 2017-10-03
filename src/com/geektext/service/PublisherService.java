package com.geektext.service;

import java.util.List;

import com.geektext.form.Publisher;

public interface PublisherService {
	public Publisher getPublisher(Publisher id);
    public void addPublisher(Publisher publisher);
    public List<Publisher> listPublisher();
    public void removePublisher(Publisher id);
    public boolean exist(Publisher id); 
}
