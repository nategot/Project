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
    private string address;
    private DateTime dateTime;
    private double minAge;
    private double maxAge;
    private int frequency;
    private bool IsPrivate;
    private int adminId;
    private double lat;
    private double lng;
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
    public string Address
    {
        get { return address; }
        set { address = value; }
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
        get { return adminId; }
        set { adminId = value; }
    }
    public double Lat
    {
        get { return lat; }
        set { lat = value; }
    }
    public double Lng
    {
        get { return lng; }
        set { lng = value; }
    }



    //insert envent
    public int insert()
    {
        DBservices dbs = new DBservices();
        int numAffected = dbs.insert(this);
        return numAffected;
    }

    //read the event Table
    public DataTable readTable()
    {
        DBservices dbs = new DBservices();
        dbs = dbs.ReadFromDataBase("bgroup14_test1ConnectionString", "EventsOnAir");

        return dbs.dt;

    }


    //read the UserInEventTable
    public DataTable ReadUserInEvent(string eventNum)
    {
        DBservices dbs = new DBservices();
        dbs = dbs.ReadUserInEvent("bgroup14_test1ConnectionString", eventNum);

        return dbs.dt;
    }


   

  

}