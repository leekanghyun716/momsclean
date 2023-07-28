package com.mom.client.reference.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.mom.client.reference.Reference;

@Service
public interface ReferenceService {
	//게시글 등록 처리
	public void register (Reference reference)throws Exception;
	//게시글 목록 페이지
	public List<Reference> list() throws Exception;
}
