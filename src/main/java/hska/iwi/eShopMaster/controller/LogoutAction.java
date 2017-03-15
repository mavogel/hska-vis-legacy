package hska.iwi.eShopMaster.controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -530488065543708898L;

	public String execute() throws Exception {

		// Clear session:
		ActionContext.getContext().getSession().clear();
		
		return "success";
		
	}
}
