<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Coupons.aspx.cs" Inherits="Coupons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
        <h2>coupons:</h2>
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
            <a href="<%=coupons.Link2 %>" rel="shadowbox">
                <img src="<%=coupons.Link %>" alt="img<%=coupons.Id %>"></a>
            <%}
                } %>
        </div>
    </div>
</asp:Content>

