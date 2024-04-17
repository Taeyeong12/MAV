package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Teacher;

public class TeacherRowMapper implements RowMapper<Teacher> {

	@Override
	public Teacher mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		
		Teacher teacher=new Teacher();
		teacher.setTeacherApprove(rs.getBoolean("teacherApprove"));
		teacher.setTeacherCategory(rs.getString("teacherCategory"));
		teacher.setTeacherId(rs.getString("teacherId"));
		teacher.setTeacherInfomation(rs.getString("teacherInfomation"));
		teacher.setLicenseImageFileName1(rs.getString("LicenseimageFileName1"));
		teacher.setLicenseImageFileName2(rs.getString("LicenseimageFileName2"));
		teacher.setLicenseImageFileName3(rs.getString("LicenseimageFileName3"));
		teacher.setLicenseImageFileName4(rs.getString("LicenseimageFileName4"));
		teacher.setLicenseImageFileName5(rs.getString("LicenseimageFileName5"));		
		teacher.setTeacherimageFileName(rs.getString("teacherimageFileName"));
		teacher.setTeacherRecode(rs.getString("teacherRecode"));
		return teacher;
	}

}