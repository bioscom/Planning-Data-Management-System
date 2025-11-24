<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BI500.master" AutoEventWireup="true" CodeFile="ViewComments.aspx.cs" Inherits="App_BI500_ViewComments" %>

<%@ Register Src="UserControl/oRequestDetails.ascx" TagName="oRequestDetails" TagPrefix="uc2" %>

<%@ Register src="UserControl/oApprovalComment.ascx" tagname="oApprovalComment" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headId" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div class="col-md-12 mb-4">
        <div class="row">
            <div class="col-6">
                <uc2:oRequestDetails ID="oRequestDetails1" runat="server" />
            </div>
            <div class="col-6">
                <uc3:oApprovalComment ID="oApprovalCommentProjectChampion" runat="server" />
                <uc3:oApprovalComment ID="oApprovalCommentBITeam" runat="server" />
                <uc3:oApprovalComment ID="oApprovalCommentProjectSponsor" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>

