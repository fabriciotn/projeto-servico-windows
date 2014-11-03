<%
Set ObjDB = Server.CreateObject("ADODB.Connection")
ObjDB.ConnectionString = "driver={MySQL ODBC 5.2 ANSI Driver};" & _
"server=127.0.0.1;" & _
"database=pulmolab_teste;" & _
"USER=pulmolab;" & _
"Pwd=123642;" &_
"PORT=3306;" &_
"OPTION=3;"
ObjDB.open
%>
