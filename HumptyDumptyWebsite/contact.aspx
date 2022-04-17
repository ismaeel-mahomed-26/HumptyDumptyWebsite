<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="M4.contact" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Humpty Dumpty Playschool</title>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="icon" href="favicon.png" sizes="192x192" />
    <meta name="viewport" content="width=device-width, user-scalable=no">
</head>
<body>
        <div class="row" id="header" >
<%if (Session["parentID"]!=null){%><!-- #include file="nav.aspx" --><%}
else
{%><!-- #include file="outnav.aspx" --><%}%>
    </div>
    <div class="row">
        <div class="col-12" style="height:50px; position:relative;"></div>
    </div>

    <div class="row">
        <div class="col-2"></div>
        <div class="col-8" style="text-align:center;">
            <img src="playground.jpg" style="width:80%;"/><br /><br />
        </div>
        <div class="col-2"></div>
    </div>

    <div class="row">
        <div class="col-2"></div>
        <div class="col-8" style="text-align:center;">
            <p><b>Email</b><br /> <a href="mailto:info@humptydumptypmb.co.za">info@humptydumptypmb.co.za</a></p><br />
            <p><b>Phone</b><br /> <a>084 678 6788</a></p><br />
            <p><b>Address</b><br /> <a>23 Greathead Road, Pietermaritzburg</a></p><br />
            <p>If you would like to view the school, please email us or call. We would love to show you around!</p><br /><br />
        </div>
        <div class="col-2"></div>
    </div>

    <div class="row">
        <div class="col-2"></div>
        <div class="col-8" style="text-align:center;">
            <img src="kids.jpg" style="width:280px;"/>
        </div>
        <div class="col-2"></div>
    </div>

    <div class="row">
        <div class="col-12" style="height:100px; position:relative;"></div>
    </div>

</body>
</html>