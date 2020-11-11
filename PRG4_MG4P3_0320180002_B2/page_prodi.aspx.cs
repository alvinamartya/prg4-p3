using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRG4_MG4P3_0320180002_B2
{
    public partial class page_prodi : System.Web.UI.Page
    {
        #region Global Variable
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";
        private DatabaseHelper dbHelper = new DatabaseHelper();
        int idProdi = 0;
        #endregion
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            // control-style
            btnCari.Style.Add("margin-left", "5px");
            txtAddNamaProdi.Style.Add("width", "80%");
            txtEditNamaProdi.Style.Add("width", "80%");

            if (!IsPostBack)
            {
                loadData();
                ViewProdi.Visible = true;
                AddProdi.Visible = false;
                EditProdi.Visible = false;
                ViewDetailProdi.Visible = false;
            }
        }

        protected void gridDataProdi_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridDataProdi.PageIndex = e.NewPageIndex;
            loadData();
        }

        protected void gridDataProdi_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Ubah")
            {
                string id = gridDataProdi.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
                lblId.Text = id;
                txtEditNamaProdi.Text = gridDataProdi.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
                EditProdi.Visible = true;
                AddProdi.Visible = false;
                ViewProdi.Visible = false;
            }
            else if(e.CommandName == "LihatDetail")
            {
                idProdi = int.Parse(gridDataProdi.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString());
                loadDataDetailProdi(idProdi);
                ViewDetailProdi.Visible = true;
            }
        }

        protected void gridDataProdi_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression;
            if (GridViewSortDirection == SortDirection.Ascending)
            {
                GridViewSortDirection = SortDirection.Descending;
                Helper.SortGridView(sortExpression, DESCENDING, gridDataProdi, loadData().Tables[0]);
            }
            else
            {
                GridViewSortDirection = SortDirection.Ascending;
                Helper.SortGridView(sortExpression, ASCENDING, gridDataProdi, loadData().Tables[0]);
            }
        }


        protected void gridDataDetailProdi_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridDataDetailProdi.PageIndex = e.NewPageIndex;
            loadDataDetailProdi(idProdi);
        }

        protected void gridDataDetailProdi_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression;
            if (GridViewSortDirection == SortDirection.Ascending)
            {
                GridViewSortDirection = SortDirection.Descending;
                Helper.SortGridView(sortExpression, DESCENDING, gridDataDetailProdi, loadDataDetailProdi(idProdi).Tables[0]);
            }
            else
            {
                GridViewSortDirection = SortDirection.Ascending;
                Helper.SortGridView(sortExpression, ASCENDING, gridDataDetailProdi, loadDataDetailProdi(idProdi).Tables[0]);
            }
        }

        protected void btnTambah_Click(object sender, EventArgs e)
        {
            AddProdi.Visible = true;
            EditProdi.Visible = false;
            ViewProdi.Visible = false;
        }

        protected void btnCari_Click(object sender, EventArgs e)
        {
            loadData();
        }

        protected void btnCancelAdd_Click(object sender, EventArgs e)
        {
            AddProdi.Visible = false;
            EditProdi.Visible = false;
            ViewProdi.Visible = true;
            clear();
        }

        protected void btnSubmitAdd_Click(object sender, EventArgs e)
        {
            List<Parameter> param = new List<Parameter>()
            {
                new Parameter()
                {
                    Key="@p1",
                    Value = txtAddNamaProdi.Text.ToUpper()
                }
            };

            dbHelper.CommandWithProc(param, "stp_insertProdi");
            loadData();
            clear();

            AddProdi.Visible = false;
            EditProdi.Visible = false;
            ViewProdi.Visible = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void btnSubmitEdit_Click(object sender, EventArgs e)
        {
            List<Parameter> param = new List<Parameter>()
            {
                new Parameter()
                {
                    Key="@p1",
                    Value = lblId.Text.ToUpper()
                },
                new Parameter()
                {
                    Key="@p2",
                    Value = txtEditNamaProdi.Text.ToUpper()
                }
            };

            int result = dbHelper.CommandWithProc(param, "stp_updateProdi");
            if (result > 0)
            {
                loadData();
                clear();

                AddProdi.Visible = false;
                EditProdi.Visible = false;
                ViewProdi.Visible = true;
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                Helper.ShowAlertMessage("Failed, Contact Admin");
            }
        }
        #endregion
        #region Logic
        public DataSet loadDataDetailProdi(int idProdi)
        {
            List<Parameter> param = new List<Parameter>
            {
                new Parameter()
                {
                    Key = "@idProdi",
                    Value = idProdi.ToString()
                }
            };

            DataSet ds = dbHelper.GetDataSetWithSearch(param, "stp_getDetailProdi");
            gridDataDetailProdi.DataSource = ds;
            gridDataDetailProdi.DataBind();
            return ds;
        }

        public DataSet loadData()
        {
            List<Parameter> param = new List<Parameter>
            {
                new Parameter()
                {
                    Key = "@p1",
                    Value = txtSearch.Text
                }
            };

            DataSet ds = dbHelper.GetDataSetWithSearch(param, "stp_getDataProdi");
            gridDataProdi.DataSource = ds;
            gridDataProdi.DataBind();
            return ds;
        }

        public void clear()
        {
            txtAddNamaProdi.Text = "";
            txtEditNamaProdi.Text = "";
        }

        public SortDirection GridViewSortDirection
        {
            get
            {
                if (ViewState["sortDirection"] == null)
                    ViewState["sortDirection"] = SortDirection.Ascending;

                return (SortDirection)ViewState["sortDirection"];
            }

            set { ViewState["sortDirection"] = value; }
        }
        #endregion
    }
}