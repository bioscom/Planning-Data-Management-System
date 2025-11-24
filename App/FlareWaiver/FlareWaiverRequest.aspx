<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="FlareWaiverRequest.aspx.cs" Inherits="FlareWaiverRequest" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Src="WorkOrder.ascx" TagName="WorkOrder" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <!-- Please, jQuery must be loaded first -->
    <script language="javascript" type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script language="javascript" type="text/javascript" src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

    <!-- Bootstrap 5 CSS -->
    <link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>

    <link href="../../CSS/FlareWaiverStyles.css" type="text/css" rel="stylesheet" media="screen" />
    <script language="javascript" type="text/javascript" src="../../JavaScript/MyScript.js"></script>
</head>
<body onload="radalert('If this request is already captured in the current years business plan, kindly select Captured in Business Plan. Otherwise, select Not Captured in Business Plan', 330, 180, 'Client RadAlert', alertCallBackFn, $dialogsDemo.imgUrl);  return false;">
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
            </Scripts>
        </telerik:RadScriptManager>

        <div class="container-fluid mt-3">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <!-- LEFT SIDE FORM -->
                        <div class="card col-6 shadow-sm">
                            <div class="card-header bg-secondary text-white fw-bold">
                                Flare Waiver
                            </div>

                            <div class="card-body">
                                <div class="card mb-1">
                                    <div class="card-body">
                                        <!-- Line Manager -->
                                        <div class="row mb-1">
                                            <label class="col-sm-3 col-form-label">
                                                <asp:Label ID="Label2" runat="server" Text="Line Manager:"></asp:Label>
                                                <asp:CompareValidator ID="CompareValidator3" runat="server"
                                                    ControlToValidate="ddlManager" ErrorMessage="Select Line Manager"
                                                    Operator="NotEqual" Type="Integer" ValueToCompare="-1">*</asp:CompareValidator>
                                            </label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="ddlManager" CssClass="form-select" Width="100%" runat="server">
                                                    <asp:ListItem Value="-1">Select Line Manager</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <!-- Category -->
                                        <div class="row mb-1">
                                            <label class="col-sm-3 col-form-label">
                                                <asp:Label ID="Label1" runat="server" Text="Category:"></asp:Label>
                                                <asp:CompareValidator ID="CompareValidator1" runat="server"
                                                    ControlToValidate="ddlCategory" ErrorMessage="Select Category"
                                                    Operator="NotEqual" Type="Integer" ValueToCompare="-1">*</asp:CompareValidator>
                                            </label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="ddlCategory" CssClass="form-select" Width="100%" runat="server">
                                                    <asp:ListItem Value="-1">Select Category</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <!-- In/Out BP -->
                                        <div class="row mb-1">
                                            <label class="col-sm-3 col-form-label">
                                                <asp:Label ID="Label109" runat="server" Text="In/Out BP:"></asp:Label>
                                                <asp:CompareValidator ID="CompareValidator4" runat="server"
                                                    ControlToValidate="ddlSchedule" ErrorMessage="Select In/Out BP"
                                                    Operator="NotEqual" Type="Integer" ValueToCompare="-1">*</asp:CompareValidator>
                                            </label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="ddlSchedule" CssClass="form-select" Width="100%" runat="server">
                                                    <asp:ListItem Value="-1">Select Business Plan</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card mb-1">
                                    <div class="card-body">
                                        <!-- Facilities -->
                                        <div class="mb-2">
                                            <asp:Label ID="Label108" runat="server" Text="Facilities Impacted:"></asp:Label>
                                        </div>

                                        <div class="border rounded p-2 mb-1 no-wrap" style="height: 200px; overflow-y: auto;">
                                            <asp:CheckBoxList ID="facilitiesCkbLst" runat="server" RepeatColumns="4">
                                            </asp:CheckBoxList>
                                        </div>
                                    </div>
                                </div>


                                <div class="card mb-2">
                                    <div class="card-body">
                                        <!-- Start / End Date & Time -->
                                        <div class="row col-sm-12 mb-1">
                                            <div class="col-sm-3">
                                                <asp:Label ID="Label3" runat="server" Text="Start Date/Time:"></asp:Label>
                                            </div>
                                            <div class="col-sm-5">
                                                <telerik:RadDatePicker RenderMode="Lightweight" ID="dtStartDate" runat="server"></telerik:RadDatePicker>
                                            </div>

                         
                                            <div class="col-sm-4">
                                                <telerik:RadTimePicker RenderMode="Lightweight" ID="startTime" runat="server"></telerik:RadTimePicker>
                                            </div>
                                        </div>

                                        <div class="row col-sm-12 mb-1">
                                            <div class="col-sm-3">
                                                <asp:Label ID="Label4" runat="server" Text="End Date/Time:"></asp:Label>
                                            </div>
                                            <div class="col-sm-5">
                                                <telerik:RadDatePicker RenderMode="Lightweight" ID="dtEndDate" runat="server"></telerik:RadDatePicker>
                                            </div>

                              
                                            <div class="col-sm-4">
                                                <telerik:RadTimePicker RenderMode="Lightweight" ID="endTime" runat="server"></telerik:RadTimePicker>
                                            </div>
                                        </div>

                                        <!-- Flare Volume -->
                                        <div class="row mb-1">
                                            <label class="col-sm-3 col-form-labe">
                                                <asp:Label ID="Label6" runat="server" Text="Flare (or AG):"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                    ControlToValidate="txtVolume" ErrorMessage="Flare Volume is required">*</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                                    ControlToValidate="txtVolume" ErrorMessage="Invalid value."
                                                    ValidationExpression="\d+(\.\d{1,2})?">*</asp:RegularExpressionValidator>
                                            </label>
                                            <div class="col-sm-9">
                                                <asp:TextBox ID="txtVolume" CssClass="form-control d-inline-block w-auto" runat="server"></asp:TextBox>
                                                Volume (mmscfd)
                                            </div>
                                        </div>

                                        <!-- Oil -->
                                        <div class="row">
                                            <label class="col-sm-3 col-form-label">
                                                <asp:Label ID="Label7" runat="server" Font-Size="12px" Text="Ass. Oil Production:"></asp:Label>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                    ControlToValidate="txtOil" ValidationExpression="\d+(\.\d{1,2})?"
                                                    ErrorMessage="Invalid value">*</asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                    ControlToValidate="txtOil" ErrorMessage="Required">*</asp:RequiredFieldValidator>
                                            </label>
                                            <div class="col-sm-9">
                                                <asp:TextBox ID="txtOil" CssClass="form-control d-inline-block w-auto" runat="server"></asp:TextBox>
                                                (mbopd)
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Reason -->
                                <div class="card mb-2">
                                    <div class="card-header">
                                        <asp:Label ID="Label8" runat="server" Text="Reason for Flaring:"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                            ControlToValidate="txtReason" ErrorMessage="Required">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="card-body">
                                        <asp:TextBox ID="txtReason" CssClass="form-control" TextMode="MultiLine" Height="100px" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                              
                                <!-- Justification -->
                                <div class="card mb-2">
                                    <div class="card-header">
                                        <asp:Label ID="Label9" runat="server" Text="Justification for Waiver Request:"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                            ControlToValidate="txtJustification" ErrorMessage="Required">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="card-body">
                                        <asp:TextBox ID="txtJustification" CssClass="form-control" TextMode="MultiLine" Height="100px" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <!-- Post Event -->
                                <div class="card">
                                    <div class="card-header">
                                        <asp:Label ID="Label10" runat="server" Text="Post event actions to remain compliant:"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                            ControlToValidate="txtPostEvent" ErrorMessage="Required">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="card-body">
                                        <asp:TextBox ID="txtPostEvent" CssClass="form-control" TextMode="MultiLine" Height="100px" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- RIGHT SIDE WORK ORDER + FILE -->
                        <div class="card col-6 shadow-sm">
                            <div class="card-header bg-secondary text-white fw-bold">
                                Attach Work Plan
                            </div>

                            <div class="card-body">
                                <uc1:WorkOrder ID="WorkOrder1" runat="server" />
                            </div>
                             <div class="card-footer">
                                <div class="row">
                                   <div class="col-sm-4 col-form-label">
                                       <asp:Label ID="Label107" runat="server" CssClass="fw-bold" Text="Upload Work Plan:"></asp:Label>
                                   </div>
                                   <div class="col-sm-6">
                                       <asp:FileUpload ID="UploadFile" CssClass="form-control mb-2" runat="server" />
                                   </div>
                                   <div class="col-sm-2">
                                       <asp:Button ID="btnUpload" runat="server" Text="Upload"
                                           CssClass="btn btn-primary btn-sm" ValidationGroup="upload" />
                                   </div>
                               </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                     <!-- SUBMIT BUTTONS -->
                     <div class="text-center">
                         <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success px-4 me-3" />
                         <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn btn-danger px-4" />
                     </div>
                </div>
            </div>
        </div>
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
        <br />
    </form>
</body>
</html>
