<%@ Page Title="Coupons" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Promotion.aspx.cs" Inherits="Promotion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>
    <!--Shadow box-->
    <link rel="stylesheet" type="text/css" href="shadowbox/shadowbox.css" />
    <script type="text/javascript" src="shadowbox/shadowbox.js"></script>
    <script type="text/javascript">

        $(function () {
            Shadowbox.init({
                handleOversize: "drag",
                modal: true,
                continuous: true,
                counterType: "skip",
                handleOversize: "resize",
            });
        })
    </script>
    <!--Shadow box-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--<div class="content">
        <div class="bg_border">
            
        </div>
        <h2>Promotion:</h2>
        <%=promotion.PageContent %>
        <img src="images/nail-banner.jpg" />
    </div>
    <div style="margin-bottom:7%;">
        <p>Print and present or display Diva Spa and Nail coupons on your mobile device to redeem value.</p>
        <div class="img_user>
            <img src="images/coupons.png" />
        <img src="images/coupons2.png" />
        <img src="images/coupons3.jpg" />
        </div>
    </div>--%>

    <div class="content">
        
        <h2>coupons:</h2>
        <img class="ban" src="images/nail-banner.jpg" />
        <p>Print and present or display Diva Spa and Nail coupons on your mobile device to redeem value.</p>

        <div id="gallery">
            <%foreach (var coupons in listCoupons)
                {
                    if (coupons.Type == 1)
                    {
            %>
            <div class="gallery_video">
                <%=coupons.Name %><br />
                <iframe src="<%=coupons.Link %>" frameborder="0" allowfullscreen></iframe>
            </div>
            <%}
                else
                { %>
            <a href="#" onclick="detail(<%=coupons.Id %>)" rel="shadowbox">
                <img class="imgg" src="<%=coupons.Link %>" alt="img<%=coupons.Id %>"></a>
            <%}
                } %>


        </div>
        <div class="pageNarrative" style="margin-left:5px">
                <div class="coupon">
                    Socialize With Us!

                </div>
                <br>
                <br>
   			    <span class="spann">
                    Let us know about your Diva Spa and Nail<br>
                    experience and find exclusive offers<br>on
			        <a style="text-decoration:underline" href="https://www.facebook.com/divaspanailscharlotte/" target="_blank">
                    FACEBOOK</a>

   			    </span>
		    </div>
    </div>
    <script>
        function detail(id) {
            location.href = "/Detail-Coupons.aspx?id=" + id;
        }
    </script>
</asp:Content>

