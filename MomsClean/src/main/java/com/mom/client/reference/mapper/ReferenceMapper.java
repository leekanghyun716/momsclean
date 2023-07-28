package com.mom.client.reference.mapper;

import java.util.List;



import org.apache.ibatis.annotations.Mapper;

import com.mom.client.reference.Reference;

@Mapper
public interface ReferenceMapper {
	
	//게시글 등록 처리
	public void create(Reference reference)throws Exception;
	
	// 게시글 목록 페이지
	public List<Reference> list() throws Exception;
	}
