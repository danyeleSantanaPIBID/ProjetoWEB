package br.edu.ifba.academico.business.cadastros;

import java.util.List;



public class DepartamentoDAO {
    
  BDMySql bd = BDMySql.getInstance();
	
	
	public  boolean save(Departamento departamento)
	{
		// JDBC
		try {
						
			String sql = "INSERT INTO departamento(nome) values ('"+departamento.getNome()+ "')";
			bd.executarSQL(sql);
			
			System.out.println(sql);
			
		} catch (Exception e) {
			System.out.println("Erro");
			return false;
			
		}
		return true;
	}
	
	public List<Instituicao> getCollection()
	{
		
		return null;
	}
}
