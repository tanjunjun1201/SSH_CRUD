package com.atguigu.crud.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;

	/**
	 * 根据id删除
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/emp/{ids}", method = RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("ids") String ids) {
		if (ids.contains("-")) {
			List<Integer> list = new ArrayList<Integer>();
			String[] split = ids.split("-");
			for (String string : split) {
				Integer id = Integer.parseInt(string);
				list.add(id);
			}
			employeeService.batchDelete(list);
			
		} else {
			Integer id = Integer.parseInt(ids);
			employeeService.deleteById(id);
			
		}
		return Msg.success();
	}

	/**
	 * 更新员工信息
	 */
	@ResponseBody
	@RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
	public Msg updateEmp(Employee employee) {
		employeeService.updateEmp(employee);
		return Msg.success();
	}

	/**
	 * 通过员工id查询员工信息
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
	public Msg selecyById(@PathVariable("id") Integer id) {
		Employee employee = employeeService.selectById(id);
		return Msg.success().add("emp", employee);
	}

	/**
	 * 校验员工姓名是否可用
	 */
	@ResponseBody
	@RequestMapping("/checkEmpName")
	public Msg checkEmpName(@RequestParam("empName") String empName) {

//		  String regex="^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}";
//		  if(!empName.matches(regex)) { 
//			  return Msg.fail().add("reg_val","用户名必须是字母数字组合或中文，长度3-16位"); 
//		}

		boolean b = employeeService.checkEmpName(empName);
		if (b) {
			return Msg.success();
		} else {
			return Msg.fail().add("reg_val", "用户名已存在");
		}
	}

	/**
	 * 保存员工信息
	 * 
	 * @param employee
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/emp", method = RequestMethod.POST)
	public Msg saveEmp(Employee employee) {
		employeeService.saveEmp(employee);

		return Msg.success();
	}

	/**
	 * 查询单页信息
	 * 
	 * @param pn
	 * @return
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.selectAll();
		PageInfo page = new PageInfo(emps, 5);

		return Msg.success().add("pageInfo", page);
	}

	/**
	 * 查询返回所有员工信息
	 */
//	@RequestMapping("/emps")
	public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.selectAll();
		PageInfo page = new PageInfo(emps, 5);
		model.addAttribute("pageInfo", page);
		return "list";

	}
}
