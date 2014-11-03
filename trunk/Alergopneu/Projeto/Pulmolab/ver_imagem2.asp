<!--#include file="conexao.asp"-->
<%
Response.Charset = "iso-8859-1"
nome = Request.QueryString("nome")
%>
<html>
<head>
<title>Instituto de Ortopedia e Traumatologia</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="resize()">
<div align="center" title="Clique para fechar"><a href="#" onClick="self.close()"><img src="anexo/<%=nome%>" border="0" alt="Clique para fechar" align="middle"></a></div>
<script language="JavaScript">
function resize(){
width = document.images[0].width + 50;
height = document.images[0].height + 100;
self.resizeTo(width,height);
}
</script>
</body>
</html>
