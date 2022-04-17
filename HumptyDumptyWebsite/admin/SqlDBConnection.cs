using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace M4
{
    using System;
    using System.Data;
    using System.Data.SqlClient;

    class SqlDBConnection
    {
        public string sql;
        public SqlConnection conn;
        public SqlCommand command;
        public SqlDataAdapter da;
        public SqlCommandBuilder cmdBuilder;

        public SqlDBConnection()
        {
            string ConnString = "Server=143.128.146.30\\ist3;Database=group2;User ID=group2;Password=bf4882";
            conn = new SqlConnection(ConnString);
        }

        public DataSet GetDataSet(string sqlQuery,string table)
        {
            try
            {
                command = new SqlCommand(sqlQuery, conn);
                da = new SqlDataAdapter(command);
                DataSet ds = new DataSet();
                da.Fill(ds, table);
                return ds;
            }
            catch(Exception)
            {
                return null;
            }
        }

        public void Update(DataTable dt)
        {
            cmdBuilder = new SqlCommandBuilder(da);
            da.Update(dt);
        }

    }

}