<!--#include file="conexao.asp"-->
<%
usuario = Session("usuario")
Session("usuario") = usuario

	resposta = Request.Form("resposta")
	cod = Request.Form("cod")
	
	resposta = replace(resposta,"'","")
	resposta = replace(resposta,chr(13),"<br />")
	
	set rsADM = server.CreateObject("ADODB.RecordSet")
	sqlADM = "SELECT id FROM usuario WHERE usuario LIKE '"& usuario &"' "
'	Response.Write(sqlADM)
	
	rsADM.Open sqlADM, ObjDB,3,1
	
	IF rsADM.EOF = FALSE THEN
	adm = rsADM("id")
	END IF

sql = "INSERT INTO resposta (idForum, idPessoa, texto, dataResposta) VALUES ('"&cod&"', '"&adm&"', '"&resposta&"', now())"
ObjDb.execute sql


sqlRESPOSTA = "UPDATE forum SET respondido = 1 WHERE cod = "&cod

ObjDb.execute sqlRESPOSTA


%>
		<script type="text/javascript">
			alert('Pergunta respondida com sucesso!');
			window.close();
			window.opener.location =  "ferramenta_forum.asp";
			window.opener.focus();
		</script>