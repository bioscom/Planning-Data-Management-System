<%@ Control Language="C#" AutoEventWireup="true" CodeFile="adminMenu.ascx.cs" Inherits="UserControl_adminMenu" %>

<div id="navigationM">
    <ul>
        <asp:Repeater runat="server" ID="menu" DataSourceID="MyDataSource" EnableViewState="False">
            <ItemTemplate>
                <li>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Url") %>'><%# Eval("Title") %></asp:HyperLink>

                    <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# ((SiteMapNode) Container.DataItem).ChildNodes %>'>
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <li>
                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("Url") %>'><%# Eval("Title") %></asp:HyperLink>
                                <asp:Repeater ID="Repeater3" runat="server" DataSource='<%# ((SiteMapNode) Container.DataItem).ChildNodes %>'>

                                    <HeaderTemplate>
                                        <ul>
                                    </HeaderTemplate>

                                    <ItemTemplate>
                                        <li>
                                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("Url") %>'><%# Eval("Title") %></asp:HyperLink>
                                        </li>
                                    </ItemTemplate>

                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </li>
                        </ItemTemplate>

                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
    <asp:SiteMapDataSource ID="MyDataSource" runat="server" ShowStartingNode="false" />
</div>
