<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="selectChild.aspx.cs" Inherits="M4.COVID.selectChild" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="covid.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:30%; min-width:400px; margin:auto; margin-top:100px;">
            <%
                string message = "";
                try
                {
                    //Below taken from https://stackoverflow.com/questions/10745542/object-to-string-array
                    string[] children = ((IEnumerable)Session["childIDs"]).Cast<object>()
                                     .Select(x => x.ToString())
                                     .ToArray();
                    string[] childrenNames = ((IEnumerable)Session["childNames"]).Cast<object>()
                                     .Select(x => x.ToString())
                                     .ToArray();

                    if (children.Length == 0)
                    {
                        message = "<tr><td>No children associated with that ID</td></tr>";
                        proceedBtn.Visible = false;
                    }
                    else
                    {
                        int i = 0;
                        foreach (String childID in children)
                        {
                            message += "<tr><td style=\"text-align:left;\"><input type=\"radio\" style=\"width:10px; transform:scale(1.5);\" name=\"selectedChild\" runat=\"server\" required=\"\" value=\"" + childID + "\" /> " + childrenNames[i] + "<td><tr>";
                            i++;
                        }
                    }
                }
                catch (Exception e)
                {
                    Response.Redirect("../login.aspx?redir=COVID/selectChild");
                }
                %>
                <table>
                    <tr>
                        <td><b>Select a child to log a COVID Screening:</b></td>
                    </tr>
                    <%
                        Response.Write(message);
                        %>
                    <tr>
                        <td>
                            <input type="submit" id="proceedBtn" runat="server" value="Proceed" />
                        </td>
                    </tr>
                </table>
        </div>
    </form>
</body>
</html>
