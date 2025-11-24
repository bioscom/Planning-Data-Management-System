<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BI500.master" AutoEventWireup="true" CodeFile="BIApprovalProc.aspx.cs" Inherits="BIApprovalProc" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="UserControl/oRequestDetails.ascx" TagName="oRequestDetails" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headId" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />


    <div class="col-12 mb-4">
        <div class="row"> 
            <div class="col-6">
                <uc1:oRequestDetails ID="oRequestDetails1" runat="server" />
            </div>

            <div class="col-6">
                <div class="card mb-1">
                    <div class="card-header">
                        <asp:Label ID="lblApproverRole" runat="server"></asp:Label>
                    </div>
                    <div class="card-body">

                    </div>
                </div>

                <div class="card mb-1">
                    <div class="card-header">
                        <asp:Label ID="approverLabel" runat="server" Font-Bold="True"></asp:Label>
                    </div>
                    <div class="card-body">
                        <div class="row ms-2">
                            <div class="col-3">
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Stand"></asp:Label>
                            </div>
                            <div class="col-8">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rdbSupport" ErrorMessage="Your stand is required">*</asp:RequiredFieldValidator>
                                <asp:RadioButtonList ID="rdbSupport" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList>
                            </div>
                        </div>
                    </div>
                </div>
                        
                <div class="card">
                    <div class="card-header">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Add comments here"></asp:Label>
                    </div>
                    <div class="card-body">
                        <asp:TextBox ID="txtComment" runat="server" Height="100px" Text="" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="submitBtn" runat="server" OnClick="submitBtn_Click" Text="Submit" />
                        <asp:Button ID="closeButton" runat="server" OnClick="closeButton_Click" Text="Close" ValidationGroup="close" />
                    </div>
                </div>
           </div>
        </div>
    </div>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
</asp:Content>

