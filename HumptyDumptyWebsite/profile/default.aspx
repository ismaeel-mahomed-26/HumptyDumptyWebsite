<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="M4.profile._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <style>
        body {
            margin: 15px;
            font-family: 'Roboto', sans-serif;
        }

        td
        {
            padding:8px;
        }

        input[type="text"]
        {
            margin:8px;
            border:unset;
            border-bottom:1px solid;
            width:300px;
        }

        input[type="text"]
        {
            outline:none;
            
        }

        #FormView1_parentIDNumLabel1
        {
            margin:8px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Profile Page</h2>
            <h4>You can edit your details below:</h4>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [parent]" DeleteCommand="DELETE FROM [parent] WHERE [parentIDNum] = @parentIDNum" InsertCommand="INSERT INTO [parent] ([parentIDNum], [surname], [firstNames], [email], [occupation], [employer], [workTel], [cellNo], [employerAddress], [password]) VALUES (@parentIDNum, @surname, @firstNames, @email, @occupation, @employer, @workTel, @cellNo, @employerAddress, @password)" UpdateCommand="UPDATE [parent] SET [surname] = @surname, [firstNames] = @firstNames, [email] = @email, [occupation] = @occupation, [employer] = @employer, [workTel] = @workTel, [cellNo] = @cellNo, [employerAddress] = @employerAddress, [password] = @password WHERE [parentIDNum] = @parentIDNum">
                <DeleteParameters>
                    <asp:Parameter Name="parentIDNum" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="parentIDNum" Type="String" />
                    <asp:Parameter Name="surname" Type="String" />
                    <asp:Parameter Name="firstNames" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="occupation" Type="String" />
                    <asp:Parameter Name="employer" Type="String" />
                    <asp:Parameter Name="workTel" Type="String" />
                    <asp:Parameter Name="cellNo" Type="String" />
                    <asp:Parameter Name="employerAddress" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="surname" Type="String" />
                    <asp:Parameter Name="firstNames" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="occupation" Type="String" />
                    <asp:Parameter Name="employer" Type="String" />
                    <asp:Parameter Name="workTel" Type="String" />
                    <asp:Parameter Name="cellNo" Type="String" />
                    <asp:Parameter Name="employerAddress" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="parentIDNum" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="parentIDNum" DataSourceID="SqlDataSource1" Height="241px" Width="580px" DefaultMode="Edit">
            <EditItemTemplate>
                Parent ID:
                <asp:Label ID="parentIDNumLabel1" runat="server" Text='<%# Eval("parentIDNum") %>' />
                <br />
                Surname:
                <asp:TextBox ID="surnameTextBox" runat="server" Text='<%# Bind("surname") %>' />
                <br />
                FIrst Names:
                <asp:TextBox ID="firstNamesTextBox" runat="server" Text='<%# Bind("firstNames") %>' />
                <br />
                Email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                Occupation:
                <asp:TextBox ID="occupationTextBox" runat="server" Text='<%# Bind("occupation") %>' />
                <br />
                Employer:
                <asp:TextBox ID="employerTextBox" runat="server" Text='<%# Bind("employer") %>' />
                <br />
                Work Contact:
                <asp:TextBox ID="workTelTextBox" runat="server" Text='<%# Bind("workTel") %>' />
                <br />
                Cell Number:
                <asp:TextBox ID="cellNoTextBox" runat="server" Text='<%# Bind("cellNo") %>' />
                <br />
                Employer Address:
                <asp:TextBox ID="employerAddressTextBox" runat="server" Text='<%# Bind("employerAddress") %>' />
                <br />
                Password:
                <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
               
            </EditItemTemplate>
            <InsertItemTemplate>
                Parent ID:
                <asp:TextBox ID="parentIDNumTextBox" runat="server" Text='<%# Bind("parentIDNum") %>' />
                <br />
                Surname:
                <asp:TextBox ID="surnameTextBox" runat="server" Text='<%# Bind("surname") %>' />
                <br />
                FIrst Names:
                <asp:TextBox ID="firstNamesTextBox" runat="server" Text='<%# Bind("firstNames") %>' />
                <br />
                Email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                Occupation:
                <asp:TextBox ID="occupationTextBox" runat="server" Text='<%# Bind("occupation") %>' />
                <br />
                Employer:
                <asp:TextBox ID="employerTextBox" runat="server" Text='<%# Bind("employer") %>' />
                <br />
                Work Contact:
                <asp:TextBox ID="workTelTextBox" runat="server" Text='<%# Bind("workTel") %>' />
                <br />
                Cell Number:
                <asp:TextBox ID="cellNoTextBox" runat="server" Text='<%# Bind("cellNo") %>' />
                <br />
                Employer Address:
                <asp:TextBox ID="employerAddressTextBox" runat="server" Text='<%# Bind("employerAddress") %>' />
                <br />
                Password:
                <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                Parent ID:
                <asp:Label ID="parentIDNumLabel" runat="server" Text='<%# Eval("parentIDNum") %>' />
                <br />
                Surname:
                <asp:Label ID="surnameLabel" runat="server" Text='<%# Bind("surname") %>' />
                <br />
                FIrst Names:
                <asp:Label ID="firstNamesLabel" runat="server" Text='<%# Bind("firstNames") %>' />
                <br />
                Email:
                <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                <br />
                Occupation:
                <asp:Label ID="occupationLabel" runat="server" Text='<%# Bind("occupation") %>' />
                <br />
                Employer:
                <asp:Label ID="employerLabel" runat="server" Text='<%# Bind("employer") %>' />
                <br />
                Work Contact:
                <asp:Label ID="workTelLabel" runat="server" Text='<%# Bind("workTel") %>' />
                <br />
                Cell Number:
                <asp:Label ID="cellNoLabel" runat="server" Text='<%# Bind("cellNo") %>' />
                <br />
                Employer Address:
                <asp:Label ID="employerAddressLabel" runat="server" Text='<%# Bind("employerAddress") %>' />
                <br />
                Password:
                <asp:Label ID="passwordLabel" runat="server" Text='<%# Bind("password") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>
