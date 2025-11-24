<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BrightIdeasForm.ascx.cs" Inherits="App_BI500_UserControl_BrightIdeasForm" %>

<%@ Register Src="~/UserControls/userFinder/Search4LocalUser.ascx" TagName="Search4LocalUser" TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/dateControl.ascx" TagName="dateControl" TagPrefix="uc2" %>

<%@ Register Src="~/UserControls/userFinder/Search4User.ascx" TagName="Search4User" TagPrefix="uc3" %>
<%--<%@ Register Src="Search4LocalUser.ascx" TagName="Search4LocalUser" TagPrefix="uc3" %>--%>

<!-- MAIN PAGE CARD -->
<div class="card col-md-6 shadow-sm mb-4">
    <div class="card-header fw-bold">
        Welcome to Ideas Garden
    </div>
    <div class="card-body">
        <p>
            Are you bursting with innovative ideas? Do you want to share your thoughts and shape the future? We want to hear it! <br />
            Submit your ideas and let's transform our business together.       
        </p><hr />
        <!-- Project Title -->
        <div class="row col-md-12 mb-1">
            <div class="col-md-3">
                <label class="form-label ">
                    <asp:Label ID="Label4" runat="server" Text="Initiative Title:" />
                </label>
                <asp:RequiredFieldValidator CssClass="text-danger d-block" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProjectTitle"
                    ErrorMessage="Enter Initiative Title">*</asp:RequiredFieldValidator>
            </div>

            <div class="col-md-9">
                <asp:TextBox ID="txtProjectTitle" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <!-- Business Case -->
        <div class="row col-md-12 mb-1">
            <div class="col-md-3">
                <label class="form-label">
                    <asp:Label ID="Label7" runat="server" Text="Problem Statement:" />
                </label>
                <asp:RequiredFieldValidator CssClass="text-danger d-block"
                    ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txtBizCase"
                    ErrorMessage="Business Case is required">*</asp:RequiredFieldValidator>
            </div>

            <div class="col-md-9">
                <asp:TextBox ID="txtBizCase" runat="server" TextMode="MultiLine"
                    CssClass="form-control" Height="100px"></asp:TextBox>
            </div>
        </div>

        <!-- Opportunity Statement -->
        <div class="row col-md-12 mb-1">
            <div class="col-md-3">
                <label class="form-label">
                    <asp:Label ID="Label8" runat="server" Text="Proposed Solution:" />
                </label>
                <asp:RequiredFieldValidator CssClass="text-danger d-block"
                    ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="txtOpportunityStmt"
                    ErrorMessage="Opportunity Statement is required">*</asp:RequiredFieldValidator>
            </div>
            <div class="col-md-9">
                <asp:TextBox ID="txtOpportunityStmt" runat="server"
                    TextMode="MultiLine" CssClass="form-control"
                    Height="100px"></asp:TextBox>
            </div>
        </div>

        <!-- Expected Benefit -->
        <div class="row col-md-12 mb-1">
            <div class="col-md-3">
                <label class="form-label">
                    <asp:Label ID="Label9" runat="server" Text="Impacted Area:" />
                </label>
                <asp:CompareValidator CssClass="text-danger d-block"
                    ID="CompareValidator2" runat="server"
                    ControlToValidate="drpBenefit"
                    Operator="NotEqual" ValueToCompare="-1"
                    Type="Integer"
                    ErrorMessage="Impacted Area is Required">*</asp:CompareValidator>
            </div>

            <div class="col-md-9">
                <asp:DropDownList ID="drpBenefit" runat="server"
                    CssClass="form-select" Width="100%">
                    <asp:ListItem Value="-1">--Select Project Type--</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <!-- Project Champion -->
        <div class="row col-md-12 mb-1">
            <div class="col-md-3">
                <label class="form-label">
                    <asp:Label ID="Label5" runat="server" Text="Supervisor:" />
                </label>
            </div>

            <div class="row col-md-9">
                <div class="col-md-6">
                    <uc1:Search4LocalUser ID="champion" runat="server" />
                </div>
                <div class="col-md-6 small">Immediate Supervisor</div>
            </div>
        </div>

        <!-- Project Sponsor -->
        <div class="row col-md-12 mb-1">
            <div class="col-md-3">
                <label class="form-label">
                    <asp:Label ID="Label6" runat="server" Text="Process Owner:" />
                </label>
            </div>

            <div class="row col-md-9">
                <div class="col-md-6"><uc1:Search4LocalUser ID="Sponsor" runat="server" /></div>
                <div class="col-md-6 small">GM of Impacted Area</div>
            </div>
        </div>

        <!-- Completion Date -->
        <div class="row col-md-12 mb-1">
            <div class="col-md-3">
                <label class="form-label">
                    <asp:Label ID="Label11" runat="server" Text="Submission Date:" />
                </label>
            </div>

            <div class="col-md-9">
                <uc2:dateControl ID="dtCompletion" runat="server" width="50%" />
            </div>
        </div>

        <!-- Hidden Field -->
        <asp:HiddenField ID="HFRequestId" runat="server" />
    </div>
    <div class="card-footer">
        <!-- Buttons -->
        <div class="row col-md-12">
            <div class="col-md-3"></div>
            <div class="col-md-9">
                <asp:Button ID="btnDraft" runat="server" Text="Save as Draft" CssClass="btn btn-secondary me-2" />

                <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="120px" CssClass="btn btn-success me-2"
                    OnClick="btnSubmit_Click" OnClientClick="return confirm('Are you sure you want to send for approval?')" />

                <asp:Button ID="btnClose" runat="server" Text="Close" Width="120px" CssClass="btn btn-danger" OnClick="btnClose_Click" />
            </div>
        </div>
    </div>
</div>

<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />