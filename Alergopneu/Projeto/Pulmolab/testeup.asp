
<%@ Language=VBScript %>
<% 
option explicit 
Response.Expires = -1
Server.ScriptTimeout = 600
' All communication must be in UTF-8, including the response back from the request
Session.CodePage  = 65001
%>
<!-- #include file="freeaspupload.asp" -->
<!-- #include file="conexao.asp"-->
<%


  ' ****************************************************
  ' Change the value of the variable below to the pathname
  ' of a directory with write permissions, for example "C:\Inetpub\wwwroot"
  ' ****************************************************

  Dim uploadsDirVar
  uploadsDirVar = "c:\pulmolab\aulas" 
  

  ' Note: this file uploadTester.asp is just an example to demonstrate
  ' the capabilities of the freeASPUpload.asp class. There are no plans
  ' to add any new features to uploadTester.asp itself. Feel free to add
  ' your own code. If you are building a content management system, you
  ' may also want to consider this script: http://www.webfilebrowser.com/

function OutputForm()
%>
    <form name="frmSend" method="POST" enctype="multipart/form-data" accept-charset="utf-8" action="testeup.asp" onSubmit="return onSubmitForm();">
    <table style="font-family: Tahoma; font-size: 8pt;">
			<tr>
				<td colspan="4" class="area"><b>T&iacute;tulo:</b></td>
			</tr>
			<tr>
				<td colspan="4" class="area"><input type="text" name="nome" id="nome" size="51"/></td>
			</tr>
			<tr>
				<td class="area">&nbsp;</td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4" class="area"><b>Arquivo:</b></td>
			</tr>
			<tr>
				<td colspan="4" class="area"><input name="attach1" type="file" size=35></td>
			</tr>
			<tr>
				<td colspan="4" class="area"><b>Data:</b></td>
			</tr>
			<tr>
				<td colspan="4" class="area"><input type="text" name="data" id="data" class="data" size="10" /></td>
			</tr>
			<tr>
				<td class="area">&nbsp;</td>
				<td colspan="3">&nbsp;</td>
			</tr>
				</tr>
			
			<tr>
				<td class="area"><b>Obs:</b></td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4" class="area"><textarea name="obs" id="obs" style="width: 350px; height: 60px; font-size:12px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="4"><b>Aten&ccedil;&atilde;o:</b> Para colocar um trecho em negrito, it&aacute;lico ou
					
					sublinhado, <br />
					coloque-o entre as respectivas tags: 
					&lt;b&gt;&lt;/b&gt;, &lt;i&gt;&lt;/i&gt; ou &lt;u&gt;&lt;/u&gt;. <br />
					<br />
					<u>Exemplo:</u> <br />
					&lt;u&gt;Venha&lt;/u&gt; &lt;i&gt;conhecer&lt;/i&gt; a&lt;b&gt;PULMOLAB&lt;/b&gt;! <br />
					<br />
					<u>Resultado:</u> <br />
					<u>Venha</u> <i>conhecer</i> a <b>PULMOLAB</b>! </td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><input style="margin-top:4" type=submit value="Upload"></td>
			</tr>
		</table>
    </form>
<%
end function

function TestEnvironment()
    Dim fso, fileName, testFile, streamTest
    TestEnvironment = ""
    Set fso = Server.CreateObject("Scripting.FileSystemObject")
    if not fso.FolderExists(uploadsDirVar) then
        TestEnvironment = "<B>Folder " & uploadsDirVar & " does not exist.</B><br>The value of your uploadsDirVar is incorrect. Open uploadTester.asp in an editor and change the value of uploadsDirVar to the pathname of a directory with write permissions."
        exit function
    end if
    fileName = uploadsDirVar & "\test.txt"
    on error resume next
    Set testFile = fso.CreateTextFile(fileName, true)
    If Err.Number<>0 then
        TestEnvironment = "<B>Folder " & uploadsDirVar & " does not have write permissions.</B><br>The value of your uploadsDirVar is incorrect. Open uploadTester.asp in an editor and change the value of uploadsDirVar to the pathname of a directory with write permissions."
        exit function
    end if
    Err.Clear
    testFile.Close
    fso.DeleteFile(fileName)
    If Err.Number<>0 then
        TestEnvironment = "<B>Folder " & uploadsDirVar & " does not have delete permissions</B>, although it does have write permissions.<br>Change the permissions for IUSR_<I>computername</I> on this folder."
        exit function
    end if
    Err.Clear
    Set streamTest = Server.CreateObject("ADODB.Stream")
    If Err.Number<>0 then
        TestEnvironment = "<B>The ADODB object <I>Stream</I> is not available in your server.</B><br>Check the Requirements page for information about upgrading your ADODB libraries."
        exit function
    end if
    Set streamTest = Nothing
