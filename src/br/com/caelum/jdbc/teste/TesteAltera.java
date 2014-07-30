package br.com.caelum.jdbc.teste;

import br.com.caelum.jdbc.dao.ContatoDao;
import br.com.caelum.jdbc.modelo.Contato;

public class TesteAltera {

	public static void main (String[] args) {
		ContatoDao dao = new ContatoDao();
		Contato contato = dao.getContatoId(1);
		if (contato != null) {
			contato.setEndereco("R. Vergueiro, 3185 cj57");
			dao.altera(contato);
			System.out.println("Contato Alterado!");
		}
		System.out.println("Fim!");
	}
	
}




