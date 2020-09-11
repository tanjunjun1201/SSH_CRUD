package com.atguigu.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.EmployeeExample;
import com.atguigu.crud.bean.EmployeeExample.Criteria;
import com.atguigu.crud.dao.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	EmployeeMapper employeeMapper;

	/**
	 * 
	 * @return查询返回所有员工信息
	 */
	public List<Employee> selectAll() {
		return employeeMapper.selectByExampleWithDept(null);
	}
	
	/**
	 * 保存员工信息
	 * @param employee
	 */

	public void saveEmp(Employee employee) {
		employeeMapper.insertSelective(employee);
	}
	
	/**
	 * 查询员工姓名是否可用
	 * @param empName
	 * @return
	 */
	public boolean checkEmpName(String empName) {
		EmployeeExample employeeExample = new EmployeeExample();
		Criteria criteria = employeeExample.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long l = employeeMapper.countByExample(employeeExample);
		return l==0;
	}

	/**
	 * 通过id查询员工信息
	 * @param id
	 * @return
	 */
	public Employee selectById(Integer id) {
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}

	/**
	 * 更新员工信息
	 * @param employee
	 */
	public void updateEmp(Employee employee) {
		employeeMapper.updateByPrimaryKeySelective(employee);
		
	}

	/**
	 * 根据id删除
	 * @param id
	 */
	public void deleteById(Integer id) {
		employeeMapper.deleteByPrimaryKey(id);
		
	}

	/**
	 * 批量删除
	 * @param list
	 */
	public void batchDelete(List<Integer> list) {
		
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdIn(list);
		employeeMapper.deleteByExample(example);
	}
	
	
}
