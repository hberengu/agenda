<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="caelum" %>

<html>
<head>
	<!-- <link href="css/jquery.css" rel="stylesheet"> -->
	
	<!-- 
	<script src="js/jquery.js"></script>
	<script src="js/jquery-ui.js"></script> 
	-->
	
	<link href="jquery/jquery-ui.css" rel="stylesheet">
	<script src="jquery/external/jquery/jquery.js"></script>
	<script src="jquery/jquery-ui.js"></script>
	
	
</head>
	<body>
	<c:import url="cabecalho.jsp" />
		<h1>Alteracao dos dados do Contato</h1>
		<hr />
		<form action="mvc"> 
			Nome: <input type="text" name="nome" value="${contato.nome}" /><br />
			E-mail: <input type="text" name="email" value="${contato.email}" /><br />
			Endereço: <input type="text" name="endereco" value="${contato.endereco}" /><br />
			<fmt:formatDate value='${contato.dataNascimento.time}' pattern='dd/MM/yyyy' var='dataFormatada' />
			Data Nascimento: <caelum:campoData id="dataNascimento" valor="${dataFormatada}" />
			<input type="submit" value="Alterar" />
			<input type="hidden" name="logica" value="AlteraContatoLogica" />
			<input type="hidden" name="id" value="${contato.id}" />
		</form>
	<c:import url="rodape.jsp" />
	</body>
</html>