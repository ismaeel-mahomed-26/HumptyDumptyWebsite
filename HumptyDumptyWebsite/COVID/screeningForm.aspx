<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="screeningForm.aspx.cs" Inherits="M4.COVID.screeningForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="covid.css" />
    <style>
        td{
            text-align:left;
        }

        input{
            width:unset;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:40%; min-width:400px; margin:auto; margin-top:100px;">
            <table style="width:100%;">
                <tr><td colspan="2"><b>Screening for
                    <%
                        Response.Write(Session["screenName"]+" for "+DateTime.Now.ToString("dddd, dd MMMM yyyy"));
                        
                    %></b></td></tr>
                <tr><td colspan="2">Temperature: &nbsp;
                    
                    <select runat="server" id="tempTens" required="required">
                        <option>34</option>
                        <option>35</option>
                        <option>36</option>
                        <option>37</option>
                        <option>38</option>
                        <option>39</option>
                        <option>40</option>
                    </select>,
                    <select runat="server" id="tempDeci" required="required">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                    </select> C&deg;
                    
                    </td></tr>
                <tr><td colspan="2"><b>Does the learner have:</b></td></tr>
                <tr><td style="width:35%;">A cough? </td><td> <asp:RadioButtonList ID="cough" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"><asp:ListItem Value="1">Yes</asp:ListItem><asp:ListItem Value="0">No</asp:ListItem></asp:RadioButtonList></td></tr>
                <tr><td>A sore throat? </td><td> <asp:RadioButtonList ID="throat" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"><asp:ListItem Value="1">Yes</asp:ListItem><asp:ListItem Value="0">No</asp:ListItem></asp:RadioButtonList></td></tr>
                <tr><td>Body aches? </td><td> <asp:RadioButtonList ID="aches" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"><asp:ListItem Value="1">Yes</asp:ListItem><asp:ListItem Value="0">No</asp:ListItem></asp:RadioButtonList></td></tr>
                <tr><td>Normal taste and smell? </td><td> <asp:RadioButtonList ID="taste" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"><asp:ListItem Value="1">Yes</asp:ListItem><asp:ListItem Value="0">No</asp:ListItem></asp:RadioButtonList></td></tr>
                <tr><td>Red eyes? </td><td> <asp:RadioButtonList ID="redEyes" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"><asp:ListItem Value="1">Yes</asp:ListItem><asp:ListItem Value="0">No</asp:ListItem></asp:RadioButtonList></td></tr>
                <tr><td>Nausea/vomiting? </td><td> <asp:RadioButtonList ID="naus" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"><asp:ListItem Value="1">Yes</asp:ListItem><asp:ListItem Value="0">No</asp:ListItem></asp:RadioButtonList></td></tr>
                <tr><td>Fatigue? </td><td> <asp:RadioButtonList ID="fatigue" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"><asp:ListItem Value="1">Yes</asp:ListItem><asp:ListItem Value="0">No</asp:ListItem></asp:RadioButtonList></td></tr>
                <tr><td colspan="2"><i>By clicking submit, I verify the above information to be true</i></td></tr>
                <tr><td style="text-align: center" colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                    </td></tr>

                
            </table>
        </div>
    </form>
</body>
</html>
