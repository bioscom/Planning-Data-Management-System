﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

public partial class App_Contract_UserControls_DailyDataInputForm : aspnetUserControl
{
    readonly ContractActivitiesRecordedHelper oContractActivitiesRecordedHelper = new ContractActivitiesRecordedHelper();
    readonly ContractActivitiesHelper oContractActivitiesHelper = new ContractActivitiesHelper();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Page_Init(object sender, EventArgs e)
    {

    }

    public void Init_Page()
    {
        LoadData();
    }

    private void LoadData()
    {
        grdView.Columns[4].HeaderText = dtTripStart.dtSelectedDate.AddDays(1).ToString("ddd, MMM d");
        grdView.Columns[5].HeaderText = dtTripStart.dtSelectedDate.AddDays(2).ToString("ddd, MMM d");
        grdView.Columns[6].HeaderText = dtTripStart.dtSelectedDate.AddDays(3).ToString("ddd, MMM d");
        grdView.Columns[7].HeaderText = dtTripStart.dtSelectedDate.AddDays(4).ToString("ddd, MMM d");
        grdView.Columns[8].HeaderText = dtTripStart.dtSelectedDate.AddDays(5).ToString("ddd, MMM d");
        grdView.Columns[9].HeaderText = dtTripStart.dtSelectedDate.AddDays(6).ToString("ddd, MMM d");
        grdView.Columns[10].HeaderText = dtTripStart.dtSelectedDate.AddDays(7).ToString("ddd, MMM d");
        grdView.Columns[11].HeaderText = dtTripStart.dtSelectedDate.AddDays(8).ToString("ddd, MMM d");
        grdView.Columns[12].HeaderText = dtTripStart.dtSelectedDate.AddDays(9).ToString("ddd, MMM d");
        grdView.Columns[13].HeaderText = dtTripStart.dtSelectedDate.AddDays(10).ToString("ddd, MMM d");
        grdView.Columns[14].HeaderText = dtTripStart.dtSelectedDate.AddDays(11).ToString("ddd, MMM d");
        grdView.Columns[15].HeaderText = dtTripStart.dtSelectedDate.AddDays(12).ToString("ddd, MMM d");
        grdView.Columns[16].HeaderText = dtTripStart.dtSelectedDate.AddDays(13).ToString("ddd, MMM d");
        grdView.Columns[17].HeaderText = dtTripStart.dtSelectedDate.AddDays(14).ToString("ddd, MMM d");

        lblAssetArea.Text = District.objGetDistrictById(int.Parse(Request.QueryString["dstrt"].ToString())).m_sDistrict;

        DataTable dt = oContractActivitiesRecordedHelper.dtGet14DayContractByDistrictStartDate(int.Parse(Request.QueryString["dstrt"].ToString()), dtTripStart.dtSelectedDate);

        grdView.DataSource = dt;
        grdView.DataBind();
        PaintGrid();
        Calculations();
    }


