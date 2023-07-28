package com.mom.client.reference.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mom.client.reference.Reference;
import com.mom.client.reference.mapper.ReferenceMapper;

@Service
public class ReferenceServiceImpl implements ReferenceService{
	
	@Autowired 
	private ReferenceMapper mapper;
	
	//게시글 등록 처리
	@Override
	public void register(Reference reference)throws Exception{
		mapper.create(reference);
	}
	//게시글 목록 페이지
	@Override
	public List<Reference> list()throws Exception{
		return mapper.list();
	}
}
