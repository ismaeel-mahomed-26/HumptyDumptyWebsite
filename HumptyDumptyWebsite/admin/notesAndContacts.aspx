<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notesAndContacts.aspx.cs" Inherits="M4.Contacts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
        }

        td{
            vertical-align:top;
            padding:3px;
        }

        input{
            width:100%;
        }

        .hidden
        {
            display:none;
        }

         input[type="text"],#filterTable input[type="number"]
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
        .auto-style1 {
            width: 10%;
            height: 38px;
        }
        .auto-style2 {
            width: 70%;
            height: 38px;
        }
        .auto-style3 {
            width: 20%;
            height: 38px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

                <div style="width:100%; display:block;">
                    <div style="margin:auto; width:700px;">
                    <h2>Contacts</h2>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style1"><asp:Label ID="Label5" runat="server" Text="Name:"></asp:Label></td>
                                <td class="auto-style2"><asp:TextBox ID="TextBox4" runat="server" ></asp:TextBox></td>
                                <td class="auto-style3"><asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="margin-left: 35px" Text="Search" Width="70px" CausesValidation="False" UseSubmitBehavior="False" /></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [externalContact] WHERE [phoneNumber] = @original_phoneNumber AND [name] = @original_name AND (([notes] = @original_notes) OR ([notes] IS NULL AND @original_notes IS NULL)) " InsertCommand="INSERT INTO [externalContact] ([phoneNumber], [name], [notes]) VALUES (@phoneNumber, @name, @notes)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT phoneNumber, name, notes, extraOne, contactID FROM externalContact ORDER BY name" UpdateCommand="UPDATE [externalContact] SET [phoneNumber] = @phoneNumber, [name] = @name, [notes] = @notes WHERE [phoneNumber] = @original_phoneNumber AND [name] = @original_name AND (([notes] = @original_notes) OR ([notes] IS NULL AND @original_notes IS NULL)) ">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_phoneNumber" Type="String" />
                                            <asp:Parameter Name="original_name" Type="String" />
                                            <asp:Parameter Name="original_notes" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="TextBox2" Name="phoneNumber" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="TextBox1" Name="name" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="TextBox3" Name="notes" PropertyName="Text" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="phoneNumber" Type="String" />
                                            <asp:Parameter Name="name" Type="String" />
                                            <asp:Parameter Name="notes" Type="String" />
                                            <asp:Parameter Name="original_phoneNumber" Type="String" />
                                            <asp:Parameter Name="original_name" Type="String" />
                                            <asp:Parameter Name="original_notes" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="contactID" DataSourceID="SqlDataSource1" Height="74px" Width="700px" AllowPaging="True">
                                        <Columns>
                                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                            <asp:BoundField DataField="name" HeaderText="Contact Name" SortExpression="name" >
                                            <HeaderStyle Width="150px" />
                                            <ItemStyle Width="150px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="phoneNumber" HeaderText="Number" SortExpression="phoneNumber" >
                                            <HeaderStyle Width="150px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="notes" HeaderText="Details" SortExpression="notes" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td><br /><br /></td>
                            </tr>
                             <tr>
                                <td colspan="3" style="text-align:center; border-bottom:1px solid;"><b>Add Contact</b></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label></td>
                                <td colspan="2"> <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="Label2" runat="server" Text="Number:"></asp:Label></td>
                                <td colspan="2"><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                                </tr>
                            <tr>
                                <td><asp:Label ID="Label3" runat="server" Text="Details:"></asp:Label></td>
                                <td  colspan="2"><asp:TextBox ID="TextBox3" runat="server" Height="35px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="3"><br /><asp:Button ID="Button1" runat="server" Text="Insert New Contact" OnClick="Button1_Click" /></td>
                            </tr>
                            <tr>
                                <td><br /><br /><br /></td>
                            </tr>
                        </table>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [note]" DeleteCommand="DELETE FROM [note] WHERE [noteID] = @noteID" InsertCommand="INSERT INTO [note] ([staffIDNum], [item], [note], [date]) VALUES (@staffIDNum, @item, @note, @date)" UpdateCommand="UPDATE [note] SET [staffIDNum] = @staffIDNum, [item] = @item, [note] = @note, [date] = @date WHERE [noteID] = @noteID">
                        <DeleteParameters>
                            <asp:Parameter Name="noteID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="staffIDNum" Type="String" />
                            <asp:Parameter Name="item" Type="String" />
                            <asp:Parameter Name="note" Type="String" />
                            <asp:Parameter DbType="Date" Name="date" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="staffIDNum" Type="String" />
                            <asp:Parameter Name="item" Type="String" />
                            <asp:Parameter Name="note" Type="String" />
                            <asp:Parameter DbType="Date" Name="date" />
                            <asp:Parameter Name="noteID" Type="Int32" />
                        </UpdateParameters>
                                    </asp:SqlDataSource>
                    

                       
        
                    </div>
                    </div>
        <hr style="border:2px solid;"/><br />
                    <div  style="width:100%; display:block; min-width:520px;">
                        <div style="width:520px; margin:auto;">
                
                            <table>
                                <tr>
                                    <td colspan="2"><h2>Notes</h2></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="noteID" DataSourceID="SqlDataSource2" Height="36px" Width="500px" AllowSorting="True" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True"  OnRowDataBound="GridView3_RowDataBound">
                                            <Columns>
                                                <asp:BoundField DataField="noteID" HeaderText="noteID" SortExpression="noteID" InsertVisible="False" ReadOnly="True" >
                                                <HeaderStyle Width="0px" />
                                                <ItemStyle Width="0px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="staffIDNum" HeaderText="staffIDNum" SortExpression="staffIDNum" />
                                                <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" DataFormatString="{0:d}" ApplyFormatInEditMode="True" >
                                                <HeaderStyle Width="110px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="item" HeaderText="Subject" SortExpression="item" />
                                                <asp:BoundField DataField="note" HeaderText="Note" SortExpression="note" />
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align:center; border-bottom:1px solid;"><b>Add Note</b></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width:10%;">Subject:</td><td><input type="text" runat="server" id="subject"/></td>
                                </tr>
                                <tr>
                                    <td>Note:</td><td><input type="text" runat="server" id="contents"/></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><br />
                                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Insert New Note" />
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                    </div>
           </div>

    
    </form>

    </body>
</html>
