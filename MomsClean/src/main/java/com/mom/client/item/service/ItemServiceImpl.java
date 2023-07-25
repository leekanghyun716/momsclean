package com.mom.client.item.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mom.client.item.Item;
import com.mom.client.item.mapper.ItemMapper;

@Service
public class ItemServiceImpl implements ItemService{
	@Autowired
	private ItemMapper mapper;
	
	@Override
	public List<Item> list()throws Exception{
		return mapper.list();
	}
	@Override
	public String getPicture(String itemNo) throws Exception {
	return mapper.getPicture(itemNo);
	}
	@Override
	public String getPicture2(String itemNo) throws Exception {
	return mapper.getPicture2(itemNo);
	}
}
