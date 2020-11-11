using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace PRG4_MG4P3_0320180002_B2
{
    public class DatabaseHelper
    {
        private SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AkademikDB_002ConnectionString"].ConnectionString);
        
        /// <summary>
        /// get data from database using stored procedure
        /// </summary>
        /// <param name="paramList"></param>
        /// <param name="sp"></param>
        /// <returns></returns>
        public DataSet GetDataSetWithSearch(List<Parameter> paramList, string sp)
        {
            try
            {
                DataSet result = new DataSet();
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandText = sp;
                com.CommandType = CommandType.StoredProcedure;
                
                foreach(Parameter x in paramList)
                {
                    com.Parameters.AddWithValue(x.Key, x.Value);
                }

                SqlDataAdapter adap = new SqlDataAdapter(com);
                adap.Fill(result);
                return result;
            }
            catch(Exception ex)
            {
                Debug.WriteLine(ex.Message);
                return null;
            }
        }

        /// <summary>
        /// Insert, Update, or Delete data to database using stored procedure
        /// </summary>
        /// <param name="paramList"></param>
        /// <param name="sp"></param>
        /// <returns></returns>
        public int CommandWithProc(List<Parameter> paramList, string sp)
        {
            int result = 0;
            con.Open();
            try
            {
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandText = sp;
                com.CommandType = CommandType.StoredProcedure;

                foreach (Parameter x in paramList)
                {
                    com.Parameters.AddWithValue(x.Key, x.Value);
                }

                result =  com.ExecuteNonQuery();
            }
            catch(Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
            finally
            {
                con.Close();
            }

            return result;
        }
    }
}