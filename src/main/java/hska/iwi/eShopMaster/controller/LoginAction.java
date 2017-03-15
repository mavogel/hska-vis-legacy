package hska.iwi.eShopMaster.controller;

import hska.iwi.eShopMaster.model.businessLogic.manager.UserManager;
import hska.iwi.eShopMaster.model.businessLogic.manager.impl.UserManagerImpl;
import hska.iwi.eShopMaster.model.database.dataobjects.User;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {

	/**
     *
     */
	private static final long serialVersionUID = -983183915002226000L;
	private String username = null;
	private String password = null;
	private String firstname;
	private String lastname;
	private String role;
	

	@Override
	public String execute() throws Exception {

		// Return string:
		String result = "input";

		UserManager myCManager = new UserManagerImpl();
		
		// Get user from DB:
		User user = myCManager.getUserByUsername(getUsername());

		// Does user exist?
		if (user != null) {
			// Is the password correct?
			if (user.getPassword().equals(getPassword())) {
				// Get session to save user role and login:
				Map<String, Object> session = ActionContext.getContext().getSession();
				
				// Save user object in session:
				session.put("webshop_user", user);
				session.put("message", "");
				firstname= user.getFirstname();
				lastname = user.getLastname();
				role = user.getRole().getTyp();
				result = "success";
			}
			else {
				addActionError(getText("error.password.wrong"));
			}
		}
		else {
			addActionError(getText("error.username.wrong"));
		}

		return result;
	}
	
	@Override
	public void validate() {
		if (getUsername().length() == 0) {
			addActionError(getText("error.username.required"));
		}
		if (getPassword().length() == 0) {
			addActionError(getText("error.password.required"));
		}
	}

	public String getUsername() {
		return (this.username);
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return (this.password);
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
