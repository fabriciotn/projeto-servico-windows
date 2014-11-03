<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pulmolab</title>
<!-- #include file="includes.asp" -->
<!--#include file="sessao.asp"-->
<script type="text/javascript">

$(document).ready(function(){
	
	
	<%if Request.QueryString("excluido") = "sim" then%>
	alert("Evento excluído com sucesso!")
	<%end if%>

	$('#novo').click(function(){
	var id_atual = $(this).attr("lang");
	var esquerda = (screen.width - 900)/2;
    var topo = (screen.height - 670)/2;
	
    window.open("cadastrar_evento.asp", "PULMOLAB" , "height=710,width=540,top=" + topo + ",left=" + 				    esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

	});	
	$('.ver').click(function(){
	var id_atual = $(this).attr("lang");
	var esquerda = (screen.width - 900)/2;
    var topo = (screen.height - 670)/2;
	
    window.open("eventos_ver.asp?cod=" + id_atual, "PULMOLAB" , "height=600,width=540,top=" + topo + ",left=" + 				    esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

	});	
	
	$('.editar').click(function(){
	var id_atual = $(this).attr("lang");
	var esquerda = (screen.width - 900)/2;
    var topo = (screen.height - 670)/2;
	
    window.open("editar_evento.asp?cod=" + id_atual, "PULMOLAB" , "height=650,width=540,top=" + topo + ",left=" + 				    esquerda + ",status=no,scrollbars=yes,menubar=no,toolbar=no,titlebar=no,location=no,directories=no,statusbar=no");

	});	
		

});
		
</script>
<style type="text/css">
<!--
.linha {
width:100%;
height:1px;
border-bottom:1px dotted #999999;
clear:both;
}

.t
{
border: 1px solid #666666;
height: 20px;
}



h2 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 22px;
	font-weight: bold;
	color: #66808F;
	border-bottom: 2px solid;
}
td{
	border:1px solid #666666;
}

.dia_sem{
	width:70px;
}
#evento1{
	cursor:default;
	color:#0000FF;
	font-weight:bold;
	text-align:center; 
	font-size:16px;
	padding-top:10px;
}
#evento2{
	cursor:help;
	font-weight:bold;
	color:#000000;
	padding-top:10px;
}
#evento2:hover{
	font-style:italic;
	color:#66808F;
	font-size:14px;
	text-decoration:underline;	
}
-->
</style>

</head>

<body>


<!-- #include file="topo.asp" -->
<!-- #include file="sessao.asp" -->
    
<!-- #include file="menu.asp" -->      
    
<div id="geral">
<div id="centro"> 
        
       <div id="texto">
 
 
 <!-- ***********************************************************************	CONTEUDO ADM ********************************************************************* -->
 	<div class="conteudo_adm" style="padding-bottom:100px">

          <h2>Agenda de Eventos</h2>
<br /><br /><br /><br />
<span class="txt_cinza">Eventos agendados no sistema.</span>
<br />
<span style="padding-left: 500px;">
	<a id="novo" style="cursor: pointer; font-size: 8pt;"><img src="img/add.png" title="Cadastrar um novo evento" style="border: none;" /></a>&nbsp;&nbsp;&nbsp;
	<a href="eventos.asp" style="cursor:pointer"><img style="border: none;" src="img/eventos.png" width="20" height="20" title="Visualizar eventos" /></a>
</span>

<br />


  <div id="novidades_conteudo" style="padding-bottom: 20px;">



<%'Calendário%>

<%charset = "iso-8859-1"%>

<%
'*******************************************************
'*     ASP 101 Sample Code - http://www.asp101.com     *
'*                                                     *
'*   This code is made available as a service to our   *
'*      visitors and is provided strictly for the      *
'*               purpose of illustration.              *
'*                                                     *
'* Please direct all inquiries to webmaster@asp101.com *
'*******************************************************
%>

<%
' ***Begin Function Declaration***
' New and improved GetDaysInMonth implementation.
' Thanks to Florent Renucci for pointing out that I
' could easily use the same method I used for the
' revised GetWeekdayMonthStartsOn function.
Function GetDaysInMonth(iMonth, iYear)
	Dim dTemp
	dTemp = DateAdd("d", -1, DateSerial(iYear, iMonth + 1, 1))
	GetDaysInMonth = Day(dTemp)
