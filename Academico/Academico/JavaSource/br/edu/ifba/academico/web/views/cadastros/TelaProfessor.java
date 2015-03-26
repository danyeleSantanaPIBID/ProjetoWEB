package br.edu.ifba.academico.web.views.cadastros;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import br.edu.ifba.academico.business.cadastros.Professor;
import br.edu.ifba.academico.business.cadastros.ProfessorDAO;

@ManagedBean
@ViewScoped
public class TelaProfessor implements Serializable
{
	private static final long serialVersionUID = -717376418838356192L;
	private String valorPesquisa;
	private List<Professor> professoresPesquisados;

	public List<Professor> getProfessoresPesquisados()
	{
		if(professoresPesquisados == null)
		{
			professoresPesquisados = new ArrayList<Professor>();
		}
		
		return professoresPesquisados;
	}

	public void setProfessoresPesquisados(List<Professor> professoresPesquisados)
	{
		this.professoresPesquisados = professoresPesquisados;
	}

	public String getValorPesquisa()
	{
		return valorPesquisa;
	}

	public void setValorPesquisa(String valorPesquisa)
	{
		this.valorPesquisa = valorPesquisa;
	}
	
	public void pesquisar()
	{
		try
		{
			setProfessoresPesquisados(ProfessorDAO.getCollection(valorPesquisa));
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
