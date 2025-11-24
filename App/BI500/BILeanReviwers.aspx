<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BI500.master" AutoEventWireup="true" CodeFile="BILeanReviwers.aspx.cs" Inherits="App_BI500_BILeanReviwers" %>

<%@ Register Src="UserControl/Search4LocalUser.ascx" TagName="Search4LocalUser" TagPrefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headId" runat="Server">
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentContentPlaceHolder" runat="Server">
</asp:Content>--%>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
   
    <div class="card col-md-8 shadow mb-4">
        <!-- Section 1: Business Improvement/Lean Team Reviewers -->
        <div class="card mb-3">
            <div class="card-header fw-bold">
                Business Improvement/Lean Team Reviewers
            </div>
            <div class="card-body">
                <uc3:Search4LocalUser ID="Reviewers" runat="server" />
                <%-- Optional old CheckBoxList
                <asp:CheckBoxList ID="revieweresCkbLst" runat="server" RepeatColumns="5">
                </asp:CheckBoxList>
                --%>
            </div>
            <div class="card-footer text-end">
                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" CssClass="btn btn-primary" />
            </div>
        </div>

        <!-- Section 2: GridView of Reviewers -->
        <div class="card">
            <div class="card-header fw-bold">
                Business Improvement/Lean Team Reviewers
            </div>
            <div class="card-body">
                <asp:GridView ID="grdView" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="20" CssClass="table table-striped table-bordered mb-0">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Members">
                            <ItemTemplate>
                                <asp:Label ID="labelManager" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FULLNAME") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton 
                                    ID="deleteLinkButton" 
                                    runat="server" 
                                    CommandArgument="<%# Container.DisplayIndex %>" 
                                    CommandName="DeleteThis" 
                                    OnClick="btnDelete_Click" 
                                    USERID='<%# DataBinder.Eval(Container.DataItem, "USERID") %>' 
                                    ValidationGroup="Remove"
                                    CssClass="btn btn-sm">
                                    Remove
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>