End Function

' Previous implementation on GetDaysInMonth
'Function GetDaysInMonth(iMonth, iYear)
'	Select Case iMonth
'		Case 1, 3, 5, 7, 8, 10, 12
'			GetDaysInMonth = 31
'		Case 4, 6, 9, 11
'			GetDaysInMonth = 30
'		Case 2
'			If IsDate("February 29, " & iYear) Then
'				GetDaysInMonth = 29
'			Else
'				GetDaysInMonth = 28
'			End If
'	End Select
'End Function

Function GetWeekdayMonthStartsOn(dAnyDayInTheMonth)
	Dim dTemp
	dTemp = DateAdd("d", -(Day(dAnyDayInTheMonth) - 1), dAnyDayInTheMonth)
	GetWeekdayMonthStartsOn = WeekDay(dTemp)
End Function

Function SubtractOneMonth(dDate)
	SubtractOneMonth = DateAdd("m", -1, dDate)
End Function

Function AddOneMonth(dDate)
	AddOneMonth = DateAdd("m", 1, dDate)
End Function
' ***End Function Declaration***


Dim dDate     ' Date we're displaying ferramenta_calendario for
Dim iDIM      ' Days In Month
Dim iDOW      ' Day Of Week that month starts on
Dim iCurrent  ' Variable we use to hold current day of month as we write table
Dim iPosition ' Variable we use to hold current position in table


' Get selected date.  There are two ways to do this.
' First check if we were passed a full date in RQS("date").
' If so use it, if not look for seperate variables, putting them togeter into a date.
' Lastly check if the date is valid...if not use today
If IsDate(Request.QueryString("date")) Then
	dDate = CDate(Request.QueryString("date"))
Else
	If IsDate(Request.QueryString("month") & "-" & Request.QueryString("day") & "-" & Request.QueryString("year")) Then
		dDate = CDate(Request.QueryString("month") & "-" & Request.QueryString("day") & "-" & Request.QueryString("year"))
	Else
		dDate = Date()
		' The annoyingly bad solution for those of you running IIS3
		If Len(Request.QueryString("month")) <> 0 Or Len(Request.QueryString("day")) <> 0 Or Len(Request.QueryString("year")) <> 0 Or Len(Request.QueryString("date")) <> 0 Then
			Response.Write "The date you picked was not a valid date.  The ferramenta_calendario was set to today's date.<BR><BR>"
		End If
		' The elegant solution for those of you running IIS4
		'If Request.QueryString.Count <> 0 Then Response.Write "The date you picked was not a valid date.  The ferramenta_calendario was set to today's date.<BR><BR>"
	End If
End If


'Now we've got the date.  Now get Days in the choosen month and the day of the week it starts on.
iDIM = GetDaysInMonth(Month(dDate), Year(dDate))
iDOW = GetWeekdayMonthStartsOn(dDate)

%>

<br />

<!-- Outer Table is simply to get the pretty border-->
<TABLE BORDER=2 CELLSPACING=0 CELLPADDING=0 style="margin-left:25px; text-align:center;">
<TR>
<TD>
<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=1 BGCOLOR=#FFFFFF>
	<TR style="background:#93A3AD; color:#CCCCCC; text-align:center; height:40px; font-size:16px">
		<TD COLSPAN=7 style="color:#FFFFFF; font-weight:bold;">
			<span style="float:left; padding-left:120px;"><A style="text-decoration: none;" HREF="?date=<%= SubtractOneMonth(dDate) %>" title="Mês anterior">&lt;&lt;</A></span>
			<span style="text-align:center;"><%= Ucase(MonthName(Month(dDate))) & " / " & Year(dDate) %></span>
			<span style="float:right;  padding-right:120px;"><A style="text-decoration: none;" HREF="?date=<%= AddOneMonth(dDate) %>" title="Próximo mês">&gt;&gt;</A></span>
		</TD>
	</TR>
	<TR style="background:#E4EEF8; text-align:center; color:#67808F; font-weight:bold; height:40px;">
		<TD class="dia_sem">Dom</TD>
		<TD class="dia_sem">Seg</TD>
		<TD class="dia_sem">Ter</TD>
		<TD class="dia_sem">Qua</TD>
		<TD class="dia_sem">Qui</TD>
		<TD class="dia_sem">Sex</TD>
		<TD class="dia_sem">Sáb</TD>
	</TR>
