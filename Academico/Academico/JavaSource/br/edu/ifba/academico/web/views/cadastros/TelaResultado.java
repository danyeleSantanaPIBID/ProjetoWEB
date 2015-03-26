package br.edu.ifba.academico.web.views.cadastros;

import java.io.Serializable;




import br.edu.ifba.academico.business.cadastros.Departamento;
import br.edu.ifba.academico.business.cadastros.DepartamentoDAO;
import br.edu.ifba.academico.business.cadastros.Resultado;
import br.edu.ifba.academico.business.cadastros.ResultadoDAO;

public class TelaResultado implements Serializable {
	
	private Resultado resultado;
	
	public TelaResultado()
	{
		// JDBC
//		resultado = ResultadoDAO.findById();
		
		if(resultado == null)
		{
			resultado = new Resultado();
		}
	}
	
	

	public Resultado getResultado() {
		return resultado;
	}

	public void setResultado(Resultado resultado) {
		this.resultado = resultado;
	}
	
	public void save()
	{
		try 
		{
			ResultadoDAO.save(resultado);
			
			resultado = new Resultado();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

}
