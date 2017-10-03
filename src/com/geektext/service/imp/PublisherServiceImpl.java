package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.PublisherDao;
import com.geektext.form.Publisher;
import com.geektext.service.PublisherService;

@Service
public class PublisherServiceImpl implements PublisherService{

	@Autowired
	private PublisherDao PublisherDAO;
	
	@Transactional
	public Publisher getPublisher(Publisher id) {
		return PublisherDAO.getPublisher(id);
	}

	@Transactional
	public void addPublisher(Publisher publisher) {
		PublisherDAO.addPublisher(publisher);
		
	}

	@Transactional
	public List<Publisher> listPublisher() {
		return PublisherDAO.listPublisher();
	}

	@Transactional
	public void removePublisher(Publisher id) {
		PublisherDAO.removePublisher(id);
		
	}

	@Override
	public boolean exist(Publisher id) {
		return PublisherDAO.exist(id);
	}

}
