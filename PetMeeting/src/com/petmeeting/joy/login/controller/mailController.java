package com.petmeeting.joy.login.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petmeeting.joy.login.service.MemberService;

//import util.SendEmail;

import com.petmeeting.joy.login.service.MailService;

@Controller
public class mailController {
	/*
	@Autowired
	MailService mailService;
	
	@Autowired
	MemberService memService;
	*/
	// 회원가입 이메일 인증
	/*
    @ResponseBody
    @RequestMapping (value="emailAuth.do", method= {RequestMethod.GET, RequestMethod.POST})
	public boolean emailAuth(String inputEmail, HttpServletRequest req) {
    	System.out.println("emailAuth.do ---------------------");
    	
    	boolean isS;
    	
    	if(inputEmail == null) {
    		System.out.println("유저가 입력한 이메일 null");
    		isS = false;
    		return isS;
    	}
    	else {
    		System.out.println("유저가 입력한 이메일 = " + inputEmail);
    	
    	
	    	int rannum = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
	        String authCode = String.valueOf(rannum);
	        req.getSession().setAttribute("joinCode", authCode);
	 
	        String subject = "이메일 인증 코드 발급 안내 입니다.";
	        //StringBuilder text = new StringBuilder();        
	        //text.append("귀하의 이메일 인증 코드는 " + authCode + " 입니다.");
	        String text = "귀하의 이메일 인증 코드는 " + authCode + " 입니다.";
	       	// subject 제목
	        // text 내용
	        // from 보내는 메일 주소
	        // to 받는 메일 주소
	        // filePath 첨부 파일 경로: 첨부파일 없을시 null
	        
	        
	        //boolean sendCheck = mailService.send(subject, text.toString(), inputEmail, null);
	    	
	        boolean sendCheck = SendEmail.sendMail(subject, text.toString(), inputEmail);
	        
	        if(sendCheck) {
	        	System.out.println("메일발신 성공");
	        	isS = true;
	        }else {
	        	System.out.println("메일발신 실패");
	        	isS = false;
	    	}
	        return isS;
    	}
    	
    }
    */
    
 
    
    
    
    
    
    
    
    
    /*
    // 아이디 찾기
    @RequestMapping(value = "/sendMail/id", method = RequestMethod.POST)
    public String sendMailId(HttpSession session, @RequestParam String email, @RequestParam String captcha, RedirectAttributes ra) {
        String captchaValue = (String) session.getAttribute("captcha");
        if (captchaValue == null || !captchaValue.equals(captcha)) {
            ra.addFlashAttribute("resultMsg", "자동 방지 코드가 일치하지 않습니다.");
            return "redirect:/find/id";
        }
 
        User user = userService.findAccount(email);
        if (user != null) {
            String subject = "아이디 찾기 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 아이디는 " + user.getId() + " 입니다.");
            mailService.send(subject, sb.toString(), "아이디@gmail.com", email, null);
            ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 해당 이메일로 가입된 아이디를 발송 하였습니다.");
        } else {
            ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
        }
        return "redirect:/find/id";
    }
 
    // 비밀번호 찾기
    @RequestMapping(value = "/sendMail/password", method = RequestMethod.POST)
    public String sendMailPassword(HttpSession session, @RequestParam String id, @RequestParam String email, @RequestParam String captcha, RedirectAttributes ra) {
        String captchaValue = (String) session.getAttribute("captcha");
        if (captchaValue == null || !captchaValue.equals(captcha)) {
            ra.addFlashAttribute("resultMsg", "자동 방지 코드가 일치하지 않습니다.");
            return "redirect:/find/password";
        }
 
        User user = userService.findAccount(email);
        if (user != null) {
            if (!user.getId().equals(id)) {
                ra.addFlashAttribute("resultMsg", "입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다.");
                return "redirect:/find/password";
            }
            int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
            String password = String.valueOf(ran);
            userService.updateInfo(user.getNo(), "password", password); // 해당 유저의 DB정보 변경
 
            String subject = "임시 비밀번호 발급 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
            mailService.send(subject, sb.toString(), "아이디@gmail.com", email, null);
            ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
        } else {
            ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
        }
        return "redirect:/find/password";
    }
	*/
    
    
    
    
	
}
