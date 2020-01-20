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

namespace OpenChessTeamTournament.MembersPages
{
    public partial class MakeOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelUsername.Text = Membership.GetUser().ToString();
            LabelEMail.Text = Membership.GetUser().Email;
            ButtonConfirm.Enabled = false;
            ButtonCancel.Enabled = false;
        }

        protected void TextValidate(object source, ServerValidateEventArgs e)
        {
            e.IsValid = (Convert.ToInt32(e.Value) >= 1 && Convert.ToInt32(e.Value) <= 1000000);
        }

        private int PayForDelivery(int totalCost) // дополнительные выплаты к стоимости в зависимости от выбора способа доставки
        {
            if (DropDownListDelivery.SelectedValue == "Home")
                return totalCost + 50;
            if (DropDownListDelivery.SelectedValue == "Meeting")
                return totalCost + 25;
            return totalCost;
        }

        protected void ButtonAddGoods_Click(object sender, EventArgs e) // формирование заказа
        {
            string strPriceOneKg = LabelCost.Text;
            int priceOneKg = Convert.ToInt32(strPriceOneKg);
            string strQuantityInKg = TextBoxKg.Text;
            int quantityInKg = Convert.ToInt32(strQuantityInKg);
            int totalCost = priceOneKg * quantityInKg;
            totalCost = PayForDelivery(totalCost);
            string strTotalCost = Convert.ToString(totalCost);
            LabelOrder.Text = DropDownListChemicals.SelectedItem + " (" + strQuantityInKg + ")";
            LabelTotalCost.Text = strTotalCost;
            ButtonAddGoods.Enabled = false;
            ButtonConfirm.Enabled = true;
            ButtonCancel.Enabled = true;
        }

        protected void ButtonConfirmDeal_Command(object sender, CommandEventArgs e) // подтверждение заказа
        {
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes") // подтверждение сделки
            {
                AddDealToDatabase();
                ButtonAddGoods.Enabled = true;
                ButtonConfirm.Enabled = false;
                ButtonCancel.Enabled = false;
            }
            else
            {
                ButtonConfirm.Enabled = true;
                ButtonCancel.Enabled = true;
            }
        }

        private void AddDealToDatabase() // добавление заказа в БД Ordergoods
        {
            // Did page validation succeed?
            if (!Page.IsValid)
                return;

            // Create and instantiate connection
            using (SqlConnection dealConnection = new SqlConnection())
            {
                // Initialize connection string from web.config
                dealConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionStringDeli"].ConnectionString;
                // Open connection
                dealConnection.Open();
                // Declare and instantiate data adapter
                SqlDataAdapter dealDataAdapter = new SqlDataAdapter();

                // Declare and instantiate command objects
                SqlCommand selectCommand = new SqlCommand("SELECT * FROM Ordergoods",
                dealConnection);
                SqlCommand insertCommand = new SqlCommand(
                    "INSERT INTO Ordergoods (Client, Last_name, First_name, EMail, Order_string, Delivery, Total_cost) VALUES (@Client, @Last_name, @First_name, @EMail, @Order_string, @Delivery, @Total_cost)", 
                    dealConnection);

                // Assign command objects
                dealDataAdapter.SelectCommand = selectCommand;
                dealDataAdapter.InsertCommand = insertCommand;

                // Declare and instantiate parameter objects
                SqlParameter insertClientParameter = new SqlParameter("@Client", SqlDbType.NVarChar, 100, "Client");
                SqlParameter insertLastNameParameter = new SqlParameter("@Last_name", SqlDbType.NVarChar, 100, "Last_name");
                SqlParameter insertFirstNameParameter = new SqlParameter("@First_name", SqlDbType.NVarChar, 100, "First_name");
                SqlParameter insertEMailParameter = new SqlParameter("@EMail", SqlDbType.NVarChar, 50, "EMail");
                SqlParameter insertOrderStringParameter = new SqlParameter("@Order_string", SqlDbType.NVarChar, Int32.MaxValue, "Order_string");
                SqlParameter insertDeliveryParameter = new SqlParameter("@Delivery", SqlDbType.NVarChar, 20, "Delivery");
                SqlParameter insertTotalCostParameter = new SqlParameter("@Total_cost", SqlDbType.Int, 0, "Total_cost");


                // Assign parameters to command object
                insertCommand.Parameters.Add(insertClientParameter);
                insertCommand.Parameters.Add(insertFirstNameParameter);
                insertCommand.Parameters.Add(insertLastNameParameter);
                insertCommand.Parameters.Add(insertEMailParameter);
                insertCommand.Parameters.Add(insertOrderStringParameter);
                insertCommand.Parameters.Add(insertDeliveryParameter);
                insertCommand.Parameters.Add(insertTotalCostParameter);

                // Declare and instantiate dataset
                DataSet dealDataSet =  new DataSet("DealDataSet");
                // Apply the full schema from the data source
                dealDataAdapter.FillSchema(dealDataSet, SchemaType.Source, "Ordergoods");
                dealDataAdapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
                dealDataAdapter.MissingMappingAction = MissingMappingAction.Passthrough;
                // Populate Customers DataTable
                dealDataAdapter.Fill(dealDataSet, "Ordergoods");

                // Create new row locally
                DataRow dealDataRow = dealDataSet.Tables["Ordergoods"].NewRow();
                dealDataRow["Client"] = LabelUsername.Text;
                dealDataRow["Last_name"] = TextBoxLastName.Text;
                dealDataRow["First_name"] = TextBoxFirstName.Text;
                dealDataRow["EMail"] = LabelEMail.Text;
                dealDataRow["Order_string"] = LabelOrder.Text;
                dealDataRow["Delivery"] = DropDownListDelivery.Text;
                dealDataRow["Total_cost"] = LabelTotalCost.Text;

                // Insert new row locally
                dealDataSet.Tables["Ordergoods"].Rows.Add(dealDataRow);

                // Update data source
                if (dealDataAdapter.Update(dealDataSet, "Ordergoods") == 1)
                {
                    // Reload page to refresh with "blank" input controls
                    Response.Redirect("~/MembersPages/MakeOrder.aspx");
                }
            } 
        }

        protected void ButtonCancel_Click(object sender, EventArgs e) // отмена заказа
        {
            LabelOrder.Text = "-";
            LabelTotalCost.Text = "-";
            ButtonAddGoods.Enabled = true;
            ButtonConfirm.Enabled = false;
            ButtonCancel.Enabled = false;
        }

        protected void DropDownListChemicals_SelectedIndexChanged(object sender, EventArgs e)
        {
            LabelCost.Text = DropDownListChemicals.SelectedValue;
        }

        protected void LabelCost_PreRender(object sender, EventArgs e)
        {
            LabelCost.Text = DropDownListChemicals.SelectedValue;
        }

        protected void DropDownListDelivery_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}