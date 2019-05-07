<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Technician.aspx.cs" Inherits="cp_page_technician_Technician" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Technician</li>
    </ol>
    <a class="btn btn-success" href="/cp/page/technician/Add-Technician.aspx">Add New Technician</a>
    <p></p>
    <table class="table table-bordered">
        <tbody>
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Name</th>
                  <th class="text-center">Phone</th>
                  <th class="text-center">Address</th>
                <th colspan="2" class="text-center">Action</th>
            </tr>
            <%for (int i = list.Count - 1; i > -1; i--)
                {%>
            <tr>

                <td><%=list[i].Id%></td>
                <td><%=list[i].Name%></td>
                <td><%=list[i].Phone%></td>
                <td><%=list[i].Address%></td>
                <td class="text-center">
                    <a class="btn btn-info" href="/cp-edit-technician-<%=list[i].Id%>">
                        <i class="fa fa-edit" style="font-size: 15px; right: 10px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=list[i].Id%>)">
                        <i class="fa fa-trash" style="font-size: 15px"></i>
                    </button>
                </td>

                <%} %>
            </tr>

        </tbody>
    </table>
    <script>
        function Delete(input, id) {
            alertify.confirm("Are you sure Delete", function () {
                $(input).prop("disabled", true);
                ShowLoading();
                $.ajax({
                    url: "/cp/do/technician/delete-technician.aspx",
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
                            location.href = "/cp/page/technician/Technician.aspx";
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

