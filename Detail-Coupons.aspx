<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Detail-Coupons.aspx.cs" Inherits="Detail_Coupons" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detail Coupons</title>
     <link rel="shortcut icon" type="image/x-icon" href="images/logoDiva.png" />
    <link href="css/Style1.css" rel="stylesheet" />
</head>
<body style="text-align:center;">
    <form id="form1" runat="server">
        <div class="coupons">
        <button onclick="javascript:window.print()">Print Coupon</button>
        <h1><a href="Default.aspx" class="test">DIVA SPA AND NAIL</a></h1>
        <p>16615 Lancaster Hwy, Ste 104, Charlotte, NC 28277</p>
        <b>(704) 542-6961</b>
        <p>Mon - Fri: 9:30 am - 7:30 pm</p>
        <p>Sat: 9:30 am - 7:00 pm</p>
        <p>Sun: 12:00 pm - 5:00 pm</p>
        <p>Gift Cards and Group Parties Available!</p>
        <img class="ban" src="<%=detail.Link %>" alt="img<%=detail.Id %>">
        <p>Not valid with other offers. One coupon per party. Please present coupon prior to service.</p>
    </div>
    </form>
</body>
</html>
