<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewReport.aspx.cs" Inherits="M4.parentsReporting.viewReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
        }

        .detailedLink
        {
            color:blue;
            text-decoration:underline;
        }

        .detailedLink:hover
        {
            cursor:pointer;
        }

        .row
        {
            margin-left:0 !important;
            margin-right:0 !important;
        }

        #listTable
        {
            width:100%;
            border-collapse:collapse;
        }

        #listTable td
        {
            border:1px solid;
            padding:4px;
        }

        th
        {
            color:white;
            background-color:black;
            padding:4px;
            border:1px solid black;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-12 col-sm-4">
                <div id="listReports" runat="server"></div>
            </div>
            <div class="col-12 col-sm-8">
                <iframe src="detailedView.aspx" style="width:100%; border:0; height:770px;" id="reportFrame"></iframe>
            </div>

        </div>
        
    </form>
    <footer>
        <script>
            function openReport(id) {
                document.getElementById('reportFrame').src = "./detailedView.aspx?id="+id;
            }
        </script>
    </footer>
</body>

</html>
