<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="WebApplication1.contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-bottom: 150px">
        <h3 class="text-center">- Contact Us -</h3>
        <form>
            <div class="form-group">
                <label for="txtName">Name:</label>
                <asp:TextBox runat="server" placeholder="Name" ID="txtName" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="email">Contact:</label>
                <asp:TextBox ID="txtContact" TextMode="Number" placeholder="Contact" CssClass="form-control" runat="server"></asp:TextBox>

            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <asp:TextBox ID="txtEmail" TextMode="Email" placeholder="Email" CssClass="form-control" runat="server"></asp:TextBox>

            </div>



            <div class="form-group">
                <label for="service">Service Requred:</label>
                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlservice">
                    <asp:ListItem Text="--Select--" Value="Select"></asp:ListItem>
                    <asp:ListItem Text="Company Registartion" Value="CR"></asp:ListItem>
                    <asp:ListItem Text="GST Registration" Value="GSTR"></asp:ListItem>
                    <asp:ListItem Text="TDS Return" Value="TR"></asp:ListItem>
                    <asp:ListItem Text="Digital Signature Certificate" Value="DSC"></asp:ListItem>
                    <asp:ListItem Text="Income Tax Return" Value="ITR"></asp:ListItem>
                    <asp:ListItem Text="GST Filling" Value="GSTF"></asp:ListItem>
                    <asp:ListItem Text="FDI Return" Value="FDIR"></asp:ListItem>
                </asp:DropDownList>
            </div>


            <asp:Button runat="server" OnClientClick="return valid()" CssClass="btn btn-primary" OnClick="btnSubmit_Click" ID="btnSubmit" Text="Submit" />
        </form>
    </div>
    <script>
        function valid() {
            var name = document.getElementById('<%= this.txtName.ClientID %>').value;

            var phone = document.getElementById('<%= this.txtContact.ClientID %>').value;
            var email = document.getElementById('<%= this.txtEmail.ClientID %>').value;
            var service = document.getElementById('<%= this.ddlservice.ClientID %>').value;
            mobilecon = /^\d{10}$/;
            emailcon = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/;

            if (name == "" || email == "" || phone == "" || city == "Select") {
                swal("Please fill all details to proceed..!", "", "error");
                return false;
            }
            if (phone != '') {
                if (!phone.match(mobilecon)) {
                    swal("Please Enter Valid Contact Number", "", "warning");
                    return false;

                }
            }
            if (email != '') {
                if (!email.match(emailcon)) {
                    swal("Please Enter Valid Email-Id", "", "error");
                    return false;
                }
            }

            return true;
        }
    </script>




</asp:Content>
