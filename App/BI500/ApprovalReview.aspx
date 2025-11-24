<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BI500.master" AutoEventWireup="true" CodeFile="ApprovalReview.aspx.cs" Inherits="App_BI500_ApprovalReview" %>

<%@ Register Src="~/App/BI500/UserControl/oRequestsPendingMyApproval.ascx" TagPrefix="app" TagName="oRequestsPendingMyApproval" %>


<asp:Content ID="Content1" ContentPlaceHolderID="headId" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <ajaxToolkit:ToolkitScriptManager ID="smtAjaxManager" runat="Server" CombineScripts="false" EnablePartialRendering="true" />

    <%--<table class="tMainBorder">
        <tr>
            <td class="cHeadTile">Bright Ideas Pending My Review/Support/Approval</td>
        </tr>
        <tr>
            <td>
                <div style="color: Black; margin-top: 2px; width: 99%">
                    <asp:UpdatePanel ID="uppAjaxBloc" runat="server">
                        <ContentTemplate>
                            <ajaxToolkit:TabContainer runat="server" ID="smtAjaxTabs" ActiveTabIndex="0" Width="100%">

                                <ajaxToolkit:TabPanel runat="server" ID="pnlAwaiting" HeaderText="Ongoing Projects" Visible="true">
                                    <HeaderTemplate>
                                        Pending Bright Ideas
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <%--<bi500:oPndgRqst ID="oPndgRqst1" runat="server"></bi500:oPndgRqst>--%

                                        <app:oRequestsPendingMyApproval runat="server" ID="oRequestsPendingMyApproval" />

                                    </ContentTemplate>
                                </ajaxToolkit:TabPanel>

                                <ajaxToolkit:TabPanel runat="server" ID="pnlApproved" HeaderText="Approved Projects" Visible="true">
                                    <HeaderTemplate>
                                        Approved Bright Ideas
                                    </HeaderTemplate>
                                    <ContentTemplate>

                                        <bi500:oAprdgRqst ID="oAprdgRqst1" runat="server"></bi500:oAprdgRqst>

                                    </ContentTemplate>
                                </ajaxToolkit:TabPanel>

                                <ajaxToolkit:TabPanel runat="server" ID="pnlDiscontinued" HeaderText="Rejected Projects" Visible="true">
                                    <HeaderTemplate>
                                        Rejected Bright Ideas
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                    </ContentTemplate>
                                </ajaxToolkit:TabPanel>

                            </ajaxToolkit:TabContainer>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <asp:Label runat="server" ID="CurrentTab" />
                    <asp:Label runat="server" ID="Messages" />
                </div>
            </td>
        </tr>
    </table>--%>

    <!-- Bootstrap Card Wrapper -->
<div class="card shadow mb-4">
    <div class="card-header fw-bold">
        Bright Ideas Pending My Review/Support/Approval
    </div>

    <div class="card-body">
        <!-- ASP.NET UpdatePanel preserved -->
        <asp:UpdatePanel ID="uppAjaxBloc" runat="server">
            <ContentTemplate>

                <!-- AjaxControlToolkit Tab Container preserved -->
                <ajaxToolkit:TabContainer runat="server" ID="smtAjaxTabs" ActiveTabIndex="0" Width="100%">

                    <!-- Pending Tab -->
                    <ajaxToolkit:TabPanel runat="server" ID="pnlAwaiting" HeaderText="Ongoing Projects" Visible="true">
                        <HeaderTemplate>Pending Bright Ideas</HeaderTemplate>
                        <ContentTemplate>

                            <!-- Your original user control preserved -->
                            <app:oRequestsPendingMyApproval runat="server" ID="oRequestsPendingMyApproval" />

                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>

                    <!-- Approved Tab -->
                    <ajaxToolkit:TabPanel runat="server" ID="pnlApproved" HeaderText="Approved Projects" Visible="true">
                        <HeaderTemplate>Approved Bright Ideas</HeaderTemplate>
                        <ContentTemplate>

                            <bi500:oAprdgRqst ID="oAprdgRqst1" runat="server" />

                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>

                    <!-- Rejected Tab -->
                    <ajaxToolkit:TabPanel runat="server" ID="pnlDiscontinued" HeaderText="Rejected Projects" Visible="true">
                        <HeaderTemplate>Rejected Bright Ideas</HeaderTemplate>
                        <ContentTemplate></ContentTemplate>
                    </ajaxToolkit:TabPanel>

                </ajaxToolkit:TabContainer>

            </ContentTemplate>
        </asp:UpdatePanel>

        <!-- Labels preserved -->
        <asp:Label runat="server" ID="CurrentTab" CssClass="d-block mt-3" />
        <asp:Label runat="server" ID="Messages" CssClass="d-block mt-1 text-danger" />
    </div>
</div>

</asp:Content>

