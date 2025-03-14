﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Security.Application;

//public partial class App_BI500_UserControl_BrightIdeaOnBehalfEdt : System.Web.UI.UserControl
//{
//    protected void Page_Load(object sender, EventArgs e)
//    {

//    }
//}

public partial class App_BI500_UserControl_BrightIdeaOnBehalfEdt : aspnetUserControl
{
    FunctionMgt oFunctionMgt = new FunctionMgt();
    BenefitsMgt oBenefitsMgt = new BenefitsMgt();
    appUsersHelper oappUsersHelper = new appUsersHelper();
    CostReductionRequest oBI500Request = new CostReductionRequest();
    BI500RequestHelper oBI500RequestHelper = new BI500RequestHelper();

    BI500RequestOnBehalf o = new BI500RequestOnBehalf();
    BI500RequestOnBehalfHelper oL = new BI500RequestOnBehalfHelper();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void Page_Init()
    {
        if (!IsPostBack)
        {
            List<Benefits> oBenefits = oBenefitsMgt.lstBenefits();
            foreach (Benefits oBenefit in oBenefits)
            {
                drpBenefit.Items.Add(new ListItem(oBenefit.m_sBenefit, oBenefit.m_iBenefitId.ToString()));
            }

            //Business Unit
            List<Functions> Functions = oFunctionMgt.lstGetFunctions();
            foreach (Functions Function in Functions)
            {
                if (Function.m_sFunction.ToUpper() != "N/A".ToUpper())
                {
                    drpBuzUnit.Items.Add(new ListItem(Function.m_sFunction, Function.m_iFunctionId.ToString()));
                }
            }

            sponsor.editMode();
            champion.editMode();
            LeanFocalPoint.editMode();

            if (Request.QueryString["RequestId"] != null)
            {
                long lRequestId = long.Parse(Encoder.HtmlEncode(Request.QueryString["RequestId"].ToString()));
                oBI500Request = oBI500RequestHelper.objGetBrightIdeaById(lRequestId);

                appUsers oChampion = appUsersHelper.objGetUserByUserId(oBI500Request.iProjectChampionUserId);
                appUsers oLeanFocalPoint = appUsersHelper.objGetUserByUserId(oBI500Request.iFocalPointUserId);
                appUsers oSponsor = appUsersHelper.objGetUserByUserId(oBI500Request.iProjectSponsorUserId);

                sponsor.thisDropDownList.Items.Add(new ListItem(oSponsor.m_sFullName, oSponsor.m_iUserId.ToString()));
                champion.thisDropDownList.Items.Add(new ListItem(oChampion.m_sFullName, oChampion.m_iUserId.ToString()));
                LeanFocalPoint.thisDropDownList.Items.Add(new ListItem(oLeanFocalPoint.m_sFullName, oLeanFocalPoint.m_iUserId.ToString()));

                sponsor.thisDropDownList.SelectedValue = oSponsor.m_iUserId.ToString();
                champion.thisDropDownList.SelectedValue = oChampion.m_iUserId.ToString();
                LeanFocalPoint.thisDropDownList.SelectedValue = oLeanFocalPoint.m_iUserId.ToString();

                BI500RequestOnBehalf oBhlf = oL.objGetBrightIdeaOnbehalfById(lRequestId);
                txtEmailAddress.Text = oBhlf.sEmailAddress;
                txtFullname.Text = oBhlf.sFullName;
                
                txtBizCase.Text = Encoder.HtmlEncode(oBI500Request.sBusinessCase);
                txtProjectTitle.Text = Encoder.HtmlEncode(oBI500Request.sTitle);
                txtOpportunityStmt.Text = Encoder.HtmlEncode(oBI500Request.sOpportunityStmt);
                drpBenefit.SelectedValue = Encoder.HtmlEncode(oBI500Request.iBenefitId.ToString());
                drpBuzUnit.SelectedValue = Encoder.HtmlEncode(oBI500Request.iFunctionId.ToString());

                ddlDepartment.Items.Clear();
                ddlDepartment.Items.Add(new ListItem("Select Department", "-1"));
                List<BIDepartments> oDepts = BIDepartments.lstGetDeparmentsByFunction(oBI500Request.iFunctionId);
                foreach (BIDepartments o in oDepts)
                {
                    ddlDepartment.Items.Add(new ListItem(o.m_sDepartment, o.m_iDepartmentId.ToString()));
                }

                ddlDepartment.SelectedValue = Encoder.HtmlEncode(oBI500Request.iDeptId.ToString());

                ddlTeam.Items.Clear();
                ddlTeam.Items.Add(new ListItem("Select Team", "-1"));
                List<BITeams> oTeams = BITeams.lstGetTeamsByDepartment(oBI500Request.iDeptId);
                foreach (BITeams o in oTeams)
                {
                    ddlTeam.Items.Add(new ListItem(o.m_sTeam, o.m_iTeamId.ToString()));
                }

                ddlTeam.SelectedValue = Encoder.HtmlEncode(oBI500Request.iTeamId.ToString());
                dtCompletion.dtSetDate(oBI500Request.dCompletionDate);
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["RequestId"] != null)
        {
            long lRequestId = long.Parse(Encoder.HtmlEncode(Request.QueryString["RequestId"].ToString()));

            if (string.IsNullOrEmpty(HFRequestId.Value) || (long.Parse(HFRequestId.Value) == 0))
            {
                if (sponsor.thisDropDownList.SelectedValue == champion.thisDropDownList.SelectedValue)
                    ajaxWebExtension.showJscriptAlert(Page, this, "Sorry, " + sponsor.thisDropDownList.SelectedItem.Text + ", cannot play dual role. Please select different actors. Thank you.");
                else if (LeanFocalPoint._SelectedValue == "-1")
                    ajaxWebExtension.showJscriptAlert(Page, this, "Please select the Lean Focal Point.");
                else if (champion._SelectedValue == "-1")
                    ajaxWebExtension.showJscriptAlert(Page, this, "Please select the Project Champion.");
                else if (sponsor._SelectedValue == "-1")
                    ajaxWebExtension.showJscriptAlert(Page, this, "Please select the Project Sponsor.");
                else
                {

                    oBI500Request.lRequestId = lRequestId;
                    oBI500Request.dCompletionDate = dtCompletion.dtSelectedDate;
                    oBI500Request.iBenefitId = int.Parse(drpBenefit.SelectedValue);
                    oBI500Request.iFocalPointUserId = int.Parse(LeanFocalPoint._SelectedValue);

                    oBI500Request.iFunctionId = int.Parse(drpBuzUnit.SelectedValue);
                    oBI500Request.iDeptId = int.Parse(ddlDepartment.SelectedValue);
                    oBI500Request.iTeamId = int.Parse(ddlTeam.SelectedValue);

                    oBI500Request.iProjectChampionUserId = int.Parse(champion._SelectedValue);
                    oBI500Request.iProjectSponsorUserId = int.Parse(sponsor._SelectedValue);
                    oBI500Request.iUserId = oSessnx.getOnlineUser.m_iUserId;
                    oBI500Request.sBusinessCase = txtBizCase.Text;
                    oBI500Request.sOpportunityStmt = txtOpportunityStmt.Text;
                    oBI500Request.sTitle = txtProjectTitle.Text;

                    bool bRet = oBI500RequestHelper.UpdateBI500Request(oBI500Request);
                    if (bRet)
                    {
                        // ------  Begin Update Onbehalf of someone  --------

                        o.lRequestId = lRequestId;
                        o.sFullName = txtFullname.Text;
                        o.sEmailAddress = txtEmailAddress.Text;

                        oL.UpdateOnBehalf(o);

                        // ------  End Update Onbehalf  --------


                        //Check if request exists in the approval table.
                        //if it exists, run reroute.
                        //if it does not, run forward to approvers.
                        System.Data.DataTable dt = BI500ApprovalHelper.dtGetBIApprovalbyRequestId(lRequestId);
                        if (dt.Rows.Count > 0)
                        {
                            bRet = oBI500RequestHelper.RouteRequestWithinApprovers(lRequestId, (int)appUsersRolesBI500.userRole.champion, int.Parse(champion._SelectedValue));
                            if (bRet)
                            {
                                //TODO: review the Logic here......
                                //Send email to the selected Project Champion, that he/she has a pending Bright Idea for review/approval and copy the Initiator
                                oBI500Request = oBI500RequestHelper.objGetBrightIdeaById(lRequestId);

                                sendMailBI500 oSendMail = new sendMailBI500(oSessnx.getOnlineUser.structUserIdx);
                                List<structUserMailIdx> oReceivers = new List<structUserMailIdx>();
                                oReceivers.Add(oappUsersHelper.objGetUserByUserID(int.Parse(champion._SelectedValue)).structUserIdx);
                                oReceivers.Add(oappUsersHelper.objGetUserByUserID(int.Parse(sponsor._SelectedValue)).structUserIdx);
                                oReceivers.Add(new structUserMailIdx("", AppConfiguration.productionBIFunctionalAccount, ""));
                                oReceivers.Add(new structUserMailIdx("", o.sEmailAddress, ""));

                                oSendMail.ForwardRequestForSupportApproval(oBI500Request, oReceivers, oSessnx.getOnlineUser.structUserIdx);

                                //Response.Redirect("~/App/BI500/Default.aspx");
                                ajaxWebExtension.showJscriptAlert(Page, this, "Bright Idea successfully submitted.");
                            }
                            else
                            {
                                ajaxWebExtension.showJscriptAlert(Page, this, "Bright Idea not submitted. Try again!!!");
                            }
                        }
                        else
                        {
                            bRet = oBI500RequestHelper.AssignRequestToNextApprover(lRequestId, (int)appUsersRolesBI500.userRole.champion, int.Parse(champion._SelectedValue));

                            //Assign the request to the BI Team into the RequestApproval(Workflow) Table
                            bRet = oBI500RequestHelper.AssignRequestToNextApprover(lRequestId, (int)appUsersRolesBI500.userRole.BusinessImprovementTeam);
                            if (bRet)
                            {
                                oBI500RequestHelper.UpdateRequestStatus(lRequestId, (int)BIRequestStatus.RequestStatusRpt.AwaitsBusinessImprovementOrProjectChampionApproval);

                                List<structUserMailIdx> oReceivers = new List<structUserMailIdx>();
                                oReceivers.Add(oappUsersHelper.objGetUserByUserID(int.Parse(champion._SelectedValue)).structUserIdx);
                                oReceivers.Add(new structUserMailIdx("", AppConfiguration.productionBIFunctionalAccount, ""));

                                //Send email to the selected Project Champion (who is the supervisor of the requestor), 
                                //that he/she has a pending Bright Idea for review/approval and copy the Initiator
                                //TODO: Get the list of people defined in the Reviewers list and copy them this mail. Thefunctional account maynot really sail through.
                                oBI500Request = oBI500RequestHelper.objGetBrightIdeaById(lRequestId);

                                sendMailBI500 oSendMail = new sendMailBI500(oSessnx.getOnlineUser.structUserIdx);
                                oSendMail.ForwardRequestForSupportApproval(oBI500Request, oReceivers, oSessnx.getOnlineUser.structUserIdx);

                                ajaxWebExtension.showJscriptAlert(Page, this, "Bright Idea successfully submitted.");
                            }
                        }
                    }
                }
            }
            else
            {
                ajaxWebExtension.showJscriptAlert(Page, this, "Not Successful, try again later.");
            }
        }
    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/App/BI500/MyBrightIdeas.aspx");
    }

    private void Clear()
    {
        //dtCompletion.dtSelectedDate;
        drpBenefit.ClearSelection();
        //drpFocalPoint.ClearSelection();
        drpBuzUnit.ClearSelection();
        //champion.thisDropDownList.ClearSelection();
        //Sponsor.thisDropDownList.ClearSelection();
        txtBizCase.Text = "";
        txtOpportunityStmt.Text = "";
        txtProjectTitle.Text = "";
    }
    protected void btnDraft_Click(object sender, EventArgs e)
    {
        //Call update function
        if (Request.QueryString["RequestId"] != null)
        {
            long lRequestId = long.Parse(Encoder.HtmlEncode(Request.QueryString["RequestId"].ToString()));


            if (string.IsNullOrEmpty(HFRequestId.Value) || (long.Parse(HFRequestId.Value) == 0))
            {
                if (sponsor.thisDropDownList.SelectedValue == champion.thisDropDownList.SelectedValue)
                    ajaxWebExtension.showJscriptAlert(Page, this, "Sorry, " + sponsor.thisDropDownList.SelectedItem.Text + ", cannot play dual role. Please select different actors. Thank you.");
                else if (LeanFocalPoint._SelectedValue == "-1")
                    ajaxWebExtension.showJscriptAlert(Page, this, "Please select the Lean Focal Point.");
                else if (champion._SelectedValue == "-1")
                    ajaxWebExtension.showJscriptAlert(Page, this, "Please select the Project Champion.");
                else if (sponsor._SelectedValue == "-1")
                    ajaxWebExtension.showJscriptAlert(Page, this, "Please select the Project Sponsor.");
                else
                {
                    oBI500Request.lRequestId = lRequestId;
                    oBI500Request.dCompletionDate = dtCompletion.dtSelectedDate;
                    oBI500Request.iBenefitId = int.Parse(drpBenefit.SelectedValue);
                    oBI500Request.iFocalPointUserId = int.Parse(LeanFocalPoint._SelectedValue);

                    oBI500Request.iFunctionId = int.Parse(drpBuzUnit.SelectedValue);
                    oBI500Request.iDeptId = int.Parse(ddlDepartment.SelectedValue);
                    oBI500Request.iTeamId = int.Parse(ddlTeam.SelectedValue);

                    oBI500Request.iProjectChampionUserId = int.Parse(champion._SelectedValue);
                    oBI500Request.iProjectSponsorUserId = int.Parse(sponsor._SelectedValue);
                    oBI500Request.iUserId = oSessnx.getOnlineUser.m_iUserId;
                    oBI500Request.sBusinessCase = txtBizCase.Text;
                    oBI500Request.sOpportunityStmt = txtOpportunityStmt.Text;
                    oBI500Request.sTitle = txtProjectTitle.Text;

                    bool bRet = oBI500RequestHelper.UpdateBI500Request(oBI500Request);

                    if (bRet)
                    {
                        // ------  Begin Update Onbehalf of someone  --------

                        o.lRequestId = lRequestId;
                        o.sFullName = txtFullname.Text;
                        o.sEmailAddress = txtEmailAddress.Text;

                        oL.UpdateOnBehalf(o);

                        // ------  End Update Onbehalf  --------

                        ajaxWebExtension.showJscriptAlert(Page, this, "Bright Idea saved as draft.");
                    }
                    else
                    {
                        ajaxWebExtension.showJscriptAlert(Page, this, "Not Successful, try again later.");
                    }
                }
            }
        }
    }
    protected void drpBuzUnit_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDepartment.Items.Clear();
        ddlDepartment.Items.Add(new ListItem("Select Department", "-1"));

        ddlTeam.Items.Clear();
        ddlTeam.Items.Add(new ListItem("Select Team", "-1"));

        List<BIDepartments> oDepts = BIDepartments.lstGetDeparmentsByFunction(int.Parse(drpBuzUnit.SelectedValue));
        foreach (BIDepartments o in oDepts)
        {
            ddlDepartment.Items.Add(new ListItem(o.m_sDepartment, o.m_iDepartmentId.ToString()));
        }
    }
    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlTeam.Items.Clear();
        ddlTeam.Items.Add(new ListItem("Select Team", "-1"));
        List<BITeams> oTeams = BITeams.lstGetTeamsByDepartment(int.Parse(ddlDepartment.SelectedValue));
        foreach (BITeams o in oTeams)
        {
            ddlTeam.Items.Add(new ListItem(o.m_sTeam, o.m_iTeamId.ToString()));
        }
    }
}