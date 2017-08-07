package me.jmll.ti.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import me.jmll.ti.model.User;
import me.jmll.ti.repository.*;

@Controller
public class CreateUserController {
	private static final Logger logger = LogManager.getLogger();
	
	@RequestMapping(value = "newuser",
			method = RequestMethod.GET)
	public String showUser(Map<String, Object> model, 
			HttpSession session, HttpServletRequest request){
		return "createuser/newuser";
	}
	
	
	@RequestMapping(value = "new",
			method = RequestMethod.POST)
	public String addUser(Map<String, Object> model, 
			HttpSession session, HttpServletRequest request,
			@RequestParam("username") String username,
			@RequestParam("password") String password,
			@RequestParam("fullname") String fullName){
		List<String> errors = new ArrayList<String>();
		List<String> warnings = new ArrayList<String>();
		User usuario = new User();
		UserRepositoryImpl ur = new UserRepositoryImpl();
		usuario = ur.getUser(username);		
		if( usuario == null){	
			logger.info("Ingresa el Usuario {}", username);
			ur.createUser(username, password, fullName);
			warnings.add(0, String.format("El usuario %s, se ingresó; correctamente.",username));
			model.put("warnings", warnings);
		} else {
			errors.add(String.format("Ya existe el usuario %s. Por favor valida que la información sea correcta.", username));
			model.put("errors", errors);
		}
		return "createuser/done";
	}
	
}