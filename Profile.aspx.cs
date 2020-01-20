using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpenChessTeamTournament
{
    public partial class Profile : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            // формирование страницы-информации о текущем пользователе
            if (Membership.GetUser() != null)
            {
                string strUserName = Membership.GetUser().UserName;
                LabelUserName.Text = strUserName;
                if (strUserName == "admin")
                {
                    ImageMapRole.ImageUrl = "~/RolesPictures/Admin.gif";
                    LabelRole.Text = "(admin)";
                }
                else
                {
                    ImageMapRole.ImageUrl = "~/RolesPictures/Member.gif";
                    LabelRole.Text = "(user)";
                }
                LabelEMail.Text = Membership.GetUser().Email;
                LabelRegistrationDate.Text = Membership.GetUser().CreationDate.ToString();
            }
            else
            {
                LabelUserName.Text = "Anonymous";
                ImageMapRole.ImageUrl = "~/RolesPictures/Unknown.gif";
                LabelRole.Text = "(anonymous user)";
                LabelEMail.Text = "?";
                LabelRegistrationDate.Text = "Not registered";
            }
        }

    }
}