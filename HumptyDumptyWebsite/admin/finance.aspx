<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="finance.aspx.cs" Inherits="M4.finance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            font-size:1.15em;
        }

        td{
            padding:4px;
            
        }

        th{
            padding:4px 8px;
            color:black;
        }

        #filterTable td
        {
            text-align:left;
            background-color:unset;
        }

        input[type="text"],#filterTable input[type="number"]
        {
            border:unset;
            border-bottom:1px solid;
            padding:3px;
            background-color:transparent;
        }

        #main
        {
            width:70%;
            min-width:700px;
            margin:auto;
        }

        #filterTable
        {
            width:48%;
            background-color:#C9C9C9;
            border-bottom:2px solid white;
            padding:10px;
            border-radius:6px;
            margin-bottom:20px;
            float:right;
        }

        #addTable
        {
            width:48%;
            background-color:#C9C9C9;
            border-bottom:2px solid white;
            padding:10px;
            border-radius:6px;
            margin-bottom:20px;
            float:left;
        }

        #GridView1
        {
            width:100%;
        }

        input[type="button"],input[type="submit"]
        {
            background-color:#404040;
            color:white;
            border:1px solid black;
            padding:3px 5px;
            font-family: 'Roboto', sans-serif;
            border-radius:5px;
        }

        input[type="button"]:hover,input[type="submit"]:hover
        {
            cursor:pointer;
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
    <div id="main">
        <form id="form1" runat="server">
        <div>

                        <table id="addTable">
                            <tr><td><a href="./financeReport.aspx">View Finance Report</a></td></tr>
                <tr>
                    <td><b>Add Payment Record:</b></td>
                </tr>
                <tr>
                    <td>
                        Child: <select runat="server" id="selectStudent">
                                     
                        </select>
                        &nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Fetch fee amount" OnClick="Button1_Click" UseSubmitBehavior="False" />

                    </td>
                                
                </tr>

                <tr>
                    <td>          
                        <br />            
                    </td>
                </tr>

                <tr>
                    <td>Date: <a id="paymentDate" runat="server"><% Response.Write(DateTime.Now.ToString("dd MMM yyyy")); %></a></td>
                </tr>
                <tr>
                    <td>Reason: <input type="text" runat="server" id="paymentReason"/></td>
                </tr>
                <tr>
                    <td>
                        Amount: R<input type="text" runat="server" id="paymentAmount"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button runat="server" Text="Add Record" OnClick="Unnamed1_Click1" UseSubmitBehavior="False" />
                    </td>
                </tr>
            </table>

            <table id="filterTable">
                <tr>
                    <td><b>Filter Payments:</b></td>
                </tr>
                <tr>
                    <td>
                        <a>Name: </a><input type="text" runat="server" id="nameSearch"/>
                    </td>
                    </tr>
                <tr>
                    <td>
                        <a>Date: </a><input type="text" placeholder="01 Aug 2021" style="width:80px;" runat="server" id="dateFrom"/><a> to </a><input type="text" placeholder="01 Nov 2021" style="width:80px;" runat="server" id="dateTo"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a>Amount: </a>R<input type="number" style="width:80px;" runat="server" id="amtFrom"/><a> to R</a><input type="number" runat="server" style="width:80px;" id="amtTo"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button runat="server" Text="Filter" Width="54px" OnClick="Unnamed1_Click" UseSubmitBehavior="False" /> &nbsp;&nbsp; <asp:Button runat="server" Text="Clear Filters" Width="90px" OnClick="Unnamed2_Click" UseSubmitBehavior="False" />
                    </td>
                </tr>
                <tr>
                    <td><br /></td>
                </tr>
                <tr>
                    <td><br /></td>
                </tr>
            </table>

            
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="childID,staffIDNum,recordID" DataSourceID="SqlDataSource1" PageSize="14" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="15px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" ShowDeleteButton="True" />
                            <asp:BoundField DataField="childID" HeaderText="childID" InsertVisible="False" ReadOnly="True" SortExpression="childID" Visible="False" />
                            <asp:BoundField DataField="staffIDNum" HeaderText="staffIDNum" ReadOnly="True" SortExpression="staffIDNum" Visible="False" />
                            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                            <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" ApplyFormatInEditMode="True" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                            <asp:BoundField DataField="reason" HeaderText="Reason" SortExpression="reason" />
                            <asp:BoundField DataField="Staff" HeaderText="Staff" SortExpression="Staff" ReadOnly="True" />
                            <asp:BoundField DataField="recordID" HeaderText="recordID" InsertVisible="False" ReadOnly="True" SortExpression="recordID" Visible="False" />
                        </Columns>
                        <FooterStyle BackColor="#C9C9C9" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#C9C9C9" Font-Bold="True" HorizontalAlign="Left" />
                        <PagerStyle BackColor="#C9C9C9" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F2F2F2" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#929292" Font-Bold="True" ForeColor="Navy" />
 
                    </asp:GridView>


 
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT child.childID, staffMember.staffIDNum, child.firstName + ' ' + child.surname AS Name, paymentRecord.date, paymentRecord.amount, paymentRecord.reason, staffMember.name AS Staff, paymentRecord.recordID FROM child INNER JOIN paymentRecord ON child.childID = paymentRecord.childID INNER JOIN staffMember ON staffMember.staffIDNum = paymentRecord.staffIDNum" DeleteCommand="DELETE FROM paymentRecord WHERE (recordID = @recordID)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="GridView1" Name="recordID" PropertyName="SelectedValue" />
            </DeleteParameters>
            </asp:SqlDataSource>
    </form>
    </div>
    <footer>

    </footer>
</body>
</html>
