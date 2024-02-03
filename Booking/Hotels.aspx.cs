using movies.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Booking
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populateBooking();
                // populateListView();

            }//post back boundery
        }

        protected void populateBooking()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select BookingId, Booking from Booking";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlCinema.DataTextField = "Booking";
            ddlCinema.DataValueField = "BookingId";
            ddlCinema.DataSource = dr;
            ddlCinema.DataBind();

            populateListView();
        }

        protected void populateListView()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"	    select Hotel.HotelImage, Hotel.HotelName, Hotel.HotelDescription, language.language, Type.Type, rating.rating,
		HotelInBooking.HotelInBookingDate ,HotelInBooking.HotelInBookingPrice from HotelInBooking 
		inner join Hotel on Hotel.HotelId = HotelInBooking.HotelId inner join Type
	    on Hotel.TypeId = Type.TypeId inner join rating on Hotel.ratingId = rating.ratingId 
	    inner join language on Hotel.languageId = language.languageId where HotelInBooking.BookingId =@BookingId;";

            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@BookingId", ddlCinema.SelectedValue);
            DataTable dt = myCrud.getDTPassSqlDic(mySql, myPara);
            moviesLv.DataSource = dt;
            moviesLv.DataBind();
        }

        protected void btnMoviesAvailable_Click(object sender, EventArgs e)
        {
            populateListView();
        }
    }
}