    private void PaintGrid()
    {
        foreach (GridViewRow grdRow in grdView.Rows)
        {
            Label lbActivity = (Label)grdRow.FindControl("lbActivity");

            TextBox txtTarget = (TextBox)grdRow.FindControl("txtTarget"); txtTarget.Attributes.Add("onkeypress", "return numericOnly(this);");
            TextBox txtDay1 = (TextBox)grdRow.FindControl("txtDay1"); txtDay1.Attributes.Add("onkeypress", "return numericOnly(this);");
            TextBox txtDay2 = (TextBox)grdRow.FindControl("txtDay2"); txtDay2.Attributes.Add("onkeypress", "return numericOnly(this);");
            TextBox txtDay3 = (TextBox)grdRow.FindControl("txtDay3"); txtDay3.Attributes.Add("onkeypress", "return numericOnly(this);");
            TextBox txtDay4 = (TextBox)grdRow.FindControl("txtDay4"); txtDay4.Attributes.Add("onkeypress", "return numericOnly(this);");
            TextBox txtDay5 = (TextBox)grdRow.FindControl("txtDay5"); txtDay5.Attributes.Add("onkeypress", "return numericOnly(this);");
            TextBox txtDay6 = (TextBox)grdRow.FindControl("txtDay6"); txtDay6.Attributes.Add("onkeypress", "return numericOnly(this);");
            TextBox txtDay7 = (TextBox)grdRow.FindControl("txtDay7"); txtDay7.Attributes.Add("onkeypress", "return numericOnly(this);");
            TextBox txtDay8 = (TextBox)grdRow.FindControl("txtDay8"); txtDay8.Attributes.Add("onkeypress", "return numericOnly(this);");
            TextBox txtDay9 = (TextBox)grdRow.FindControl("txtDay9"); txtDay9.Attributes.Add("onkeypress", "return numericOnly(this);");
            TextBox txtDay10 = (TextBox)grdRow.FindControl("txtDay10"); txtDay10.Attributes.Add("onkeypress", "return numericOnly(this);");
            TextBox txtDay11 = (TextBox)grdRow.FindControl("txtDay11"); txtDay11.Attributes.Add("onkeypress", "return numericOnly(this);");
            TextBox txtDay12 = (TextBox)grdRow.FindControl("txtDay12"); txtDay12.Attributes.Add("onkeypress", "return numericOnly(this);");
            TextBox txtDay13 = (TextBox)grdRow.FindControl("txtDay13"); txtDay13.Attributes.Add("onkeypress", "return numericOnly(this);");
            TextBox txtDay14 = (TextBox)grdRow.FindControl("txtDay14"); txtDay14.Attributes.Add("onkeypress", "return numericOnly(this);");
            //int iSubActivityId = int.Parse(lbActivity.Attributes["IDSUBACTIVITIES"].ToString());

            if (string.IsNullOrEmpty(lbActivity.Attributes["IDSUBACTIVITIES"].ToString()))
            {
                grdRow.BackColor = System.Drawing.Color.PaleGreen;
                grdRow.Font.Bold = true;

                txtTarget.Visible = false;
                txtDay1.Visible = false; txtDay2.Visible = false; txtDay3.Visible = false; txtDay4.Visible = false; txtDay5.Visible = false; txtDay6.Visible = false;
                txtDay7.Visible = false; txtDay8.Visible = false; txtDay9.Visible = false; txtDay10.Visible = false; txtDay11.Visible = false; txtDay12.Visible = false;
                txtDay13.Visible = false; txtDay14.Visible = false;
            }
            else if (lbActivity.Attributes["IDSUBACTIVITIES"].ToString() == lbActivity.Attributes["IDACTIVITIES"].ToString())
            {
                grdRow.BackColor = System.Drawing.Color.PaleGreen;
            }
        }
        grdView.Columns[2].ItemStyle.BackColor = System.Drawing.Color.Yellow;
        grdView.Columns[3].ItemStyle.BackColor = System.Drawing.Color.LightBlue;
        grdView.GridLines = GridLines.Both;
    }

