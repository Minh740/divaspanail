<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Edit-Technician.aspx.cs" Inherits="cp_page_technician_Edit_Technician" %>

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
        <li class="breadcrumb-item"><a href="/cp/page/technician/Technician.aspx"> Edit Technician</a></li>
        <li class="breadcrumb-item active">Edit Technician </li>
    </ol>
    <div class="col-md-12 form-group">
        <label>Name</label>
        <input type="text" id="txtName" value="<%=edit1.Name%>" class="form-control" />
    </div>
    <div class="col-md-12 form-group">
        <label>Phone</label>
        <input type="text" id="txtPhone" value="<%=edit1.Phone%>" class="form-control" />
    </div>
    <div class="col-md-12 form-group">
        <label>Address</label>
        <input type="text" id="txtAddress" value="<%=edit1.Address%>" class="form-control" />
    </div>
    

    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/technician/Edit-Technician.aspx">Cancel</a>
        <button class="btn btn-info" onclick="Submit(this,<%=edit1.Id%>)">Edit </button>
    </div>


    <script>


                function Submit(input,id) {
            ShowLoading();
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            var name = $("#txtName").val();
            var phone = $("#txtPhone").val();
          var address = $("#txtAddress").val();
            $.post("/cp/do/technician/edit-technician.aspx", {
                     
                id: id,
                name: name,
                phone: phone,
                address: address,
               
                    
            }, function (data) {
                if (data == 1) {
                    alertify.alert("Success");
                    location.href = "/cp/page/technician/Technician.aspx";
                }
                else {
                    alertify.alert("Error", data);
                  
                }
            });
        }
    </script>
</asp:Content>

