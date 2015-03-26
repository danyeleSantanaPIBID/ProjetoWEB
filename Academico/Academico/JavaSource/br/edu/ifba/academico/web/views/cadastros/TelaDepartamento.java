package br.edu.ifba.academico.web.views.cadastros;

import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import br.edu.ifba.academico.business.cadastros.Departamento;
import br.edu.ifba.academico.business.cadastros.DepartamentoDAO;
import br.edu.ifba.academico.business.cadastros.Instituicao;
import br.edu.ifba.academico.business.cadastros.InstituicaoDAO;

@ManagedBean
@ViewScoped
public class TelaDepartamento implements Serializable {

	private Departamento departamento;
	DepartamentoDAO depar = new DepartamentoDAO();
	public TelaDepartamento()
	{
		// JDBC
		//departamento = DepartamentoDAO.findById();
		
		
		if(departamento == null)
		{
			departamento = new Departamento();
		}
	}
	

	public Departamento getDepartamento() {
		return departamento;
	}

	public void setDepartamento(Departamento departamento) {
		this.departamento = departamento;
	}
	
	public  void save()
	{
		try 
		{
			depar.save(departamento);
			
			departamento = new Departamento();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}	
}