    private void Calculations()
    {
        decimal? dDay1 = 0; decimal? dDay2 = 0; decimal? dDay3 = 0; decimal? dDay4 = 0;
        decimal? dDay5 = 0; decimal? dDay6 = 0; decimal? dDay7 = 0; decimal? dDay8 = 0;
        decimal? dDay9 = 0; decimal? dDay10 = 0; decimal? dDay11 = 0; decimal? dDay12 = 0;
        decimal? dDay13 = 0; decimal? dDay14 = 0; decimal? dSumTarget = 0;

        foreach (GridViewRow grdRow in grdView.Rows)
        {
            Label lbActivity = (Label)grdRow.FindControl("lbActivity");
            Label lbActual = (Label)grdRow.FindControl("lbActual");
            Label lbTarget = (Label)grdRow.FindControl("lbTarget");

            if (string.IsNullOrEmpty(lbActivity.Attributes["IDSUBACTIVITIES"].ToString()))
            {
                //Where IDSUBACTIVITIES is null or empty is the Items header which is the IDACTIVITIES
                Label lbDay1 = (Label)grdRow.FindControl("lbDay1"); Label lbDay8 = (Label)grdRow.FindControl("lbDay8");
                Label lbDay2 = (Label)grdRow.FindControl("lbDay2"); Label lbDay9 = (Label)grdRow.FindControl("lbDay9");
                Label lbDay3 = (Label)grdRow.FindControl("lbDay3"); Label lbDay10 = (Label)grdRow.FindControl("lbDay10");
                Label lbDay4 = (Label)grdRow.FindControl("lbDay4"); Label lbDay11 = (Label)grdRow.FindControl("lbDay11");
                Label lbDay5 = (Label)grdRow.FindControl("lbDay5"); Label lbDay12 = (Label)grdRow.FindControl("lbDay12");
                Label lbDay6 = (Label)grdRow.FindControl("lbDay6"); Label lbDay13 = (Label)grdRow.FindControl("lbDay13");
                Label lbDay7 = (Label)grdRow.FindControl("lbDay7"); Label lbDay14 = (Label)grdRow.FindControl("lbDay14");

                List<ContractActivitiesRecorded> lstContractActivitiesRecorded = oContractActivitiesRecordedHelper.lstGet14DayContractByTripStartDateActivityId(int.Parse(lbActivity.Attributes["IDACTIVITIES"].ToString()), DateTime.Parse(Request.QueryString["dt"]));
                foreach (ContractActivitiesRecorded oVal in lstContractActivitiesRecorded)
                {
                    dDay1 += oVal.dDay1; dDay2 += oVal.dDay2; dDay3 += oVal.dDay3; dDay4 += oVal.dDay4;
                    dDay5 += oVal.dDay5; dDay6 += oVal.dDay6; dDay7 += oVal.dDay7; dDay8 += oVal.dDay8;
                    dDay9 += oVal.dDay9; dDay10 += oVal.dDay10; dDay11 += oVal.dDay11; dDay12 += oVal.dDay12;
                    dDay13 += oVal.dDay13; dDay14 += oVal.dDay14;

                    dSumTarget += oVal.dTarget;
                }
                lbTarget.Text = dSumTarget.ToString();

                lbDay1.Text = dDay1.ToString(); lbDay2.Text = dDay2.ToString(); lbDay3.Text = dDay3.ToString(); lbDay4.Text = dDay4.ToString();
                lbDay5.Text = dDay5.ToString(); lbDay6.Text = dDay6.ToString(); lbDay7.Text = dDay7.ToString(); lbDay8.Text = dDay8.ToString();
                lbDay9.Text = dDay9.ToString(); lbDay10.Text = dDay10.ToString(); lbDay11.Text = dDay11.ToString(); lbDay12.Text = dDay12.ToString();
                lbDay13.Text = dDay13.ToString(); lbDay14.Text = dDay14.ToString();

                SumAverage(lbActual, int.Parse(lbActivity.Attributes["IDACTIVITIES"].ToString()), dDay1, dDay2, dDay3, dDay4, dDay5, dDay6, dDay7, dDay8, dDay9, dDay10, dDay11, dDay12, dDay13, dDay14);

                dDay1 = 0; dDay2 = 0; dDay3 = 0; dDay4 = 0; dDay5 = 0; dDay6 = 0; dDay7 = 0; dDay8 = 0; dDay9 = 0; dDay10 = 0; dDay11 = 0; dDay12 = 0; dDay13 = 0; dDay14 = 0;
                dSumTarget = 0;
            }            
        }

        foreach (GridViewRow grdRow in grdView.Rows)
        {
            Label lbActivity = (Label)grdRow.FindControl("lbActivity");
            

            if (!string.IsNullOrEmpty(lbActivity.Attributes["IDSUBACTIVITIES"].ToString()))
            {
                Label lbActual = (Label)grdRow.FindControl("lbActual");
                ContractActivitiesRecorded oVal = oContractActivitiesRecordedHelper.objGetContractActivitiesRecordedById(int.Parse(lbActivity.Attributes["IDFOURTEEN"].ToString()));
                SumAverage(lbActual, int.Parse(lbActivity.Attributes["IDACTIVITIES"].ToString()), oVal.dDay1, oVal.dDay2, oVal.dDay3, oVal.dDay4, oVal.dDay5, oVal.dDay6, oVal.dDay7, oVal.dDay8, oVal.dDay9, oVal.dDay10, oVal.dDay11, oVal.dDay12, oVal.dDay13, oVal.dDay14);
            }
        }
    }

