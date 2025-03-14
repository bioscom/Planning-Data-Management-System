﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/LeanMasterPage.master" AutoEventWireup="true" CodeFile="MainReport.aspx.cs" Inherits="Report_MainReport" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table class="tMainBorder" style="width: 98%">
        <tr>
            <td class="cHeadTile">Project Charter</td>
        </tr>
        <tr>
            <td valign="top">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <asp:Panel ID="rptViewPanel" runat="server">
                    <rsweb:ReportViewer ID="rptViewer" runat="server" BorderColor="Black"
                        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="8pt"
                        Height="600px" Width="100%" ZoomMode="Percent">
                    </rsweb:ReportViewer>
                </asp:Panel>
            </td>
        </tr>
    </table>

</asp:Content>

