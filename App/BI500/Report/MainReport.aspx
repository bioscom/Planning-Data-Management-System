<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BI500.master" AutoEventWireup="true" CodeFile="MainReport.aspx.cs" Inherits="Report_MainReport" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headId" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="col-md-12 mb-4">
        <div class="card">
            <div class="card-header">
                Idea Report
            </div>
            <div class="card-body">
                <asp:Panel ID="rptViewPanel" runat="server">
                    <rsweb:ReportViewer ID="rptViewer" runat="server" BorderColor="Black"
                        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="8pt"
                        Height="600px" Width="100%" ZoomMode="Percent">
                    </rsweb:ReportViewer>
                </asp:Panel>
            </div>
        </div>
    </div>

</asp:Content>