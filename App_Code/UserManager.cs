using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserManager
/// </summary>
public class UserManager
{
    DataClassesDataContext DB = new DataClassesDataContext();
    public void Save()
    {
        DB.SubmitChanges();
    }

    public void Add(UsersTbx ele)
    {
        DB.UsersTbxes.InsertOnSubmit(ele);
        DB.SubmitChanges();
    }

    public UsersTbx GetByID(int ID)
    {
        return DB.UsersTbxes.FirstOrDefault(e => e.Status != -1 && e.UserId == ID);
    }


    public UsersTbx GetByEmail(string email)
    {
        return DB.UsersTbxes.FirstOrDefault(e => e.Status != -1 && e.Email == email);
    }


    public UsersTbx GetByPhone(string phone)
    {
        return DB.UsersTbxes.FirstOrDefault(e => e.Status != -1 && e.PhoneNumber == phone);
    }

    public List<UsersTbx> GetList()
    {
        return DB.UsersTbxes.Where(e => e.Status != -1).ToList();
    }

    // get list user
    public List<UsersTbx> GetUserList()
    {
        return DB.UsersTbxes.Where(u => u.Status == 1).ToList();
    }
}