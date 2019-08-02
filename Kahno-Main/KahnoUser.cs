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
        //public double longitude { get; set; }
        //public double latitude { get; set; }
        public char isowner { get; set; }
        public int restaurantno { get; set; }

        public KahnoUser(int id, string fname, string lname, string email, string phone, int coordID)
        {
            this.userid = id;
            this.fname = fname;
            this.lname = lname;
            this.email = email;
            this.phone = phone;
            this.coodinateid = coordID;
            this.isowner = 'N';
            this.restaurantno = 0;
        }

        public KahnoUser()
        {

        }
    }
}