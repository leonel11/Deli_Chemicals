using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpenChessTeamTournament
{
    public partial class Goods : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void GridViewGoods_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            this.Response.Redirect("~/ChemicalInfo.aspx");
        }
    }
}