package br.edu.ifba.academico.business.cadastros;

import java.util.List;

public class SemestreLetivoDAO {
	  BDMySql bd = BDMySql.getInstance();
		
		
		public  boolean save(SemestreLetivo semles)
		{
			// JDBC
			try {
							
				String sql = "INSERT INTO semestreLetivo(nome) values ('"+semles.getSemestre()+ "')";
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
