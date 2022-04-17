<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="M4._default" %>

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
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <style>
        .dropdown-menu
        {
            padding:0 !important;
        }
    </style>
</head>
<body>
    <div class="row" id="header" >
<%if (Session["parentID"]!=null){%><!-- #include file="nav.aspx" --><%}
else
{%><!-- #include file="outnav.aspx" --><%}%>
    </div>
    <div style="padding:10px;">
    <div class="row">
        <div class="col-12" style="height:50px; position:relative;"></div>
    </div>
    <div class="row">
        <div class="col-sm-2 col-12"></div>
        <div class="col-sm-4 col-lg-3 col-12" style="text-align:center;">
            <img src="logo.jpg" style="width:95%; max-width:220px;"/><br /><br />
        </div>
        <div class="col-sm-4 col-lg-5 col-12">
            <p>Humpty Dumpty Playschool is a daycare based in Bisley, Pietermaritzburg. We take on kids aged 3 months to 5 years, and give them a solid foundation for primary school, and for life.</p>
            <p>Our children should feel safe, happy and loved when they are at playschool. We have created a home-away-from-home environment for them, with a daily structured routine for them which helps make them feel safe and secure.</p>
            <p>When our children leave Humpty Dumpty Playschool, we would like them to be happy, confident, well rounded little individuals with a keen sense for learning.</p>
        </div>
        <div class="col-sm-2 col-12"></div>
    </div>
    <div class="row">
        <div class="col-12" style="height:50px; position:relative;"></div>
    </div>
    <div class="row">
         <div class="col-sm-2 col-12"></div>
         <div class="col-12 col-sm-8"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2061.7501795504563!2d30.391017909373343!3d-29.64910052204714!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1ef6bd9e6bd672e5%3A0xf40addafe10cf5f!2sHumpty%20Dumpty%20Playschool!5e0!3m2!1sen!2sza!4v1603141021369!5m2!1sen!2sza" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe></div>
         <div class="col-sm-2 col-12"></div>
    </div>
    <div class="row">
        <div class="col-12"><br /><br /></div>
    </div>
    <div class="row">
            <div class="col-sm-2 col-12"></div>
            <div class="col-sm-8 col-12" style="text-align:center;"><a href="./admin/index.aspx" style="background-color:#404040; color:white; padding:6px; border-radius:4px; font-size:1.2em;">Admin Login</a></div>
            <div class="col-sm-2 col-12"></div>
    </div>
    <div class="row">
        <div class="col-sm-2 col-12"><br /><br /></div>
    </div>
    </div>
</body>
</html>