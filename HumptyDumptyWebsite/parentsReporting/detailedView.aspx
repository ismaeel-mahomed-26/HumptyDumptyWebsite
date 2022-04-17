<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detailedView.aspx.cs" Inherits="M4.parentsReporting.detailedView" %>

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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="reportView" runat="server">
            <br /><br /><br />
            <div id="nameHeading" runat="server" style="font-weight:bold; font-size:1.3em;">
                <%
                    if (Session["tempName"] != null)
                        Response.Write("Report for " + Session["tempName"]);
                    %>
            </div>
            <br />
            <i>Items are ranked age-appropriately out of a 5</i>
            <br /><br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="3" DataKeyNames="reportID" DataSourceID="SqlDataSource1" GridLines="Horizontal" Height="50px" Width="606px">
            <Fields>
                <asp:BoundField DataField="" HeaderText="Progress Report" InsertVisible="False" ReadOnly="True" SortExpression="reportID" Visible="True" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="reportID" HeaderText="reportID" InsertVisible="False" ReadOnly="True" SortExpression="reportID" Visible="False" />
                <asp:BoundField DataField="childID" HeaderText="childID" SortExpression="childID" Visible="False" />
                <asp:BoundField DataField="semester" HeaderText="Semester" SortExpression="semester" />
                <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
                <asp:BoundField DataField="height" HeaderText="Height" SortExpression="height" />
                <asp:BoundField DataField="weight" HeaderText="Weight" SortExpression="weight" />
                <asp:BoundField DataField="" HeaderText="Emotional Intelligence" InsertVisible="False" ReadOnly="True" SortExpression="reportID" Visible="True" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="shareToys" HeaderText="Do they share their toys?" SortExpression="shareToys" />
                <asp:BoundField DataField="waitTurn" HeaderText="Do they wait for their turn?" SortExpression="waitTurn" />
                <asp:BoundField DataField="solveProblemsSelf" HeaderText="Can they solve problems?" SortExpression="solveProblemsSelf" />
                <asp:BoundField DataField="" HeaderText="Fine Motor Skills" InsertVisible="False" ReadOnly="True" SortExpression="reportID" Visible="True" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="holdCrayonProperly" HeaderText="Do they hold the crayon properly?" SortExpression="holdCrayonProperly" />
                <asp:BoundField DataField="holdScissorsProperly" HeaderText="Do they hold scissors properly?" SortExpression="holdScissorsProperly" />
                <asp:BoundField DataField="cutStraightLine" HeaderText="Can they cut a straight line?" SortExpression="cutStraightLine"  />
                <asp:BoundField DataField="generalFineMotor" HeaderText="General Fine Motor Skills" SortExpression="generalFineMotor" Visible="false" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="completePuzzle" HeaderText="Can they complete a puzzle?" SortExpression="completePuzzle" />
                 <asp:BoundField DataField="" HeaderText="Gross Motor Skills" InsertVisible="False" ReadOnly="True" SortExpression="reportID" Visible="True" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="catchBall" HeaderText="Can they catch a ball?" SortExpression="catchBall" />
                <asp:BoundField DataField="hop" HeaderText="Can they hop?" SortExpression="hop" />
                <asp:BoundField DataField="swingMyself" HeaderText="Can they swing themselves?" SortExpression="swingMyself" />
                 <asp:BoundField DataField="" HeaderText="Arts and Crafts" InsertVisible="False" ReadOnly="True" SortExpression="reportID" Visible="True" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="colorInLines" HeaderText="How well do they color in the lines?" SortExpression="colorInLines" />
                <asp:BoundField DataField="canPaint" HeaderText="How well do they paint?" SortExpression="canPaint" />
                 <asp:BoundField DataField="" HeaderText="Speech" InsertVisible="False" ReadOnly="True" SortExpression="reportID" Visible="True" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="canSpeakFluently" HeaderText="Can they speak fluently?" SortExpression="canSpeakFluently" />
                <asp:BoundField DataField="goodVocabulary" HeaderText="Is their vocabulary developing?" SortExpression="goodVocabulary" />
                 <asp:BoundField DataField="" HeaderText="General" InsertVisible="False" ReadOnly="True" SortExpression="reportID" Visible="True" >
                <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="toiletTrained" HeaderText="How is their potty training?" SortExpression="toiletTrained" />
                <asp:BoundField DataField="generalComment" HeaderText="General comment" SortExpression="generalComment" >
                <HeaderStyle Width="320px" />
                </asp:BoundField>
            </Fields>
        </asp:DetailsView>
            
        </div>
        <br />
            <input type="button" onclick="printDiv('reportView')" runat="server" id="printBtn" value="Print Report" />
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:group2ConnectionString2 %>" SelectCommand="SELECT * FROM [newProgressReport]"></asp:SqlDataSource>
    </form>
     <script>
        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;
        }
     </script>
</body>
</html>
