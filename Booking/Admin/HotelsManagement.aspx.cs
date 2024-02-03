using movies.App_Code;
using System;
using System.Configuration;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

namespace Booking.Admin
{
    public partial class HotelsManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                populateGenre();
                populateLanguage();
                populateStatus();
                populateRating();
            }
        }

        // put this immediately after page_load method, fixes error when exporting pdf, word, excel, etc
        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }

        protected void populateGenre()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select TypeId, Type from Type";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlGenre.DataTextField = "Type";
            ddlGenre.DataValueField = "TypeId";
            ddlGenre.DataSource = dr;
            ddlGenre.DataBind();
        }

        protected void populateLanguage()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select languageId, language from language";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlLang.DataTextField = "language";
            ddlLang.DataValueField = "languageId";
            ddlLang.DataSource = dr;
            ddlLang.DataBind();
        }

        protected void populateStatus()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select HotelStatusId, HotelStatus from HotelStatus";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            rbtlStatus.DataTextField = "HotelStatus";
            rbtlStatus.DataValueField = "HotelStatusId";
            rbtlStatus.DataSource = dr;
            rbtlStatus.DataBind();
        }

        protected void populateRating()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select ratingId, rating from rating";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlRating.DataTextField = "rating";
            ddlRating.DataValueField = "ratingId";
            ddlRating.DataSource = dr;
            ddlRating.DataBind();
        }


        protected void populateMoviesGv()
        {

            CRUD myCrud = new CRUD();
            string mySql = @"SELECT Hotel.HotelId, Hotel.HotelName, Hotel.HotelImage, Hotel.HotelDescription, Type.Type, language.language, Hotel.HotelRelease, HotelStatus.HotelStatus, rating.rating
                             FROM Hotel inner join 
                             Type on Type.TypeId = Hotel.TypeId inner join
                             language on Hotel.languageId = language.languageId inner join
                             HotelStatus on Hotel.HotelStatusId = HotelStatus.HotelStatusId inner join
                             rating on Hotel.ratingId = rating.ratingId;";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            moviesGvV2.DataSource = dr;
            moviesGvV2.DataBind();

            //these three methods are essential for getting DataTables to work on gridview
            moviesGvV2.UseAccessibleHeader = true;
            moviesGvV2.HeaderRow.TableSection = TableRowSection.TableHeader;
            moviesGvV2.FooterRow.TableSection = TableRowSection.TableFooter;
        }

        //this colorlesss gridview is for export buttons
        protected void populateMoviesGvNoImages()
        {

            CRUD myCrud = new CRUD();
            string mySql = @"SELECT Hotel.HotelId, Hotel.HotelName, Hotel.HotelDescription, Type.Type, language.language, Hotel.HotelRelease, HotelStatus.HotelStatus, rating.rating
                             FROM Hotel inner join 
                             Type on Type.TypeId = Hotel.TypeId inner join
                             language on Hotel.languageId = language.languageId inner join
                             HotelStatus on Hotel.HotelStatusId = HotelStatus.HotelStatusId inner join
                             rating on Hotel.ratingId = rating.ratingId;";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            moviesGv.DataSource = dr;
            moviesGv.DataBind();
        }


        //protected void populateMoviesGv()
        //{

        //    CRUD myCrud = new CRUD();
        //    string mySql = @"SELECT Hotel.HotelId, Hotel.HotelName, Hotel.HotelImage, Hotel.HotelDescription, Type.Type, language.language, Hotel.HotelRelease, HotelStatus.HotelStatus, rating.rating
        //                     FROM Hotel inner join 
        //                     Type on Type.TypeId = Hotel.TypeId inner join
        //                     language on Hotel.languageId = language.languageId inner join
        //                     HotelStatus on Hotel.HotelStatusId = HotelStatus.HotelStatusId inner join
        //                     rating on Hotel.ratingId = rating.ratingId;";
        //    SqlDataReader dr = myCrud.getDrPassSql(mySql);
        //    moviesGv.DataSource = dr;
        //    moviesGv.DataBind();
        //}


        protected void btnAddMovie_Click(object sender, EventArgs e)
        {

            //set uploaded file to HttpPostedFile object
            HttpPostedFile postedFile = fileupMovieCover.PostedFile;

            //get uploaded file extension
            string fileName = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(fileName);

            CRUD myCrud = new CRUD();
            string mySql = @"INSERT INTO Hotel
           ( HotelName, HotelDescription, HotelImage, TypeId, languageId, HotelRelease, HotelStatusId, ratingId) VALUES
           ( @HotelName, @HotelDescription, @HotelImage, @TypeId, @languageId, @HotelRelease, @HotelStatusId, @ratingId)
            SELECT CAST(scope_identity() AS int)";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@HotelName", txtMovieTitle.Text);
            
            myPara.Add("@HotelDescription", txtMovieDesc.Text);

            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".jpeg")
            {
                Stream stream = postedFile.InputStream;
                myPara.Add("@HotelImage", stream);
            }
