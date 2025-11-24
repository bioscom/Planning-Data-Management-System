<%@ Control Language="C#" AutoEventWireup="true" CodeFile="oApprovalComment.ascx.cs" Inherits="App_BI500_UserControl_oApprovalComment" %>


<div class="card mb-1">
    <div class="card-header">
        <asp:Label ID="lblApproverRole" runat="server"></asp:Label>
    </div>
    <div class="card-body">
        <table style="width: 500px">
            <tr>
                <td style="width: 150px">
                    <asp:Label ID="lblSupportApprover" runat="server" Text="" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblApprover" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Status" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblStand" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="Comment" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblComment" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label12" runat="server" Text="Date Received" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblDateReceived" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label45" runat="server" Text="Date Reviewed" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblDateReviewed" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align:right">
                    <%--<asp:CheckBox ID="oCkb" runat="server" />--%>
                </td>
                <td>

                    <asp:Button ID="forwardReminderButton" runat="server" Text="Send Reminder"
                        OnClick="forwardReminderButton_Click" />

                    <asp:HiddenField ID="HFRole" runat="server" />

                </td>
            </tr>
        </table>
        
    </div>
</div>



