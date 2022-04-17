<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="financeReport.aspx.cs" Inherits="M4.admin.financeReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
        }
        table
        {
            border-collapse:collapse;
        }

        td{border:1px solid;padding:6px;}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>Cross-tab Finance Report</h3>
            </div>
        <div>
            Select year:
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Year" DataValueField="Year" Height="24px" Width="128px">
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" Width="75px" /><br /><br />
        </div>
        
        <div id="report" runat="server">   
            
        </div>
        <div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:group2ConnectionString2 %>" SelectCommand="SELECT YEAR(date) AS Year FROM paymentRecord GROUP BY YEAR(date)"></asp:SqlDataSource>
            
            <br />
            <h3></h3>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="587px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="Month" YValueMembers="Total">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Amount (R)" TitleFont="Microsoft Sans Serif, 9.75pt">
                        </AxisY>
                        <AxisX Title="Month" TitleFont="Microsoft Sans Serif, 9.75pt">
                        </AxisX>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:group2ConnectionString2 %>" SelectCommand="SELECT DATENAME(month, DATEADD(month, MONTH(date) - 1, CAST('2008-01-01' AS datetime))) AS 'Month', SUM(amount) AS 'Total' FROM paymentRecord GROUP BY MONTH(date), YEAR(date)  HAVING YEAR(date) = @year">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="2020" Name="year" SessionField="barGraphFilter" />
                </SelectParameters>
            </asp:SqlDataSource>
            
        </div>
    </form>
</body>
</html>
