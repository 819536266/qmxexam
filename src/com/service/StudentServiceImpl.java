package com.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.util.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.dao.StudentDao;
import com.dao.StudentDaoImpl;
import com.entity.Scorde;
import com.entity.Student;
import org.hibernate.criterion.DetachedCriteria;

public class StudentServiceImpl implements StudentService{
	private StudentDao studentDao = new StudentDaoImpl();
	/**
	 * 判断员工是否符合登录条件
	 */
	@Override
	public Student allowLogin(String studentID, String password) {
		password = MD5.Encrypt(password);
		Student student = studentDao.login(studentID,password);//根据ID查找员工的记录
		return student;
	}
	/**
	 * 根据员工的部门返回结果
	 */
	@Override
	public PageResult getStudentByClass(String sclass,Page page){
		page = PageUtil.createPage(page.getEveryPage(), page.getTotalCount(), page.getCurrentPage());
		List<Student> list = studentDao.findStudentsByClass(sclass,page);//TODO:
		PageResult result = new PageResult(page, list);
		return result;
	}
	/**
	 * 根据员工姓名返回结果
	 */
	@Override
	public List<Student> getStudentByName(String studentName) {
		return studentDao.findByStudentName(studentName);
	}
	/**
	 * 根据id返回
	 */
	public Student getStudent(String studentID) {
		return studentDao.findByStudenID(studentID);
	}
	
	
	@Override
	public Student getStudentInfo(Integer studentID) {
		return studentDao.findBySysid(studentID);
	}
	/**
	 * 根据员工id更新员工成绩
	 */
	@Override
	public void setStudentResult(String studentID, int result) {
		/*Student student = studentDao.findByStudenID(studentID);
		student.setResult(result);
		studentDao.updateStudent(student);*/
	}
	/**
	 * 保存一条员工记录
	 */
	@Override
	public int saveStudent(Student student) {
		int id=studentDao.save(student);
		return id;
	}
	/**
	 * 根据分页  查找员工
	 */
	@Override
	public PageResult queryStudentByPage(Condition forClass,Page page) {
		page = PageUtil.createPage(page.getEveryPage(), page.getTotalCount(), page.getCurrentPage());
		List<Scorde> list = studentDao.findStudentsByPage(forClass,page);
		PageResult result = new PageResult(page, list);
		return result;
	}
	/**
	 * 获取员工数量
	 */
	@Override
	public int countStudent(Condition  forClass) {
		return studentDao.fintStudentCount(forClass);
	}
	/**
	 * 返回部门员工数量
	 */
	@Override
	public int countStudentByClass(String sclass) {
		return studentDao.fintStudentCountByClass(sclass);
	}
	/*2019.3.6 niuuniu修改
	 * 删除单条员工信息
	 * */
	@Override
	public void deleteStudent(Student studentID) {
		// TODO Auto-generated method stub
		studentDao.deleteStudent(studentID);
		
	}
	//更新员工信息

	@Override
	public void updateStudent(String studentName,String term,String sclass,Integer sysid) {
		// TODO Auto-generated method stub
		studentDao.updateStudent(studentName,term,sclass,sysid);
	}
	
	@Override
	public Student getStudentPassword(String password) {
		
		return studentDao.findByPassword(password);
	}
	@Override
	public Student getStudentBySclass(String sclass) {
		
		return studentDao.getStudentBySclass(sclass);
	}
	@Override
	public List<Student> excelImport(File file, String sclass,String onesclass) {
		XSSFWorkbook hw = null;
		try {
			//读取流
			hw = new XSSFWorkbook(new FileInputStream(file));
		} catch (IOException e) {
			System.out.println("读取文件错误");
			e.printStackTrace();
		}
		//获取单元格
		XSSFSheet sheetAt = hw.getSheetAt(0);
		List<Student> list = new ArrayList<Student>();
		//遍历
		for (org.apache.poi.ss.usermodel.Row row : sheetAt) {
			if (row.getRowNum() == 0) {
			     continue;
			}
			//设置单元格格式
			row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
			row.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
			Student student = new Student();
			String studentName = row.getCell(0).getStringCellValue();
			/*String sclass = row.getCell(2).getStringCellValue();
			String onesclass = row.getCell(3).getStringCellValue();*/
			String term = row.getCell(4).getStringCellValue();
			String password = row.getCell(1).getStringCellValue();
			//存入对象
			String encrypt = MD5.Encrypt(password);

			student.setPassword(encrypt);
			student.setSclass(sclass);
			student.setStudentName(studentName);
			student.setTerm(term);
            student.setState(0);
			if(studentDao.findByStudentName(studentName)==null){
				//查询该部门人数
				Integer count=studentDao.findBySclass(sclass,term);
				String ID=null;
				if(count==0){
					if(password.length()>5){

						ID=onesclass+term+"1"+password.substring(password.length()-4,password.length());
					}else{
						ID=onesclass+term+"1";
					}

				}else{
					count=count+1;
					if(password.length()>5){

						ID=onesclass+term+count.toString()+password.substring(password.length()-4,password.length());

					}else{
						ID=onesclass+term+count.toString();
					}
				}
				student.setStudentID(ID);
				Scorde scorde = new Scorde();
				Scorde scorde1 = new Scorde();
                scorde1.setTesttime(new Date());
				scorde.setTesttime(new Date());
				scorde1.setStuSysid(student);
				scorde.setStuSysid(student);
                scorde1.setShorttime(0);
                scorde.setShorttime(0);
				scorde1.setCount(0);
				scorde.setCount(0);
				scorde1.setTimescore(0);
				scorde.setTimescore(0);
				student.getSr().add(scorde);
                student.getSr().add(scorde1);
				studentDao.save(student);

			}else{
				student.setPassword(password);
				list.add(student);
			}

		}
		return list;
	}
	@Override
	public Integer findBySclass(String sclass, String term) {
		// TODO Auto-generated method stub
		return studentDao.findBySclass(sclass, term);
	}
	@Override
	public List<Scorde> exportExcel(Condition condition) {
		// TODO Auto-generated method stub
		return studentDao.exportExcel(condition);
	}

	@Override
	public void updateStudent(Student studentInfo) {
		studentDao.updateStudent(studentInfo);
	}

	@Override
	public int countStudentMar(BootstrapTable bootstrapTable, DetachedCriteria condition) {
		return studentDao.countStudentMar(condition);
	}

	@Override
	public List<Student> queryStudentByPageMar(DetachedCriteria forClass, BootstrapTable page) {
		List<Student> list = studentDao.queryStudentByPageMar(forClass,page);
		return list;
	}

	@Override
	public List<Student> getByCriteria(DetachedCriteria detachedCriteria) {
		return studentDao.getByCriteria(detachedCriteria);
	}


}
