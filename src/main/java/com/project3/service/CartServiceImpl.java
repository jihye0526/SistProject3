package com.project3.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.project3.dao.IdusCartDAO;
import com.project3.vo.IdusCartVO;

@Service("cartService")
public class CartServiceImpl implements CartService {
	@Autowired
	private IdusCartDAO cartDAO;
	
	/** ���� ���� **/
	public int getSelectDelete(String[] dellist) {
		return cartDAO.getSelectDelete(dellist);
	}
	
	@Override
	public int getCartInsert(IdusCartVO vo) {
		return cartDAO.getCartInsert(vo);
	}
	
	@Override
	public String getCartList(String uemail) {
		ArrayList<IdusCartVO> list = cartDAO.getCartList(uemail);
		
		JsonArray jarray = new JsonArray();
		JsonObject jdata = new JsonObject();
		Gson gson = new Gson();
		
		for(IdusCartVO vo : list) {
			JsonObject jobj = new JsonObject();
			
			jobj.addProperty("cid", vo.getCid());
			jobj.addProperty("uemail", vo.getUemail());
			jobj.addProperty("pid", vo.getPid());
			jobj.addProperty("p_name", vo.getP_name());
			jobj.addProperty("p_qty", vo.getP_qty());
			jobj.addProperty("p_opt", vo.getP_opt());
			jobj.addProperty("p_price", vo.getP_price());
			
			jarray.add(jobj);
		}

		jdata.add("jlist", jarray);
		return gson.toJson(jdata);
		
		/* ModelAndView mv = new ModelAndView();
		
		ArrayList<IdusCartVO> list = cartDAO.getCartList(uemail);
		
		mv.addObject("list", list);
		mv.setViewName("/cart/cart");
		
		return mv; */
		//return cartDAO.getCartList(uemail);
	}
	
	@Override
	public int getCartUpdate(String cid, String p_qty, String p_price) {
		return cartDAO.getCartUpdate(cid, p_qty, p_price);
	}
	
	@Override
	public int getCartDelete(String cid) {
		return cartDAO.getCartDelete(cid);
	}
	
	@Override
    public int sumMoney(String uemail) {
        return cartDAO.sumMoney(uemail);
    }
 
    @Override
    public int countCart(String uemail, String pid) {
        return 0;
    }
}
