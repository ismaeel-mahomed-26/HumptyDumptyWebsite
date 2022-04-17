<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="parent.aspx.cs" Inherits="M4.parent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View and Edit parent</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
        }

        table
        {
            width:100%;
            padding:20px;
            font-size:1.1em;
        }

        td{
            padding:5px;

        }

        input{
            width:100%;
            font-size:1.1em;

        }

        input[type="text"],input[type="email"]
        {
            border:unset;
            border-bottom:1px solid;
        }

        .auto-style1 {
            height: 77px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="extraInfo">
                    <tr>
                        <td colspan="5"><b style="font-size:1.3em;">Parent <a id="parentNum"> </a> Details</b></td>
                    </tr>
                    <tr>
                        <td style="width:25%;">Surname:</td><td><input type="text" runat="server" id="pSurname" required=""/></td>
                    </tr>
                    <tr>
                        <td>Firstname(s):</td><td><input runat="server" id="pFirstname" type="text" required=""/></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">ID Number:</td><td class="auto-style1"><input type="text" runat="server" id="pID" readonly="" required=""/>
                        <br />
                        <asp:Button ID="addByID"  runat="server" OnClick="Button1_Click" Text="Add existing parent by ID" ToolTip="Enter only the parent ID if they already exist on the system, and click this" UseSubmitBehavior="False" Width="247px" />

                        </td>
                    </tr>
                    <tr>
                        <td>Email:</td><td><input runat="server" id="pEmail" type="email" required="" /></td>
                    </tr>
                    <tr>
                        <td>Cell number:</td><td><input type="text" runat="server" id="pCell" required=""/></td>
                    </tr>
                    <tr>
                        <td>Work tel:</td><td><input runat="server" id="pWorkTel" type="text" /></td>
                    </tr>
                    <tr>
                        <td>Occupation:</td><td><input type="text" runat="server" id="pOccupation"/></td>
                    </tr>
                    <tr>
                        <td>Employer:</td><td><input runat="server" id="pEmployer" type="text" /></td>
                    </tr>
                    <tr>
                        <td>Work address:</td><td  colspan="4"><input type="text" runat="server" id="pAdd"/></td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="hidden" runat="server" id="pOrigID"/>
                            <input type="hidden" runat="server" id="cID" />
                            <asp:Button runat="server" ID="submitP" Text="Save Changes" BackColor="#006600" ForeColor="White" OnClick="submitParents_Click" Width="244px" />
                            <br /><br />
                            <asp:Button ID="deleteBtn"  runat="server" Text="Delete" UseSubmitBehavior="False" Width="247px" BackColor="Red" ForeColor="White" OnClick="deleteBtn_Click" />
                        </td>
                    </tr>
                </table>
        </div>
    </form>
    <script>
        function confirmDelete() {
            var toDelete = confirm("Are you sure you want to delete this parent?")
            if (toDelete)
            {
                window.location = "parent.aspx?action=delete&pID=" + document.getElementById('pOrigID').value;
            }
                
        }
        window.onload = function () {
            var str = window.opener.location.href.replace(/\?action=\S*/,"");
            window.opener.location.href = str;;

        <%  
            if (Request.QueryString["die"] == "true")
                Response.Write("window.close();");
        %>
        }
    </script>
</body>
</html>
