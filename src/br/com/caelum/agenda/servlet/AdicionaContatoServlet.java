package br.com.caelum.agenda.servlet;

import java.io.IOException; 
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.jdbc.dao.ContatoDao;
import br.com.caelum.jdbc.modelo.Contato;

@WebServlet("/adicionaContato")
public class AdicionaContatoServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();

		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String endereco = request.getParameter("endereco");
		
		String stringDate = request.getParameter("dataNascimento");
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date utilDate = null;
		Calendar calendarDate = null;
		try {
			utilDate = formatter.parse(stringDate);
		} catch (ParseException e) {
			out.println("Problemas com a formatacao da data digitada causaram erro na classe AdicionaContatoServlet!");
			e.printStackTrace();
		} 
    	calendarDate = Calendar.getInstance();
		calendarDate.setTime(utilDate);
	
		Contato contato = new Contato();
		contato.setNome(nome);
		contato.setEmail(email);
		contato.setEndereco(endereco);
		contato.setDataNascimento(calendarDate);
		
		ContatoDao dao = new ContatoDao();
		dao.adiciona(contato);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("mvc?logica=ListaContatosLogica");
		requestDispatcher.forward(request, response);
		//requestDispatcher.include(request, response);
		
		/*
		out.println("<html>");
		out.println("<body>");
		out.println("Contato " + contato.getNome() + " adicionado com sucesso!");
		out.println("</body>");
		out.println("</html>");
		*/
	}
	
}
