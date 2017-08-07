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
public class DeleteUserController {
	private static final Logger logger = LogManager.getLogger();
	

	@RequestMapping(value = "deleteuser",
			method = RequestMethod.GET)
	public String getUserDetail(Map<String, Object> model, 
			HttpSession session, HttpServletRequest request,
			@RequestParam("username") String username){
		List<String> errors = new ArrayList<String>();
		List<String> warnings = new ArrayList<String>();
		User usuario = new User();
		UserRepositoryImpl ur = new UserRepositoryImpl();
		usuario = ur.getUser(username);		
		if( usuario != null){
			logger.info("Regresa Usuario {}", usuario.getUsername());
			model.put("usuario", usuario);
			warnings.add(0, String.format("&#191; Realmente deseas eliminar al usuario ( %s ) %s &#63; <br/>Una vez realizada esta operación, no se podr&#225; revertir.", username,usuario.getFullName()));
			model.put("warnings", warnings);
		} else {
			errors.add(String.format("No existe el usuario %s.", username));
			model.put("errors", errors);
		}
		return "deleteuser/delete";
	}
	
	@RequestMapping(value = "deleteuser/do",
			method = RequestMethod.POST)
	public String deleteUser(Map<String, Object> model, 
			HttpSession session, HttpServletRequest request,
			@RequestParam("username") String username){
		List<String> errors = new ArrayList<String>();
		List<String> warnings = new ArrayList<String>();
		User usuario = new User();
		UserRepositoryImpl ur = new UserRepositoryImpl();
		usuario = ur.getUser(username);
		
		if( usuario != null){	
			logger.info("Regresa Usuario {}", usuario.getUsername());
			ur.deleteUser(username);
			warnings.add(0, String.format("El usuario %s, se elimin&#243; correctamente.",username));
			model.put("warnings", warnings);
		} else {
			errors.add(String.format("No existe el usuario %s.", username));
			model.put("errors", errors);
		}
		return "deleteuser/done";
	}
	
}