<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BI500.master" AutoEventWireup="true" CodeFile="MyBrightIdeas.aspx.cs" Inherits="App_BI500_MyBrightIdeas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headId" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <%--<table class="tMainBorder" style="width: 98%">
        <tr>
            <td class="cHeadTile">My Bright Ideas</td>
        </tr>
        <tr>
            <td>
                <ajaxToolkit:ToolkitScriptManager ID="smtAjaxManager" runat="Server" CombineScripts="false" EnablePartialRendering="true" />
                <div style="color: Black; margin-top: 2px; width: 99%">
                    <asp:UpdatePanel ID="uppAjaxBloc" runat="server">
                        <ContentTemplate>
                            <ajaxToolkit:TabContainer runat="server" ID="smtAjaxTabs" ActiveTabIndex="0" Width="100%">

                                <ajaxToolkit:TabPanel runat="server" ID="pnlAwaiting" HeaderText="Ongoing Projects" Visible="true">
                                    <HeaderTemplate>
                                        Pending Bright Ideas
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <bi500:oMyPndgRqst ID="oMyPndgRqst1" runat="server"></bi500:oMyPndgRqst>
                                    </ContentTemplate>
                                </ajaxToolkit:TabPanel>

                                <ajaxToolkit:TabPanel runat="server" ID="pnlApproved" HeaderText="Approved Projects" Visible="true">
                                    <HeaderTemplate>
                                        Approved Bright Ideas
                                    </HeaderTemplate>
                                    <ContentTemplate>

                                        <bi500:oMyAprdgRqst ID="oMyAprdgRqst1" runat="server"></bi500:oMyAprdgRqst>

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

    <!-- Card Container -->
<div class="card shadow mb-4">
    <div class="card-header fw-bold">
        My Bright Ideas
    </div>

    <div class="card-body">
        <!-- ScriptManager preserved -->
        <ajaxToolkit:ToolkitScriptManager ID="smtAjaxManager" runat="Server" CombineScripts="false" EnablePartialRendering="true" />
        <!-- UpdatePanel preserved -->
        <asp:UpdatePanel ID="uppAjaxBloc" runat="server">
            <ContentTemplate>

                <!-- TabContainer preserved -->
                <ajaxToolkit:TabContainer runat="server" ID="smtAjaxTabs" ActiveTabIndex="0" Width="100%">

                    <!-- Panel 1 -->
                    <ajaxToolkit:TabPanel runat="server" ID="pnlAwaiting" HeaderText="Ongoing Projects" Visible="true">
                        <HeaderTemplate>Pending Bright Ideas</HeaderTemplate>
                        <ContentTemplate>
                            <bi500:oMyPndgRqst ID="oMyPndgRqst1" runat="server" />
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>

                    <!-- Panel 2 -->
                    <ajaxToolkit:TabPanel runat="server" ID="pnlApproved" HeaderText="Approved Projects" Visible="true">
                        <HeaderTemplate>Approved Bright Ideas</HeaderTemplate>
                        <ContentTemplate>
                            <bi500:oMyAprdgRqst ID="oMyAprdgRqst1" runat="server" />
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>

                    <!-- Panel 3 -->
                    <ajaxToolkit:TabPanel runat="server" ID="pnlDiscontinued" HeaderText="Rejected Projects" Visible="true">
                        <HeaderTemplate>Rejected Bright Ideas</HeaderTemplate>
                        <ContentTemplate>
                        </ContentTemplate>
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

