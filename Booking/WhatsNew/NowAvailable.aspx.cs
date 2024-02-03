using movies.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Booking.WhatsNew
{
    public partial class NowAvailable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateListView();

            }
        }

        protected void populateListView()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"SELECT Hotel.HotelName, Hotel.HotelImage, Hotel.HotelDescription, Type.Type, language.language, HotelStatus.HotelStatus, rating.rating
                             FROM Hotel inner join 
                             Type on Type.TypeId = Hotel.TypeId inner join
                             language on Hotel.languageId = language.languageId inner join
                             HotelStatus on Hotel.HotelStatusId = HotelStatus.HotelStatusId inner join
                             rating on Hotel.ratingId = rating.ratingId;";
            DataTable dt = myCrud.getDT(mySql);
            moviesLv.DataSource = dt;
            moviesLv.DataBind();
        }
    }
}