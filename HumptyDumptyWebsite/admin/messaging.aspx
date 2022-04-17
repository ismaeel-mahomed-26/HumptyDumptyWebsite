<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="messaging.aspx.cs" Inherits="M4.admin.messaging" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet"/>
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            min-width: 500px;
        }

        textarea{
            font-family: 'Roboto', sans-serif;
        }
        td{
            padding:3px;
        }

        input[type="text"]
        {
            border:unset;
            border-bottom:1px solid;
            padding:3px;
            background-color:transparent;
        }

        input[type="button"],input[type="submit"]
        {
            background-color:#404040;
            color:white;
            border:1px solid;
            padding:3px 5px;
            font-family: 'Roboto', sans-serif;
            border-radius:5px;
            font-size:1.1em;
            
        }

        th{
            background-color:#C9C9C9;
        }

        input[type="button"]:hover,input[type="submit"]:hover
        {
            cursor:pointer;
            transform:scale(1.01);
        }

        @media (max-width: 1370px) 
        {
            body {
                font-size: 0.8em;
            }
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <h1>Messages</h1>
            <table style="width:300px;">
                <tr><td colspan="3"><h4>Filter Messages</h4></td></tr>
                <tr>
                    <td style="width:10%;"><asp:Label ID="Label5" runat="server" Text="Name:"></asp:Label></td>
                    <td style="width:70%;"><asp:TextBox ID="TextBox4" runat="server" ></asp:TextBox></td>
                    <td style="width:20%;"><asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="margin-left: 35px" Text="Search" Width="77px" /></td>
                </tr>
                <tr><td><br /></td></tr>
             </table>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" Width="100%">
            <Columns>
                <asp:BoundField DataField="Parent" HeaderText="Parent" SortExpression="Parent" ReadOnly="True" >
                <HeaderStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" DataFormatString="{0:d}" >
                <HeaderStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="subject" HeaderText="Subject" SortExpression="subject" >
                <HeaderStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="contents" HeaderText="Contents" SortExpression="contents" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:group2ConnectionString2 %>" DeleteCommand="DELETE FROM [parentStaffMessage] WHERE [messageID] = @messageID" InsertCommand="INSERT INTO [parentStaffMessage] ([staffIDNum], [parentIDNum], [date], [subject], [contents]) VALUES (@staffIDNum, @parentIDNum, @date, @subject, @contents)" SelectCommand="SELECT parent.firstNames + ' ' + parent.surname AS Parent, parentStaffMessage.date, parentStaffMessage.subject, parentStaffMessage.contents FROM parentStaffMessage INNER JOIN parent ON parent.parentIDNum = parentStaffMessage.parentIDNum ORDER BY parentStaffMessage.date DESC" UpdateCommand="UPDATE [parentStaffMessage] SET [staffIDNum] = @staffIDNum, [parentIDNum] = @parentIDNum, [date] = @date, [subject] = @subject, [contents] = @contents WHERE [messageID] = @messageID">
            <DeleteParameters>
                <asp:Parameter Name="messageID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="staffIDNum" Type="String" />
                <asp:Parameter Name="parentIDNum" Type="String" />
                <asp:Parameter DbType="Date" Name="date" />
                <asp:Parameter Name="subject" Type="String" />
                <asp:Parameter Name="contents" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="staffIDNum" Type="String" />
                <asp:Parameter Name="parentIDNum" Type="String" />
                <asp:Parameter DbType="Date" Name="date" />
                <asp:Parameter Name="subject" Type="String" />
                <asp:Parameter Name="contents" Type="String" />
                <asp:Parameter Name="messageID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <table>
            <tr><td colspan="2"><br /><br /><h4>Send message</h4></td></tr>
            <tr><td><a>Send to:</a></td><td><select runat="server" id="parentList"></select></td></tr>
            <tr><td>Subject:</td><td><input type="text" runat="server" id="newSubject"/></td></tr>
            <tr><td>Contents:</td><td><textarea runat="server" id="newContent" style="width:450px; height:130px; resize:none;"></textarea></td></tr>
            <tr><td colspan="2"><i>Clicking "Send message" will send an email to the parent and record the message</i><br /><br />
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Send message" Width="140px" />
                </td></tr>
            <tr><td colspan="2"><a id="confirm" runat="server" style="color:darkgreen; font-weight:bold; font-size:1.3em;"></a></td></tr>
        </table>
    </form>
</body>
</html>
