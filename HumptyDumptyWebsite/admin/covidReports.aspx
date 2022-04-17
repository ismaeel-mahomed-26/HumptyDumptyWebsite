<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="covidReports.aspx.cs" Inherits="M4.covidReports" %>

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


        input[type="checkbox"]
        {
            transform:scale(1.4);
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
    <div>
    <form id="form1" runat="server">
        <div>
            <h1>COVID Screening Overview</h1>
        </div>
        <div> 
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="screeningID" DataSourceID="SqlDataSource1" BorderStyle="Solid" Width="700px" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="childID" HeaderText="Child ID" InsertVisible="False" ReadOnly="True" SortExpression="childID" Visible="False" />
                    <asp:BoundField DataField="screeningID" HeaderText="Screening ID" InsertVisible="False" ReadOnly="True" SortExpression="screeningID" Visible="False" />
                    <asp:BoundField DataField="surname" HeaderText="Surname" SortExpression="surname" />
                    <asp:BoundField DataField="firstName" HeaderText="Name" SortExpression="firstName" />
                    <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="temp" HeaderText="Temperature" SortExpression="temp" />
                </Columns>
            </asp:GridView>
            <br /><br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT child.childID, covidScreening.screeningID, child.firstName, child.surname, covidScreening.date, covidScreening.temp FROM child INNER JOIN covidScreening ON child.childID = covidScreening.childID"></asp:SqlDataSource>
            <h3>Detailed View</h3><i>Select a screening above to view a detailed report</i>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="screeningID" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="childID" HeaderText="childID" SortExpression="childID" Visible="False" />
                    <asp:BoundField DataField="screeningID" HeaderText="screeningID" InsertVisible="False" ReadOnly="True" SortExpression="screeningID" Visible="False" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True" />
                    <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="temp" HeaderText="Temp." SortExpression="temp" />
                    <asp:CheckBoxField DataField="cough" HeaderText="Cough" SortExpression="cough" />
                    <asp:CheckBoxField DataField="soreThroat" HeaderText="Sore Throat" SortExpression="soreThroat" />
                    <asp:CheckBoxField DataField="bodyAches" HeaderText="Body Aches" SortExpression="bodyAches" />
                    <asp:CheckBoxField DataField="tasteSmell" HeaderText="Taste/Smell" SortExpression="tasteSmell" />
                    <asp:CheckBoxField DataField="redEyes" HeaderText="Red Eyes" SortExpression="redEyes" />
                    <asp:CheckBoxField DataField="nauseaOrVomiting" HeaderText="Nausea/ Vomiting" SortExpression="nauseaOrVomiting" />
                    <asp:CheckBoxField DataField="tiredness" HeaderText="Tiredness" SortExpression="tiredness" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT covidScreening.childID, covidScreening.screeningID, child.firstName + ' ' + child.surname AS Name, covidScreening.date, covidScreening.temp, covidScreening.cough, covidScreening.soreThroat, covidScreening.bodyAches, covidScreening.tasteSmell, covidScreening.redEyes, covidScreening.nauseaOrVomiting, covidScreening.tiredness FROM child INNER JOIN covidScreening ON child.childID = covidScreening.childID WHERE (covidScreening.screeningID = @ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br /><br />
            <asp:Button ID="Button1" runat="server" Text="High Temperature Report" Height="40px" Width="287px" OnClick="Button1_Click" />
        </div>
    </form>
    </div>
</body>
</html>
