using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace OpenChessTeamTournament
{
    public partial class ExistingDeals : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //string currentUserName = Membership.GetUser().ToString();
            string currentUserName = Page.User.Identity.Name; // получение информации о текущем пользователе
            HiddenFieldUserName.Value = currentUserName; // заполнение невидимого поля
        }

        protected void ButtonCancelDeal_Command(object sender, CommandEventArgs e)
        {
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                GridViewExistingDeals.DeleteRow(GridViewExistingDeals.SelectedIndex);
                Response.Write("<script LANGUAGE='JavaScript' >alert('Deal is canceled. You have upset by this decision');</script>"); // MessageBox
            }
        }

    }
}