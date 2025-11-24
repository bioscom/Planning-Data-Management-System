<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search4LocalUser.ascx.cs" Inherits="UserControl_userFinder_Search4LocalUser" %>

<%--<table>
    <tr>
        <td>
            <asp:DropDownList ID="drpUserx" runat="server" Width="200px">
                <asp:ListItem Selected="True" Value="-1">[Select User]</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtUserx" runat="server" MaxLength="25" Height="22px" Width="200px" ToolTip="Enter First Name or Last Name of the User to search"></asp:TextBox>

        </td>
        <td>
            <asp:ImageButton runat="Server" ID="imbEdit" ImageUrl="~/UserControls/btnEdit.png" CausesValidation="False" OnClick="imbEdit_Click" ToolTip="Reset" />
            <asp:ImageButton runat="Server" ID="imbFind" ImageUrl="~/UserControls/btnFind.png" CausesValidation="False" OnClick="imbFind_Click" ToolTip="Click to search for user" />
            <asp:CompareValidator ID="valdtUserRequired" runat="server" ErrorMessage="User is required" ControlToValidate="drpUserx" Operator="NotEqual" Type="Integer" ValueToCompare="-1">*</asp:CompareValidator>
        </td>
    </tr>
</table>--%>

<div class="input-group" style="max-width: 500px;">

    <!-- DROPDOWN -->
    <asp:DropDownList ID="drpUserx" runat="server" CssClass="form-select" Width="180px">
        <asp:ListItem Selected="True" Value="-1">[Select User]</asp:ListItem>
    </asp:DropDownList>

    <!-- TEXTBOX -->
    <asp:TextBox ID="txtUserx" runat="server" CssClass="form-control" MaxLength="25"
        Width="180px" ToolTip="Enter First Name or Last Name of the User to search">
    </asp:TextBox>

    <!-- EDIT BUTTON -->
    <span class="input-group-text p-0">
        <asp:ImageButton runat="Server" ID="imbEdit" ImageUrl="~/UserControls/btnEdit.png" CausesValidation="False" OnClick="imbEdit_Click"
            ToolTip="Reset" CssClass="border-0 bg-transparent" Height="32px" />
    </span>

    <!-- FIND BUTTON -->
    <span class="input-group-text p-0">
        <asp:ImageButton runat="Server" ID="imbFind" ImageUrl="~/UserControls/btnFind.png" CausesValidation="False" OnClick="imbFind_Click"
            ToolTip="Click to search for user" CssClass="border-0 bg-transparent" Height="32px" />
    </span>
    <asp:CompareValidator ID="valdtUserRequired" runat="server" ErrorMessage="User is required" ControlToValidate="drpUserx" Operator="NotEqual" Type="Integer" ValueToCompare="-1">*</asp:CompareValidator>

</div>
