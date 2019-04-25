<%@ Page Title="Contact" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/JavaScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="content">
        <div class="bg_border">
            
        </div>
        <h2>Contact:</h2>
        <div class="contact_from">
            <%=contact.PageContent %>

            <div class="contact_from_l">
                <div class="contact_from_title">Send us a message</div>
                <div class="form_m">
                    <!--Contact form Begin-->
                    
                    <div id="form">
                        <div class="formrow">
                            <div class="formrowtop">Your Name*:</div>
                            <div class="formrowtext">
                                <input class="txtbox" type="text" value="" id="txtName" placeholder="Your Name" required data-validation-required-message="Please enter your name.">
                            </div>
                        </div>
                        <div class="formrow">
                            <div class="formrowtop">Your Email*:</div>
                            <div class="formrowtext">
                                <input class="txtbox" type="text" value="" id="txtEmail" placeholder="Your Email" required data-validation-required-message="Please enter your email address.">
                            </div>
                        </div>
                        
                        <div class="formrow">
                            <div class="formrowtop">Phone Number*:</div>
                            <div class="formrowtext">
                                <input class="txtbox" onkeypress=" return isNumberKey(event)" type="text" value="" id="txtPhone" placeholder="Phone Number" required data-validation-required-message="Please enter your phone number.">
                            </div>
                        </div>
                        <div class="formrow">
                            <div class="formrowtop">Content*:</div>
                            <div class="formrowtext">
                                <textarea class="txtbox textarea" rows="10" id="txtContent" placeholder="Message" required data-validation-required-message="Please enter a message."></textarea>
                            </div>
                        </div>
                        <p></p>
                        <div class="formrow buttonrow">
                            <div id="formwait">Please wait...</div>
                            <button type="button" <%--id="bSend"--%> onclick="SendContactEmail()" class="btn btn-default senmail" >Submit</button>
                        </div>
                        <p></p>
                        <!--opt notify-->
                        <div id="formnotify">
                            <div id="formnotifycontent">
                            </div>
                            <div id="formnotifyok">OK</div>
                        </div>
                        <!--opt notify-->
                    </div>
                        
                    <!--Contact form End-->
                </div>

            </div>
        </div>

    </div>

    <script>

        function isNumberKey(evt)
    {
       var charCode = (evt.which) ? evt.which : event.keyCode;
       if(charCode == 59 || charCode == 46)
        return true;
       if (charCode > 31 && (charCode < 48 || charCode > 57))
          return false;
       return true;
    }

        function SendContactEmail() {
            ShowLoading();

            var name = $('#txtName').val();
            var email = $('#txtEmail').val();
            var phone = $('#txtPhone').val();
            var notes = $('#txtContent').val();

            CheckFieldEmpty("#form");
            var error = CheckEmailValid(email);
            error += CheckFieldError();

            if (error != "") {
                HideLoading();

                alert('Đã có lỗi xảy ra.', error);
            } else {
                $.post('/do/contact.aspx', {
                    name: name,
                    email: email,
                    phone: phone,
                    notes: notes,
                }, function (data) {
                    if (data == 0) {
                        HideLoading();

                alert('Đã có lỗi xảy ra. Vui lòng thử lại sau.');
            } else {
                $.post(SENDMAIL_URL + 'send-contact-mail.aspx', {
                    email: email,
                    mailBody: data,
                }, function (result) {
                    

                    if (result != 1) {
                        alert('Có lỗi xảy ra', result);
                    } else {
                        alert('Thành công', 'Cảm ơn bạn đã liên hệ với chúng tôi.', function () {
                            location.reload();
                        });
                    }

                    HideLoading();
                });
            }
        });
    }
}
       

    </script>
    

</asp:Content>

