<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BrightIdeasOnBehalf.ascx.cs" Inherits="App_BI500_UserControl_BrightIdeasOnBehalf" %>

<%@ Register Src="~/UserControls/userFinder/Search4LocalUser.ascx" TagName="Search4LocalUser" TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/dateControl.ascx" TagName="dateControl" TagPrefix="uc2" %>

<%@ Register Src="~/UserControls/userFinder/Search4User.ascx" TagName="Search4User" TagPrefix="uc3" %>
<%--<%@ Register Src="Search4LocalUser.ascx" TagName="Search4LocalUser" TagPrefix="uc3" %>--%>

<!-- Card: Title -->
<div class="card col-md-8 shadow mb-4">
    <div class="card-header">
        Welcome to Ideas Garden
    </div>
    <div class="card-body">
        <p>
            Are you bursting with innovative ideas? Do you want to share your thoughts and shape the future? We want to hear it! <br />
            Submit your ideas and let's transform our business together.
        </p>
    </div>
</div>

<!-- On Behalf Of Section -->
<div class="card col-md-8 shadow mb-4">
    <div class="card-header">
        On Behalf of:
    </div>

    <div class="card-body">
        <!-- Fullname -->
        <div class="row mb-3">
            <label class="col-sm-4 col-form-label bg-light">
                Fullname:
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                    ControlToValidate="txtFullname" ErrorMessage="Fullname is required">*</asp:RequiredFieldValidator>
            </label>

            <div class="col-sm-8">
                <asp:TextBox ID="txtFullname" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <!-- Email -->
        <div class="row mb-3">
            <label class="col-sm-4 col-form-label bg-light">
                Email Address:
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                    ControlToValidate="txtEmailAddress" ErrorMessage="Invalid Email Address"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                    ControlToValidate="txtEmailAddress" ErrorMessage="Email Address is required">*</asp:RequiredFieldValidator>
            </label>

            <div class="col-sm-8">
                <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <!-- Project Details -->

        <!-- Project Title -->
        <div class="row mb-3">
            <label class="col-sm-4 col-form-label bg-light">
                <asp:Label ID="Label4" runat="server" Text="Intiative Title:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtProjectTitle" ErrorMessage="Enter Project Improvement Title">*</asp:RequiredFieldValidator>
            </label>

            <div class="col-sm-8">
                <asp:TextBox ID="txtProjectTitle" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        

        <!-- Business Case -->
        <div class="row mb-3">
            <label class="col-sm-4 col-form-label bg-light">
                <asp:Label ID="Label7" runat="server" Text="Problem Statement:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txtBizCase" ErrorMessage="Business Case is required">*</asp:RequiredFieldValidator>
            </label>

            <div class="col-sm-8">
                <asp:TextBox ID="txtBizCase" runat="server" CssClass="form-control"
                    TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>
        </div>

        <!-- Opportunity Statement -->
        <div class="row mb-3">
            <label class="col-sm-4 col-form-label bg-light">
                <asp:Label ID="Label8" runat="server" Text="Problem Solution:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="txtOpportunityStmt" ErrorMessage="Opportunity Statement is required">*</asp:RequiredFieldValidator>
            </label>

            <div class="col-sm-8">
                <asp:TextBox ID="txtOpportunityStmt" runat="server" CssClass="form-control"
                    TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>
        </div>

        <!-- Impact Area -->
        <div class="row mb-3">
            <label class="col-sm-4 col-form-label bg-light">
                <asp:Label ID="Label9" runat="server" Text="Expected benefit/Impacted Area:"></asp:Label>
                <asp:CompareValidator ID="CompareValidator2" runat="server"
                    ControlToValidate="drpBenefit" Operator="NotEqual" Type="Integer"
                    ValueToCompare="-1" ErrorMessage="Impacted Area is Required">*</asp:CompareValidator>
            </label>

            <div class="col-sm-8">
                <asp:DropDownList ID="drpBenefit" runat="server" CssClass="form-select">
                    <asp:ListItem Value="-1">Select Impacted Area</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <!-- Project Champion -->
        <div class="row mb-3">
            <label class="col-sm-4 col-form-label bg-light">
                <asp:Label ID="Label5" runat="server" Text="Project Champion:"></asp:Label>
            </label>

            <div class="col-sm-8">
                <uc1:Search4LocalUser ID="champion" runat="server" />
                <em>(This is your immediate supervisor)</em>
            </div>
        </div>

        <!-- Project Sponsor -->
        <div class="row mb-3">
            <label class="col-sm-4 col-form-label bg-light">
                <asp:Label ID="Label6" runat="server" Text="Project Sponsor:"></asp:Label>
            </label>

            <div class="col-sm-8">
                <uc1:Search4LocalUser ID="Sponsor" runat="server" />
                <em>(Supervisor to your immediate supervisor)</em>
            </div>
        </div>

        <!-- Completion Date -->
        <div class="row mb-3">
            <label class="col-sm-4 col-form-label bg-light">
                <asp:Label ID="Label11" runat="server" Text="Project Plan Completion Date:"></asp:Label>
            </label>

            <div class="col-sm-8">
                <uc2:dateControl ID="dtCompletion" runat="server" />
            </div>
        </div>
    </div>
     <!-- Submit Buttons -->
     <div class="card-footer">
         <div class="col-sm-4">
             <asp:HiddenField ID="HFRequestId" runat="server" />
         </div>

         <div class="col-sm-8 text-end">
             <asp:Button ID="btnDraft" runat="server" Text="Save as Draft" CssClass="btn btn-secondary" />
             <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary"
                 OnClick="btnSubmit_Click"
                 OnClientClick="return confirm('Are you sure you want to send for approval?')" />
             <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn btn-danger" />
         </div>
     </div>
</div>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
