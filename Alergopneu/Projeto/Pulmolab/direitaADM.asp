<%
	SQL = "SELECT * FROM usuario WHERE usuario LIKE '%" & usuario & "%' "
	set rs = server.CreateObject("ADODB.RecordSet")
'	RESPONSE.Write(SQL)
	rs.Open sql, ObjDB,3,1
	
	dataUltimoLogin = rs("dataUltimoLogin")


%>
<div class="direita" id="direitaADM">
	<p align="center">
	<img src="img/logo3.png" />
	<br />
	&Aacute;rea Administrativa
	</p>
	<br />
	<br />
	
	<b>Usu&aacute;rio(a):</b>
	<br />
	<span style="padding-left:20px;"><%=usuario%></span>
	<br />
	<br />
	<b>&Uacute;ltimo Acesso:</b>
	<br />
	<span style="padding-left:20px;"><%=dataUltimoLogin%></span>
	<br />
	<br />
	<p align="center">
		<a href="home_admin.asp">
		<img alt="Ir para a home administrativa" src="img/home.png" style="border: none;" title="Home" />
		</a>
		<a href="area_admin.asp" onClick="return confirm('Deseja realmente sair da Área Administrativa?')">
		<img alt="Sair da área administrativa" src="img/sair.png" style="border: none; padding-left: 10px;" title="Sair" />
		</a>
	</p>
</div>
<style type="text/css">
	#direitaADM{
		font-size:14px;
		margin-top:20px;
		margin-left:40px;
		width:300px;
		float:right;
	}
</style>