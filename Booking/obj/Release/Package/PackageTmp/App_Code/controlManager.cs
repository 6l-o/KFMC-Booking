using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace movies.App_Code
{
    public class controlManager
    {
        public void populateCommbo(string mySql, DropDownList myCombo, string myValueField, string myDataField)
        {
            CRUD myCrud = new CRUD();
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            myCombo.DataValueField = myValueField;
            myCombo.DataTextField = myDataField;
            myCombo.DataSource = dr;
            myCombo.DataBind();
        }
        public void populateList(string mySql, ListBox myList, string myValueField, string myDataField)
        {
            CRUD myCrud = new CRUD();
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            myList.DataValueField = myValueField;
            myList.DataTextField = myDataField;
            myList.DataSource = dr;
            myList.DataBind();
        }
        public void populateCheckBoxList(string mySql, CheckBoxList myListBox, string myValueField, string myDataField)
        {
            CRUD myCrud = new CRUD();
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            myListBox.DataValueField = myValueField;
            myListBox.DataTextField = myDataField;
            myListBox.DataSource = dr;
            myListBox.DataBind();
        }
        public void populateRadioButtonList(string mySql, RadioButtonList myRadioButtonList, string myValueField, string myDataField)
        {
            CRUD myCrud = new CRUD();
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            myRadioButtonList.DataValueField = myValueField;
            myRadioButtonList.DataTextField = myDataField;
            myRadioButtonList.DataSource = dr;
            myRadioButtonList.DataBind();
        }
        public void populateGv(string mySql, GridView myGridview)
        {
            CRUD myCrud = new CRUD();
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            myGridview.DataSource = dr;
            myGridview.DataBind();
        }
    }
}