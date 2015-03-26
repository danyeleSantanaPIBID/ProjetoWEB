package br.edu.ifba.academico.web.views.cadastros;

import java.io.Serializable;

import br.edu.ifba.academico.business.cadastros.Departamento;
import br.edu.ifba.academico.business.cadastros.DepartamentoDAO;
import br.edu.ifba.academico.business.cadastros.SemestreLetivo;
import br.edu.ifba.academico.business.cadastros.SemestreLetivoDAO;

public class TelaSemestreLetivo implements Serializable {

	private SemestreLetivo semestreLetivo;
	SemestreLetivoDAO semLet = new SemestreLetivoDAO();
	public TelaSemestreLetivo()
	{
		// JDBC
		//departamento = DepartamentoDAO.findById();
		
		
		if(semestreLetivo == null)
		{
			semestreLetivo = new SemestreLetivo();
		}
	}
	

	public SemestreLetivo getDepartamento() {
		return semestreLetivo;
	}

	public void setSemestreLetivo(SemestreLetivo semestreLetivo) {
		this.semestreLetivo = semestreLetivo;
	}
	
	public  void save()
	{
		try 
		{
			semLet.save(semestreLetivo);
			
			semestreLetivo = new SemestreLetivo();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}	
}
