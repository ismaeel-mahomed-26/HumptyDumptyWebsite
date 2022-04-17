<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pupilIndex.aspx.cs" Inherits="M4.pupilIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="pupilindex.css" />
    <style>
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
            <a style="font-size:3em; font-weight:bold;">Pupils</a><br />
            <div runat="server" id="main">

            </div>
        </div>
    </form>
    <script>window.onload = function () { parent.document.getElementById('loginoutBtn').innerHTML = "Logout" };</script>
</body>
</html>
