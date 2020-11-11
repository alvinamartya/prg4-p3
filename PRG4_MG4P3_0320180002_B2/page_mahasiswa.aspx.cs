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
    public partial class page_mahasiswa : System.Web.UI.Page
    {
        #region Global Variable
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";
        private DatabaseHelper dbHelper = new DatabaseHelper();
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            // control-style
            btnCari.Style.Add("margin-left", "5px");

            if (!IsPostBack)
            {
                loadData();
                ViewMahasiswa.Visible = true;
                AddMahasiswa.Visible = false;
                EditMahasiswa.Visible = false;

                // load data ddlProdi
                DataTable dt = loadDataProdi().Tables[0];
                foreach (DataRow row in dt.Rows)
                {
                    ddlAddProdi.Items.Add(row[1].ToString());
                    ddlEditProdi.Items.Add(row[1].ToString());
                }
            }
        }


        protected void gridDataMahasiswa_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Debug.WriteLine(e.CommandName);
            if (e.CommandName == "Ubah")
            {
                string id = gridDataMahasiswa.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
                txtEditNim.Text = id;
                ddlEditProdi.Text = gridDataMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
                txtEditNamaMahasiswa.Text = gridDataMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[2].Text;
                if (gridDataMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[3].Text == "Laki-Laki") rblEditJenisKelamin.Items[0].Selected = true; 
                else rblEditJenisKelamin.Items[1].Selected = true;
                txtEditAlamat.Text = gridDataMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[4].Text;
                txtEditEmail.Text = gridDataMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[5].Text;
                txtEditNoHp.Text = gridDataMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[6].Text;
                txtEditAngkatan.Text = gridDataMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[7].Text;
                txtEditTempatLahir.Text = gridDataMahasiswa.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[8].Text;


                EditMahasiswa.Visible = true;
                AddMahasiswa.Visible = false;
                ViewMahasiswa.Visible = false;
            }
        }

        protected void gridDataMahasiswa_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridDataMahasiswa.PageIndex = e.NewPageIndex;
            loadData();
        }

        protected void gridDataMahasiswa_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression;
            if (GridViewSortDirection == SortDirection.Ascending)
            {
                GridViewSortDirection = SortDirection.Descending;
                Helper.SortGridView(sortExpression, DESCENDING, gridDataMahasiswa, loadData().Tables[0]);
            }
            else
            {
                GridViewSortDirection = SortDirection.Ascending;
                Helper.SortGridView(sortExpression, ASCENDING, gridDataMahasiswa, loadData().Tables[0]);
            }
        }


        protected void btnCari_Click(object sender, EventArgs e)
        {
            loadData();
        }

        protected void btnTambah_Click(object sender, EventArgs e)
        {
            ViewMahasiswa.Visible = false;
            AddMahasiswa.Visible = true;
            EditMahasiswa.Visible = false;
        }

        protected void btnSubmitAdd_Click(object sender, EventArgs e)
        {
            DataTable dt = loadDataProdi().Tables[0];
            string gender = rblAddJenisKelamin.SelectedValue.ToString();

            List<Parameter> param = new List<Parameter>()
            {
                new Parameter()
                {
                    Key = "@NIM",
                    Value = txtAddNim.Text
                },
                new Parameter()
                {
                    Key = "@IdProdi",
                    Value = dt.Rows[ddlAddProdi.SelectedIndex][0].ToString()
                },
                new Parameter()
                {
                    Key = "@NamaMahasiswa",
                    Value = txtAddNamaMahasiswa.Text
                },
                  new Parameter()
                {
                    Key = "@TempatLahir",
                    Value = txtAddTempatLahir.Text
                },
                new Parameter()
                {
                    Key = "@JenisKelamin",
                    Value = gender
                },
                new Parameter()
                {
                    Key = "@Alamat",
                    Value = txtAddAlamat.Text
                },
                new Parameter()
                {
                    Key = "@Email",
                    Value = txtAddEmail.Text
                },
                new Parameter()
                {
                    Key = "@NoHp",
                    Value = txtAddNoHp.Text
                },
                new Parameter() {
                    Key = "@Angkatan",
                    Value = txtAddAngkatan.Text
                },
            };

            dbHelper.CommandWithProc(param, "stp_insertMahasiswa");
            loadData();
            clear();

            AddMahasiswa.Visible = false;
            EditMahasiswa.Visible = false;
            ViewMahasiswa.Visible = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void btnCancelAdd_Click(object sender, EventArgs e)
        {
            ViewMahasiswa.Visible = true;
            AddMahasiswa.Visible = false;
            EditMahasiswa.Visible = false;
            clear();
        }

        protected void btnSubmitEdit_Click(object sender, EventArgs e)
        {
            DataTable dt = loadDataProdi().Tables[0];
            string gender = rblEditJenisKelamin.SelectedValue.ToString();

            List<Parameter> param = new List<Parameter>()
            {
                new Parameter()
                {
                    Key = "@NIM",
                    Value = txtEditNim.Text
                },
                new Parameter()
                {
                    Key = "@IdProdi",
                    Value = dt.Rows[ddlEditProdi.SelectedIndex][0].ToString()
                },
                new Parameter()
                {
                    Key = "@NamaMahasiswa",
                    Value = txtEditNamaMahasiswa.Text
                },
                  new Parameter()
                {
                    Key = "@TempatLahir",
                    Value = txtEditTempatLahir.Text
                },
                new Parameter()
                {
                    Key = "@JenisKelamin",
                    Value = gender
                },
                new Parameter()
                {
                    Key = "@Alamat",
                    Value = txtEditAlamat.Text
                },
                new Parameter()
                {
                    Key = "@Email",
                    Value = txtEditEmail.Text
                },
                new Parameter()
                {
                    Key = "@NoHp",
                    Value = txtEditNoHp.Text
                },
                new Parameter() {
                    Key = "@Angkatan",
                    Value = txtEditAngkatan.Text
                },
            };

            int result = dbHelper.CommandWithProc(param, "stp_updateMahasiswa");

            if (result > 0)
            {
                loadData();
                clear();

                AddMahasiswa.Visible = false;
                EditMahasiswa.Visible = false;
                ViewMahasiswa.Visible = true;
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                Helper.ShowAlertMessage("Failed, Contact Admin");
            }
        }
        #endregion
        #region Logic
        private DataSet loadDataProdi()
        {
            List<Parameter> param = new List<Parameter>
            {
                new Parameter()
                {
                    Key = "@p1",
                    Value = ""
                }
            };

            DataSet ds = dbHelper.GetDataSetWithSearch(param, "stp_getDataProdi");
            return ds;
        }

        public DataSet loadData()
        {
            List<Parameter> param = new List<Parameter>
            {
                new Parameter()
                {
                    Key = "@NIM",
                    Value = txtSearch.Text
                }
            };

            DataSet ds = dbHelper.GetDataSetWithSearch(param, "stp_getMahasiswa");
            gridDataMahasiswa.DataSource = ds;
            gridDataMahasiswa.DataBind();
            return ds;
        }

        private void clear()
        {
            // add form


            // edit form
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