    private void SumAverage(Label lbActual, int iActivityId, decimal? dDay1, decimal? dDay2, decimal? dDay3, decimal? dDay4, decimal? dDay5, decimal? dDay6, decimal? dDay7, decimal? dDay8, decimal? dDay9, decimal? dDay10, decimal? dDay11, decimal? dDay12, decimal? dDay13, decimal? dDay14)
    {
        decimal? dSum = dDay1 + dDay2 + dDay3 + dDay4 + dDay5 + dDay6 + dDay7 + dDay8 + dDay9 + dDay10 + dDay11 + dDay12 + dDay13 + dDay14;
        int iBitCalc = oContractActivitiesHelper.objGetActivitiesByActivity(iActivityId).iBitCalc;

        if (iBitCalc == 1)
        {
            lbActual.Text = dSum.ToString();
        }
        else if (iBitCalc == 2)
        {
            decimal dResult = Convert.ToDecimal(dSum / 14);
            lbActual.Text = Math.Round(dResult, 2).ToString(CultureInfo.InvariantCulture);
        }
        dDay1 = null; dDay2 = null; dDay3 = null; dDay4 = null; dDay5 = null; dDay6 = null; dDay7 = null; dDay8 = null; dDay9 = null; dDay10 = null; dDay11 = null; dDay12 = null; dDay13 = null; dDay14 = null;
    }

    protected void txtSubmitUpper_Click(object sender, EventArgs e)
    {
        SaveMesage();
    }

    protected void txtSubmitLower_Click(object sender, EventArgs e)
    {
        SaveMesage();
    }

    private void SaveMesage()
    {
        if (Update())
        {
            Calculations();
            ajaxWebExtension.showJscriptAlert(Page, this, "Successfully submitted.");
        }
        else
            ajaxWebExtension.showJscriptAlert(Page, this, "Submit not successful, try again later!!!");
    }

