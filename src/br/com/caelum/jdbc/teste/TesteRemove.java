package br.com.caelum.jdbc.teste;

import br.com.caelum.jdbc.dao.ContatoDao;
import br.com.caelum.jdbc.modelo.Contato;

public class TesteRemove {

	public static void main(String[] args) {
		ContatoDao dao = new ContatoDao();
		Contato contato = dao.getContatoId(3);
		if (contato != null) {
			dao.remove(contato);
			System.out.println("Contato removido!");
		}
		System.out.println("Fim!");
	}
}
