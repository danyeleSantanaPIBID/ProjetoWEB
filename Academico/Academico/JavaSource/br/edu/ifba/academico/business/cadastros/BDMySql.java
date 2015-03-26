package br.edu.ifba.academico.business.cadastros;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import br.edu.ifba.academico.web.utils.Mensagem;



public class BDMySql {
	
	
	private static BDMySql singleton = null;
	private Connection con;

	public static BDMySql getInstance() {
		if (singleton == null) {
			singleton = new BDMySql();
		}
		return singleton;
	}


	private BDMySql() {
		try {

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/academico", "root", "1234");

			         System.out.println("Sucesso!!!");
		} catch (Exception e) {
			e.printStackTrace();
         System.out.println("Erro ao conectar");
		
		}
	}


	protected ResultSet executarBuscaSQL(String sql) {
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			return rs;
		} catch (Exception e) {
			
			Mensagem.setErroAtual(Mensagem.NAO_FOI_POSSIVEL_EXECUTAR_SQL_BUSCA);
			return null;
		}

	}

	protected int executarSQL(String sql) {
		try {
			Statement st = con.createStatement();
			st.executeUpdate(sql);
			st.close();
			return Mensagem.SEM_ERRO;

		} catch (Exception e) {
			
			return Mensagem.NAO_FOI_POSSIVEL_CONECTAR_AO_BANCO;
		}
	}

	protected void fecharConexao() {
		try {
			con.close();
		} catch (Exception e) {
			Mensagem.setErroAtual(Mensagem.NAO_FOI_POSSIVEL_FECHAR_A_CONEXAO);
		}

	}
	
	@Override
	protected void finalize() throws Throwable {
		fecharConexao();
		super.finalize();
	}


}