    private bool Update()
    {
        bool bRet = false;
        ContractActivitiesRecorded oContractActivitiesRecorded = new ContractActivitiesRecorded
        {
            iDistrictId = int.Parse(Request.QueryString["dstrt"].ToString()),
            iUserId = oSessnx.getOnlineUser.m_iUserId,
            dtTripStartDate = dtTripStart.dtSelectedDate
        };

        //oContractActivitiesRecorded.iDistrictId = int.Parse(Request.QueryString["dstrt"].ToString());

        foreach (GridViewRow grdRow in grdView.Rows)
        {
            Label lbActivity = (Label)grdRow.FindControl("lbActivity");
            TextBox txtTarget = (TextBox)grdRow.FindControl("txtTarget");
            TextBox txtDay1 = (TextBox)grdRow.FindControl("txtDay1");
            TextBox txtDay2 = (TextBox)grdRow.FindControl("txtDay2");
            TextBox txtDay3 = (TextBox)grdRow.FindControl("txtDay3");
            TextBox txtDay4 = (TextBox)grdRow.FindControl("txtDay4");
            TextBox txtDay5 = (TextBox)grdRow.FindControl("txtDay5");
            TextBox txtDay6 = (TextBox)grdRow.FindControl("txtDay6");
            TextBox txtDay7 = (TextBox)grdRow.FindControl("txtDay7");
            TextBox txtDay8 = (TextBox)grdRow.FindControl("txtDay8");
            TextBox txtDay9 = (TextBox)grdRow.FindControl("txtDay9");
            TextBox txtDay10 = (TextBox)grdRow.FindControl("txtDay10");
            TextBox txtDay11 = (TextBox)grdRow.FindControl("txtDay11");
            TextBox txtDay12 = (TextBox)grdRow.FindControl("txtDay12");
            TextBox txtDay13 = (TextBox)grdRow.FindControl("txtDay13");
            TextBox txtDay14 = (TextBox)grdRow.FindControl("txtDay14");

            oContractActivitiesRecorded.iActivityId = int.Parse(lbActivity.Attributes["IDACTIVITIES"].ToString());
            oContractActivitiesRecorded.lFourteenDayId = long.Parse(lbActivity.Attributes["IDFOURTEEN"].ToString());

            if (string.IsNullOrEmpty(txtTarget.Text)) oContractActivitiesRecorded.dTarget = null; else oContractActivitiesRecorded.dTarget = decimal.Parse(txtTarget.Text);
            if (string.IsNullOrEmpty(txtDay1.Text)) oContractActivitiesRecorded.dDay1 = null; else oContractActivitiesRecorded.dDay1 = decimal.Parse(txtDay1.Text);
            if (string.IsNullOrEmpty(txtDay2.Text)) oContractActivitiesRecorded.dDay2 = null; else oContractActivitiesRecorded.dDay2 = decimal.Parse(txtDay2.Text);
            if (string.IsNullOrEmpty(txtDay3.Text)) oContractActivitiesRecorded.dDay3 = null; else oContractActivitiesRecorded.dDay3 = decimal.Parse(txtDay3.Text);
            if (string.IsNullOrEmpty(txtDay4.Text)) oContractActivitiesRecorded.dDay4 = null; else oContractActivitiesRecorded.dDay4 = decimal.Parse(txtDay4.Text);
            if (string.IsNullOrEmpty(txtDay5.Text)) oContractActivitiesRecorded.dDay5 = null; else oContractActivitiesRecorded.dDay5 = decimal.Parse(txtDay5.Text);
            if (string.IsNullOrEmpty(txtDay6.Text)) oContractActivitiesRecorded.dDay6 = null; else oContractActivitiesRecorded.dDay6 = decimal.Parse(txtDay6.Text);
            if (string.IsNullOrEmpty(txtDay7.Text)) oContractActivitiesRecorded.dDay7 = null; else oContractActivitiesRecorded.dDay7 = decimal.Parse(txtDay7.Text);
            if (string.IsNullOrEmpty(txtDay8.Text)) oContractActivitiesRecorded.dDay8 = null; else oContractActivitiesRecorded.dDay8 = decimal.Parse(txtDay8.Text);
            if (string.IsNullOrEmpty(txtDay9.Text)) oContractActivitiesRecorded.dDay9 = null; else oContractActivitiesRecorded.dDay9 = decimal.Parse(txtDay9.Text);
            if (string.IsNullOrEmpty(txtDay10.Text)) oContractActivitiesRecorded.dDay10 = null; else oContractActivitiesRecorded.dDay10 = decimal.Parse(txtDay10.Text);
            if (string.IsNullOrEmpty(txtDay11.Text)) oContractActivitiesRecorded.dDay11 = null; else oContractActivitiesRecorded.dDay11 = decimal.Parse(txtDay11.Text);
            if (string.IsNullOrEmpty(txtDay12.Text)) oContractActivitiesRecorded.dDay12 = null; else oContractActivitiesRecorded.dDay12 = decimal.Parse(txtDay12.Text);
            if (string.IsNullOrEmpty(txtDay13.Text)) oContractActivitiesRecorded.dDay13 = null; else oContractActivitiesRecorded.dDay13 = decimal.Parse(txtDay13.Text);
            if (string.IsNullOrEmpty(txtDay14.Text)) oContractActivitiesRecorded.dDay14 = null; else oContractActivitiesRecorded.dDay14 = decimal.Parse(txtDay14.Text);

            bRet = oContractActivitiesRecordedHelper.Update14DayContract(oContractActivitiesRecorded);
        }

        return bRet;
    }

    protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //PriorityHelper oPriorityHelper = new PriorityHelper();
        //int iColumns = grdView.Columns.Count;
        //int iPriorityIdA = 0;
        //int iPriorityIdB = 0;

        //foreach (GridViewRow grdRow in grdView.Rows)
        //{
        //    Label lbActivityA = (Label)grdRow.FindControl("lbActivity");
        //    iPriorityIdA = int.Parse(lbActivityA.Attributes["IDPRIORITY"].ToString());

        //    GridViewRow gvrow = e.Row;
        //    if (gvrow.RowType == DataControlRowType.Header)
        //    {
        //        Label lbActivityB = (Label)gvrow.FindControl("lbActivity");
        //        iPriorityIdB = int.Parse(lbActivityB.Attributes["IDPRIORITY"].ToString());

        //        if (iPriorityIdA != iPriorityIdB)
        //        {
        //            GridViewRow gvRow = new GridViewRow(gvrow.RowIndex + 1, 0, DataControlRowType.Header, DataControlRowState.Insert);

        //            TableCell oCell = new TableCell();
        //            oCell.ColumnSpan = 4;
        //            oCell.Text = oPriorityHelper.objGetPriorityById(int.Parse(lbActivityB.Attributes["IDPRIORITY"].ToString())).priority;
        //            oCell.HorizontalAlign = HorizontalAlign.Center;
        //            oCell.ColumnSpan = 3;
        //            oCell.Font.Bold = true;
        //            oCell.BackColor = System.Drawing.Color.Transparent;

