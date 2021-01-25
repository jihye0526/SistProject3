package com.project3.dao;

import com.project3.vo.IdusProductVO;

public class IdusProductDAO extends DBConn{
	/**
	 * ��ǰ ���
	 */
	public boolean getInsert(IdusProductVO vo) {
		boolean result = false;
		
		try {
			String sql = "insert into idus_product values('p_'||idus_product_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
					+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
					+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
					+ "?, ?, ?, ?, ?, sysdate, 0, 0)";
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getPcat());
			pstmt.setString(2, vo.getSname());
			pstmt.setString(3, vo.getSemail());
			pstmt.setString(4, vo.getPtitle());
			pstmt.setString(5, vo.getPcontent());
			pstmt.setInt(6, vo.getPprice());
			pstmt.setString(7, vo.getOpt1());
			pstmt.setInt(8, vo.getOpt1_price());
			pstmt.setString(9, vo.getOpt2());
			pstmt.setInt(10, vo.getOpt2_price());
			pstmt.setString(11, vo.getOpt3());
			pstmt.setInt(12, vo.getOpt3_price());
			pstmt.setString(13, vo.getOpt4());
			pstmt.setInt(14, vo.getOpt4_price());
			pstmt.setString(15, vo.getOpt5());
			pstmt.setInt(16, vo.getOpt5_price());
			pstmt.setString(17, vo.getPfile1());
			pstmt.setString(18, vo.getPsfile1());
			pstmt.setString(19, vo.getPfile2());
			pstmt.setString(20, vo.getPsfile2());
			pstmt.setString(21, vo.getPfile3());
			pstmt.setString(22, vo.getPsfile3());
			pstmt.setString(23, vo.getPfile4());
			pstmt.setString(24, vo.getPsfile4());
			pstmt.setString(25, vo.getPfile5());
			pstmt.setString(26, vo.getPsfile5());
			pstmt.setString(27, vo.getPfile6());
			pstmt.setString(28, vo.getPsfile6());
			pstmt.setString(29, vo.getPfile7());
			pstmt.setString(30, vo.getPsfile7());
			pstmt.setString(31, vo.getPfile8());
			pstmt.setString(32, vo.getPsfile8());
			pstmt.setString(33, vo.getPfile9());
			pstmt.setString(34, vo.getPsfile9());
			//38��(id, sysdate, seller-total, product-total)
			
			int count = pstmt.executeUpdate();
			if(count != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}