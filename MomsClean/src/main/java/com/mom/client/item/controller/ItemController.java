package com.mom.client.item.controller;



import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.annotation.security.PermitAll;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mom.client.item.Item;
import com.mom.client.item.service.ItemService;

import lombok.extern.java.Log;
@Log
@PermitAll
@Controller
@RequestMapping("/client/item")
public class ItemController {

	@Autowired
	private ItemService service;
	
	@Value("${upload.path}")
	private String uploadPath;

	@RequestMapping(value = "/itemInfo", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		// 뷰에 페이징 처리를 한 게시글 목록을 전달한다.
		List<Item> list = service.list();
		Integer iNo = list.size();
		String iNoString = Integer.toString(iNo);
		
		log.info(service.getPicture2(list.get(0).getItemNo()));
		model.addAttribute("list", service.list());
	}

	@ResponseBody
	@RequestMapping("/display")
	public ResponseEntity<byte[]> displayFile(String itemNo) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String fileName = service.getPicture(itemNo);
		log.info(uploadPath + File.separator + fileName);
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			log.info(uploadPath + File.separator + fileName);
			in = new FileInputStream(uploadPath + File.separator + fileName);
			if (mType != null) {
				headers.setContentType(mType);
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping("/display2")
	public ResponseEntity<byte[]> displayFile2(String itemNo) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String fileName = service.getPicture2(itemNo);
		log.info(uploadPath + File.separator + fileName);
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			log.info(uploadPath + File.separator + fileName);
			in = new FileInputStream(uploadPath + File.separator + fileName);
			if (mType != null) {
				headers.setContentType(mType);
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
	@ResponseBody
	@RequestMapping("/display3")
	public ResponseEntity<byte[]> displayFile3() throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String fileName = "/option/option.png";
		log.info(uploadPath + File.separator + fileName);
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			log.info(uploadPath + File.separator + fileName);
			in = new FileInputStream(uploadPath + File.separator + fileName);
			if (mType != null) {
				headers.setContentType(mType);
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}

	private MediaType getMediaType(String formatName) {
		if (formatName != null) {
			if (formatName.equals("JPG")) {
				return MediaType.IMAGE_JPEG;
			}
			if (formatName.equals("GIF")) {
				return MediaType.IMAGE_GIF;
			}
			if (formatName.equals("PNG")) {
				return MediaType.IMAGE_PNG;
			}
		}
		return null;
	}

}
