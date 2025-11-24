<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WorkOrder.ascx.cs" Inherits="UserControl_WorkOrder" %>
<%--<table style="width: 700px">
    <tr>
        <td>
            <table class="tMainBorder" style="width: 99%">
                <tr>
                    <td class="cHeadTile" colspan="2">Work Plan</td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="OpenPDFHyperLink" runat="server" NavigateUrl="../../WorkOrder.pdf" Target="_blank">Open PDF into New Page</asp:HyperLink>
                    </td>
                    <td>Click
                            <asp:ImageButton ID="refreshPageImageButton" runat="server" ImageUrl="~/Images/Refresh.jpg" Width="20px" />
                        &nbsp;to refresh</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <iframe id="fileLoader" name="fileLoader" style="width: 99%; height: 436px" runat="server" scrolling="auto"></iframe>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>--%>
<asp:HiddenField ID="workOrderFileNameHF" runat="server" />
<div class="container p-0">
    <div class="card shadow-sm mb-3" style="max-width: 700px;">
        <div class="card-header bg-primary text-white">
            Work Plan
        </div>

        <div class="card-body">

            <div class="row mb-3">
                <div class="col-md-6 d-flex align-items-center">
                    <asp:HyperLink ID="OpenPDFHyperLink" 
                                   runat="server" 
                                   NavigateUrl="../../WorkOrder.pdf" 
                                   Target="_blank" 
                                   CssClass="fw-semibold text-decoration-none">
                        Open PDF into New Page
                    </asp:HyperLink>
                </div>

                <div class="col-md-6 d-flex align-items-center">
                    Click&nbsp;
                    <asp:ImageButton ID="refreshPageImageButton" 
                                     runat="server" 
                                     ImageUrl="~/Images/Refresh.jpg" 
                                     CssClass="img-fluid" 
                                     Width="20px" />
                    &nbsp;to refresh
                </div>
            </div>

            <div class="border rounded overflow-auto" style="height: 400px;">
                <iframe id="fileLoader" 
                        name="fileLoader" 
                        runat="server"
                        class="w-100 h-100 border-0"
                        scrolling="auto">
                </iframe>
            </div>
        </div>
        
    </div>
</div>


