﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Drawing;
using System.IO;
using System.Web.UI.HtmlControls;

public partial class App_Prices_UserControl_oBCostSavings : aspnetUserControl
{
    long lPriceId = 0;
    string PreviewPath = "/App/Prices/RedFlag/";
    string DestinationPath = "../Prices/RedFlag/";

    public void Page_Init()
    {
        if (oSessnx.getOnlineUser.m_iUserId == 0)
        {
            Response.Redirect("~/Default.aspx?pr=9");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadPendingRecords();
        }
    }

    protected void lnkViewAttachments_Click(object sender, EventArgs e)
    {
        var lnk = (LinkButton) sender;
        var nesteditem = (GridNestedViewItem) lnk.NamingContainer;

        if (nesteditem != null)
        {
            long lPriceId = long.Parse(lnk.Attributes["PRICEID"].ToString());
            //iframe id = "fileLoader"
            var pp = (HtmlGenericControl) nesteditem.FindControl("fileLoader");
            Price o = PriceHelper.objGetPriceById(lPriceId);
            PriceHelper.PreviewLoadedFile(o, pp);
        }
    }

    public void LoadPendingRecords()
    {
        //If the logged on user is found on the Reviewers table, he should be able to see all reports with Action button enabled
        List<PriceReviewers> lstReviewers = PriceReviewerHelper.lstGetPriceReviewers();
        bool bRet = lstReviewers.Where(item => item.iUserId == oSessnx.getOnlineUser.m_iUserId) != null ? true : false;
        if (bRet)
        {
            grdView.DataSource = PriceHelper.dtGetPendingPrices();
            grdView.Rebind();
        }
    }

