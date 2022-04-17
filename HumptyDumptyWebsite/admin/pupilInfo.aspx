<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pupilInfo.aspx.cs" Inherits="M4.pupilInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="formstyle.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="mainView">
            <a style="font-size:2em; font-weight:bold;" href="pupilIndex.aspx"><< Pupils</a><br />
            
            <div id="centerPanel">
                <table style="width:100%;height:100%;">
                    <tr>
                        <td style="width:14%"><input style="width:40px;height:100%;" class="naviBtn" runat="server" id="backBtn" type="button" value="<<" onclick="navigate('back');" /></td>
                        <td style="width:72%;"><input type="hidden" runat="server" id="childID"/>
                <table style="width:100%">
                    <tr><td colspan="2" >
                        <table style="width:100%;">
                            <tr>
                                <td style="width:33%; text-align:left;"></td>
                                <td style="width:34%; text-align:center;" class="nameDisp"><a runat="server" id="firstNameDisp"> </a> <a runat="server" id="surnameDisp"> </a></td>
                                <td style="width:33%; text-align:right""></td>
                            </tr>
                        </table>
                    </td></tr>
                    <tr><td style="vertical-align:top; text-align:center; padding:15px;" >
                            <div style="width:100%; height:200px; text-align:center;">
                                <img runat="server" id="pupilImage" style="max-width:200px; max-height:200px;"/>
                            </div>
                            <br /><br />
                            <input type="submit" value="Update changes" id="updateBtn" runat="server" style="width:100%; background-color:darkgreen;"/><br /><br />
                            <input type="button" value="Delete" id="deleteBtn" runat="server" style="background-color: red; width: 100%;" onclick="confirmDelete(this);" />
                        </td>
                        <td>
                            <table style="margin:auto;">
                                <tr>
                                    <td>Surname:</td><td><input type="text" id="surname" runat="server" required="" /></td>
                                </tr>
                                <tr>
                                    <td>First name(s):</td><td><input type="text" id="firstnames" runat="server" required=""/></td>
                                </tr>
                                <tr>
                                    <td>Birthdate:</td><td><input type="text" id="birth" runat="server" required="" /></td>
                                </tr>
                                <tr>
                                    <td>Gender:</td><td><select runat="server" id="gender" required=""><option value="F">Female</option><option value="M">Male</option></select></td>
                                </tr>
                                <tr>
                                    <td>Allergies:</td><td><textarea id="allergies" runat="server"></textarea></td>
                                </tr>
                                <tr>
                                    <td>Medication:</td><td><textarea id="chronicMed" runat="server"></textarea></td>
                                </tr>
                                <tr>
                                    <td><a>Days per week:</a></td>
                                    <td><select id="daysPerWeek" runat="server">
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select></td></tr>
                                <tr>
                                    <td><a>Finishing time:</a></td>
                                    <td><select id="hoursPerWeek" runat="server">
                                        <option value="12">13:00</option>
                                        <option value="15">14:00</option>
                                        <option value="16">15:00</option>
                                        <option value="17">17:00</option>
                                    </select></td>
                                </tr>     
                                <tr><td>Update pic:</td><td><asp:FileUpload id="FileUploadControl" runat="server" accept=".png,.jpg,.jpeg"/></td></tr>
                            </table>
                            </td>
                    </tr>
                   
                    <tr>
                        <td colspan="2" class="extraInfo">
                                <table style="margin:auto; min-width:500px;">
                                    <tr><td colspan="2" style="text-align:center;"><b>Emergency Contact Info</b></td></tr>
                                    <tr><td style="width:30%;">Name:</td><td><input type="text" id="emerName" runat="server"/></td></tr>
                                    <tr><td>Cell number:</td><td><input type="text" id="emerCell" runat="server"/></td></tr>
                                    <tr><td>Relation to child:</td><td><input type="text" id="emerRelation" runat="server"/></td></tr>
                                </table>
                               
                            </td>
                    </tr>       
                     <tr>
                        <td colspan="2"><br /><div id="parentsDiv" runat="server"></div></td>
                    </tr>
                </table></td>
                        <td style="width:10%; text-align:right;"><input style="width:40px;height:100%;" runat="server" id="forwardBtn" class="naviBtn" type="button" value=">>" onclick="navigate('next');" /></td>
                    </tr>
                </table>
                  
            </div>
        </div>
    <footer>
        <script>
            window.onload = function () { parent.document.getElementById('loginoutBtn').innerHTML = "Logout" };
            function navigate(action) {
                window.location = "?action=" + action;
            }

            function confirmDelete(id) {
                var toDelete = confirm("Are you sure you want to delete this profile?")
                if (toDelete)
                    window.location = "?action=delete&childID=" + id.getAttribute("data-value");
            }

            function loadParents(id,newParent,childID)
            {
                var myWidth = 700;
                var myHeight = 670;
                var left = (window.innerWidth - myWidth) / 2;
                var top = (window.innerWidth - myHeight) / 4;
                window.open("parent.aspx?parentID=" + id + "&new=" + newParent+"&cID="+childID, '_blank', 'location=yes,height=610,width=690, top=' + top + ', left=' + left);
            }

            function openTester() {
                var myWidth = 670;
                var myHeight = 570;
                var left = (window.innerWidth - myWidth) / 2;
                var top = (window.innerWidth - myHeight) / 4;
                window.open("tester.aspx", '_blank', 'location=yes,height=570,width=670, top=' + top + ', left=' + left);

            }
        </script>
    </footer>
       
    </form>
    </body>
</html>
