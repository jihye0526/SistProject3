package com.project3.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project3.dao.IdusCategoryDAO;
import com.project3.vo.IdusProductVO;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	private IdusCategoryDAO categoryDAO;
	
	public ModelAndView getList(String pcat) {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<IdusProductVO> list = categoryDAO.getList(pcat);
		
		mv.addObject("list", list);
		mv.setViewName("/category/category_list");
		
		return mv;
	}
	
	public ModelAndView getNewList() {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<IdusProductVO> list = categoryDAO.getNewList();
		
		mv.addObject("list", list);
		mv.setViewName("/category/product_new");
		
		return mv;
	}
	
	public ModelAndView getBestList(String pcat) {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<IdusProductVO> list = categoryDAO.getBestList(pcat);
		
		mv.addObject("list", list);
		mv.setViewName("/category/product_best");
		
		return mv;
	}
	
	/** 최신 차트 **/
	/* public ModelAndView getNewList(String param) {
		ModelAndView mv = new ModelAndView();
		int start = 0;
		int end = 0;
		
		ArrayList<IdusProductVO> list = productDAO.getNewList(start, end);
		
		mv.addObject("list", list);
		mv.setViewName("/category/product_new");
		
		return mv;
	} */
	
	/** 인기 차트 **/
	/* public ModelAndView getBestList(String param) {
		ModelAndView mv = new ModelAndView();
		int start = 0;
		int end = 0;
		
		ArrayList<IdusProductVO> list = productDAO.getBestList(start, end);
		
		mv.addObject("list", list);
		mv.setViewName("/category/product_best");
		
		return mv;
	} */
	
}
