<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Add-Technician.aspx.cs" Inherits="cp_page_technician_Add_Technician" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style>
        .fileUpload {
            position: relative;
            width: fit-content;
        }

            .fileUpload .upload {
                position: absolute;
                top: 0;
                left: 0;
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
                cursor: pointer;
                opacity: 0;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="/cp/page/technician/Technician.aspx">Technician</a></li>
        <li class="breadcrumb-item active">Add New </li>
    </ol>
    <div class="col-md-12 form-group">
        <label>Name</label>
        <input type="text" id="txtName" class="form-control" />
    </div>
     <div class="col-md-12 form-group">
        <label>Phone</label>
        <input type="text" id="txtPhone" class="form-control" />
    </div>
     <div class="col-md-12 form-group">
        <label>Address</label>
        <input type="text" id="txtAddress" class="form-control" />
    </div>
  

    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/technician/Technician.aspx">Cancel</a>
        <button class="btn btn-info" onclick="Submit(this)">Submit</button>
    </div>


    <script>
                function Submit(input) {
            ShowLoading();
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            var name = $("#txtName").val();
                    var phone = $("#txtPhone").val();
                    var address = $("#txtAddress").val();
           
            $.ajax({
                url: "/cp/do/technician/add-new-technician.aspx",
                method: "post",
                data: {
                    name: name,
                    phone: phone,
                    address:address
                  
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                        console.log(data.error);
                        alertify.error("Error. Please try again");
                    } else {
                        location.href = "/cp/page/technician/Technician.aspx";
                         alertify.error("Susses");
                    }
                    
                }
            })
        }
    </script>
</asp:Content>