<%
' Write spacer cells at beginning of first row if month doesn't start on a Sunday.
If iDOW <> 1 Then
	Response.Write vbTab & "<TR>" & vbCrLf
	iPosition = 1
	Do While iPosition < iDOW
		Response.Write vbTab & vbTab & "<TD style=""background-color: #F2F2F2;"" >&nbsp;</TD>" & vbCrLf
		iPosition = iPosition + 1
	Loop
End If

' Write days of month in proper day slots
iCurrent = 1
iPosition = iDOW
Do While iCurrent <= iDIM
	' If we're at the begginning of a row then write TR
	If iPosition = 1 Then
		Response.Write vbTab & "<TR>" & vbCrLf
	End If



'SQL para marcar os dias que possuem cirugia no mês visualizado
	sql = "select * from eventos where dataInicio = '"&year(dDate)&"-"&month(dDate)&"-"&iCurrent&"'"

set rs = server.CreateObject("ADODB.RecordSet")
rs.Open sql, ObjDB,3,1

if not rs.EOF and iCurrent = Day(dDate) then	
	
		Response.Write vbTab & vbTab & "<TD HEIGHT=40 BGCOLOR=#DDDDDD id=""evento1""><B>" & iCurrent & "</B><BR><BR></TD>" & vbCrLf
	
	Elseif not rs.EOF and iCurrent <> Day(dDate) then	
			Response.Write vbTab & vbTab & "<TD HEIGHT=40 BGCOLOR=#DDDDDD style=""text-align: center"" title=""Ver evento(s) deste dia""><A id=""evento2"" HREF=""?date=" & iCurrent & "-" & Month(dDate) & "-" & Year(dDate) & """>" & iCurrent & "</A><BR><BR></TD>" & vbCrLf
	Elseif rs.EOF and iCurrent = Day(date) and month(date) = month(dDate) and iCurrent = Day(dDate) then	
		Response.Write vbTab & vbTab & "<TD HEIGHT=40 BGCOLOR=#F2F2F2 style=""text-align: center; padding-top: 16px; text-decoration:underline""><FONT SIZE=""-1""><B>" & iCurrent & "</B></FONT><BR><BR></TD>" & vbCrLf
	Elseif rs.EOF and iCurrent = Day(date) and month(date) = month(dDate) and iCurrent <> Day(dDate) then		
			Response.Write vbTab & vbTab & "<TD HEIGHT=40 BGCOLOR=#F2F2F2 style=""text-align: center; padding-top: 20px;"">" & iCurrent & "<BR><BR></TD>" & vbCrLf	
			
	Elseif rs.EOF and iCurrent = Day(dDate) then	
				Response.Write vbTab & vbTab & "<TD HEIGHT=40 BGCOLOR=#F2F2F2 style=""text-align: center; padding-top: 20px;""><FONT SIZE=""-1""><B>" & iCurrent & "</B></FONT><BR><BR></TD>" & vbCrLf
	Else
		Response.Write vbTab & vbTab & "<TD HEIGHT=40 BGCOLOR=#F2F2F2 style=""text-align: center; padding-top: 10px;"">" & iCurrent & "<BR><BR></TD>" & vbCrLf
	
	End If
	rs.Close
	
	' If we're at the endof a row then write /TR
	If iPosition = 7 Then
		Response.Write vbTab & "</TR>" & vbCrLf
		iPosition = 0
	End If
	
	' Increment variables
	iCurrent = iCurrent + 1
	iPosition = iPosition + 1
Loop

' Write spacer cells at end of last row if month doesn't end on a Saturday.
If iPosition <> 1 Then
	Do While iPosition <= 7
		Response.Write vbTab & vbTab & "<TD style=""background-color: #F2F2F2; "">&nbsp;</TD>" & vbCrLf
		iPosition = iPosition + 1
	Loop
	Response.Write vbTab & "</TR>" & vbCrLf
End If
%>
</TABLE>
</TD>
</TR>
</TABLE>
</div>

<br />
<div class="linha">
</div>
<br />


<%
if Request.QueryString("date") = "" then
	
dia =   day(date)
mes = month(date)
ano =  year(date)

n_dia = len(dia)
n_mes = len(mes)


if n_dia  = 1 then
dia  = 0&""&dia
end if

if n_mes  = 1 then
mes  = 0&""&mes
end if

dataAtualA = dia &"/"& mes &"/"& ano
dataAtualB = ano &"-"& mes &"-"& dia


else

data = Request.QueryString("date")

dia =   day(data)
mes = month(data)
ano =  year(data)

n_dia = len(dia)
n_mes = len(mes)


if n_dia  = 1 then
dia  = 0&""&dia
end if

if n_mes  = 1 then
mes  = 0&""&mes
end if

dataAtualA = dia &"/"& mes &"/"& ano
dataAtualB = ano &"-"& mes &"-"& dia

end if


sql_2 = "SELECT dataInicio, dataFinal, evento, tipo, cod FROM eventos WHERE dataInicio= '"&dataAtualB&"' ORDER BY cod DESC"

Set rs_2 = server.CreateObject("ADODB.RecordSet")

'Response.Write(sql_2)
'Response.End()

rs_2.Open sql_2, ObjDB,3,1

if not rs_2.EOF then
%>


<span style="color:#CC0000; font-weight:bold; text-align:center; font-size: 10pt;">Eventos agendados para <%=dataAtualA%></span>

<br />

<Table style="border: 1px solid #666666; width: 600px; background:#FFFFFF; margin-top:10px;">
	<tr style="background-color:#666666; color: #FFFFFF; font-weight: bold;">
		<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td class="t" style="width:75px;">Data In&iacute;cio</td>
		<td class="t" style="width:75px;">Data Final</td>
		<td class="t">Evento</td>
		<td class="t">Tipo</td>
		<td class="t" style="width:70px">A&ccedil;&otilde;es</td>
	</tr>
<%
cont = 0

WHILE NOT rs_2.EOF

cont = cont + 1

nome = rs_2("evento")

IF Len(nome) > 30 THEN
	nome = mid(nome,1,25)&"..."
END IF

tipo = rs_2("tipo")


	dataInicio = rs_2("dataInicio")
	dataFinal = rs_2("dataFinal")
%>
	<tr>
		<td style="background-color:#666666; color: #FFFFFF; font-weight: bold; font-size: 16px; text-align: center;"><%=cont%></td>
	
		<td class="t">&nbsp;
			<%=dataInicio%>
		</td>
		<td class="t">&nbsp;
			<%=dataFinal%>
		</td>
		<td class="t">&nbsp;
			<%=nome%>
		</td>
		<td class="t">&nbsp;
			<%=tipo%>
		</td>
		<td class="t">
			<div id="icones" style="text-align:center; padding-left:10px;">
				<a lang="<%=rs_2("cod")%>" class="ver" style="cursor:pointer"><img style="border: none;" src="img/zoom.png" title="Visualizar cirurgia" /></a>
				<a lang="<%=rs_2("cod")%>" class="editar" style="cursor:pointer"><img style="border: none;" src="img/wrench_orange.png" title="Editar cirurgia" /></a>
				<a href="delete_evento.asp?cod=<%=rs_2("cod")%>" onclick="return confirm('Deseja realmente excluir este evento?');"><img style="border: none;" src="img/delete.png" title="Deletar cirurgia" /></a>
			</div>
		</td>
	</tr>
<%
'end if
rs_2.MOVENEXT
WEND

%>

</Table>

<%else%>

		<span style="color:#CC0000; font-weight:bold;">Nenhum evento foi agendado para <%=dataAtualA%>.</span>

<%
end if
%>



</div>
 <!-- ***********************************************************************	FIM CONTEUDO ADM ********************************************************************* -->

       </div>
       
 <!-- #include file="direitaADM.asp" -->      

        
</div>
</div>
    

<!-- #include file="rodape.asp" -->



</body>
</html>
<!--#include file="conexaoOFF.asp" -->