    protected void grdView_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        if (!e.IsFromDetailTable)
        {
            List<PriceReviewers> lstReviewers = PriceReviewerHelper.lstGetPriceReviewers();
            bool bRet = lstReviewers.Where(item => item.iUserId == oSessnx.getOnlineUser.m_iUserId) != null ? true : false;
            if (bRet)
            {
                (sender as RadGrid).DataSource = PriceHelper.dtGetPendingPrices();
            }
        }
    }

    protected void grdView_ItemCreated(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            var actionLink = (HyperLink) e.Item.FindControl("actionLink");
            if (actionLink != null)
            {
                actionLink.Attributes["href"] = "javascript:void(0);";
                actionLink.Attributes["onclick"] = string.Format("return ShowActionForm('{0}','{1}');", e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["PRICEID"], e.Item.ItemIndex);
            }

            var editLink = (HyperLink) e.Item.FindControl("editLink");
            if (editLink != null)
            {
                editLink.Attributes["href"] = "javascript:void(0);";
                editLink.Attributes["onclick"] = string.Format("return ShowEditForm('{0}','{1}');", e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["PRICEID"], e.Item.ItemIndex);
            }            
        }
    }

    protected void grdView_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (grdView.MasterTableView.Items.Count > 0)
                grdView.MasterTableView.Items[0].Expanded = true;
        }
    }

    protected void grdView_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            var lbl = e.Item.FindControl("numberLabel") as Label;
            if (lbl != null)
                lbl.Text = (e.Item.ItemIndex + 1).ToString();

            var item = e.Item as GridDataItem;
            if (item.Cells[11].Text == ((int) DiscrepancyStatus.ReviewStatus.PendingReview).ToString())
            {
                item.Cells[11].Text = DiscrepancyStatus.DiscrepancyStatusDesc(DiscrepancyStatus.ReviewStatus.PendingReview);
                item.Cells[11].Font.Bold = true;
                item.Cells[11].ForeColor = Color.Red;
            }
            else if (item.Cells[11].Text == ((int) DiscrepancyStatus.ReviewStatus.UnderGoingReview).ToString())
            {
                item.Cells[11].Text = DiscrepancyStatus.DiscrepancyStatusDesc(DiscrepancyStatus.ReviewStatus.UnderGoingReview);
                item.Cells[11].Font.Bold = true;
                item.Cells[11].ForeColor = Color.YellowGreen;
            }
            else if (item.Cells[11].Text == ((int) DiscrepancyStatus.ReviewStatus.ClosedOut).ToString())
            {
                item.Cells[11].Text = DiscrepancyStatus.DiscrepancyStatusDesc(DiscrepancyStatus.ReviewStatus.ClosedOut);
                item.Cells[11].Font.Bold = true;
                item.Cells[11].ForeColor = Color.Green;
            }
        }
    }

    protected void grdView_ItemCommand(object source, GridCommandEventArgs e)
    {
        if (e.CommandName == RadGrid.ExpandCollapseCommandName)
        {
            if (e.Item.Expanded)
            {
                long lPriceId = long.Parse(e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["PRICEID"].ToString());
                var ht = (RadPageView) ((GridDataItem) e.Item).ChildItem.FindControl("DocumentsPageView");
                var pp = (HtmlGenericControl) ht.FindControl("fileLoader");
                //var pp = (HtmlGenericControl) e.Item.FindControl("fileLoader");
                Price o = PriceHelper.objGetPriceById(lPriceId);
                PriceHelper.PreviewLoadedFile(o, pp);
            }
        }

        //var lnk = (LinkButton) sender;
        //var nesteditem = (GridNestedViewItem) lnk.NamingContainer;

        //if (nesteditem != null)
        //{
        //    long lPriceId = long.Parse(lnk.Attributes["PRICEID"].ToString());
        //    //iframe id = "fileLoader"
        //    var pp = (HtmlGenericControl) nesteditem.FindControl("fileLoader");
        //    Price o = PriceHelper.objGetPriceById(lPriceId);
        //    PriceHelper.PreviewLoadedFile(o, pp);
        //}
    }

    public static int i = 0;
    private object fileLoader;

    protected void tabClick(object sender, RadTabStripEventArgs e)
    {
        //AddPageView(e.Tab.Text, sender, e);
        //e.Tab.PageView.Selected = true;
        
        //e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["PRICEID"]

        //PreviewLoadedFile(o);
    }

    private void AddPageView(string pageViewID, object sender, RadTabStripEventArgs e)
    {
        var button = (RadTabStrip) sender;
        var nesteditem = (GridNestedViewItem) button.NamingContainer;

        var pageView = new RadPageView();
        pageView.ID = pageViewID + i;
        i = i + 1;

        var rdmpRedFlag = (RadMultiPage) nesteditem.FindControl("rdmpRedFlag");
        rdmpRedFlag.PageViews.Add(pageView);

        //var rdmpRedFlag = (RadMultiPage) grdView.MasterTableView.FindControl("rdtabRedFlag");
        //rdmpRedFlag.PageViews.Add(pageView);
    }

    //private void PreviewLoadedFile(Price o, HtmlGenericControl fileLoader)
    //{
    //    if (o != null)
    //    {
    //        string sFinalPath = HttpContext.Current.Server.MapPath(DestinationPath + o.sFileName);

    //        if (o.bBlob != null)
    //        {
    //            File.WriteAllBytes(sFinalPath, o.bBlob);
    //            fileLoader.Attributes["src"] = PreviewPath + o.sFileName;
    //        }
    //    }
    //    else
    //    {
    //        fileLoader.Attributes["src"] = "";
    //    }
    //}


    #region Individual Uploaded Documents
    private void LoadMySubmittedPrices(int iUserId)
    {
        grdView.DataSource = PriceHelper.dtGetMyPendingPrices(iUserId);
        grdView.DataBind();
        //GetStatus(grdView);
    }
    public void LoadMySubmittedPendingPrices(int iUserId)
    {
        grdView.DataSource = PriceHelper.dtGetMyPendingPrices(iUserId);
        grdView.DataBind();

        grdView.Columns[1].Visible = false;
        grdView.Columns[2].Visible = true;

        //GetStatus(grdView);

        //PriceReviewerHelper.FormatReport(grdView);
    }
    public void LoadMyApprovedPrices(int iUserId)
    {
        grdView.DataSource = PriceHelper.dtGetMyApprovedPrices(iUserId);
        grdView.DataBind();
        grdView.Columns[1].Visible = false;
        grdView.Columns[2].Visible = false;

        //GetStatus(grdView);

        //PriceReviewerHelper.FormatReport(grdView);
    }
    #endregion

    private void GetStatus(GridView oGrdView)
    {
        foreach (GridViewRow grdRow in oGrdView.Rows)
        {
            PriceReviewerHelper.Reporter(grdRow);
        }
    }

    public void LoadClosedOutRecords()
    {
        List<PriceReviewers> lstReviewers = PriceReviewerHelper.lstGetPriceReviewers();
        foreach (PriceReviewers o in lstReviewers)
        {
            if (o.iUserId == oSessnx.getOnlineUser.m_iUserId)
            {
                grdView.DataSource = PriceHelper.dtGetClosedOutPrices();
                grdView.DataBind();
                grdView.Columns[1].Visible = false;
                grdView.Columns[10].Visible = true;

                //GetStatus(grdView);
                break;
            }
        }
        //PriceReviewerHelper.FormatReport(grdView);
    }

    protected void RadAjaxManager1_AjaxRequest(object sender, AjaxRequestEventArgs e)
    {
        if (e.Argument == "Rebind")
        {
            grdView.MasterTableView.SortExpressions.Clear();
            grdView.MasterTableView.GroupByExpressions.Clear();
            grdView.Rebind();
        }
        else if (e.Argument == "RebindAndNavigate")
        {
            grdView.MasterTableView.SortExpressions.Clear();
            grdView.MasterTableView.GroupByExpressions.Clear();
            grdView.MasterTableView.CurrentPageIndex = grdView.MasterTableView.PageCount - 1;
            grdView.Rebind();
        }
    }
}