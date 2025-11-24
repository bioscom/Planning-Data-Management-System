<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/siteMaster.master" AutoEventWireup="true" CodeFile="GasflareCancelled.aspx.cs" Inherits="App_FlareWaiver_GasflareCancelled" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Src="UserControl/oRequests.ascx" TagName="oRequests" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headId" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card mb-4">
        <div class="card-header">
            Cancelled Requests
        </div>
        <div class="card-body">
            <uc1:oRequests ID="oRequestsCancelled" runat="server" />
        </div>
    </div>
</asp:Content>

