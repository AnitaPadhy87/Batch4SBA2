package com.eval.coronakit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eval.coronakit.dao.KitDetailRepository;
import com.eval.coronakit.entity.KitDetail;

@Service
public class KitDetailServiceImpl implements KitDetailService {

	@Autowired
	KitDetailRepository repository;
	
	@Override
	public KitDetail addKitItem(KitDetail kitItem) {
		// TODO Auto-generated method stub
		return this.repository.save(kitItem);
	}

	@Override
	public KitDetail getKitItemById(int itemId) {
		return this.repository.getOne(itemId);
		
	}

	@Override
	public List<KitDetail> getAllKitItemsOfAKit(int kitId) {
		
		return this.repository.findAll();
	}

}
