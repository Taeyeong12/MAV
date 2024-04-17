package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Classes;
import com.springmvc.domain.Member;
import com.springmvc.exception.classException;

@Repository
public class ClassesRepositoryImpl implements ClassesRepository{
	private List<Classes> listOfClasses=new ArrayList<Classes>();
	/*
	 * public ClassesRepositoryImpl() { Classes classes1= new Classes("족구강의");
	 * classes1.setClassLecturetime("13:00"); classes1.setClassNumberOfStudents(5);
	 * listOfClasses.add(classes1);
	 * 
	 * }
	 */
	private JdbcTemplate template;
	@Autowired
	public void setJdbctemplate(DataSource dataSoure) {
		this.template=new JdbcTemplate(dataSoure);
	}
	

	
	// 값넣기 컬럼명순서
	   @Override
	   public void setNewClasses(Classes classes) {
	       String SQL= "insert into classes"
	             + "(classId,"
	             + "className,"
	             + "classLectureDate,"
	             + "classLecturetime,"
	             + "classNumberOfStudents,"
	             + "classCourseContents,"
	             + "classGrade,"
	             + "classIntroduction,"
	             + "classImagesFileName1,"
	             + "classImagesFileName2,"
	             + "classImagesFileName3,"
	             + "classImagesFileName4,"
	             + "classImagesFileName5,"
	             + "classLocale,"
	             + "classApprove"
	             + ") Values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	       System.out.println("setnewCLASS실행");
	       template.update(SQL, 
	             classes.getClassId(), 
	             classes.getClassName(), 
	             classes.getClassLecturedate(), 
	             classes.getClassLecturetime(), 
	             classes.getClassNumberOfStudents(), 
	             classes.getClassCourseContents(), 
	             classes.getClassGrade(), 
	             classes.getClassIntroduction(), 
	             classes.getClassImagesFileName1(),
	             classes.getClassImagesFileName2(),
	             classes.getClassImagesFileName3(),
	             classes.getClassImagesFileName4(),
	             classes.getClassImagesFileName5(),
	             classes.getClassLocale(), 
	             classes.isClassApprove());

	   }


//class번호로조회
	@Override
	public Classes getById(int classNum) {
		
		Classes classesInfo=null;
		// TODO Auto-generated method stub
		String SQL="SELECT count(*) from classes where classNum=?";
		int rowCount=template.queryForObject(SQL,Integer.class,classNum);
		if(rowCount !=0) {
			SQL="SELECT * FROM classes where classNum=?";
			classesInfo=template.queryForObject(SQL, new Object[] {classNum},new ClassesRowMapper());
		}
		  for(int i=0; i<listOfClasses.size(); i++)
	      {
			  Classes classes=listOfClasses.get(i);
	         if(classes!=null &&(Integer)classes.getClassNum()  != null)
	         {
	        	 classesInfo=classes;
	            break;
	         }
	      }
	      if(classesInfo==null)
	      {
	         throw new classException(classNum);
	      }
	      return classesInfo;

	}

	@Override
	public List<Classes> getAllClassesList() {
		System.out.println("getAllClassesList 도착");
		String SQL="SELECT * FROM CLASSES";
		List<Classes> listOfClasses=template.query(SQL,new ClassesRowMapper());
	//	System.out.println("listOfClasses:"+listOfClasses);
		return listOfClasses;
	}
	@Override
	public void setdeleteClasses(int classNum) {
		
		String SQL="DELETE FROM CLASSES WHERE classNum=?";
		this.template.update(SQL,classNum);
	}
	@Override
	public void setUpdateClasses(Classes classes) {
			System.out.println("setUpdateclasses1:"+classes.getClassNum());
			String SQL="UPDATE CLASSES SET "
					+ "classId=?,"
					+ "classLectureDate=?,"
					+ "classLecturetime=?,"
					+ "classNumberOfStudents=?,"
					+ "classCourseContents=?,"
					+ "classGrade=?,"
					+ "classIntroduction=?,"
		    		+ "classImagesFileName1=?,"
		    		+ "classImagesFileName2=?,"
		    		+ "classImagesFileName3=?,"
		    		+ "classImagesFileName4=?,"
		    		+ "classImagesFileName5=?,"
					+ "classLocale=?,"
					+ "className=?"
					+ " where classNum=?";
			template.update(SQL,
					classes.getClassId(),
					classes.getClassLecturedate(),
					classes.getClassLecturetime(),
					classes.getClassNumberOfStudents(),
					classes.getClassCourseContents(),
					classes.getClassGrade(),
					classes.getClassIntroduction(),
		    		classes.getClassImagesFileName1(),
		    		classes.getClassImagesFileName2(),
		    		classes.getClassImagesFileName3(),
		    		classes.getClassImagesFileName4(),
		    		classes.getClassImagesFileName5(),
					classes.getClassLocale(),
					classes.getClassName(),
					classes.getClassNum());
			System.out.println("변경시키려는 주소 : " + classes.getClassLocale());
			template.execute("COMMIT");
			System.out.println("setUpdateClasses2:"+classes.getClassNum());	
					
	}



	@Override
	public void setApproveClasses(int classNum) 
	{
		String SQL = "update classes set classApprove = true where classNum=?";
		template.update(SQL,classNum);
		
	}
	

}
	



	


