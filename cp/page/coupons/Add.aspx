﻿<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="cp_page_coupons_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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

        .image {
            display: none;
        }
         </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="#">Coupons</a></li>
        <li class="breadcrumb-item active">Add New Coupons</li>
    </ol>

    <div class="col-md-6 form-group">
        <label>Type</label>
        <select class="form-control" id="slxType" onchange="ChangeType(this)">
            <option value="1">Video</option>
            <option value="2">Image</option>
        </select>
    </div>

    <div class="col-md-6 form-group image">
        <div class="">
            <label>Image small</label>
            <img src="" id="preview1" width="100%" />
        </div>
        <div class="">
            <div class="fileUpload btn btn-info btn-upload">
                <span>+ Add Image</span>
                <input type="file" onchange="Preview(event,1)" accept="image/*" class="upload" />
            </div>
        </div>
    </div>
    <div class="col-md-6 form-group image">
        <div class="">
            <label>Image popup</label>
            <img src="" id="preview2" width="100%" />
        </div>
        <div class="">
            <div class="fileUpload btn btn-info btn-upload">
                <span>+ Add Image</span>
                <input type="file" onchange="Preview(event,2)" accept="image/*" class="upload" />
            </div>
        </div>
    </div>

    <div class="col-md-6 form-group video">
        <label>Name</label>
        <input type="text" id="txtName" class="form-control" />
    </div>

    <div class="col-md-6 form-group video">
        <label>Link video</label>
        <input type="text" id="txtLink" class="form-control" />
    </div>


    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/coupons/Coupons.aspx">Cancel</a>
        <button class="btn btn-info" onclick="Submit(this)">Submit</button>
    </div>
    <script>
        var base641 = "";
        var base642 = "";
        function ChangeType(input) {
            var type = $(input).val();
            if (type == 1) {
                $(".video").show();
                $(".image").hide();
            } else {
                $(".video").hide();
                $(".image").show();
            }
        }

        function Preview(event, type) {
            var input = event.target;
            if (input.files) {
                var reader = new FileReader();
                reader.fileName = input.files[0].name;
                reader.onload = function (e) {
                    if (type == 1)
                        base641 = e.target.result.replace(/^data:image\/[a-z]+;base64,/, "");
                    else
                        base642 = e.target.result.replace(/^data:image\/[a-z]+;base64,/, "");
                    $("#preview" + type).attr("src", e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        };
        function Submit(input) {
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            ShowLoading();
            var type = $("#slxType").val();
            var name = $("#txtName").val();
            var link = $("#txtLink").val();
            $.ajax({
                url: "/cp/do/coupons/add.aspx",
                method: "post",
                data: {
                    base641: base641,
                    base642: base642,
                    type: type,
                    name: name,
                    link: link
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                        console.log(data.error);
                        alertify.error("Error. Please try again");
                    } else {
                        location.href = "/cp/page/coupons/Coupons.aspx";
                    }
                    $(input).prop("disabled", false);
                    $(input).text("Submit");
                    HideLoading();
                },
                error: function (error) {
                    $(input).prop("disabled", false);
                    $(input).text("Submit");
                    console.log(error);
                    alertify.error("Error. Please try again");
                    HideLoading();
                }
            })
        }
    </script>
</asp:Content>

