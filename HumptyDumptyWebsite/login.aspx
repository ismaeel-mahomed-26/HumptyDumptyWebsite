<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="M4.login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="login.css" />
    <meta name="viewport" content="width=device-width, user-scalable=no">
</head>
<body>
    <form id="form1" runat="server" method="get">
        <div style="width:30%; min-width:400px; margin:auto; margin-top:100px;">
            <table>
                <tr>
                    <td colspan="2"><a id="heading">Login</a></td>
                </tr>
                
                        <%if (Session["loginErr"] != null)
                            {
                                Response.Write("<tr><td colspan=\"2\"><a style=\"color:white; background-color:red; padding: 4px; border-radius:4px; font-weight:bold;\">Login not found</a></td></tr>");
                                Session["loginErr"] = null;
                            }
                        %>
                                    
                <tr><td colspan="2"><i>Enter your details to access your account</i></td></tr>
                <tr>
                    <td>ID number: </td><td><input type="text" style="width:200px;" required="" runat="server" id="parentID"/></td>
                </tr>
                <tr>
                    <td>Password: </td><td><input type="password" style="width:200px;" required="" runat="server" id="password"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Proceed" ValidateRequestMode="Enabled" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
