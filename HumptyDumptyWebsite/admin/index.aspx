<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="M4.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css" />
    <link rel="icon" href="../favicon.png" sizes="192x192" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <title>Humpty Dumpty System</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-xl-2 col-3" id="navBar">

                <div class="row" >
                    <div class="col-12">

                        <div class="row" id="header-col">
                            <div class="col-5 darker" style="padding:20px 0 0 0; text-align:center;">
                                <img src="logo.png" height="90"/>
                            </div>
                            <div class="col-7 darker" id="headingBlock">
                                <a id="heading">Humpty Dumpty Playschool</a><br /><a id="subheading">Admin System</a><br /><br /><a href="../" style="color:white;"><< Home Page</a>
                            </div>
                            <div class="col-12 darker"style="padding:0 0; text-align:center;"></div>
                        </div>
                    </div>

                    

                    <div class="col-12">
                        <div onclick="loadPage('pupilIndex');" class="nav-btn">Pupil Info</div>
                    </div>
                    <div class="col-12">
                        <div onclick="loadPage('finance');" class="nav-btn">Finances</div>
                    </div>
                    <div class="col-12">
                        <div onclick="loadPage('staff');" class="nav-btn">Staff</div>
                    </div>
                    <div class="col-12">
                        <div onclick="loadPage('notesAndContacts');" class="nav-btn">Notes and Contacts</div>
                    </div>
                    <div class="col-12">
                        <div onclick="loadPage('messaging');" class="nav-btn">Messaging</div>
                    </div>
                    <div class="col-12">
                        <div onclick="loadPage('reports');" class="nav-btn">Progress Reports</div>
                    </div>
                    <div class="col-12">
                        <div onclick="loadPage('covidReports');" class="nav-btn">COVID Reports</div>
                    </div>
                    

                </div>

                <div id="loginoutBtn" onclick="loadPage('login');">
                    Login
                </div>

            </div>

            <div class="col-9 col-xl-10">
                <iframe src="login.aspx" id="embedded"></iframe>
            </div>
        </div>
    </form>
    <footer>
        <script>
                window.onload = function() {
                    resize();
            };

            window.onresize = function () {
                resize();
            };

            function loadPage(page) {
                document.getElementById('embedded').src = page + ".aspx";
            }

            function resize() {
                var height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
                document.getElementById('navBar').style.height = height + "px";
                document.getElementById('embedded').style.height = height -7 + "px";
            }
        </script>
    </footer>
</body>
</html>
