package br.edu.ifba.academico.web.utils;

public class Mensagem {

	private static int tamanho = 50;
	
	/** 
	 * ##### 
	 *      MENSAGENS DE ERRO 
	 * ##### 
	 * */
	public static final int SEM_ERRO = 0;
	/* Mensagens de acesso a banco */
	public static final int NAO_FOI_POSSIVEL_CONECTAR_AO_BANCO = 1;
	public static final int NAO_FOI_POSSIVEL_FECHAR_A_CONEXAO = 2;
	public static final int NAO_FOI_POSSIVEL_EXECUTAR_SQL_BUSCA = 3;
	public static final int NAO_FOI_POSSIVEL_EXECUTAR_SQL_ALTERACAO = 4;
	
	public static final int TAMANHO_BUSCA_PEQUENO = 5;
	public static final int PESSOA_CORRUPTA = 6;
	
	public static final int CAMPO_NAO_PODE_FICAR_EM_BRANCO = 7;
	public static final int VALOR_MUITO_LONGO = 8;
	public static final int VALOR_DEVE_SER_NUMERO = 9;
	public static final int LOGIN_E_SENHA_INCORRETOS = 10;
	public static final int NAO_HA_ESTAGIO_PARA_ESSE_ALUNO = 11;
	public static final int DATA_NAO_VALIDA = 12;
	public static final int SELECIONE_UMA_OPCAO=12;
    public static final int NAO_HA_TCC_PARA_ESSE_ALUNO = 13;
	
	
	private static String[] mensagens = new String[tamanho];
	
	
	private static int erroAtual = SEM_ERRO;
	private static String mensagemCustomizada = "";
	
	public static void setMensagemCustomizada(String mensagemCustomizada) {
		Mensagem.mensagemCustomizada = " - "+mensagemCustomizada;
	}

	public static int getErroAtual() {
		return erroAtual;
	}

	public static void setErroAtual(int erroAtual) {
		Mensagem.erroAtual = erroAtual;
		Mensagem.mensagemCustomizada = "";
	}

	static {
		mensagens[SEM_ERRO] = "Não houve erro no sistema!!";
		mensagens[NAO_FOI_POSSIVEL_CONECTAR_AO_BANCO] = "Não foi possível executar SQL. {executarSQL} ";
		mensagens[NAO_FOI_POSSIVEL_FECHAR_A_CONEXAO] = "Nao foi possível fechar a conexao ";
		mensagens[NAO_FOI_POSSIVEL_EXECUTAR_SQL_BUSCA] = "Nao foi executar SQL de busca ";
		mensagens[NAO_FOI_POSSIVEL_EXECUTAR_SQL_ALTERACAO] = "Não foi possível executar SQL de alteração ";
		mensagens[TAMANHO_BUSCA_PEQUENO] = "Digite pelo menos 3 caracteres para fazer a busca";
		mensagens[CAMPO_NAO_PODE_FICAR_EM_BRANCO] = "Valor do campo não pode ser vazio";
		mensagens[VALOR_MUITO_LONGO] = "Valor do campo muito longo";
		mensagens[VALOR_DEVE_SER_NUMERO] = "Valor deve ser número. Erro ao converter.";
		mensagens[LOGIN_E_SENHA_INCORRETOS] = "Usuário e senha incorretos.";
		mensagens[NAO_HA_ESTAGIO_PARA_ESSE_ALUNO] = "Não há estágio para esse aluno.";
		mensagens[DATA_NAO_VALIDA] = "Data não válida.";
		mensagens[SELECIONE_UMA_OPCAO]= "Selecione uma opção.";
		mensagens[NAO_HA_TCC_PARA_ESSE_ALUNO] = "Não há Tcc para este aluno.";
	}
	
	public static String getMensagem(int tipoMensagem){
		String msn = mensagens[tipoMensagem];
		if (!mensagemCustomizada.equals("")) 
			msn += mensagemCustomizada;
		return msn;
	}
	
	
}
