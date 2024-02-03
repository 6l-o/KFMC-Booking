using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using movies.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Booking.Admin
{
    public partial class CitiesManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populateBooking();
                populateMovie();
                //    populateMoviesGv();
            }
        }//page load boundery

        // put this immediately after page_load method, fixes error when exporting pdf, word, excel, etc
        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }


        //Cinemas admin management controls

        protected void populateBooking()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select BookingId, Booking from Booking";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlCinema.DataTextField = "Booking";
            ddlCinema.DataValueField = "BookingId";
            ddlCinema.DataSource = dr;
            ddlCinema.DataBind();
        }

        protected void populateMovie()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select HotelId, HotelName from Hotel";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlMovie.DataTextField = "HotelName";
            ddlMovie.DataValueField = "HotelId";
            ddlMovie.DataSource = dr;
            ddlMovie.DataBind();
        }

        protected void btnAddCinema_Click(object sender, EventArgs e)
        {


            CRUD myCrud = new CRUD();
            string mySql = @"insert into Booking(Booking) values(@Booking);";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@Booking", txtAddCinema.Text);
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);

            if (rtn >= 1)
            {
                lblOutput.Text = "Succesfully Added Cinema";
            }
            else
            {
                lblOutput.Text = "Failed to Add Cinema";
            }

            populateBookingsGv();

        }

        protected void btnDeleteCinema_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"delete Booking from Booking where BookingId = @BookingId;";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@BookingId", int.Parse(txtDeleteCinema.Text));
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);

            if (rtn >= 1)
            {
                lblOutput.Text = "Succesfully Deleted Cinema";
            }
            else
            {
                lblOutput.Text = "Failed to Delete Cinema";
            }

            populateBookingsGv();

        }

        protected void btnShowAllCinema_Click(object sender, EventArgs e)
        {
            populateBookingsGv();

        }

        protected void populateBookingsGv()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select BookingId, Booking from Booking;";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            cinemasGv.DataSource = dr;
            cinemasGv.DataBind();
            cinemasGv.UseAccessibleHeader = true;
            cinemasGv.HeaderRow.TableSection = TableRowSection.TableHeader;
            cinemasGv.FooterRow.TableSection = TableRowSection.TableFooter;
        }

        protected void populateBookingsGvNoColors()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select BookingId, Booking from Booking;";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            cinemasGvNoColors.DataSource = dr;
            cinemasGvNoColors.DataBind();
        }

        protected void btnExportToExcelCinemas_Click(object sender, EventArgs e)
        {
            populateBookingsGvNoColors();
            ExportGridToExcelCinemasGv(cinemasGvNoColors);
        }
        public void ExportGridToExcelCinemasGv(GridView grd)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grd.AllowPaging = false;
            populateBookingsGvNoColors();
            grd.RenderControl(hw);
            string style = @"<style> .textmode { mso-number-format:\@; } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }

        protected void btnExportToWordCinemas_Click(object sender, EventArgs e)
        {
            populateBookingsGvNoColors();
            ExportGridTowordCinemasGv();
        }
        public void ExportGridTowordCinemasGv()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            //string FileName = "Vithal" + DateTime.Now + ".doc";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/msword";
            Response.AddHeader("Content-Disposition", "attachment;filename=GridViewExport.doc");
            cinemasGvNoColors.GridLines = GridLines.Both;
            cinemasGvNoColors.HeaderStyle.Font.Bold = true;
            cinemasGvNoColors.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }

        protected void btnExportToPDFCinemas_Click(object sender, EventArgs e)
        {
            populateBookingsGvNoColors();
            ExportGridToPDFCinemasGv();
        }
        public void ExportGridToPDFCinemasGv()
        {

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            cinemasGvNoColors.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            iTextSharp.text.html.simpleparser.HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            cinemasGvNoColors.AllowPaging = true;
            cinemasGvNoColors.DataBind();
        }





        //Movies In Cinemas admin management controls

        protected void btnAddMovieToCinema_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"INSERT INTO HotelInBooking
                     (BookingId,HotelId,HotelInBookingDate,HotelInBookingPrice)
                     VALUES(@BookingId,@HotelId,@HotelInBookingDate,@HotelInBookingPrice)";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@BookingId", ddlCinema.SelectedValue);
            myPara.Add("@HotelId", ddlMovie.SelectedValue);

            myPara.Add("@HotelInBookingDate", Convert.ToDateTime(txtDate.Text));
            myPara.Add("@HotelInBookingPrice", decimal.Parse(txtTicketPrice.Text));
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if (rtn >= 1)
            {
                lblOutput.Text = "Succesfully Added Hotel in Booking";
            }
            else
            {
                lblOutput.Text = "Failed to Add Hotel in Booking";
            }

            populateMoviesInCinemasGv();

        }

        protected void btnRemoveMovieInCinema_Click(object sender, EventArgs e)
        {

            CRUD myCrud = new CRUD();
            string mySql = @"delete HotelInBooking where HotelInBookingId = @HotelInBookingId;";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@HotelInBookingId", int.Parse(txtHotelInBookingId.Text));
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);

            if (rtn >= 1)
            {
                lblOutput.Text = "Succesfully Deleted Movie In Cinema";
            }
            else
            {
                lblOutput.Text = "Failed to Delete Movie In Cinema";
            }

            populateMoviesInCinemasGv();
        }

        protected void btnShowAllMoviesInCinemas_Click(object sender, EventArgs e)
        {
            populateMoviesInCinemasGv();
        }

        protected void populateMoviesInCinemasGv()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select HotelInBooking.HotelInBookingId, Hotel.HotelName, Booking.Booking, HotelInBooking.HotelInBookingDate, HotelInBooking.HotelInBookingPrice
                              from HotelInBooking inner join Booking
                              on HotelInBooking.BookingId = Booking.BookingId inner join Hotel
                              on HotelInBooking.HotelId = Hotel.HotelId";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            MoviesInCinemasGv.DataSource = dr;
            MoviesInCinemasGv.DataBind();
            MoviesInCinemasGv.UseAccessibleHeader = true;
            MoviesInCinemasGv.HeaderRow.TableSection = TableRowSection.TableHeader;
            MoviesInCinemasGv.FooterRow.TableSection = TableRowSection.TableFooter;
        }

        protected void populateMoviesInCinemasGvNoColors()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select HotelInBooking.HotelInBookingId, Hotel.HotelName, Booking.Booking, HotelInBooking.HotelInBookingDate, HotelInBooking.HotelInBookingPrice
                              from HotelInBooking inner join Booking
                              on HotelInBooking.BookingId = Booking.BookingId inner join Hotel
                              on HotelInBooking.HotelId = Hotel.HotelId";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            MoviesInCinemasGvNoColors.DataSource = dr;
            MoviesInCinemasGvNoColors.DataBind();
        }

        protected void btnExportExcelMoviesInCinemas_Click(object sender, EventArgs e)
        {
            populateMoviesInCinemasGvNoColors();
            ExportGridToExcelMoviesInCinemasGv(MoviesInCinemasGvNoColors);
        }
        public void ExportGridToExcelMoviesInCinemasGv(GridView grd)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grd.AllowPaging = false;
            populateMoviesInCinemasGvNoColors();
            grd.RenderControl(hw);
            string style = @"<style> .textmode { mso-number-format:\@; } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }

        protected void btnExportWordMoviesInCinemas_Click(object sender, EventArgs e)
        {
            populateMoviesInCinemasGvNoColors();
            ExportGridTowordMoviesInCinemasGv();
        }
        public void ExportGridTowordMoviesInCinemasGv()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            //string FileName = "Vithal" + DateTime.Now + ".doc";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/msword";
            Response.AddHeader("Content-Disposition", "attachment;filename=GridViewExport.doc");
            MoviesInCinemasGvNoColors.GridLines = GridLines.Both;
            MoviesInCinemasGvNoColors.HeaderStyle.Font.Bold = true;
            MoviesInCinemasGvNoColors.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }

        protected void btnExportPDFMoviesInCinemas_Click(object sender, EventArgs e)
        {
            populateMoviesInCinemasGvNoColors();
            ExportGridToPDFMoviesInCinemasGv();
        }
        public void ExportGridToPDFMoviesInCinemasGv()
        {

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            MoviesInCinemasGvNoColors.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            iTextSharp.text.html.simpleparser.HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            MoviesInCinemasGvNoColors.AllowPaging = true;
            MoviesInCinemasGvNoColors.DataBind();
        }


        protected void populateBookingsGv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "update")
            {
                Response.Write("test");
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                int customerTicketId = Convert.ToInt32(e.CommandArgument);
                lblOutput.Text = customerTicketId.ToString();


                populateBookingsGv();
            }
            populateBookingsGv();
        }


        protected void gvAdminLinkButton1_Click(object sender, EventArgs e)
        {
            int PK = int.Parse((sender as LinkButton).CommandArgument);
            //lblOuput.Text = PK.ToString();
            string mySql = @"select BookingId, Booking from Booking where BookingId=@BookingId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@BookingId", PK);
            CRUD myCrud = new CRUD();
            SqlDataReader dr = myCrud.getDrPassSql(mySql, myPara);
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    String BookingId = dr["BookingId"].ToString();
                    String BookingName = dr["Booking"].ToString();
                    txtDeleteCinema.Text = BookingId;
                    txtAddCinema.Text = BookingName;
                }
            }
        }


        protected void populateMoviesInCinemasGv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "update")
            {
                Response.Write("test");
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                int customerTicketId = Convert.ToInt32(e.CommandArgument);
                lblOutput.Text = customerTicketId.ToString();


                populateMoviesInCinemasGv();
            }
            populateMoviesInCinemasGv();
        }


        protected void gvAdminLinkButton2_Click(object sender, EventArgs e)
        {
            int PK = int.Parse((sender as LinkButton).CommandArgument);
            //lblOuput.Text = PK.ToString();
            string mySql = @"SELECT HotelInBookingId
                                  ,BookingId
                                  ,HotelId
                                  ,HotelInBookingDate
                                  ,HotelInBookingPrice
                                  FROM HotelInBooking where HotelInBookingId =@HotelInBookingId ";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@HotelInBookingId", PK);
            CRUD myCrud = new CRUD();
            SqlDataReader dr = myCrud.getDrPassSql(mySql, myPara);
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    String HotelInBookingId = dr["HotelInBookingId"].ToString();
                    String BookingId = dr["BookingId"].ToString();
                    String HotelId = dr["HotelId"].ToString();
                    String HotelInBookingDate = dr["HotelInBookingDate"].ToString();
                    String HotelInBookingPrice = dr["HotelInBookingPrice"].ToString();
                    txtHotelInBookingId.Text = HotelInBookingId;
                    ddlCinema.SelectedValue = BookingId;
                    ddlMovie.SelectedValue = HotelId;
                    txtDate.Text = HotelInBookingDate.Substring(0, 9);
                    //txtTime.Text = HotelInBookingDate.Substring(9, 8);
                    txtTicketPrice.Text = HotelInBookingPrice;
                }
            }
        }

    }// class boundery
}//namespace boundery