        //            gvRow.Cells.Add(oCell);
        //            grdView.Controls[0].Controls.AddAt(gvrow.RowIndex + 1, gvRow);
        //        }
        //    }                                                                           
        //}
    }
    protected void btnForwardForApproval_Click(object sender, EventArgs e)
    {
        appUsers oAppUser = new appUsers();
        if (!string.IsNullOrEmpty(Request.QueryString["dstrt"]))
        {
            //Forward an email to the Operations Manager, copy the Admins of the tool and the Superintendent account.
            List<structUserMailIdx> eOpsMgr = new List<structUserMailIdx>();

            structUserMailIdx eSender = new structUserMailIdx(oSessnx.getOnlineUser.m_sUserName, oSessnx.getOnlineUser.m_sUserMail, oSessnx.getOnlineUser.m_iUserId.ToString());
            SendMail14DaysContract emailSender = new SendMail14DaysContract(eSender);

            int iDistrict = int.Parse(Request.QueryString["dstrt"].ToString());

            DataTable dt = OpsMgrFunctionalAcctUser.dtGetOpsMgrFunctionalAcctUsersByDistrict(iDistrict);
            if (dt.Rows.Count == 0)
            {
                ajaxWebExtension.showJscriptAlert(Page, this, "Sorry, no Operations Manager found assigned to your District. Please Contact the administrator. Thanks.");
            }
            else
            {
                //Update the 14 Days contract status, to be sent for Operations Superintendent approval

                //string sql = "SELECT DISTINCT PROD_DISTRICT.ID_DISTRICT, PROD_DISTRICT.DISTRICT, CONTRACT_APPROVAL.IDAPPROVAL, CONTRACT_APPROVAL.START_DATE, ";
                //sql += "CONTRACT_APPROVAL.USERID, CONTRACT_APPROVAL.DATE_RECEIVED, CONTRACT_APPROVAL.DATE_REVIEWED, CONTRACT_APPROVAL.STATUS, ";
                //sql += "CONTRACT_APPROVAL.COMMENTS FROM PROD_DISTRICT ";
                //sql += "INNER JOIN CONTRACT_APPROVAL ON PROD_DISTRICT.ID_DISTRICT = CONTRACT_APPROVAL.ID_DISTRICT ";

                //Get all the Operations Managers attached to the District/Asset
                List<OpsMgrFunctionalAcctUserDetails> lstOpsMgrFunctionalAcctUser = OpsMgrFunctionalAcctUser.lstGetOpsMgrAcctDetailsByDistrict(iDistrict);
                eOpsMgr.AddRange(lstOpsMgrFunctionalAcctUser.Select(opsMgr => appUsersHelper.objGetUserByUserId(opsMgr.iUserId).structUserIdx));

                DateTime dStartDate = DateTime.Parse(Request.QueryString["dt"]);
                DateTime dEndDate = dStartDate.AddDays(14);

                string sStartDate = dStartDate.ToString("dd/MM/yyyy");
                string sEndDate = dEndDate.ToString("dd/MM/yyyy");

                ContractApproval oContractApproval = new ContractApproval
                {
                    iDistrictId = iDistrict,
                    dtTripStartDate = dStartDate,
                    dtDateReceived = DateTime.Now
                };

                //Before you send an email, enter the approval into the APPROVAL TABLE
                bool bRet = ContractApprovalHelper.SendForApproval(oContractApproval);
                if (bRet)
                {
                    bRet = emailSender.SuperintendentRequestsForApproval(oSessnx.getOnlineUser, District.objGetDistrictById(iDistrict).m_sDistrict, sStartDate, sEndDate, eOpsMgr);
                    if (bRet)
                    {
                        ajaxWebExtension.showJscriptAlert(Page, this, "Your 14 days contract has been sucessfully sent for approval.");
                    }
                }
                else
                {
                    ajaxWebExtension.showJscriptAlert(Page, this, "Your 14 days contract has not been sucessfully sent for approval, please try again later!!!");
                }
            }
        }
    }

    public UserControl_dateControl DtDateTripStarts
    {
        get { return dtTripStart; }
    }

    public Button ForwardForApproval
    {
        get { return btnForwardForApproval; }
    }
}