<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
 import="java.util.*, java.text.*, br.com.caelum.jdbc.dao.*, br.com.caelum.jdbc.modelo.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table border=1>
		<tr bgcolor="lightblue" align="center">
			<td>Nome</td>
			<td>Email</td>
			<td>Endereco</td>
			<td>Data Nascimento</td>
		</tr>
		<%
			ContatoDao dao = new ContatoDao();
			List<Contato> contatos = dao.getLista();
			for (Contato contato : contatos) {
				SimpleDateFormat data = new SimpleDateFormat("dd/MM/yyyy");
				String dataString = data.format(contato.getDataNascimento().getTime());
		%>
				<tr>
					<td><%= contato.getNome() %></td>
					<td><%= contato.getEmail()%></td>
					<td><%= contato.getEndereco()%></td>
					<td><%= dataString %></td>
				</tr>
		<%
			}
		%>
	</table>
</body>
</html>