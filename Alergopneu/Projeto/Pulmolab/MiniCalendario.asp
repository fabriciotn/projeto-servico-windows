<!-- ***************************************************************		CONTEUDO CALENDARIO ************************************************************************ -->                            
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
			Response.Write "The date you picked was not a valid date.  The indexTeste was set to today's date."
		End If
		' The elegant solution for those of you running IIS4
		'If Request.QueryString.Count <> 0 Then Response.Write "The date you picked was not a valid date.  The ferramenta_calendario was set to today's date."
	End If
End If


'Now we've got the date.  Now get Days in the choosen month and the day of the week it starts on.
iDIM = GetDaysInMonth(Month(dDate), Year(dDate))
iDOW = GetWeekdayMonthStartsOn(dDate)

anoAtual = Year(dDate)
%>
<!-- Outer Table is simply to get the pretty border-->
<div class="agenda">
	<div class="mesCalendarioPeq">
		<span style="float:left; padding-left:15px; color:#FFFFFF; vertical-align:bottom">
			<A  HREF="?date=<%= SubtractOneMonth(dDate) %>" style="color:#FFFFFF; font-weight:bold" title="M&ecirc;s anterior" >&lt;&lt;</A>&nbsp;<%= MonthName(Month(dDate)) %>&nbsp;<A style="color:#FFFFFF; font-weight:bold"  HREF="?date=<%= AddOneMonth(dDate) %>" title="Pr&oacute;ximo m&ecirc;s" >&gt;&gt;</A>
		</span>
		<span style="float:right; padding-right:20px; padding-top:5px; color:#67808F; font-weight:bold; font-size:14px"><%=anoAtual%></span>
	</div>


<TABLE CELLSPACING=8 CELLPADDING=0 class="tableCalendarioPeq">
<%
' Write spacer cells at beginning of first row if month doesn't start on a Sunday.
If iDOW <> 1 Then
	Response.Write"<TR>" & vbCrLf
	iPosition = 1
	Do While iPosition < iDOW
		Response.Write "<TD>&nbsp;</TD>" & vbCrLf
		iPosition = iPosition + 1
	Loop
End If

' Write days of month in proper day slots
iCurrent = 1
iPosition = iDOW
Do While iCurrent <= iDIM
	' If we're at the begginning of a row then write TR
	If iPosition = 1 Then
		Response.Write "<TR>" & vbCrLf
	End If



'SQL para marcar os dias que possuem cirugia no mês visualizado
	sql = "select * from eventos where dataInicio = '"&year(dDate)&"-"&month(dDate)&"-"&iCurrent&"'"
'	Response.Write(sql)
'	response.End()

set rs = server.CreateObject("ADODB.RecordSet")
rs.Open sql, ObjDB,3,1

if not rs.EOF and iCurrent = Day(dDate) then	
	
		cod = rs("cod")
	

		IF rs("tipo") = "Congresso" THEN
			Response.Write"<TD class=""diaEventoPeq1"" title=""Congresso""><a href=""#verEvento"" name=""modal"" class=""evento"" lang="""&cod&""">" & iCurrent & "</a></TD>" & vbCrLf
		ELSE
			Response.Write"<TD class=""diaEventoPeq2"" title=""Reuni&atilde;o""><a href=""#verEvento"" name=""modal"" class=""evento"" lang="""&cod&""">" & iCurrent & "</a></TD>" & vbCrLf
		END IF
	
	Elseif not rs.EOF and iCurrent <> Day(dDate) then
		cod = rs("cod")
	
		IF rs("tipo") = "Congresso" THEN
			Response.Write"<TD class=""diaDiferentePeq1"" title=""Congresso""><a name=""modal"" HREF=""#verEvento"" lang="""&cod&""">" & iCurrent & "</A></TD>" & vbCrLf
		ELSE
			Response.Write"<TD class=""diaDiferentePeq2"" title=""Reuni&atilde;o""><a HREF=""#verEvento"" name=""modal"" lang="""&cod&""">" & iCurrent & "</A></TD>" & vbCrLf
		END IF
			
	Elseif rs.EOF and iCurrent = Day(date) and month(date) = month(dDate) and iCurrent = Day(dDate) then	
		Response.Write"<TD id=""diaCalendarioPeq"" class=""diaAtualPeq"">" & iCurrent & "</TD>" & vbCrLf
	Elseif rs.EOF and iCurrent = Day(date) and month(date) = month(dDate) and iCurrent <> Day(dDate) then		
			Response.Write"<TD id=""diaCalendarioPeq"" >" & iCurrent & "</TD>" & vbCrLf	
			
	Elseif rs.EOF and iCurrent = Day(dDate) then	
				Response.Write"<TD id=""diaCalendarioPeq"">" & iCurrent & "</TD>" & vbCrLf
	Else
		Response.Write"<TD id=""diaCalendarioPeq"" >" & iCurrent & "</TD>" & vbCrLf
	
	End If
	rs.Close
	
	' If we're at the endof a row then write /TR
	If iPosition = 7 Then
		Response.Write "</TR>" & vbCrLf
		iPosition = 0
	End If
	
	' Increment variables
	iCurrent = iCurrent + 1
	iPosition = iPosition + 1
Loop

' Write spacer cells at end of last row if month doesn't end on a Saturday.
If iPosition <> 1 Then
	Do While iPosition <= 7
		Response.Write"<TD>&nbsp;</TD>" & vbCrLf
		iPosition = iPosition + 1
	Loop
	Response.Write "</TR>" & vbCrLf
End If
%>
</TABLE>
</div>

<!-- ***************************************************************		CONTEUDO CALENDARIO ************************************************************************ -->                               
