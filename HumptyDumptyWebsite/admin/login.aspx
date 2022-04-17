<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="M4.login" %>
<% 
    if (Session["user"] != null)
        Session["user"] = null;
    %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="formstyle.css" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server" onsubmit="loading();">
        <div style="width:100%; height:100%; position:relative; position: absolute;top: 40%; -ms-transform: translateY(-50%);transform: translateY(-50%);">
            <div style="width:600px; margin:auto; text-align:center; position:relative; top:40%;">
                <table style="width:300px; margin:auto; text-align:left;">
                    <tr>
                        <td style="text-align:center;"><div runat="server" id="message">&nbsp;</div></td>
                    </tr>
                    <tr>
                        <td>Username:</td>
                    </tr>
                    <tr>
                        <td><input type="text" id="username" name="username" runat="server" /></td>
                    </tr>
                    <tr>
                        <td><br /></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                    </tr>
                    <tr>
                        <td><input type="password" id="password" name="password" runat="server" /></td>
                    </tr>
                    <tr>
                        <td><br /></td>
                    </tr>
                    <tr>
                        <td style="text-align:center;"><input id="loginMainBtn" type="submit" value="Login" />
                            <a id="loadingTxt" style="font-size:1.2em;"></a></td> 
                    </tr>
                </table>
                
                
            </div>
            
        </div>
    </form>
    <footer>
        <script>
            window.onload = function () { parent.document.getElementById('loginoutBtn').innerHTML = "Login" };

            function loading() {
                document.getElementById("loginMainBtn").style.display = "none";
                document.getElementById("loadingTxt").innerText = "Logging in...";
            }
        </script>
    </footer>
</body>
</html>
