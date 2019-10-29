package com.petmeeting.joy.admin.dao;

import java.util.List;

import com.petmeeting.joy.admin.model.AdminMemberDto;
import com.petmeeting.joy.admin.model.BoardReportDto;
import com.petmeeting.joy.admin.model.FundMemberDto;
import com.petmeeting.joy.admin.model.MemberSearchBean;
import com.petmeeting.joy.admin.model.NoticeBoardDto;
import com.petmeeting.joy.admin.model.Memberleaveparam;
import com.petmeeting.joy.admin.model.ReportDto;
import com.petmeeting.joy.funding.model.FMsgDto;
import com.petmeeting.joy.funding.model.FundingDto;
import com.petmeeting.joy.funding.model.FundingStaDto;
import com.petmeeting.joy.funding.model.fundingBean;
import com.petmeeting.joy.mypage.model.MypageMemberleave;
import com.petmeeting.joy.playboard.model.PlayboardDto;
import com.petmeeting.joy.playboard.model.PlayboardSearchBean;

public interface AdminDao {
	
	
	/*playboard*/
	public List<PlayboardDto> getAllPlayboardList(PlayboardSearchBean search);
	public int getPlayboardTotalRowCount(PlayboardSearchBean search);
	
	public void deletePlayboard(int seq);
	public void deletePlayMem(int seq);
	public void deletePlayboardQnA(int seq);
	
	public PlayboardDto getPlayboardDetail(int seq);


	public List<BoardReportDto> getBoardReportReason(ReportDto reportDto);
	
	public void deleteBoardReport(ReportDto reportDto);
	public void minusReportCount(ReportDto reportDto);

	/*member*/
	public List<AdminMemberDto> getAllMemberList(MemberSearchBean memSearch);
	public int getMemberTotalCount(MemberSearchBean memSearch);
	
	public AdminMemberDto getMemberDetail(String email);
	
	public void pauseMember(String email);
	public void cancelPauseMember(String email);
	
	public int leaveMemberCheck(String email);
	public int memberProfileCheck(String email);
	public int petProfileCheck(String email);
	
	public List<ReportDto> getMemberReportReason(String email);
	
	public void deleteMemberReport(ReportDto reportDto);
	public void minusMemberReportCount(ReportDto reportDto);
	

	/*funding*/
	public boolean addFunding(FundingDto dto);
	public List<FundingDto> getFundingList(fundingBean fbean);
	public int getFundingCount(fundingBean fbean);

	public FundingDto fundingDetail(int seq);
	public boolean addfundingSta(FundingStaDto sta);
	
	public boolean fundingUpdate(FundingDto dto);
	public void fundingDelete(int seq);
	public void fundingStaDel(int seq);
	public void fundingMemDel(int seq);
	public int fundingStacheck(int seq);
	
	public List<FundMemberDto> whofundingMem(int seq);

	
	public void sendMsgFund(List<FMsgDto> msgList);
	public void revMsgFund(List<FMsgDto> msgList);
	
	/*notice*/
	public void noticeWrite(NoticeBoardDto dto);
	public List<NoticeBoardDto> getnoticeList(fundingBean bean);
	public int noticeListcount(fundingBean bean);
	public NoticeBoardDto noticeDetail(int seq);
	public void noticeDelete(int seq);

	/*회원탈퇴*/
	public List<MypageMemberleave> memleave(Memberleaveparam param);
	public int memleavecount(Memberleaveparam param);
	
	/* main */
	public int getTodayPlay();
	public int getTodayEndFunding();
	
	public List<AdminMemberDto> getReportTop5();
}
