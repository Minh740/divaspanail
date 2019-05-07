using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TechnicianManager
/// </summary>
public class TechnicianManager
{
    public TechnicianManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    DataClassesDataContext DB = new DataClassesDataContext();
    public void Save()
    {
        DB.SubmitChanges();
    }

    public void Add(TechnicianTBx ele)
    {
        DB.TechnicianTBxes.InsertOnSubmit(ele);
        DB.SubmitChanges();
    }

    public TechnicianTBx GetByID(int ID)
    {
        return DB.TechnicianTBxes.FirstOrDefault(e => e.Status != -1 && e.Id== ID);
    }


    public TechnicianTBx GetByEmail(string email)
    {
        return DB.TechnicianTBxes.FirstOrDefault(e => e.Status != -1 && e.Email == email);
    }


    public TechnicianTBx GetByPhone(string phone)
    {
        return DB.TechnicianTBxes.FirstOrDefault(e => e.Status != -1 && e.Phone == phone);
    }

    public List<TechnicianTBx> GetList()
    {
        return DB.TechnicianTBxes.Where(e => e.Status != -1).ToList();
    }

    // get list user
    public List<TechnicianTBx> GetUserList()
    {
        return DB.TechnicianTBxes.Where(u => u.Status == 1).ToList();
    }
    public void AddNew(TechnicianTBx ele)
    {
        DB.TechnicianTBxes.InsertOnSubmit(ele);
        Save();
    }
}