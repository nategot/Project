using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Text;

/// <summary>
/// Summary description for EventOnAir
/// </summary>
public class EventOnAir
{
    public EventOnAir()
    {

    }

    private int catedory;
    private int numOfParti;
    private string location;
    private DateTime dateTime;

    private double minAge;
    private double maxAge;
    private int frequency;
    private bool IsPrivate;
    private int adminID;
    private string comments;

    //prop
    public int Catedory
    {
        get { return catedory; }
        set { catedory = value; }
    }
    public int NumOfParti
    {
        get { return numOfParti; }
        set { numOfParti = value; }
    }
    public string Location
    {
        get { return location; }
        set { location = value; }
    }
    public DateTime DateTime
    {
        get { return dateTime; }
        set { dateTime = value; }
    }
    public double MinAge
    {
        get { return minAge; }
        set { minAge = value; }
    }
    public double MaxAge
    {
        get { return maxAge; }
        set { maxAge = value; }
    }
    public bool IsPrivate1
    {
        get { return IsPrivate; }
        set { IsPrivate = value; }
    }
    public int Frequency
    {
        get { return frequency; }
        set { frequency = value; }
    }
    public string Comments
    {
        get { return comments; }
        set { comments = value; }
    }
    public int AdminID
    {
        get { return adminID; }
        set { adminID = value; }
    }




    public int insert()
    {
        DBservices dbs = new DBservices();
        int numAffected = dbs.insert(this);
        return numAffected;
    }



    public DataTable readTable()
    {
        DBservices dbs = new DBservices();
        dbs = dbs.ReadFromDataBase("bgroup14_test1ConnectionString", "EventsOnAir");

        return dbs.dt;

    }

    //public void showdiscount(string amount, string discount)
    //{
    //    DBservices dbs = (DBservices)HttpContext.Current.Session["productDataSet"];
    //    DataTable dt = dbs.dt;
    //    for (int i = 0; i < dt.Rows.Count; i++)
    //    {

    //        if (double.Parse((dt.Rows[i].ItemArray[3]).ToString()) > double.Parse((amount)))
    //        {
    //            price = int.Parse((dt.Rows[i].ItemArray[2]).ToString());
    //            price = price * (((100 - double.Parse((discount))) / 100));
    //            dt.Rows[i]["price"] = price;
    //        }
    //    }

    //    HttpContext.Current.Session["productDataBase"] = dbs;


    //}

    //public void updateDatabase()
    //{

    //    if (HttpContext.Current.Session["productDataBase"] == null) return;
    //    DBservices dbs = (DBservices)HttpContext.Current.Session["productDataBase"];
    //    dbs.Update(dbs);
    //}


    //public int UpdatDBCount(string names, int count)
    //{
    //    DBservices dbs = new DBservices();
    //    int numAffected = dbs.Updatecount(names, count);
    //    return numAffected;
    //}
}