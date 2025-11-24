<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OrganisationStructMgr.ascx.cs" Inherits="App_BI500_UserControl_OrganisationStructMgr" %>

<div class="col-md-12 mb-4">
    <div class="card">
        <div class="card-header">
            Business Organisational Structure
        </div>
        <div class="card-body">
            <div style="float: left; width:100%">
                <div class="row"> 
                    <div class="col-4"> 
                        <div class="card">
                            <div class="card-header">
                                List Structure
                            </div>
                            <div class="card-body">
                                <asp:TreeView ID="mnuTreeView" runat="server" OnSelectedNodeChanged="mnuTreeView_SelectedNodeChanged" ImageSet="Arrows" ExpandDepth="1" ShowLines="True">
                                    <ParentNodeStyle Font-Bold="True" />
                                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
                                    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                                </asp:TreeView>
                            </div>
                        </div>
                    </div>

                    <div class="col-8"> 
                        <asp:Panel ID="pnlDepartment" Visible="false" runat="server">
                            <div class="card">
                                <div class="card-header">
                                    <asp:Label ID="lblBusinessUnit" runat="server"></asp:Label>
                                </div>
                                <div class="card-body">
                                    <asp:Label ID="Label1" runat="server" Text="Department:"></asp:Label>
                                    <asp:TextBox ID="txtDepartment" runat="server" Width="250px"></asp:TextBox>
                                </div>
                                <div class="card-footer">
                                    <asp:LinkButton ID="lnkAddDepartment" runat="server" OnClick="lnkAddDepartment_Click">Add New Department</asp:LinkButton>
                                </div>
                            </div>
                        </asp:Panel>

                        <asp:Panel ID="pnlTeam" Visible="false" runat="server">
                            <div class="card">
                                <div class="card-header">
                                    <asp:Label ID="lblDepartment" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="card-body">
                                    <asp:Label ID="Label2" runat="server" Text="Team:"></asp:Label>
                                    <asp:TextBox ID="txtTeam" runat="server" Width="250px"></asp:TextBox>
                                </div>
                                <div class="card-footer">
                                   <asp:LinkButton ID="lnkAddTeam" runat="server" OnClick="lnkAddTeam_Click">Add New Team</asp:LinkButton>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>

