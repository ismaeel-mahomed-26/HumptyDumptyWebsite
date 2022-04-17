<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="staff.aspx.cs" Inherits="M4.staff" %>

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

        td
        {
            padding:6px;
        }

        input[type="text"]
        {
            margin:8px;
            border:unset;
            border-bottom:1px solid;
        }

        input[type="text"]
        {
            outline:none;
            
        }

        #GridView2 input
        {
            max-width:100px;
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


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:60%; float:left; display:block; min-width:600px;">
            <h2>Manage Staff</h2>
                    <div style="width:700px; margin-right:auto;">

        <a>Search name:</a><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;&nbsp;<asp:Button ID="searchBtn" runat="server" Text="Search" Width="94px" OnClick="searchBtn_Click" />
    <asp:GridView OnPageIndexChanging="GridView1_PageIndexChanging" ID="GridView1" runat="server" style="width:100%;" AutoGenerateColumns="False" DataKeyNames="staffIDNum" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="4" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateEditButton="True" AutoGenerateSelectButton="True" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing">
        <Columns>
            <asp:BoundField DataField="staffIDNum" HeaderText="ID Num" ReadOnly="True" SortExpression="staffIDNum" />
            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
            <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
        </Columns>
        <SelectedRowStyle BackColor="#EFEFEF" Font-Bold="True" ForeColor="#000000" />
        </asp:GridView>
                         <br />
            <asp:Button ID="viewAllBtn" runat="server" Enabled="False" OnClick="viewAllBtn_Click" style="margin-left: 9px" Text="Clear Search" Width="180px" />&nbsp;&nbsp;<asp:Button ID="deleteBtn" runat="server" Enabled="true" OnClick="deleteBtn_Click" style="margin-left: 9px" Text="Delete selected" Width="187px" /><br /><br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [staffIDNum], [name], [address] FROM [staffMember]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [staffMember] WHERE [staffIDNum] = @original_staffIDNum" InsertCommand="INSERT INTO [staffMember] ([staffIDNum], [name], [address]) VALUES (@staffIDNum, @name, @address)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [staffMember] SET [name] = @name, [address] = @address WHERE [staffIDNum] = @original_staffIDNum AND [name] = @original_name AND [address] = @original_address">
            <DeleteParameters>
                <asp:Parameter Name="original_staffIDNum" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="staffIDNum" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="address" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="original_staffIDNum" Type="String" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_address" Type="String" />
            </UpdateParameters>
            </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [staffIDNum], [accessLevel], [accType], [accNumber], [branchCode], [swiftCode] FROM [staffMember] WHERE ([staffIDNum] = @staffIDNum)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [staffMember] WHERE [staffIDNum] = @original_staffIDNum AND [accessLevel] = @original_accessLevel AND (([accType] = @original_accType) OR ([accType] IS NULL AND @original_accType IS NULL)) AND (([accNumber] = @original_accNumber) OR ([accNumber] IS NULL AND @original_accNumber IS NULL)) AND (([branchCode] = @original_branchCode) OR ([branchCode] IS NULL AND @original_branchCode IS NULL)) AND (([swiftCode] = @original_swiftCode) OR ([swiftCode] IS NULL AND @original_swiftCode IS NULL))" InsertCommand="INSERT INTO [staffMember] ([staffIDNum], [accessLevel], [accType], [accNumber], [branchCode], [swiftCode]) VALUES (@staffIDNum, @accessLevel, @accType, @accNumber, @branchCode, @swiftCode)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [staffMember] SET [accessLevel] = @accessLevel, [accType] = @accType, [accNumber] = @accNumber, [branchCode] = @branchCode, [swiftCode] = @swiftCode WHERE [staffIDNum] = @original_staffIDNum AND [accessLevel] = @original_accessLevel AND (([accType] = @original_accType) OR ([accType] IS NULL AND @original_accType IS NULL)) AND (([accNumber] = @original_accNumber) OR ([accNumber] IS NULL AND @original_accNumber IS NULL)) AND (([branchCode] = @original_branchCode) OR ([branchCode] IS NULL AND @original_branchCode IS NULL)) AND (([swiftCode] = @original_swiftCode) OR ([swiftCode] IS NULL AND @original_swiftCode IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_staffIDNum" Type="String" />
                <asp:Parameter Name="original_accessLevel" Type="Int32" />
                <asp:Parameter Name="original_accType" Type="String" />
                <asp:Parameter Name="original_accNumber" Type="String" />
                <asp:Parameter Name="original_branchCode" Type="String" />
                <asp:Parameter Name="original_swiftCode" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="staffIDNum" Type="String" />
                <asp:Parameter Name="accessLevel" Type="Int32" />
                <asp:Parameter Name="accType" Type="String" />
                <asp:Parameter Name="accNumber" Type="String" />
                <asp:Parameter Name="branchCode" Type="String" />
                <asp:Parameter Name="swiftCode" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="staffIDNum" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="accessLevel" Type="Int32" />
                <asp:Parameter Name="accType" Type="String" />
                <asp:Parameter Name="accNumber" Type="String" />
                <asp:Parameter Name="branchCode" Type="String" />
                <asp:Parameter Name="swiftCode" Type="String" />
                <asp:Parameter Name="original_staffIDNum" Type="String" />
                <asp:Parameter Name="original_accessLevel" Type="Int32" />
                <asp:Parameter Name="original_accType" Type="String" />
                <asp:Parameter Name="original_accNumber" Type="String" />
                <asp:Parameter Name="original_branchCode" Type="String" />
                <asp:Parameter Name="original_swiftCode" Type="String" />
            </UpdateParameters>
            </asp:SqlDataSource>
                        <br /><br />

             <asp:Label ID="Label1" runat="server" Text="Select Staff to view account information" Font-Bold="True"></asp:Label>
             <asp:GridView ID="GridView2" runat="server" style="width:100%;" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                 <Columns>
                     <asp:CommandField ShowEditButton="True" />
                     <asp:BoundField DataField="accessLevel" HeaderText="Access Level" SortExpression="accessLevel" />
                     <asp:BoundField DataField="accType" HeaderText="Acc. Type" SortExpression="accType" />
                     <asp:BoundField DataField="accNumber" HeaderText="Acc. Number" SortExpression="accNumber" />
                     <asp:BoundField DataField="branchCode" HeaderText="Branch Code" SortExpression="branchCode" />
                     <asp:BoundField DataField="swiftCode" HeaderText="Swift Code" SortExpression="swiftCode" />
                 </Columns>
             </asp:GridView>
            </div>
            </div>

        <div  style="width:38%; float:left; display:block; min-width:520px;">
                        <div style="width:500px; margin:auto;">
                            <h3>&nbsp;</h3>
            <asp:label runat="server" text="Register new staff member" Font-Size="X-Large"></asp:label>
            <br />
            <br/>
            <asp:label runat="server" text="Name & Surname:"></asp:label><asp:textbox ID="txtName"  runat="server" style="margin-left: 23px; margin-top: 0px"></asp:textbox>
            <br/>
            <br/>
            <asp:label runat="server" text="ID Number :"></asp:label><asp:textbox ID="txtStaffID" runat="server" style="margin-left: 84px; margin-top: 0px"></asp:textbox>
            <br/>
            <br/>
            <asp:label runat="server" text="Address :"></asp:label><asp:textbox ID="txtAddress" runat="server" style="margin-left: 79px; margin-top: 0px"></asp:textbox>
            <br/>
            <br/>
            <asp:label runat="server" text="Access Level :"></asp:label><asp:textbox ID="txtAccess" runat="server" style="margin-left: 48px; margin-top: 0px"></asp:textbox>
            <br/>
            <br/>
            <asp:label runat="server" text="Bank Account Type :"></asp:label><asp:textbox ID="txtAccType" runat="server" style="margin-left: 6px; margin-top: 0px"></asp:textbox>
            <br/>
            <br/>
            <asp:label runat="server" text="Bank Account No :"></asp:label><asp:textbox ID="txtAccNo" runat="server" style="margin-left: 15px; margin-top: 0px"></asp:textbox>
            <br/>
            <br/>
            <asp:label runat="server" text="Branch code :"></asp:label><asp:textbox ID="txtBrCode" runat="server" style="margin-left: 47px; margin-top: 0px"></asp:textbox>
            <br/>
            <br/>
            <asp:label runat="server" text="Swift code :"></asp:label><asp:textbox ID="txtSwCode" runat="server" style="margin-left: 57px; margin-top: 0px"></asp:textbox>
            <br/>
            <br/>
            <asp:label runat="server" text="Username :"></asp:label><asp:textbox ID="txtUserN" runat="server" style="margin-left: 60px; margin-top: 0px"></asp:textbox>
            <br/>
            <br/>
            <asp:label runat="server" text="Password:"></asp:label><asp:textbox ID="txtPass" runat="server" style="margin-left: 65px; margin-top: 0px"></asp:textbox>
            <br/>
            <br/>
            <asp:Button ID="Insertbtn" runat="server" style="margin-left: 130px; margin-top: 16px; margin-bottom: 1px;" Text="Submit" Height="28px" Width="189px" OnClick="Insertbtn_Click" />

        

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [staffMember] WHERE ([name] LIKE '%' + @name + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="name" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        

        
                            </div></div>

    
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [staffMember] WHERE [staffIDNum] = @original_staffIDNum " InsertCommand="INSERT INTO [staffMember] ([staffIDNum], [accessLevel], [name], [address], [branchCode], [accType], [accNumber], [swiftCode], [loginUsername], [loginPassword]) VALUES (@staffIDNum, @accessLevel, @name, @address, @branchCode, @accType, @accNumber, @swiftCode, @loginUsername, @loginPassword)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [staffIDNum], [accessLevel], [name], [address], [branchCode], [accType], [accNumber], [swiftCode], [loginUsername], [loginPassword] FROM [staffMember]" UpdateCommand="UPDATE [staffMember] SET [accessLevel] = @accessLevel, [name] = @name, [address] = @address, [branchCode] = @branchCode, [accType] = @accType, [accNumber] = @accNumber, [swiftCode] = @swiftCode, [loginUsername] = @loginUsername, [loginPassword] = @loginPassword WHERE [staffIDNum] = @original_staffIDNum AND [accessLevel] = @original_accessLevel AND [name] = @original_name AND [address] = @original_address AND (([branchCode] = @original_branchCode) OR ([branchCode] IS NULL AND @original_branchCode IS NULL)) AND (([accType] = @original_accType) OR ([accType] IS NULL AND @original_accType IS NULL)) AND (([accNumber] = @original_accNumber) OR ([accNumber] IS NULL AND @original_accNumber IS NULL)) AND (([swiftCode] = @original_swiftCode) OR ([swiftCode] IS NULL AND @original_swiftCode IS NULL)) AND [loginUsername] = @original_loginUsername AND [loginPassword] = @original_loginPassword">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="original_staffIDNum" PropertyName="SelectedValue" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtStaffID" Name="staffIDNum" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtAccess" Name="accessLevel" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="txtName" Name="name" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtAddress" Name="address" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtBrCode" Name="branchCode" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtAccType" Name="accType" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtAccNo" Name="accNumber" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtSwCode" Name="swiftCode" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtUserN" Name="loginUsername" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPass" Name="loginPassword" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="accessLevel" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="branchCode" Type="String" />
            <asp:Parameter Name="accType" Type="String" />
            <asp:Parameter Name="accNumber" Type="String" />
            <asp:Parameter Name="swiftCode" Type="String" />
            <asp:Parameter Name="loginUsername" Type="String" />
            <asp:Parameter Name="loginPassword" Type="String" />
            <asp:Parameter Name="original_staffIDNum" Type="String" />
            <asp:Parameter Name="original_accessLevel" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_address" Type="String" />
            <asp:Parameter Name="original_branchCode" Type="String" />
            <asp:Parameter Name="original_accType" Type="String" />
            <asp:Parameter Name="original_accNumber" Type="String" />
            <asp:Parameter Name="original_swiftCode" Type="String" />
            <asp:Parameter Name="original_loginUsername" Type="String" />
            <asp:Parameter Name="original_loginPassword" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM staffMember WHERE (staffIDNum = @ID)" SelectCommand="SELECT * FROM [staffMember]">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="ID" PropertyName="SelectedRowStyle" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT name FROM staffMember WHERE (staffIDNum = @ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="ID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
  </form>
    </body>
</html>
