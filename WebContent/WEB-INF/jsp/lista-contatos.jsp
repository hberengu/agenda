<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:import url="/cabecalho.jsp"></c:import>	
	<!--  cria o DAO -->
	<!-- <jsp:useBean id="dao" class="br.com.caelum.jdbc.dao.ContatoDao" /> -->
	<jsp:useBean id="date" class="java.util.Date" />
	<table>
		<tr bgcolor="lightblue" align="center">
			<td>Linha</td>
			<td>Nome</td>
			<td>Email</td>
			<td>Endereco</td>
			<td>Data Nascimento</td>
			<td>Alterar</td>
			<td>Remover</td>
		</tr>
		
		<c:if test="${empty contatos}">
			<c:redirect url="mvc?logica=ListaContatosLogica" />
		</c:if>
		
		<!--  percorre contatos montando as linhas da tabela -->
		<c:forEach var="contato" items="${contatos}" varStatus="id">
			<tr bgcolor="${id.count % 2 == 0 ? 'lightgray' : 'lightyellow'  }">
			    <td>${id.count}</td>
				<td>${contato.nome }</td>
				<td>
				<!-- 
				<c:if test="${not empty contato.email}">
				    <a href="mailto:${contato.email}">${contato.email}</a>
				</c:if>
				</td>
				-->
				<c:choose>
					<c:when test="${contato.email.contains('@')}"><a href="mailto:${contato.email}">${contato.email}</a></c:when>
					<c:otherwise>email invalido</c:otherwise>
				</c:choose>
				</td>
				
				<td>${contato.endereco }</td>
				<td>
				<fmt:formatDate value="${contato.dataNascimento.time}" pattern="dd/MM/yyyy"/>
				</td>
				<td>
					<a href="mvc?logica=CarregaContatoLogica&id=${contato.id}">Alterar</a>
				</td>
				<td>
					<a href="mvc?logica=RemoveContatoLogica&id=${contato.id}">Remover</a>
				</td>
			</tr>
		</c:forEach>
		<tr>
		<td><a href="adiciona-contato.jsp">Adicionar Contato</a></td>
		</tr>
	</table>
	<c:import url="/rodape.jsp"></c:import>
    <br />
	<c:set var="teste" value="${date.time }" />
	<c:set var="resultado" value="${teste - tempoInicial }" />
	Resultado em ${resultado} milisegundos.
	</body>
</html>




