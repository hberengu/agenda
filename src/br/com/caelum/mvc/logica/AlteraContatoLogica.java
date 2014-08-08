package br.com.caelum.mvc.logica;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.jdbc.dao.ContatoDao;
import br.com.caelum.jdbc.modelo.Contato;

public class AlteraContatoLogica implements Logica {

	@Override
	public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		System.out.println("cheguei no alteracontatologica - controller");
		
		Contato contato = new Contato();
		contato.setId(Long.parseLong(req.getParameter("id")));
		contato.setNome(req.getParameter("nome"));
		contato.setEmail(req.getParameter("email"));
		contato.setEndereco(req.getParameter("endereco"));

		Calendar calendarDate = Calendar.getInstance();
		calendarDate.setTime(new SimpleDateFormat("dd/MM/yyyy").parse(req.getParameter("dataNascimento")));
		contato.setDataNascimento(calendarDate);
		
		ContatoDao dao = new ContatoDao();
		dao.altera(contato);
		
		System.out.println("terminada alteracao do contato, vou repassar view para controller");
		
		return "mvc?logica=ListaContatosLogica";
		
	}
	
	

}
