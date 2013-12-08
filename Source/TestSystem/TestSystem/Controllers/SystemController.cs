using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestSystem.Models;
using System.Data;
using System.Data.SqlClient;

namespace TestSystem.Controllers
{
    public class SystemController : Controller
    {
        //
        // GET: /System/

        public ViewResult Index()
        {
            return View();
        }

        [HttpGet]
        public ViewResult MerchantWare()
        {
            return View();
        }

        [HttpPost]
        public ViewResult MerchantWare(MerchantWare merchWare)
        {
            SqlConnection cs = new SqlConnection("Data Source=MW-test;Initial Catalog=mwSystemMapping;Trusted_Connection=Yes;Connect Timeout=300;");
            SqlDataAdapter da = new SqlDataAdapter();

            da.InsertCommand = new SqlCommand("INSERT INTO testMapping VALUES(@SystemName, @PathName)", cs);
            da.InsertCommand.Parameters.Add("@SystemName", SqlDbType.VarChar).Value = merchWare.SystemName;
            da.InsertCommand.Parameters.Add("@PathName", SqlDbType.VarChar).Value = merchWare.PathName;

            cs.Open();
            da.InsertCommand.ExecuteNonQuery();
            cs.Close();

            return View("System Added", merchWare);
        }

    }
}
