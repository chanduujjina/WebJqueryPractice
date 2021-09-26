package com.demo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;


@WebServlet("/userList")
public class UserController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	  public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		  List<User> userList= getUserList();
		  
		  ObjectMapper mapper = new ObjectMapper();
		 String json =  mapper.writeValueAsString(userList);
		 
		PrintWriter printWriter = resp.getWriter();
		printWriter.write(json);
		 
	  }
	  
	  private List<User> getUserList(){
		  List<User> userList = new ArrayList<User>();
		  userList.add(new  User(1, "test", "male", "test@gmail.com"));
		  for(int i=2;i<=100;i++) {
			  String gender = i%2==0?"female":"male";
			  userList.add(new  User(i, "test"+i, gender, "test"+i+"@gmail.com"));
		  }
		  return userList;
	  }
	
	

}
