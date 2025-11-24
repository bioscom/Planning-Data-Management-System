<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/siteMaster.master" AutoEventWireup="true" CodeFile="AssignAssetsToGM.aspx.cs" Inherits="App_FlareWaiver_AssignAssetsToGM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headId" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card mb-4">
        <div class="card-header">
            Assign Asset to GM Offshore/GM Onshore
        </div>
        <div class="card-body">
            <asp:DropDownList ID="drpGMOnOffShore" Width="300px" CssClass="form-select" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpGMOnOffShore_SelectedIndexChanged">
                <asp:ListItem Value="-1">--Select GM Offshore/GM Onshore--</asp:ListItem>
            </asp:DropDownList>
            <hr />
            <asp:CheckBoxList ID="facilitiesCheckBoxList" runat="server" RepeatColumns="5">
            </asp:CheckBoxList>
            <hr />
        </div>
        <div class="card-footer">
            <asp:Button ID="submitButton" runat="server" OnClick="submitButton_Click" Text="Submit" Width="100px" />
        </div>
    </div>
</asp:Content>
