using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpenChessTeamTournament
{
    public partial class ChemicalInfo : System.Web.UI.Page
    {
        private const string fileNotFoundPath = "~/ChemicalsPictures/404.jpg"; // путь к изображению по умолчанию

        protected void Page_Load(object sender, EventArgs e)
        {
            // установка в метки значений из выбранной ранее в GridView строки
            string strChemical = Request.QueryString["chemical"];
            string strSymbol = Request.QueryString["symbol"];
            string strTablenumber = Request.QueryString["tablenumber"];
            string strCharacteristic = Request.QueryString["characteristic"];
            LabelChemical.Text = strChemical;
            LabelSymbol.Text = strSymbol;
            LabelTableNumber.Text = strTablenumber;
            LabelCharacteristic.Text = strCharacteristic;
            string filePath = "~/ChemicalsPictures/" + strTablenumber + ".jpg";
            if (!File.Exists(Server.MapPath(filePath))) // проверка существования картинки, соответствующей выбранному химическому элементу
                ImageMapChemical.ImageUrl = fileNotFoundPath;
            else
                ImageMapChemical.ImageUrl = filePath;
        }

        protected void ButtonMakeDeal_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MembersPages/MakeOrder.aspx");
        }
    }
}