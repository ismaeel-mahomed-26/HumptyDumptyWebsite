<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detailedCovid.aspx.cs" Inherits="M4.detailedCovid" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>High Temperatures</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            font-size:1.15em;
        }

        td{
            padding:4px;
            vertical-align:top;
        }

        th{
            padding:4px 8px;
            color:black;
        }

        input[type="number"]
        {
            width:70px;
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
        .auto-style1 {
            height: 32px;
        }
        </style>
</head>
<body>
    <div <%--style="background-color: transparent; background-image: url(Images/bg.jpg);"--%>>
    <form id="form1" runat="server">
        
        <div><h1>High Temperatures</h1>
            <table>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td class="auto-style1">From:</td>
                                <td class="auto-style1">To:</td>
                            </tr>
                            <tr>
                                <td>
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="154px" Width="177px">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                                </td>
                                <td>
                                    <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="140px" Width="155px">
                                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                        <NextPrevStyle VerticalAlign="Bottom" />
                                        <OtherMonthDayStyle ForeColor="#808080" />
                                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                        <SelectorStyle BackColor="#CCCCCC" />
                                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                        <WeekendDayStyle BackColor="#FFFFCC" />
                                    </asp:Calendar>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="Button2" value="2020" runat="server" OnClick="Button2_Click" Text="Filter" Width="106px" /><br />
                                    <p runat="server" id="err" style="color:red;"></p>
                                </td>
                            </tr>
                        </table>
                    </td>
                    
                    <td>
                        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource3" Width="461px">
            <Series>
                <asp:Series Name="Series1" XValueMember="Date" YValueMembers="High Temps" CustomProperties="PixelPointWidth=15, EmptyPointValue=Zero, PointWidth=1" IsValueShownAsLabel="True">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                    <AxisY Title="No. of high temperatures" LineWidth="2">
                        <MajorGrid Interval="1" IntervalOffsetType="Auto" LineDashStyle="Dot" />
                    </AxisY>
                    <AxisX IsStartedFromZero="False" Title="Date" LineWidth="2" Interval="1" IsLabelAutoFit="False">
                        <MajorGrid Enabled="False" />
                        <LabelStyle Angle="-90" />
                        <ScaleView SizeType="Days" />
                    </AxisX>
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
                        
                    </td>
                </tr> 
                <tr>
                    <td>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="childID,screeningID" DataSourceID="SqlDataSource2" AllowPaging="True">
                <Columns>
                    <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="childID" HeaderText="Child ID" SortExpression="childID" Visible="False" />
                    <asp:BoundField DataField="screeningID" HeaderText="Screening ID" SortExpression="screeningID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="temp" HeaderText="Temperature" SortExpression="temp" />
                </Columns>
            </asp:GridView>
        </td>
                    <td><div style="width:100%; padding-left:20px;"><asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="screeningID" DataSourceID="SqlDataSource1" Height="50px" Width="295px">
            <Fields>
                <asp:BoundField DataField="childID" HeaderText="Child ID" SortExpression="childID" Visible="False" />
                <asp:BoundField DataField="screeningID" HeaderText="Screening ID" InsertVisible="False" ReadOnly="True" SortExpression="screeningID" Visible="False" />
                <asp:BoundField DataField="firstName" HeaderText="Name" SortExpression="firstName" />
                <asp:BoundField DataField="surname" HeaderText="Surname" SortExpression="surname" />
                <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" DataFormatString="{0:d}" />
                <asp:BoundField DataField="temp" HeaderText="Temperature" SortExpression="temp" />
                <asp:CheckBoxField DataField="cough" HeaderText="Cough" SortExpression="cough" />
                <asp:CheckBoxField DataField="soreThroat" HeaderText="Sore Throat" SortExpression="soreThroat" />
                <asp:CheckBoxField DataField="bodyAches" HeaderText="Body Aches" SortExpression="bodyAches" />
                <asp:CheckBoxField DataField="tasteSmell" HeaderText="Taste/Smell" SortExpression="tasteSmell" />
                <asp:CheckBoxField DataField="redEyes" HeaderText="Red Eyes" SortExpression="redEyes" />
                <asp:CheckBoxField DataField="nauseaOrVomiting" HeaderText="Nausea/Vomiting" SortExpression="nauseaOrVomiting" />
                <asp:CheckBoxField DataField="tiredness" HeaderText="Tiredness" SortExpression="tiredness" />
            </Fields>
        </asp:DetailsView></div>

                    </td>
                </tr>
                <tr><td></td></tr>
            </table>
            </div>
       
       
      
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT date AS Date, COUNT(date) AS 'High Temps' FROM covidScreening WHERE (temp &gt; 36.8) GROUP BY date"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT covidScreening.childID, covidScreening.screeningID, child.firstName + ' ' + child.surname AS Name, covidScreening.date, covidScreening.temp FROM child INNER JOIN covidScreening ON child.childID = covidScreening.childID WHERE (covidScreening.temp &gt; @temp)">
            <SelectParameters>
                <asp:Parameter DefaultValue="36,8" Name="temp" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div>
        </div>
        
         <div>
            <asp:Button ID="Button1" runat="server" Text="Back" OnClick="Button1_Click" Width="107px" />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT covidScreening.childID, covidScreening.screeningID, child.firstName, child.surname, covidScreening.date, covidScreening.temp, covidScreening.cough, covidScreening.soreThroat, covidScreening.bodyAches, covidScreening.tasteSmell, covidScreening.redEyes, covidScreening.nauseaOrVomiting, covidScreening.tiredness FROM covidScreening INNER JOIN child ON covidScreening.childID = child.childID WHERE (covidScreening.childID = @id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" DefaultValue="" Name="id" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
       
        
       
    </form>
         </div>
</body>
</html>
