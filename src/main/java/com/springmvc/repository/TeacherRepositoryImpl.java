package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import com.springmvc.domain.Member;
import com.springmvc.domain.Teacher;
import com.springmvc.exception.MemberIdException;


@Repository
public class TeacherRepositoryImpl implements TeacherRepository {
 JdbcTemplate template;
	@Autowired
	public void setJdbctemplate(DataSource dataSoure) {
		this.template=new JdbcTemplate(dataSoure);
	}
	List<Teacher> teacherlist=new ArrayList();
	@Override
	public void CreateTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
	//강사 등록
		
		String SQL="INSERT INTO Teacher (teacherId,teacherimageFileName,teacherCategory,teacherRecode,LicenseimageFileName1,LicenseimageFileName2,LicenseimageFileName3,LicenseimageFileName4,LicenseimageFileName5,teacherInfomation,teacherApprove)"
		+"values(?,?,?,?,?,?,?,?,?,?,?)";
		template.update(SQL,
				teacher.getTeacherId(),
				teacher.getTeacherimageFileName(),
				teacher.getTeacherCategory(),
				teacher.getTeacherRecode(),
			    teacher.getLicenseImageFileName1(),
			    teacher.getLicenseImageFileName2(),
			    teacher.getLicenseImageFileName3(),
			    teacher.getLicenseImageFileName4(),
			    teacher.getLicenseImageFileName5(),
				teacher.getTeacherInfomation(),
				teacher.isTeacherApprove()
				);
	
	}
// 강사정보 수정
	@Override
	public void UpdateTeacher(Teacher teacher) {
		// TODO Auto-generated method stub

		String SQL="update Teacher SET "
				+ "teacherCategory=?,"
				+ "teacherRecode=?,"
				+ "teacherInfomation=?,"
				+ "teacherimageFileName=?,"
				+ "LicenseimageFileName1=?,"
				+ "LicenseimageFileName2=?,"
				+ "LicenseimageFileName3=?,"
				+ "LicenseimageFileName4=?,"
				+ "LicenseimageFileName5=?"
				+ "where teacherId=?";
		template.update(SQL,
				teacher.getTeacherCategory(),
				teacher.getTeacherRecode(),
				teacher.getTeacherInfomation(),
				teacher.getTeacherimageFileName(),
				teacher.getLicenseImageFileName1(),
				teacher.getLicenseImageFileName2(),
				teacher.getLicenseImageFileName3(),
				teacher.getLicenseImageFileName4(),
				teacher.getLicenseImageFileName5(),
				teacher.getTeacherId());

	}
//전체 출력
	@Override
	public List<Teacher> AllTeacher() {
		// TODO Auto-generated method stub
		String SQL="SELECT * FROM Teacher";
		List<Teacher> teacherlist=template.query(SQL, new TeacherRowMapper());
		return teacherlist;
	}

//단일출력 자동으로 

	   @Override
	   public Teacher teacherId(String teacherId) {
	       String SQL = "SELECT COUNT(*) FROM TEACHER WHERE TEACHERId=?";
	       int rowCount = template.queryForObject(SQL, Integer.class, teacherId);
	       if(rowCount != 0) {
	           SQL = "SELECT * FROM Teacher where teacherId=?";
	           try {
	               return template.queryForObject(SQL, new Object[] {teacherId}, new TeacherRowMapper());
	           } catch (EmptyResultDataAccessException e) {
	               return null;
	           }
	       } else {
	           return null;
	       }
	   }
	@Override
	public Teacher deleteTeacher(String teacherId) {
		String SQL="DELETE FROM Teacher where teacherId=?";
		template.update(SQL,teacherId);
		return null;
		
	}
	@Override
	public void setApproveTeacher(String teacherId) 
	{
		String SQL = "update teacher set teacherApprove = true where teacherId=?";
		template.update(SQL, teacherId);		
	}
	
	
}