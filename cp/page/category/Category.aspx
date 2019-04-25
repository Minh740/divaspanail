﻿<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="cp_page_category_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Category</li>
    </ol>
    <a class="btn btn-success" href="/cp-add-category">Add New Category</a>
    <p></p>
    <table class="table table-bordered">
        <tbody>
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Name</th>
                <th class="text-center">Order</th>
                <th class="text-center">Parent</th>
                <th class="text-center">Status</th>
                
                <th colspan="2" class="text-center">Action</th>
            </tr>
            <%for (int i = listCategory.Count - 1 ; i > -1; i-- )
                   {%>
            <tr>

                <td><%=listCategory[i].ID%></td>
                <td><%=listCategory[i].Name%></td>
                  <td><%=listCategory[i].Order%></td>
                <%if (listCategory[i].ParentID != null)
                    { %>
                <td><%=listCategory[i].CategoryTBx1.Name%></td>
                <%}
                    else
                    { %>
                
                <td></td>
                <td><%=listCategory[i].Status%></td>
              
                <%} %>
                <td class="text-center">
                    <a class="btn btn-info" href="/cp-edit-category-<%=listCategory[i].ID %>">
                        <i class="fa fa-edit" style="font-size: 15px; right: 10px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=listCategory[i].ID%>)">
                        <i class="fa fa-trash" style="font-size: 15px"></i>
                    </button>
                </td>
            </tr>
            <%} %>
        </tbody>
    </table>
    <script>
        function Delete(input, id) {
            alertify.confirm("Are you sure Delete", function () {
                $(input).prop("disabled", true);
                ShowLoading();
                $.ajax({
                    url: "/cp/do/category/delete.aspx",
                    method: "post",
                    data: {
                        id: id,
                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.success == -1) {
                            alertify.error("Error. Please try again");
                            console.log(data);
                        }
                        else {
                            location.href = "/cp-category";
                        }
                        $(input).prop("disabled", false);
                        HideLoading();
                    },
                    error: function (error) {
                        alertify.error("Error. Please try again.");
                        console.log(error);
                        $(input).prop("disabled", false);
                        HideLoading();
                    }
                })
            });

        }
    </script>
</asp:Content>

