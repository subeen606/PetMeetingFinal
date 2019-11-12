package com.petmeeting.joy.freeboard.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petmeeting.joy.freeboard.dao.FreeboardDao;
import com.petmeeting.joy.freeboard.model.BoardlikeDto;
import com.petmeeting.joy.freeboard.model.CmreportDto;
import com.petmeeting.joy.freeboard.model.CommentDto;
import com.petmeeting.joy.freeboard.model.CommentlikeDto;
import com.petmeeting.joy.freeboard.model.FbParam;
import com.petmeeting.joy.freeboard.model.FreeboardDto;
import com.petmeeting.joy.freeboard.model.ReportDto;
import com.petmeeting.joy.login.model.MemberDto;

@Repository
public class FreeboardDaoImpl implements FreeboardDao{
	
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void fbwritedown(FreeboardDto fb) {
		sqlSession.insert("freeboard.fbwritedown", fb);
	}

	@Override
	public List<FreeboardDto> getfbList(FbParam param) {
		return sqlSession.selectList("freeboard.getfbList", param);
	}

	@Override
	public FreeboardDto getdetail(int seq) {
		return sqlSession.selectOne("freeboard.getdetail", seq);
	}

	@Override
	public void fbupdate(FreeboardDto fb) {
		sqlSession.update("freeboard.fbupdate", fb);
	}

	@Override
	public boolean fbdelete(int seq) {
		int n = sqlSession.update("freeboard.fbdelete", seq);
		return n>0? true:false;
	}

	@Override
	public int getfbCount(FbParam param) {
		
		return sqlSession.selectOne("freeboard.getfbCount", param);
	}

	@Override
	public List<FreeboardDto> soltingfree(FbParam param) {
		return sqlSession.selectList("freeboard.soltingfree", param);
	}

	@Override
	public List<FreeboardDto> soltingmiss(FbParam param) {
		return sqlSession.selectList("freeboard.soltingmiss", param);
	}

	@Override
	public List<FreeboardDto> soltinginfor(FbParam param) {
		return sqlSession.selectList("freeboard.soltinginfor", param);
	}

	@Override
	public List<FreeboardDto> soltingqna(FbParam param) {
		return sqlSession.selectList("freeboard.soltingqna", param);
	}

	@Override
	public List<FreeboardDto> soltingboast(FbParam param) {
		return sqlSession.selectList("freeboard.soltingboast", param);
	}

	@Override
	public List<FreeboardDto> soltingdate(FbParam param) {
		return sqlSession.selectList("freeboard.soltingdate", param);
	}

	@Override
	public List<FreeboardDto> soltinglike(FbParam param) {
		return sqlSession.selectList("freeboard.soltinglike", param);
	}

	@Override
	public List<FreeboardDto> solting_date(FbParam param) {
		return sqlSession.selectList("freeboard.solting_date", param);
	}

	@Override
	public List<FreeboardDto> solting_like(FbParam param) {
		return sqlSession.selectList("freeboard.solting_like", param);
	}

	@Override
	public List<FreeboardDto> soltingread(FbParam param) {
		return sqlSession.selectList("freeboard.soltingread", param);
	}
	
	@Override
	public List<FreeboardDto> solting_read(FbParam param) {
		return sqlSession.selectList("freeboard.solting_read", param);
	}
	
	@Override
	public void writedowncomment(CommentDto cmdto) {
		sqlSession.insert("freeboard.writedowncomment", cmdto);
	}

	@Override
	public List<CommentDto> getcmList(int seq) {
		return sqlSession.selectList("freeboard.getcmList", seq);
	}

	@Override
	public boolean cmdelete(CommentDto cmdto) {
		int n = sqlSession.update("freeboard.cmdelete", cmdto);
		return n>0? true:false;
	}

	@Override
	public void readcountup(int seq) {
		sqlSession.update("freeboard.readcountup", seq);
	}

	@Override
	public void likeboard(int seq) {
		sqlSession.update("freeboard.likeboard", seq);
	}

	@Override
	public void likecheck(String email, int seq) {
	//	sqlSession.selectOne("freeboard.likecheck", email, seq);
	}

	@Override
	public void addlike(BoardlikeDto likedto) {
		sqlSession.insert("freeboard.addlike", likedto);
	}

