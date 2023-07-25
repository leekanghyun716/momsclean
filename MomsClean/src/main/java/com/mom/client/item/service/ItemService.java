package com.mom.client.item.service;

import java.util.List;

import com.mom.client.item.Item;

public interface ItemService {
	public List<Item> list()throws Exception;
	
	public String getPicture(String itemNo) throws Exception;
	
	public String getPicture2(String itemNo) throws Exception;
}
