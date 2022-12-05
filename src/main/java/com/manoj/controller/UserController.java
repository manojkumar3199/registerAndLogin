package com.manoj.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.manoj.model.User;

@Controller
public class UserController {

	@Autowired
	private SessionFactory sessionFactory;

	@RequestMapping("/registerPage")
	public String getRegisterPage(@ModelAttribute("user") User user) {
		return "register";
	}

	@RequestMapping("/loginPage")
	public String getLoginPage(HttpSession s) {
		if (s.getAttribute("user") != null)
			return "user";
		return "login";
	}

	@RequestMapping("/logout")
	public String logOut(HttpSession s) {
		s.invalidate();
		return "login";
	}

	@Transactional
	@RequestMapping(path = "/register", method = RequestMethod.POST)
	public String register(@Valid @ModelAttribute("user") User user, BindingResult result,
			@RequestParam("userImageFile") MultipartFile userImageFile, Model model, HttpSession s) {

		if (result.hasErrors() || userImageFile.isEmpty() || !user.getPassword().equals(user.getConfirmPassword())) {
			if (userImageFile.isEmpty())
				model.addAttribute("error", "Please select your profile image!");
			if (!user.getConfirmPassword().isBlank() && !user.getPassword().equals(user.getConfirmPassword()))
				model.addAttribute("matchError", "Password didn't match!");
			return "register";
		}

		Session session = sessionFactory.getCurrentSession();

		String hql = "FROM User as u WHERE u.email = :e";
		Query<User> query = session.createQuery(hql);
		query.setParameter("e", user.getEmail());

		if (query.uniqueResult() != null) {
			model.addAttribute("registerationError",
					"You are already registered! please signin to continue your work.");
			return "register";
		}

		String modifiedName = user.getEmail() + userImageFile.getOriginalFilename().substring(
				userImageFile.getOriginalFilename().length() - 4, userImageFile.getOriginalFilename().length());
		String path = s.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "resources" + File.separator
				+ "images" + File.separator + modifiedName;

		try {
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(userImageFile.getBytes());
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		user.setProfile(modifiedName);
		session.save(user);
		model.addAttribute("registerationSuccessMsg", "registration completed successfully!");
		model.addAttribute("description", "your account has been created!");
		return "success";
	}

	@Transactional
	@RequestMapping(path = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam(value = "checkbox", defaultValue = "false") boolean checkbox, Model model, HttpSession s) {

		if (email.isBlank() || password.isBlank() || !checkbox) {
			if (email.isBlank())
				model.addAttribute("emailError", "plz! enter your email!");
			if (password.isBlank())
				model.addAttribute("passwordError", "plz! enter your password!");
			if (!checkbox)
				model.addAttribute("checkboxError", "plz! check this box if you want to proceed!");
			return "login";
		}

		Session session = sessionFactory.getCurrentSession();

		String hql = "FROM User as u WHERE u.email = :e AND u.password = :p";
		Query<User> query = session.createQuery(hql);
		query.setParameter("e", email);
		query.setParameter("p", password);
		User user = query.uniqueResult();

		if (user == null) {
			model.addAttribute("loginError", "login failed! please recheck the email and password and try again..");
			return "login";
		}

		s.setAttribute("user", user);
		return "user";
	}
}
