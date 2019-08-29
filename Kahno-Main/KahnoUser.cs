using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kahno_Main
{
    public class KahnoUser
    {
        public int userid { get; set; }
        public string fname { get; set; }
        public string lname { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public int coodinateid { get; set; }
        public string isowner { get; set; }
        public int restaurantno { get; set; }

        public KahnoUser(int id, string fname, string lname, string email, string phone, int coordID, string isowner, int restaurantno)
        {
            this.userid = id;
            this.fname = fname;
            this.lname = lname;
            this.email = email;
            this.phone = phone;
            this.coodinateid = coordID;
            this.isowner = isowner;
            this.restaurantno = restaurantno;
        }

        public KahnoUser()
        {
            this.userid = 0;
        }

        public override string ToString()
        {
            return this.userid + ", " + this.fname + ", " + this.lname + ", " + this.email + ", " + this.phone + ", " + this.coodinateid + ", " + this.isowner + ", " + this.restaurantno; ;
        }
    }
}