end function

function SaveFiles
    Dim Upload, fileName, fileSize, ks, i, fileKey

    Set Upload = New FreeASPUpload
    Upload.Save(uploadsDirVar)

	' If something fails inside the script, but the exception is handled
	If Err.Number<>0 then Exit function

    SaveFiles = ""
    ks = Upload.UploadedFiles.keys
    if (UBound(ks) <> -1) then
        SaveFiles = "<B>Files uploaded:</B> "
        for each fileKey in Upload.UploadedFiles.keys
            SaveFiles = SaveFiles & Upload.UploadedFiles(fileKey).FileName & " (" & Upload.UploadedFiles(fileKey).Length & "B) "
        next
    else
        SaveFiles = "No file selected for upload or the file name specified in the upload form does not correspond to a valid file in the system."
    end if
	SaveFiles = SaveFiles & "<br>Titulo = " & Upload.Form("nome") & "<br>"
	SaveFiles = SaveFiles & "Data = " & Upload.Form("data") & "<br>"
	SaveFiles = SaveFiles & "Obs = " & Upload.Form("obs") & "<br>"
end function
%>

<link href="estilo.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="js/resources/css/ext-all.css" />
<link rel="stylesheet" type="text/css" href="js/resources/css/xtheme-gray.css" />
<script src="js/AC_RunActiveContent.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.1.2.pack.js"></script>
<script type="text/javascript" src="js/ext.js"></script>
<script type="text/javascript">

    $(document).ready(function() {
        $('#loaging').hide();

        $('.data').mask("99/99/9999");

        $('#cadastra').click(function() {


            if ($('#titulo').val() == '') {
                alert("Erro! Preencha corretamente o título do caso.");
                return false;
            }

            if ($('#texto').val() == '') {
                alert("Erro! Preencha corretamente o texto do caso.");
                return false;
            }

            if ($('#arquivo').val() == '') {
                alert("Erro! Insira um arquivo.");
                return false;
            }
            if ($('#arquivo').val().substr($('#arquivo').val().length - 4).toLowerCase() != ".pdf") {
                alert("Erro! Extensão invalida.");
                return false;
            }
            if ($('#data').val() == '') {
                alert("Erro! Insira uma data.");
                return false;
            }
            $("#campos").fadeOut("slow", function() {
                $('#loaging').show();
            });

        });

    });		

</script>
<style type="text/css">
<!--
body {
	background-color: #F7F7F7;
	font-family: Tahoma;
	font-size: 8pt;
}
.style1 {
	font-size: 14px;
	font-weight: bold;
}
td {
	padding-left: 50px;
}
#loaging {
	height:100px;
	width:300px;
	padding:30px;
	margin:auto;
	vertical-align:middle;
	border:2px solid #CCC;
	background-color:white;
}
textarea {
	background:#F5F5F5;
	border:1px solid #CCCCCC;
	font-family:Arial, Helvetica, sans-serif;
	font-size:11px;
}
-->
</style>
<script>
function onSubmitForm() {
    var formDOMObj = document.frmSend;
    if (formDOMObj.attach1.value == "" )
        alert("Please press the Browse button and pick a file.")
    else
        return true;
    return false;
}
</script>

</HEAD>
<body style="font-size: 8pt; font-family: Trebuchet, Tahoma, Arial;">
<p align="center" style="padding-top: 16px;"><img src="img/logo.png" alt="" border="0" /></p>
<br />
<div id="campos">

<%
Dim diagnostics
if Request.ServerVariables("REQUEST_METHOD") <> "POST" then
    diagnostics = TestEnvironment()
    if diagnostics<>"" then
        response.write "<div style=""margin-left:20; margin-top:30; margin-right:30; margin-bottom:30;"">"
        response.write diagnostics
        response.write "<p>After you correct this problem, reload the page."
        response.write "</div>"
    else
        response.write "<div style=""margin-left:150"">"
        OutputForm()
        response.write "</div>"
    end if
else
    response.write "<div style=""margin-left:150"">"
    OutputForm()
    response.write SaveFiles()
    response.write "<br><br></div>"
end if

%>

</div>

</BODY>
</HTML>
