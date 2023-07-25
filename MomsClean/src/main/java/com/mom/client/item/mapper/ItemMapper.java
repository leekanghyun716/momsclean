package com.mom.client.item.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mom.client.item.Item;
@Mapper
public interface ItemMapper {
	public List<Item> list()throws Exception;
	
	public String getPicture(String itemNo) throws Exception;
	
	public String getPicture2(String itemNo) throws Exception;
}
