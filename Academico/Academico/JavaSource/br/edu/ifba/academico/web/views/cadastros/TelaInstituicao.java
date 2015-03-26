package br.edu.ifba.academico.web.views.cadastros;

import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import br.edu.ifba.academico.business.cadastros.Instituicao;
import br.edu.ifba.academico.business.cadastros.InstituicaoDAO;

@ManagedBean
@ViewScoped
public class TelaInstituicao implements Serializable 
{
	private Instituicao instituicao;
	
	public TelaInstituicao()
	{
		// JDBC
//		instituicao = InstituicaoDAO.findById();
		
		if(instituicao == null)
		{
			instituicao = new Instituicao();
		}
	}

	public Instituicao getInstituicao() 
	{
		return instituicao;
	}

	public void setInstituicao(Instituicao instituicao)
	{
		this.instituicao = instituicao;
	}
	
	public void save()
	{
		try 
		{
			InstituicaoDAO.save(instituicao);
			
			instituicao = new Instituicao();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}
