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
public class ListUserController {
	private static final Logger logger = LogManager.getLogger();
	

	
	@RequestMapping(value = "userlist",
			method = RequestMethod.GET)
	public String getUserList(Map<String, Object> model, 
			HttpSession session, HttpServletRequest request){
		List<String> errors = new ArrayList<String>();
		List<String> warnings = new ArrayList<String>();
		List<User> usuarios = new ArrayList<User>();
		UserRepositoryImpl ur = new UserRepositoryImpl();
		usuarios = ur.getUsers();
		logger.info("Regresa los Usuarios {}", usuarios);
		if( usuarios != null){
			model.put("usuarios", usuarios);
			model.put("warnings", warnings);
		} else {
			errors.add("No existen usuarios");
			model.put("errors", errors);
		}
		return "userlist/list";
	}
	
	@RequestMapping(value = "userlist/show",
			method = RequestMethod.GET)
	public String getUserDetail(Map<String, Object> model, 
			HttpSession session, HttpServletRequest request,
			@RequestParam("username") String username){
		List<String> errors = new ArrayList<String>();
		List<String> warnings = new ArrayList<String>();
		User usuario = new User();
		UserRepositoryImpl ur = new UserRepositoryImpl();
		usuario = ur.getUser(username);
		logger.info("Regresa Usuario {}", usuario.getUsername());
		if( usuario != null){
			model.put("usuario", usuario);
			model.put("warnings", warnings);
		} else {
			errors.add(String.format("No existe el usuario %s.", username));
			model.put("errors", errors);
		}
		return "userlist/detalle";
	}
	
}