;
            myPara.Add("@TypeId", ddlGenre.SelectedValue);
            myPara.Add("@languageId", ddlLang.SelectedValue);
            myPara.Add("@HotelRelease", txtmovieRelease.Text);
            myPara.Add("@HotelStatusId", rbtlStatus.SelectedValue);
            myPara.Add("@ratingId", ddlRating.SelectedValue);
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if (rtn >= 1)
            {
                lblOutput.Text = "Succesfully Added Hotel";
            }
            else
            {
                lblOutput.Text = "Failed to Add Movie";
            }

            //  populateMoviesGv();
        }

        protected void btnInsertType_Click(object sender, EventArgs e)
        {


            CRUD myCrud = new CRUD();
            string mySql = @"insert into Type(Type) values(@Type);";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@Type", txtHotelType.Text);
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);

            if (rtn >= 1)
            {
                lblOutput.Text = "Succesfully Added Hotel Type";
            }
            else
            {
                lblOutput.Text = "Failed to Add Hotel Type";
            }

            

        }

        protected void btnInsertLang_Click(object sender, EventArgs e)
        {


            CRUD myCrud = new CRUD();
            string mySql = @"insert into language(language) values(@language);";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@language", txtLanguage.Text);
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);

            if (rtn >= 1)
            {
                lblOutput.Text = "Succesfully Added language";
            }
            else
            {
                lblOutput.Text = "Failed to Add Hotel language";
            }



        }

        protected void btnInsertHtlStatus_Click(object sender, EventArgs e)
        {


            CRUD myCrud = new CRUD();
            string mySql = @"insert into HotelStatus(HotelStatus) values(@HotelStatus);";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@HotelStatus", txtHotelStatus.Text);
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);

            if (rtn >= 1)
            {
                lblOutput.Text = "Succesfully Added Hotel Status";
            }
            else
            {
                lblOutput.Text = "Failed to Add Hotel Hotel Status";
            }



        }

        protected void btnInsertRating_Click(object sender, EventArgs e)
        {


            CRUD myCrud = new CRUD();
            string mySql = @"insert into Type(Type) values(@Type);";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@Type", txtHotelType.Text);
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);

            if (rtn >= 1)
            {
                lblOutput.Text = "Succesfully Added Hotel Type";
            }
            else
            {
                lblOutput.Text = "Failed to Add Hotel Type";
            }



        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            //set uploaded file to HttpPostedFile object
            HttpPostedFile postedFile = fileupMovieCover.PostedFile;

            //get uploaded file extension
            string fileName = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(fileName);

            CRUD myCrud = new CRUD();
            string mySql = @"update Hotel set HotelName =@HotelName, HotelDescription=@HotelDescription, HotelImage=@HotelImage, TypeId=@TypeId, languageId=@languageId, HotelRelease=@HotelRelease,
                             HotelStatusId=@HotelStatusId, ratingId=@ratingId
                             where HotelId = @HotelId
                             SELECT CAST(scope_identity() AS int);";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@HotelName", txtMovieTitle.Text);
            myPara.Add("@HotelDescription", txtMovieDesc.Text);

            //condition to only accept uploaded images with .jpg, .png, .jpeg extensions and then reads the content of the file via inputStream
            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".jpeg")
            {
                Stream stream = postedFile.InputStream;
                myPara.Add("@HotelImage", stream);
            }

            myPara.Add("@TypeId", ddlGenre.SelectedValue);
            myPara.Add("@languageId", ddlLang.SelectedValue);
            myPara.Add("@HotelRelease", txtmovieRelease.Text);
            myPara.Add("@HotelStatusId", rbtlStatus.SelectedValue);
            myPara.Add("@ratingId", ddlRating.SelectedValue);
            myPara.Add("@HotelId", int.Parse(txtHotelId.Text));
            int pk = int.Parse(txtHotelId.Text);
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if (rtn >= 1)
            {
                lblOutput.Text = "Succesfully Updated Hotel";
            }
            else
            {
                lblOutput.Text = "Failed to Update Hotel";
            }

            populateMoviesGv();

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"delete Hotel where HotelId=@HotelId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@HotelId", int.Parse(txtHotelId.Text));
            int pk = int.Parse(txtHotelId.Text);
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if (rtn >= 1)
            {
                lblOutput.Text = "Succesfully Deleted Hotel";
            }
            else
            {
                lblOutput.Text = "Failed to Delete Hotel";
            }
            //  populateMoviesGv();
        }

        protected void btnDisplayAllMovies_Click(object sender, EventArgs e)
        {
            populateMoviesGv();
        }

        protected void btnExportToExcel_Click_Click(object sender, EventArgs e)
        {
            populateMoviesGvNoImages();
            ExportGridToExcel(moviesGv);
        }
        public void ExportGridToExcel(GridView grd)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grd.AllowPaging = false;
            populateMoviesGvNoImages();
            grd.RenderControl(hw);
            string style = @"<style> .textmode { mso-number-format:\@; } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }

        protected void btnExportToWord_Click_Click(object sender, EventArgs e)
        {
            populateMoviesGvNoImages();
            ExportGridToword();
        }
        public void ExportGridToword()
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
            moviesGv.GridLines = GridLines.Both;
            moviesGv.HeaderStyle.Font.Bold = true;
            moviesGv.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }

        protected void btnExportToPdf_Click_Click(object sender, EventArgs e)
        {
            populateMoviesGvNoImages();
            ExportGridToPDF();
        }
        public void ExportGridToPDF()
        {

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            moviesGv.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            iTextSharp.text.html.simpleparser.HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            moviesGv.AllowPaging = true;
            moviesGv.DataBind();
        }


        protected void gvTicketDataAdmin_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "update")
            {   // shows how to get column values from gv
                Response.Write("test");
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                int customerTicketId = Convert.ToInt32(e.CommandArgument);
                lblOutput.Text = customerTicketId.ToString();


                populateMoviesGv();
            }
            populateMoviesGv();
        }
        protected void gvAdminLinkButton_Click(object sender, EventArgs e)
        {
            int PK = int.Parse((sender as LinkButton).CommandArgument);
            //lblOuput.Text = PK.ToString();
            string mySql = @"SELECT HotelId
                              ,HotelName
                              ,HotelDescription
                              ,HotelImage
                              ,TypeId
                              ,languageId
                              ,HotelRelease
                              ,HotelStatusId
                              ,ratingId
                          FROM Hotel where HotelId = @HotelId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@HotelId", PK);
            CRUD myCrud = new CRUD();
            SqlDataReader dr = myCrud.getDrPassSql(mySql, myPara);
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    String HotelId = dr["HotelId"].ToString();
                    String HotelTitle = dr["HotelName"].ToString();
                    String HotelDesc = dr["HotelDescription"].ToString();
                    String HotelType = dr["TypeId"].ToString();
                    String HotelLang = dr["languageId"].ToString();
                    String HotelRelease = dr["HotelRelease"].ToString();
                    String HotelStatus = dr["HotelStatusId"].ToString();
                    String HotelRating = dr["ratingId"].ToString();
                    txtMovieTitle.Text = HotelTitle;
                    txtMovieDesc.Text = HotelDesc;
                    ddlGenre.SelectedValue = HotelType;
                    ddlLang.SelectedValue = HotelLang;
                    txtmovieRelease.Text = HotelRelease;
                    rbtlStatus.SelectedValue = HotelStatus;
                    ddlRating.SelectedValue = HotelRating;
                    txtHotelId.Text = HotelId;
                }
            }
        }

    }
}