<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewUsers.ascx.cs" Inherits="UserControls_ViewUsers" %>

<div class="card shadow-sm mb-4">
    <div class="card-header d-flex justify-content-between align-items-center">
        <span>Users List</span>
        <asp:HiddenField ID="appHF" runat="server" />
    </div>

    <div class="card-body">

        <!-- Top Buttons -->
        <div class="d-flex justify-content-between mb-3">
            <asp:LinkButton ID="lbAddNew" CssClass="btn btn-sm btn-secondary" runat="server"
                PostBackUrl="~/AddUser.aspx">
                Add New User
            </asp:LinkButton>

            <asp:LinkButton ID="lbAddC4CUsers" CssClass="btn btn-sm btn-secondary" runat="server"
                PostBackUrl="~/AddC4CUsers.aspx">
                Add C4C User
            </asp:LinkButton>
        </div>

        <!-- Filters -->
        <div class="row mb-3">

            <!-- Role Filter -->
            <div class="col-md-4">
                <asp:DropDownList ID="ddlUserRole" CssClass="form-select"
                    runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlUserRole_SelectedIndexChanged">
                    <asp:ListItem Value="-1">--Select User Role--</asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Search Box -->
            <div class="col-md-8">
                <div class="d-flex justify-content-end">

                    <div class="input-group" style="max-width: 350px;">
                        <span class="input-group-text">Find User</span>

                        <asp:TextBox ID="txtUser" CssClass="form-control" runat="server"></asp:TextBox>

                        <asp:ImageButton ID="searchButton" runat="server"
                            CssClass="input-group-text p-1"
                            ImageUrl="~/Images/gosearch.gif"
                            OnClick="searchButton_Click" />
                    </div>

                </div>
            </div>
        </div>

        <!-- GridView -->
        <div class="table-responsive">
           <asp:GridView ID="grdView" runat="server" AllowPaging="True"
                AllowSorting="True" AutoGenerateColumns="False"
                OnPageIndexChanged="grdView_PageIndexChanged"
                OnPageIndexChanging="grdView_PageIndexChanging"
                OnSorted="grdView_Sorted" OnSorting="grdView_Sorting" PageSize="40"
                Width="100%">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="...">
                        <ItemTemplate>
                            <asp:LinkButton ID="editLinkButton" runat="server"
                                CommandArgument="<%# Container.DisplayIndex %>" CommandName="EditThis"
                                OnClick="btnSelect_Click"
                                USERID='<%# DataBinder.Eval(Container.DataItem, "USERID") %>'
                                USERMAIL='<%# DataBinder.Eval(Container.DataItem, "EMAIL") %>'
                                USERNAME='<%# DataBinder.Eval(Container.DataItem, "USERNAME") %>'>Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Full Name" SortExpression="FULLNAME">
                        <ItemTemplate>
                            <asp:Label ID="labelFullName" runat="server"
                                Text='<%# DataBinder.Eval(Container.DataItem, "FULLNAME") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Role(s)" SortExpression="ROLES">
                        <ItemTemplate>
                            <asp:Label ID="labelRole" runat="server"
                                Text='<%# DataBinder.Eval(Container.DataItem, "ROLEID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email Address" SortExpression="EMAIL">
                        <ItemTemplate>
                            <a href='mailto:%20<%# DataBinder.Eval(Container.DataItem, "EMAIL") %>'>
                                <%# DataBinder.Eval(Container.DataItem, "EMAIL")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="...">
                        <ItemTemplate>
                            <asp:LinkButton ID="deleteLinkButton" runat="server"
                                CommandArgument="<%# Container.DisplayIndex %>" CommandName="DeleteThis"
                                OnClick="btnDelete_Click"
                                USERID='<%# DataBinder.Eval(Container.DataItem, "USERID") %>'
                                USERROLESID='<%# DataBinder.Eval(Container.DataItem, "ROLEID") %>'>Delete</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</div>
