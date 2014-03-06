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
    private string name;
    private double price;
    private string imageUrl;
    private int amount;
    private bool discount = false;

    public bool Discount
    {
        get { return discount; }
        set { discount = value; }
    }
    public int Amount
    {
        get { return amount; }
        set { amount = value; }
    }


    public string ImageUrl
    {
        get { return imageUrl; }
        set { imageUrl = value; }
    }

    public double Price
    {
        get { return price; }
        set { price = value; }
    }

    public string Name
    {
        get { return name; }
        set { name = value; }
    }

 
    public EventOnAir(string _name, double _price, string _imageUrl, int _amount, bool _discount)
    {
        name = _name;
        price = _price;
        imageUrl = _imageUrl;
        amount = _amount;
        discount = _discount;

    }
    public int insert()
    {
        DBservices dbs = new DBservices();
        int numAffected = dbs.insert(this);
        return numAffected;
    }

    public bool CheckName(string name)
    {
        DBservices dbs = new DBservices();
        List<string> names = dbs.getNamesProducts();
        foreach (string n in names)
        {
            if (n == name)
            {
                return false;
            }
        }
        return true;
    }

    public DataTable readTable()
    {
        DBservices dbs = new DBservices();
        dbs = dbs.ReadFromDataBase("bgroup14_test1ConnectionString", "EventS");
      //  HttpContext.Current.Session["productDataSet"] = dbs;
        return dbs.dt;

    }

    public void showdiscount(string amount, string discount)
    {
        DBservices dbs = (DBservices)HttpContext.Current.Session["productDataSet"];
        DataTable dt = dbs.dt;
        for (int i = 0; i < dt.Rows.Count; i++)
        {

            if (double.Parse((dt.Rows[i].ItemArray[3]).ToString()) > double.Parse((amount)))
            {
                price = int.Parse((dt.Rows[i].ItemArray[2]).ToString());
                price = price * (((100 - double.Parse((discount))) / 100));
                dt.Rows[i]["price"] = price;
            }
        }

        HttpContext.Current.Session["productDataBase"] = dbs;


    }

    public void updateDatabase()
    {

        if (HttpContext.Current.Session["productDataBase"] == null) return;
        DBservices dbs = (DBservices)HttpContext.Current.Session["productDataBase"];
        dbs.Update(dbs);
    }


    public int UpdatDBCount(string names, int count)
    {
        DBservices dbs = new DBservices();
        int numAffected = dbs.Updatecount(names, count);
        return numAffected;
    }
}