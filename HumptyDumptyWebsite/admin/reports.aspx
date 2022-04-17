<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="M4.reports" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            font-size:1.15em;
        }
        .auto-style1 {
            margin-top: 0px;
        }

        #FormView1 input[type="text"]
        {
            padding:6px;
        }
        
        td
        {
            padding:8px;

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
        <div style="width:100%;">
            <div style="width:40%; float:left; display:block; min-width:450px;">
                <h1 style="margin-bottom:2px;">Progress Reports</h1>
                <a href="https://app.powerbi.com/reportEmbed?reportId=bc0cdfe5-bdb3-4fed-a4b7-6b122ec41e18&autoAuth=true&ctid=226827d6-a9d0-470d-8c15-b146b0192d51&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly93YWJpLW5vcnRoLWV1cm9wZS1yZWRpcmVjdC5hbmFseXNpcy53aW5kb3dzLm5ldC8ifQ%3D%3D">View summarized reporting</a>
                <br /><br />
                <table>
                    <tr>
                        <td><a>Add report for: </a>&nbsp;&nbsp 
                        <asp:DropDownList ID="nameLists" runat="server" style="padding:3px;" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Value" Height="31px" Width="178px">
                        
                        </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT surname + ', ' + firstName AS 'Name', CAST(childID AS varchar(9)) + '@' + firstName AS 'Value' FROM child"></asp:SqlDataSource>
                            &nbsp;&nbsp 
                            <asp:Button ID="addReport" runat="server" Text="Add Report" OnClick="addReport_Click" UseSubmitBehavior="False" />
                        </td>
                    </tr>
                     <tr>
                        <td><a>Filter reports by name: </a>&nbsp;&nbsp 
                        <asp:TextBox ID="searchBox" runat="server" Width="168px" AutoPostBack="True"></asp:TextBox>&nbsp;&nbsp; 
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" /></td>
                    </tr>
                    <tr>
                        <td>&nbsp;
                            <%
                                if (Request.QueryString["saved"] != null)
                                {
                                    Response.Write("<b style=\"color:darkgreen;\">Saved!</b>");
                                }
                                %>
                        </td>
                    </tr>
                </table>
                
               
                <%if (GridView1.Rows.Count == 0)
                        Response.Write("<a>No students</a>");
                  %>&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:group2ConnectionString2 %>" SelectCommand="SELECT UPPER(child.firstName + ' ' + child.surname) AS childName, newProgressReport.year, DATEDIFF(month, child.dateOfBirth, newProgressReport.year) / 12 AS Age, newProgressReport.semester, newProgressReport.reportID FROM newProgressReport INNER JOIN child ON newProgressReport.childID = child.childID" DeleteCommand="DELETE FROM [newProgressReport] WHERE [reportID] = @reportID" InsertCommand="INSERT INTO [newProgressReport] ([childID], [semester], [year], [height], [weight], [shareToys], [waitTurn], [solveProblemsSelf], [holdCrayonProperly], [holdScissorsProperly], [cutStraightLine], [generalFineMotor], [completePuzzle], [catchBall], [hop], [swingMyself], [colorInLines], [canPaint], [canSpeakFluently], [goodVocabulary], [toiletTrained], [generalComment]) VALUES (@childID, @semester, @year, @height, @weight, @shareToys, @waitTurn, @solveProblemsSelf, @holdCrayonProperly, @holdScissorsProperly, @cutStraightLine, @generalFineMotor, @completePuzzle, @catchBall, @hop, @swingMyself, @colorInLines, @canPaint, @canSpeakFluently, @goodVocabulary, @toiletTrained, @generalComment)" UpdateCommand="UPDATE [newProgressReport] SET [childID] = @childID, [semester] = @semester, [year] = @year, [height] = @height, [weight] = @weight, [shareToys] = @shareToys, [waitTurn] = @waitTurn, [solveProblemsSelf] = @solveProblemsSelf, [holdCrayonProperly] = @holdCrayonProperly, [holdScissorsProperly] = @holdScissorsProperly, [cutStraightLine] = @cutStraightLine, [generalFineMotor] = @generalFineMotor, [completePuzzle] = @completePuzzle, [catchBall] = @catchBall, [hop] = @hop, [swingMyself] = @swingMyself, [colorInLines] = @colorInLines, [canPaint] = @canPaint, [canSpeakFluently] = @canSpeakFluently, [goodVocabulary] = @goodVocabulary, [toiletTrained] = @toiletTrained, [generalComment] = @generalComment WHERE [reportID] = @reportID">
                <DeleteParameters>
                    <asp:Parameter Name="reportID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="childID" Type="Int32" />
                    <asp:Parameter Name="semester" Type="Int32" />
                    <asp:Parameter Name="year" Type="String" />
                    <asp:Parameter Name="height" Type="Decimal" />
                    <asp:Parameter Name="weight" Type="Decimal" />
                    <asp:Parameter Name="shareToys" Type="Int32" />
                    <asp:Parameter Name="waitTurn" Type="Int32" />
                    <asp:Parameter Name="solveProblemsSelf" Type="Int32" />
                    <asp:Parameter Name="holdCrayonProperly" Type="Int32" />
                    <asp:Parameter Name="holdScissorsProperly" Type="Int32" />
                    <asp:Parameter Name="cutStraightLine" Type="Int32" />
                    <asp:Parameter Name="generalFineMotor" Type="Int32" />
                    <asp:Parameter Name="completePuzzle" Type="Int32" />
                    <asp:Parameter Name="catchBall" Type="Int32" />
                    <asp:Parameter Name="hop" Type="Int32" />
                    <asp:Parameter Name="swingMyself" Type="Int32" />
                    <asp:Parameter Name="colorInLines" Type="Int32" />
                    <asp:Parameter Name="canPaint" Type="Int32" />
                    <asp:Parameter Name="canSpeakFluently" Type="Int32" />
                    <asp:Parameter Name="goodVocabulary" Type="Int32" />
                    <asp:Parameter Name="toiletTrained" Type="Int32" />
                    <asp:Parameter Name="generalComment" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="childID" Type="Int32" />
                    <asp:Parameter Name="semester" Type="Int32" />
                    <asp:Parameter Name="year" Type="String" />
                    <asp:Parameter Name="height" Type="Decimal" />
                    <asp:Parameter Name="weight" Type="Decimal" />
                    <asp:Parameter Name="shareToys" Type="Int32" />
                    <asp:Parameter Name="waitTurn" Type="Int32" />
                    <asp:Parameter Name="solveProblemsSelf" Type="Int32" />
                    <asp:Parameter Name="holdCrayonProperly" Type="Int32" />
                    <asp:Parameter Name="holdScissorsProperly" Type="Int32" />
                    <asp:Parameter Name="cutStraightLine" Type="Int32" />
                    <asp:Parameter Name="generalFineMotor" Type="Int32" />
                    <asp:Parameter Name="completePuzzle" Type="Int32" />
                    <asp:Parameter Name="catchBall" Type="Int32" />
                    <asp:Parameter Name="hop" Type="Int32" />
                    <asp:Parameter Name="swingMyself" Type="Int32" />
                    <asp:Parameter Name="colorInLines" Type="Int32" />
                    <asp:Parameter Name="canPaint" Type="Int32" />
                    <asp:Parameter Name="canSpeakFluently" Type="Int32" />
                    <asp:Parameter Name="goodVocabulary" Type="Int32" />
                    <asp:Parameter Name="toiletTrained" Type="Int32" />
                    <asp:Parameter Name="generalComment" Type="String" />
                    <asp:Parameter Name="reportID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:group2ConnectionString2 %>" DeleteCommand="DELETE FROM [newProgressReport] WHERE [reportID] = @reportID" InsertCommand="INSERT INTO [newProgressReport] ([childID], [semester], [year], [height], [weight], [shareToys], [waitTurn], [solveProblemsSelf], [holdCrayonProperly], [holdScissorsProperly], [cutStraightLine], [generalFineMotor], [completePuzzle], [catchBall], [hop], [swingMyself], [colorInLines], [canPaint], [canSpeakFluently], [goodVocabulary], [toiletTrained], [generalComment]) VALUES (@childID, @semester, @year, @height, @weight, @shareToys, @waitTurn, @solveProblemsSelf, @holdCrayonProperly, @holdScissorsProperly, @cutStraightLine, @generalFineMotor, @completePuzzle, @catchBall, @hop, @swingMyself, @colorInLines, @canPaint, @canSpeakFluently, @goodVocabulary, @toiletTrained, @generalComment)" SelectCommand="SELECT * FROM [newProgressReport]" UpdateCommand="UPDATE [newProgressReport] SET [childID] = @childID, [semester] = @semester, [year] = @year, [height] = @height, [weight] = @weight, [shareToys] = @shareToys, [waitTurn] = @waitTurn, [solveProblemsSelf] = @solveProblemsSelf, [holdCrayonProperly] = @holdCrayonProperly, [holdScissorsProperly] = @holdScissorsProperly, [cutStraightLine] = @cutStraightLine, [generalFineMotor] = @generalFineMotor, [completePuzzle] = @completePuzzle, [catchBall] = @catchBall, [hop] = @hop, [swingMyself] = @swingMyself, [colorInLines] = @colorInLines, [canPaint] = @canPaint, [canSpeakFluently] = @canSpeakFluently, [goodVocabulary] = @goodVocabulary, [toiletTrained] = @toiletTrained, [generalComment] = @generalComment WHERE [reportID] = @reportID" OnInserted="SqlDataSource2_Inserted">
                <DeleteParameters>
                    <asp:Parameter Name="reportID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="childID" Type="Int32" />
                    <asp:Parameter Name="semester" Type="Int32" />
                    <asp:Parameter Name="year" Type="String" />
                    <asp:Parameter Name="height" Type="Decimal" />
                    <asp:Parameter Name="weight" Type="Decimal" />
                    <asp:Parameter Name="shareToys" Type="Int32" />
                    <asp:Parameter Name="waitTurn" Type="Int32" />
                    <asp:Parameter Name="solveProblemsSelf" Type="Int32" />
                    <asp:Parameter Name="holdCrayonProperly" Type="Int32" />
                    <asp:Parameter Name="holdScissorsProperly" Type="Int32" />
                    <asp:Parameter Name="cutStraightLine" Type="Int32" />
                    <asp:Parameter Name="generalFineMotor" Type="Int32" />
                    <asp:Parameter Name="completePuzzle" Type="Int32" />
                    <asp:Parameter Name="catchBall" Type="Int32" />
                    <asp:Parameter Name="hop" Type="Int32" />
                    <asp:Parameter Name="swingMyself" Type="Int32" />
                    <asp:Parameter Name="colorInLines" Type="Int32" />
                    <asp:Parameter Name="canPaint" Type="Int32" />
                    <asp:Parameter Name="canSpeakFluently" Type="Int32" />
                    <asp:Parameter Name="goodVocabulary" Type="Int32" />
                    <asp:Parameter Name="toiletTrained" Type="Int32" />
                    <asp:Parameter Name="generalComment" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="childID" Type="Int32" />
                    <asp:Parameter Name="semester" Type="Int32" />
                    <asp:Parameter Name="year" Type="String" />
                    <asp:Parameter Name="height" Type="Decimal" />
                    <asp:Parameter Name="weight" Type="Decimal" />
                    <asp:Parameter Name="shareToys" Type="Int32" />
                    <asp:Parameter Name="waitTurn" Type="Int32" />
                    <asp:Parameter Name="solveProblemsSelf" Type="Int32" />
                    <asp:Parameter Name="holdCrayonProperly" Type="Int32" />
                    <asp:Parameter Name="holdScissorsProperly" Type="Int32" />
                    <asp:Parameter Name="cutStraightLine" Type="Int32" />
                    <asp:Parameter Name="generalFineMotor" Type="Int32" />
                    <asp:Parameter Name="completePuzzle" Type="Int32" />
                    <asp:Parameter Name="catchBall" Type="Int32" />
                    <asp:Parameter Name="hop" Type="Int32" />
                    <asp:Parameter Name="swingMyself" Type="Int32" />
                    <asp:Parameter Name="colorInLines" Type="Int32" />
                    <asp:Parameter Name="canPaint" Type="Int32" />
                    <asp:Parameter Name="canSpeakFluently" Type="Int32" />
                    <asp:Parameter Name="goodVocabulary" Type="Int32" />
                    <asp:Parameter Name="toiletTrained" Type="Int32" />
                    <asp:Parameter Name="generalComment" Type="String" />
                    <asp:Parameter Name="reportID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Size="Medium" AutoGenerateSelectButton="True"
                onselectedindexchanged="GridView1_SelectedIndexChanged" DataKeyNames="reportID" CssClass="auto-style1" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="childName" HeaderText="Name" ReadOnly="True" SortExpression="childName" >
                    <HeaderStyle Width="250px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" >
                    <HeaderStyle HorizontalAlign="Center" Width="70px" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="semester" HeaderText="Semester" SortExpression="semester" >
                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" ReadOnly="True" >
                    <HeaderStyle HorizontalAlign="Center" Width="60px" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="reportID" HeaderText="reportID" SortExpression="reportID" InsertVisible="False" ReadOnly="True" Visible="False" />
                </Columns>
            </asp:GridView>
                <br />
  
                
                
&nbsp;</div>
        <div style="width:45%; float:right; border-left:1px solid; padding-left:10px;" >
            <h3 style="margin-bottom:0;" runat="server" id="repName">REPORT</h3>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="reportID" DataSourceID="SqlDataSource2" DefaultMode="Edit" Font-Size="Small">
                <EmptyDataRowStyle HorizontalAlign="Right" />
            <EditRowStyle HorizontalAlign="Right" />
                <EditItemTemplate>
                    <asp:TextBox ID="childIDTextBox" runat="server" Visible="false" Text='<%# Bind("childID") %>' />
                    <br />
                    Semester:
                    <asp:TextBox ID="semesterTextBox" runat="server" Text='<%# Bind("semester") %>' />
                    <br />
                    Year:
                    <asp:TextBox ID="yearTextBox" runat="server" Text='<%# Bind("year") %>' />
                    <br />
                    Height:
                    <asp:TextBox ID="heightTextBox" runat="server" Text='<%# Bind("height") %>' />
                    <br />
                    Weight:
                    <asp:TextBox ID="weightTextBox" runat="server" Text='<%# Bind("weight") %>' />
                    <br />
                    Share toys?
                    <asp:TextBox ID="shareToysTextBox" runat="server" Text='<%# Bind("shareToys") %>' />
                    <br />
                    Wait turn?
                    <asp:TextBox ID="waitTurnTextBox" runat="server" Text='<%# Bind("waitTurn") %>' />
                    <br />
                    Solve problems self?
                    <asp:TextBox ID="solveProblemsSelfTextBox" runat="server" Text='<%# Bind("solveProblemsSelf") %>' />
                    <br />
                    Hold crayon properly?
                    <asp:TextBox ID="holdCrayonProperlyTextBox" runat="server" Text='<%# Bind("holdCrayonProperly") %>' />
                    <br />
                    Hold scissors properly?
                    <asp:TextBox ID="holdScissorsProperlyTextBox" runat="server" Text='<%# Bind("holdScissorsProperly") %>' />
                    <br />
                    Cut straight line?
                    <asp:TextBox ID="cutStraightLineTextBox" runat="server" Text='<%# Bind("cutStraightLine") %>' />
                    <br />
                    General fine motor?
                    <asp:TextBox ID="generalFineMotorTextBox" runat="server" Text='<%# Bind("generalFineMotor") %>' />
                    <br />
                    Complete puzzle?
                    <asp:TextBox ID="completePuzzleTextBox" runat="server" Text='<%# Bind("completePuzzle") %>' />
                    <br />
                    Catch ball?
                    <asp:TextBox ID="catchBallTextBox" runat="server" Text='<%# Bind("catchBall") %>' />
                    <br />
                    Hopping?
                    <asp:TextBox ID="hopTextBox" runat="server" Text='<%# Bind("hop") %>' />
                    <br />
                    Swing by self?
                    <asp:TextBox ID="swingMyselfTextBox" runat="server" Text='<%# Bind("swingMyself") %>' />
                    <br />
                    Color in lines?
                    <asp:TextBox ID="colorInLinesTextBox" runat="server" Text='<%# Bind("colorInLines") %>' />
                    <br />
                    Can paint?
                    <asp:TextBox ID="canPaintTextBox" runat="server" Text='<%# Bind("canPaint") %>' />
                    <br />
                    Can speak fluently?
                    <asp:TextBox ID="canSpeakFluentlyTextBox" runat="server" Text='<%# Bind("canSpeakFluently") %>' />
                    <br />
                    Good vocabulary?
                    <asp:TextBox ID="goodVocabularyTextBox" runat="server" Text='<%# Bind("goodVocabulary") %>' />
                    <br />
                    Toilet training?
                    <asp:TextBox ID="toiletTrainedTextBox" runat="server" Text='<%# Bind("toiletTrained") %>' />
                    <br />
                    General comment:
                    <asp:TextBox ID="generalCommentTextBox" runat="server" Text='<%# Bind("generalComment") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle CssClass="rowStyle" />
                <HeaderStyle Font-Bold="True" />
                <InsertItemTemplate>
                    <asp:TextBox ID="childIDTextBox" runat="server" Text='<%# Bind("childID") %>' />
                    <br />
                    Semester:
                    <asp:TextBox ID="semesterTextBox" runat="server" Text='<%# Bind("semester") %>' />
                    <br />
                    Year:
                    <asp:TextBox ID="yearTextBox" runat="server" Text='<%# Bind("year") %>' />
                    <br />
                    Height:
                    <asp:TextBox ID="heightTextBox" runat="server" Text='<%# Bind("height") %>' /><br />Weight:
                    <asp:TextBox ID="weightTextBox" runat="server" Text='<%# Bind("weight") %>' />
                    <br />
                    Share toys?
                    <asp:TextBox ID="shareToysTextBox" runat="server" Text='<%# Bind("shareToys") %>' />
                    <br />
                    Wait turn?
                    <asp:TextBox ID="waitTurnTextBox" runat="server" Text='<%# Bind("waitTurn") %>' />
                    <br />
                    Solve problems self?
                    <asp:TextBox ID="solveProblemsSelfTextBox" runat="server" Text='<%# Bind("solveProblemsSelf") %>' />
                    <br />
                    Hold crayon properly?
                    <asp:TextBox ID="holdCrayonProperlyTextBox" runat="server" Text='<%# Bind("holdCrayonProperly") %>' />
                    <br />
                    Hold scissors properly?
                    <asp:TextBox ID="holdScissorsProperlyTextBox" runat="server" Text='<%# Bind("holdScissorsProperly") %>' />
                    <br />
                    Cut straight line?
                    <asp:TextBox ID="cutStraightLineTextBox" runat="server" Text='<%# Bind("cutStraightLine") %>' />
                    <br />
                    General fine motor?
                    <asp:TextBox ID="generalFineMotorTextBox" runat="server" Text='<%# Bind("generalFineMotor") %>' />
                    <br />
                    Complete puzzle?
                    <asp:TextBox ID="completePuzzleTextBox" runat="server" Text='<%# Bind("completePuzzle") %>' />
                    <br />
                    Catch ball?
                    <asp:TextBox ID="catchBallTextBox" runat="server" Text='<%# Bind("catchBall") %>' />
                    <br />
                    Hopping?
                    <asp:TextBox ID="hopTextBox" runat="server" Text='<%# Bind("hop") %>' />
                    <br />
                    Swing by self?
                    <asp:TextBox ID="swingMyselfTextBox" runat="server" Text='<%# Bind("swingMyself") %>' />
                    <br />
                    Color in lines?
                    <asp:TextBox ID="colorInLinesTextBox" runat="server" Text='<%# Bind("colorInLines") %>' />
                    <br />
                    Can paint?
                    <asp:TextBox ID="canPaintTextBox" runat="server" Text='<%# Bind("canPaint") %>' />
                    <br />
                    Can speak fluently?
                    <asp:TextBox ID="canSpeakFluentlyTextBox" runat="server" Text='<%# Bind("canSpeakFluently") %>' />
                    <br />
                    Good vocabulary?
                    <asp:TextBox ID="goodVocabularyTextBox" runat="server" Text='<%# Bind("goodVocabulary") %>' />
                    <br />
                    Toilet training?
                    <asp:TextBox ID="toiletTrainedTextBox" runat="server" Text='<%# Bind("toiletTrained") %>' />
                    <br />
                    General comment:
                    <asp:TextBox ID="generalCommentTextBox" runat="server" Text='<%# Bind("generalComment") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="childIDTextBox" runat="server" Text='<%# Bind("childID") %>' />
                    <br />
                    Semester:
                    <asp:Label ID="semesterLabel" runat="server" Text='<%# Bind("semester") %>' />
                    <br />
                    Year:
                    <asp:Label ID="yearLabel" runat="server" Text='<%# Bind("year") %>' />
                    <br />
                    Height:
                    <asp:Label ID="heightLabel" runat="server" Text='<%# Bind("height") %>' />
                    <br />
                    Weight:
                    <asp:Label ID="weightLabel" runat="server" Text='<%# Bind("weight") %>' />
                    <br />
                    Share toys?
                    <asp:Label ID="shareToysLabel" runat="server" Text='<%# Bind("shareToys") %>' />
                    <br />
                    Wait turn?
                    <asp:Label ID="waitTurnLabel" runat="server" Text='<%# Bind("waitTurn") %>' />
                    <br />
                    Solve problems self?
                    <asp:Label ID="solveProblemsSelfLabel" runat="server" Text='<%# Bind("solveProblemsSelf") %>' />
                    <br />
                    Hold crayon properly?
                    <asp:Label ID="holdCrayonProperlyLabel" runat="server" Text='<%# Bind("holdCrayonProperly") %>' />
                    <br />
                    Hold scissors properly?
                    <asp:Label ID="holdScissorsProperlyLabel" runat="server" Text='<%# Bind("holdScissorsProperly") %>' />
                    <br />
                    Cut straight line?
                    <asp:Label ID="cutStraightLineLabel" runat="server" Text='<%# Bind("cutStraightLine") %>' />
                    <br />
                    General fine motor?
                    <asp:Label ID="generalFineMotorLabel" runat="server" Text='<%# Bind("generalFineMotor") %>' />
                    <br />
                    Complete puzzle?
                    <asp:Label ID="completePuzzleLabel" runat="server" Text='<%# Bind("completePuzzle") %>' />
                    <br />
                    Catch ball?
                    <asp:Label ID="catchBallLabel" runat="server" Text='<%# Bind("catchBall") %>' />
                    <br />
                    Hopping?
                    <asp:Label ID="hopLabel" runat="server" Text='<%# Bind("hop") %>' />
                    <br />
                    Swing by self?
                    <asp:Label ID="swingMyselfLabel" runat="server" Text='<%# Bind("swingMyself") %>' />
                    <br />
                    Color in lines?
                    <asp:Label ID="colorInLinesLabel" runat="server" Text='<%# Bind("colorInLines") %>' />
                    <br />
                    Can paint?
                    <asp:Label ID="canPaintLabel" runat="server" Text='<%# Bind("canPaint") %>' />
                    <br />
                    Can speak fluently?
                    <asp:Label ID="canSpeakFluentlyLabel" runat="server" Text='<%# Bind("canSpeakFluently") %>' />
                    <br />
                    Good vocabulary?
                    <asp:Label ID="goodVocabularyLabel" runat="server" Text='<%# Bind("goodVocabulary") %>' />
                    <br />
                    Toilet training?
                    <asp:Label ID="toiletTrainedLabel" runat="server" Text='<%# Bind("toiletTrained") %>' />
                    <br />
                    General comment:
                    <asp:Label ID="generalCommentLabel" runat="server" Text='<%# Bind("generalComment") %>' />
                    <br />

                </ItemTemplate>
            </asp:FormView>
            
        </div>
        </div>
    </form>
    <%
        if (Request.QueryString["addID"] != null)
            Response.Write("<script>window.onload=function(){document.getElementById('FormView1_childIDTextBox').value = "+Request.QueryString["addID"]+";document.getElementById('FormView1_childIDTextBox').style.display='none';};</script>");
        %>
   
</body>

</html>
