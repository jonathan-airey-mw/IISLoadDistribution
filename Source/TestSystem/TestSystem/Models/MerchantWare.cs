using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace TestSystem.Models
{
    public class MerchantWare
    {
        public string SystemName { get; set; }
        public string PathName { get; set; }

       /* public void saveToDB()
        {
            SqlConnection cs = new SqlConnection("Data Source=MW-test;Initial Catalog=mwSystemMapping;Trusted_Connection=Yes;Connect Timeout=300; providerName=System.Data.SqlClient");
            SqlDataAdapter da = new SqlDataAdapter();

            da.InsertCommand = new SqlCommand("INSERT INTO testMapping VALUES(@SystemName, @PathName)", cs);
            da.InsertCommand.Parameters.Add("@SystemName", SqlDbType.VarChar).Value = SystemName;
            da.InsertCommand.Parameters.Add("@SystemName", SqlDbType.VarChar).Value = PathName;

            cs.Open();
            da.InsertCommand.ExecuteNonQuery();
            cs.Close();

        }*/
    }


}