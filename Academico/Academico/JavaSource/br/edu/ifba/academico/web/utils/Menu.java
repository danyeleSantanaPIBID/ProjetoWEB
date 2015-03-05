package br.edu.ifba.academico.web.utils;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named
@SessionScoped
public class Menu implements Serializable
{
	private static final long serialVersionUID = 1433990803635169620L;
	private String currentSubMenu;
	private String nome;
	public String getCurrentSubMenu()
	{
		return currentSubMenu;
	}
	
	public void setCurrentSubMenu(String currentSubMenu)
	{
		this.currentSubMenu = currentSubMenu;
	}
	
	public static long getSerialversionuid()
	{
		return serialVersionUID;
	}
}
