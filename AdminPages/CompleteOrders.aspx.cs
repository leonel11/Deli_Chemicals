using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpenChessTeamTournament
{
    public partial class CompleteOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCompleteDeal_Command(object sender, CommandEventArgs e)
        {
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes") // Ok во всплывающем окне
            {
                GridViewOrders.DeleteRow(GridViewOrders.SelectedIndex); // удаление записи из GridView и как следствие из БД Ordergoods
            }
        }
    }
}