<!--#include file="conexao.asp"-->
<%
	ultima_pagina = Session("ultima_pagina")
	Session ("ultima_pagina") = ultima_pagina
	
	id						=	Request.Form("id")
	nome					=	Request.Form("nome")
	atividade				=	Request.Form("atividade")
	universidade			=	Request.Form("universidade")
	formaturaGraduacao		=	Request.Form("formaturaGraduacao")
	residenciaPediatria		=	Request.Form("residenciaPediatria")
	inicioPediatria			=	Request.Form("inicioPediatria")
	fimPediatria			=	Request.Form("fimPediatria")
	residencia				=	Request.Form("residencia")
	localOutra			=	Request.Form("localOutra")
	inicioOutra				=	Request.Form("inicioOutra")
	fimOutra				=	Request.Form("fimOutra")
	posGraduacao			=	Request.Form("posGraduacao")
	localPOS		=	Request.Form("localPOS")
	formaturaPOS			=	Request.Form("formaturaPOS")
	mestrado				=	Request.Form("mestrado")
	formaturaMestrado		=	Request.Form("formaturaMestrado")
	doutorado				=	Request.Form("doutorado")
	formaturaDoutorado		=	Request.Form("formaturaDoutorado")
	tituloEspecialista		=	Request.Form("tituloEspecialista")
	IF tituloEspecialista 	= "Outro" THEN
		tituloEspecialista 	= Request.Form("outroTituloEspecialista")
	END IF
	areaInteresse			=	Request.Form("areaInteresse")
	enderecoConsultorio		=	Request.Form("enderecoConsultorio")
	endereco				=	Request.Form("endereco")
	telefone				=	Request.Form("telefone")
	celular					=	Request.Form("celular")
	email					=	Request.Form("email")
	opcaoResposta			=	Request.Form("opcaoResposta")

	IF opcaoResposta = "ArtigosMedicos" THEN
		opcaoResposta = "Artigos Médicos"
	ELSEIF opcaoResposta = "newsletter" THEN
		opcaoResposta = "Newsletter"
	ELSEIF opcaoResposta = "InformacoesUteis" THEN
		opcaoResposta = "Informações Úteis"
	ELSEIF opcaoResposta = "CasoClinico" THEN
		opcaoResposta = "Caso Clínico"
	END IF 
	
	sqlEdita = "UPDATE ex_corpoclinico SET"
	sqlEdita = sqlEdita &" nome = '" & nome &"', localOutra = '" & localOutra &"', atividade = '" & atividade &"', universidade = '" & universidade &"', formaturaGraduacao = '" & formaturaGraduacao &"'," 
	sqlEdita = sqlEdita &" residenciaPediatria = '" & residenciaPediatria &"', inicioPediatria = '" & inicioPediatria &"', fimPediatria = '" & fimPediatria &"', outraResidencia = '" & outraResidencia &"',"
	sqlEdita = sqlEdita &" inicioOutra = '" & inicioOutra &"', fimOutra = '" & fimOutra &"', posGraduacao = '" & posGraduacao &"', localPOS = '" & localPOS &"', formaturaPOS = '" & formaturaPOS &"',"
	sqlEdita = sqlEdita &" mestrado = '" & mestrado &"', formaturaMestrado = '" & formaturaMestrado &"', doutorado = '" & doutorado &"', formaturaDoutorado = '" & formaturaDoutorado &"',"
	sqlEdita = sqlEdita &" tituloEspecialista = '" & tituloEspecialista &"', areaInteresse = '" & areaInteresse &"', endereco = '" & endereco &"', telefone = '" & telefone &"',"
	sqlEdita = sqlEdita &" celular = '" & celular &"', email = '" & email &"', opcaoResposta = '" & opcaoResposta &"', enderecoConsultorio = '" & enderecoConsultorio &"' WHERE id = "& id


'	Response.Write("<br /><br />" & sqlEdita & "<br /><br /><hr><br />")
	

	ObjDb.execute sqlEdita
	

'	set rs = server.CreateObject("ADODB.RecordSet")
'	rs.Open "SELECT nome, universidade, endereco FROM corpoClinico WHERE id = "&id&" ", ObjDB, 3, 1
'		Response.Write(rs("nome") & "<br />" & rs("universidade") & "<br />" & rs("endereco"))
'	rs.Close
	
'	response.End()

	Set ObjDb = Nothing
%>
<script type="text/javascript">
	alert('Salvo com sucesso!');
	window.location="inserirFoto.asp?id=<%=id%>";
</script>