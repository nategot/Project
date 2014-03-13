using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// Summary description for DBservices
/// </summary>
public class DBservices
{
    public SqlDataAdapter da;
    public DataTable dt;

    public DBservices()
    {
    }
    public SqlConnection connect(String conString)
    {
        string cStr = WebConfigurationManager.ConnectionStrings[conString].ConnectionString;
        SqlConnection con = new SqlConnection(cStr);
        con.Open();
        return con;
    }

    //insert event to DB
    public int insert(EventOnAir p)
    {
        SqlConnection con;
        SqlCommand cmd;

        try
        {
            con = connect("bgroup14_test1ConnectionString");
        }
        catch (Exception ex)
        {
            throw (ex);
        }

        String cStr = BuildInsertCommand(p);      // helper method to build the insert string

        cmd = CreateCommand(cStr, con);             // create the command

        try
        {
            int numEffected = cmd.ExecuteNonQuery(); // execute the command
            return numEffected;
        }
        catch (Exception ex)
        {
            return 0;
            // write to log
            throw (ex);
        }

        finally
        {
            if (con != null)
            {
                // close the db connection
                con.Close();
            }
        }

    }

    private String BuildInsertCommand(EventOnAir p)//build insert command
    {
        String command;
        int isprivate = 0;
        string dateStr = " ";
        StringBuilder sb = new StringBuilder();
        if (p.IsPrivate1)
            isprivate = 1;

        dateStr += p.DateTime.Month.ToString() + "/" + p.DateTime.Day.ToString() + "/" + p.DateTime.Year.ToString() + " " + p.DateTime.Hour.ToString() + ":" + p.DateTime.Minute.ToString() + "0:00";



        sb.AppendFormat("Values({0}, {1} ,{2}, {3},{4},'{5}',{6},{7},'{8}')", p.Location, p.NumOfParti, p.Catedory, p.Frequency, isprivate, dateStr, p.MinAge, p.MaxAge, p.Comments);
        String prefix = "INSERT INTO EventsOnAir " + "(CourtId, NumOfParticipants, CategoryId, FrequencyId, [Private],[Time],MinAge,MaxAge,Comments)";
        command = prefix + sb.ToString();

        return command;
    }

    private SqlCommand CreateCommand(String CommandSTR, SqlConnection con)
    {

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = CommandSTR;
        cmd.CommandTimeout = 10;
        cmd.CommandType = System.Data.CommandType.Text;
        return cmd;
    }

   
    //--------------------------------------------------------------------
    // Read from the DB into a table
    //--------------------------------------------------------------------
    public DBservices ReadFromDataBase(string conString, string tableName)
    {

        DBservices dbS = new DBservices(); // create a helper class
        SqlConnection con = null;

        try
        {
            con = dbS.connect(conString); // open the connection to the database/

            String selectStr = "SELECT * FROM " + tableName; // create the select that will be used by the adapter to select data from the DB

            SqlDataAdapter da = new SqlDataAdapter(selectStr, con); // create the data adapter

            DataSet ds = new DataSet(); // create a DataSet and give it a name (not mandatory) as defualt it will be the same name as the DB
            da.Fill(ds);                        // Fill the datatable (in the dataset), using the Select command
            DataTable dt = ds.Tables[0];

            // add the datatable and the dataa adapter to the dbS helper class in order to be able to save it to a Session Object
            dbS.dt = dt;
            dbS.da = da;


            return dbS;
        }
        catch (Exception ex)
        {
            // write to log
            throw ex;
        }
        finally
        {
            if (con != null)
            {
                con.Close();
            }
        }
    }

    //read one event
    public DBservices ReadFromDataBase(string conString, string tableName,string eventnum)
    {

        DBservices dbS = new DBservices(); // create a helper class
        SqlConnection con = null;

        try
        {
            con = dbS.connect(conString); // open the connection to the database/

            String selectStr = "SELECT * FROM " + tableName +" Where [EventNumber]  = " + eventnum; // create the select that will be used by the adapter to select data from the DB

            SqlDataAdapter da = new SqlDataAdapter(selectStr, con); // create the data adapter

            DataSet ds = new DataSet(); // create a DataSet and give it a name (not mandatory) as defualt it will be the same name as the DB
            da.Fill(ds);                        // Fill the datatable (in the dataset), using the Select command
            DataTable dt = ds.Tables[0];

            // add the datatable and the dataa adapter to the dbS helper class in order to be able to save it to a Session Object
            dbS.dt = dt;
            dbS.da = da;


            return dbS;
        }
        catch (Exception ex)
        {
            // write to log
            throw ex;
        }
        finally
        {
            if (con != null)
            {
                con.Close();
            }
        }
    }
    public void Update(DBservices dbs)
    {
        SqlCommandBuilder builder = new SqlCommandBuilder(dbs.da);
        da.Update(dbs.dt);
    }

    ///update 
    public int Updatecount(string names, int count)
    {
        SqlConnection con;
        SqlCommand cmd;

        try
        {
            con = connect("ProductsDBConnectionString");
        }
        catch (Exception ex)
        {
            throw (ex);
        }

        String cStr = BuildUpdatCommand(names, count);      // helper method to build the insert string

        cmd = CreateCommand(cStr, con);             // create the command

        try
        {
            int numEffected = cmd.ExecuteNonQuery(); // execute the command
            return numEffected;
        }
        catch (Exception ex)
        {
            return 0;
            // write to log
            throw (ex);
        }

        finally
        {
            if (con != null)
            {
                // close the db connection
                con.Close();
            }
        }

    }

    private String BuildUpdatCommand(string nameT, int count)//build update command
    {
        String command;
        StringBuilder sb = new StringBuilder();
        String com = " UPDATE ProductsInShop SET amount=amount-" + count + " WHERE name='" + nameT + "'";
        command = com;

        return command;
    }
}
