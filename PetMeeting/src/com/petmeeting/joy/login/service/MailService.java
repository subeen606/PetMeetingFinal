package com.petmeeting.joy.login.service;

public interface MailService {
	
	// 이메일 인증	
    public boolean send(String subject, String text, String from, String to, String filePath);
    
}
