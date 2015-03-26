import br.edu.ifba.academico.business.cadastros.BDMySql;
import br.edu.ifba.academico.business.cadastros.Instituicao;

public class InstituicaoDAO 
{
	
	  BDMySql bd = BDMySql.getInstance();
	  
	public boolean save(Instituicao instituicao)
	{
		// JDBC
		try {
			
			String sql = "INSERT INTO instituiçao(nome) values ('"+instituicao.getNome()+ "')";
			bd.executarSQL(sql);
			
			System.out.println(sql);
			
		} catch (Exception e) {
			System.out.println("Erro");
			return false;
			
	}
	
	public List<Instituicao> getCollection()
	{
		
		return null;
	}
}
