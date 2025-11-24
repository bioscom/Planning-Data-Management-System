<%@ Control Language="C#" AutoEventWireup="true" CodeFile="oRequestDetails.ascx.cs" Inherits="UserControl_oRequestDetails" %>

<div class="card mb-1">
    <div class="card-header">
        Idea Details
    </div>
    <div class="card-body">
        <table style="width:99%">
            <tr>
                <td style="width: 180px">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Request Number:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblRequestNumber" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label30" runat="server" Font-Bold="True" Text="Title:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblTitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Date Submitted:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblDateInit" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label36" runat="server" Font-Bold="True" Text="Business Area:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblBusinessArea" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label29" runat="server" Font-Bold="True"
                        Text="Impact Area:  "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblImpactArea" runat="server" Font-Bold="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Plan Date Completion:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblPlanCompletionDate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Project Manager:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblInitiator" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label31" runat="server" Font-Bold="True" Text="Project Supervisor:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblProjectChampion" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label32" runat="server" Font-Bold="True" Text="Leadership Governing Board:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblProjectSponsor" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label34" runat="server" Font-Bold="True" Text="Status:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblStatus" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label35" runat="server" Font-Bold="True" Text="Project Phase Status:"></asp:Label>
                </td>
                <td>
                    <asp:LinkButton ID="lnkPhase" runat="server" Font-Bold="True"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label37" runat="server" Font-Bold="True" Text="Improvement Benefit Realised:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblImprovementBenefit" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label38" runat="server" Font-Bold="True" Text="Quantity Benefit:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblQtyBenefit" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label39" runat="server" Font-Bold="True" Text="Replication Potential in SCIN:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblReplicationPotential" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label40" runat="server" Font-Bold="True" Text="Actual Project Finish Date:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFinishedDate" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</div>

<div class="card mb-1">
    <div class="card-header">
        Raised on behalf of:
    </div>
    <div class="card-body">
        <table style="width:99%">
            <tr>
                <td>
                    <asp:Label ID="lblFullName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEmailAddress" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</div>

<div class="card mb-1">
    <div class="card-header">
        Business Case
    </div>
    <div class="card-body">
        <asp:Label ID="lblBuzCase" runat="server"></asp:Label>
    </div>
</div>


<div class="card mb-1">
    <div class="card-header">
        Opportunity Statement
    </div>
    <div class="card-body">
        <asp:Label ID="lblOpportunityStmt" runat="server"></asp:Label>
    </div>
</div>

<div class="card">
    <div class="card-header">
        Project Team Members
    </div>
    <div class="card-body">
        <asp:Label ID="lblTeamMembers" runat="server"></asp:Label>
    </div>
</div>

