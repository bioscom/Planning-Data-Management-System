<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/siteMaster.master" AutoEventWireup="true" CodeFile="GasflarePending.aspx.cs" Inherits="App_FlareWaiver_GasflarePending" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Src="UserControl/oRequests.ascx" TagName="oRequests" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headId" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">

                <!-- Title Section -->
                <div class="card mb-3">
                    <div class="card-header">
                        <asp:Label ID="lblTitle" runat="server"></asp:Label>
                    </div>

                    <!-- Content Section -->
                    <div class="card-body">
                        <uc1:oRequests ID="oRequestsPending" runat="server" />
                    </div>
                </div>

            </div>
        </div>
    </div>

    <%--<table class="tMainBorder" style="width: 100%">
        <tr class="cHeadTile">
            <td>
                <asp:Label ID="lblTitle" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:oRequests ID="oRequestsPending" runat="server" />
            </td>
        </tr>
    </table>--%>
</asp:Content>

