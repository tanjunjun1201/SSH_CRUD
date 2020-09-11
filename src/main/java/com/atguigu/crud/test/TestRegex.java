package com.atguigu.crud.test;

import org.junit.Test;

public class TestRegex {

	@Test
	public void test() {
		 String regex="(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})+$";
		// String regex ="(^[a-z0-9_-]{3,16}$)||(^[\u2E80-\u9FFF]{2,5})";
		 String zhangString = "张三1";
		 boolean matches = zhangString.matches(regex);
		 System.out.println(matches);
	}
}