	@Override
	public boolean dolikecheck(BoardlikeDto likedto) {
		int n = sqlSession.selectOne("freeboard.dolikecheck", likedto);
		return n>0?true:false;
	}

	@Override
	public void dellike(BoardlikeDto likedto) {
		sqlSession.delete("freeboard.dellike", likedto);
	}

	@Override
	public void dislikeboard(int seq) {
		sqlSession.update("freeboard.dislikeboard", seq);
	}

	@Override 
	public int getlikecount(BoardlikeDto likedto) {
	return sqlSession.selectOne("freeboard.getlikecount", likedto); 
	}

	@Override
	public boolean docmlikecheck(CommentlikeDto cmlikedto) {
		int nn = sqlSession.selectOne("freeboard.docmlikecheck", cmlikedto);
		return nn>0?true:false;
		}

	@Override
	public void addcmlike(CommentlikeDto cmlikedto) {
		sqlSession.insert("freeboard.addcmlike", cmlikedto);
		}

	@Override
	public void delcmlike(CommentlikeDto cmlikedto) {
		sqlSession.delete("freeboard.delcmlike", cmlikedto);
		}

	@Override
	public void cmlikeup(int seq) {
		sqlSession.update("freeboard.cmlikeup", seq);
		}

	@Override
	public void cmlikedown(int seq) {
		sqlSession.update("freeboard.cmlikedown", seq);
		}

	@Override
	public CommentDto getcmdetail(int seq) {
		return sqlSession.selectOne("freeboard.getcmdetail", seq);
	}

	@Override
	public void cmupdate(CommentDto cmdto) {
		sqlSession.update("freeboard.cmupdate", cmdto);
	}

	@Override
	public void recommentupdate(CommentDto cmdto) {
		sqlSession.insert("freeboard.recommentupdate", cmdto);
	}

	@Override
	public void recommentinsert(CommentDto cmdto) {
		sqlSession.update("freeboard.recommentinsert", cmdto);
	}

	@Override
	public int _getlikecount(int seq) {
		
		return sqlSession.selectOne("freeboard._getlikecount", seq); 
	}

	@Override
	public int _getcmlikecount(int seq) {
		return sqlSession.selectOne("freeboard._getcmlikecount", seq); 
	}

	@Override
	public boolean doreportcheck(ReportDto reportdto) {
		int n = sqlSession.selectOne("freeboard.doreportcheck",reportdto);
		return n>0?true:false;
	}

	@Override
	public void reportwritedown(ReportDto reportDto) {
		sqlSession.insert("freeboard.reportwritedown", reportDto);
	}

	@Override
	public boolean docmreportcheck(CmreportDto cmreportdto) {
		int n = sqlSession.selectOne("freeboard.docmreportcheck",cmreportdto);
		return n>0?true:false;		
	}

	@Override
	public void cmreportwritedown(CmreportDto cmreportDto) {
		sqlSession.insert("freeboard.cmreportwritedown", cmreportDto);
	}

	@Override
	public void fbpointup(MemberDto mem) {
		sqlSession.update("freeboard.pointupfb", mem);
	}

	@Override
	public void cmpointup(MemberDto mem) {
		sqlSession.update("freeboard.pointupcm", mem);
	
	}

	@Override
	public List<FreeboardDto> getfbadminList(FbParam param) {
		
		return sqlSession.selectList("freeboard.getfbadminList", param);
	}

	@Override
	public void Freeboardadmindelete(int seq) {
		sqlSession.delete("Freeboardadmindelete", seq);
	}

	@Override
	public int getfbadminCount(FbParam param) {
		return sqlSession.selectOne("freeboard.getfbadminCount", param);
	}

	@Override
	public List<ReportDto> getadminreport(ReportDto reportdto) {
		return sqlSession.selectList("freeboard.getadminreport", reportdto);
		}

	@Override
	public boolean admincmdelete(CommentDto cmdto) {
		int n = sqlSession.update("freeboard.admincmdelete", cmdto);
		return n>0? true:false;
	}

	@Override
	public void reportcountup(int seq) {
		System.out.println("시퀀스값 확인");
		System.out.println(seq);
		sqlSession.update("freeboard.reportcountup", seq);
	}

	
	
	

	
	

	



	

}
