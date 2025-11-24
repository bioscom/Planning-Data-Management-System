<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BrightIdeasFormEdt.ascx.cs" Inherits="App_BI500_UserControl_BrightIdeasFormEdt" %>

<%@ Register src="../../../UserControls/userFinder/Search4LocalUser.ascx" tagname="Search4LocalUser" tagprefix="uc1" %>

<%--<%@ Register Src="~/UserControls/userFinder/Search4User.ascx" TagName="Search4User" TagPrefix="uc1" %>--%>
<%@ Register Src="~/UserControls/dateControl.ascx" TagName="dateControl" TagPrefix="uc2" %>


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
                <asp:RequiredFieldValidator CssClass="text-danger d-block" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtProjectTitle"
                    ErrorMessage="Enter Initiative Title">*</asp:RequiredFieldValidator>
            </div>

            <div class="col-md-9">
                <asp:TextBox ID="txtProjectTitle" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <!-- Business Case -->
        <div class="row col-md-12 mb-1">
            <div class="col-md-3">
                <asp:Label ID="Label16" runat="server" Text="Problem Statement:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                    runat="server" 
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
                <asp:Label ID="Label17" runat="server" Text="Proposed Solution:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
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
                <asp:Label ID="Label18" runat="server" Text="Impacted Area:"></asp:Label>
                <asp:CompareValidator CssClass="text-danger d-block" 
                    ID="CompareValidator2" runat="server"
                    ControlToValidate="drpBenefit"
                    ErrorMessage="Impacted Area is Required" 
                    Operator="NotEqual" 
                    Type="Integer" 
                    ValueToCompare="-1">*</asp:CompareValidator>
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
                <asp:Label ID="Label14" runat="server" Text="Supervisor:"></asp:Label>
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
                <asp:Label ID="Label15" runat="server" Text="Process Owner:"></asp:Label>  
            </div>

            <div class="row col-md-9">
                <div class="col-md-6"><uc1:Search4LocalUser ID="sponsor" runat="server" /></div>
                <div class="col-md-6 small">GM of Impacted Area</div>
            </div>
        </div>

        <!-- Completion Date -->
        <div class="row col-md-12 mb-1">
            <div class="col-md-3">
                <label class="form-label">
                    <asp:Label ID="Label20" runat="server" Text="Submission Date:"></asp:Label>
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
                 <asp:Button ID="btnDraft" runat="server" Text="Save as Draft" OnClick="btnDraft_Click" />
                 <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="100px" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
</div>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />