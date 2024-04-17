package com.springmvc.exception;

@SuppressWarnings("serial")
public class classException  extends RuntimeException {
	  private int classNum;
	   
	   public classException(int classNum)
	   {
	      this.classNum=classNum;
	   }
	   public int getMemberId()
	   {
	      return classNum;
	   }

}


