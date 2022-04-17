<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewMessages.aspx.cs" Inherits="M4.messages.viewMessages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="message.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="row">
                <div class="col-12 col-sm-4 col-lg-3"><div style ="border-radius:8px; background-color:#A2C04C; padding:8px; margin-bottom:30px; height:295px;" >
            <table><tr><td><b>New Message</b></td></tr><tr>
            <td>Subject: <input type = "text" runat="server" id="msgSubject" required=""/>
              </td></tr><tr><td>Message: <textarea runat = "server" id="msgContents" required=""></textarea></td></tr><tr><td>
           <asp:Button ID="Button1" runat="server" style="width:100%;" Text="Send message" ValidateRequestMode="Enabled" OnClick="Button1_Click" />
           </td></tr></table></div></div><div class="col-12 col-sm-1">&nbsp;</div>
                <div id="msgBlock" style="display:contents;" runat="server">

                </div>
            </div>
        </div>
    </form>
</body>
</html>
