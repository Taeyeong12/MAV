package com.springmvc.exception;

@SuppressWarnings("serial")
public class MemberIdException extends RuntimeException 
{
	private String memberId;
	
	public MemberIdException(String memberId)
	{
		this.memberId=memberId;
	}
	public String getMemberId()
	{
		return memberId;
	}
}
