<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BI500.master" AutoEventWireup="true" CodeFile="AllBrightIdeas.aspx.cs" Inherits="App_BI500_AllBrightIdeas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headId" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    
    <ajaxToolkit:ToolkitScriptManager ID="smtAjaxManager" runat="Server" CombineScripts="false" EnablePartialRendering="true" />

    <div class="card shadow-sm mb-4">

    <!-- Title -->
    <div class="card-header fw-bold">
        Ideas Register
    </div>

    <!-- Body -->
    <div class="card-body">

        <!-- AJAX Toolkit Tabs -->
        <ajaxToolkit:TabContainer runat="server" ID="smtAjaxTabs" ActiveTabIndex="0">

            <!-- Ongoing Projects -->
            <ajaxToolkit:TabPanel runat="server" ID="pnlAwaiting" HeaderText="Ongoing Projects" Visible="true">
                <HeaderTemplate>
                    <div class="custom-tab-header">Pending Ideas</div>
                </HeaderTemplate>
                <ContentTemplate>
                    <bi500:oPndgRqst ID="oPndgRqst1" runat="server"></bi500:oPndgRqst>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>

            <!-- Approved Projects -->
            <ajaxToolkit:TabPanel runat="server" ID="pnlApproved" HeaderText="Approved Projects" Visible="true">
                <HeaderTemplate>
                    <div class="custom-tab-header">Approved Ideas</div>
                </HeaderTemplate>
                <ContentTemplate>
                    <bi500:oAprdgRqst ID="oAprdgRqst1" runat="server"></bi500:oAprdgRqst>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>

            <!-- Rejected Projects -->
            <ajaxToolkit:TabPanel runat="server" ID="pnlDiscontinued" HeaderText="Rejected Projects" Visible="true">
                <HeaderTemplate>
                    <div class="custom-tab-header">Rejected Ideas</div>
                </HeaderTemplate>
                <ContentTemplate>
                    <!-- Add your content here if needed -->
                </ContentTemplate>
            </ajaxToolkit:TabPanel>

        </ajaxToolkit:TabContainer>

    </div>
</div>

</asp:Content>

