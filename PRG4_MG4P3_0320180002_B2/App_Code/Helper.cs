using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRG4_MG4P3_0320180002_B2
{
    public class Helper
    {
        public static void ShowAlertMessage(string pesan)
        {
            Page page = HttpContext.Current.Handler as Page;
            if (page != null)
            {
                ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "alert('" + pesan + "')", true);
            }
        }

        public static void SortGridView(string sortExpression, string direction, GridView grid, DataTable dt)
        {
            DataView dv = new DataView(dt);
            dv.Sort = sortExpression + direction;
            grid.DataSource = dv;
            grid.DataBind();
        }
    }
}