﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace POS_Code
{
    public partial class StudentHome : System.Web.UI.Page
    {
        string sNetId;

        protected void Page_Load(object sender, EventArgs e)
        {
           sNetId = Session["NetID"].ToString();
        }
    }
}
