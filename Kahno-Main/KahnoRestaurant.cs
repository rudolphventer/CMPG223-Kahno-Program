using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kahno_Main
{
    public class KahnoRestaurant
    {
        public int restaurantID { get; set; }

        public string restaurantname { get; set; }
        public string phone { get; set; }
        public int coodinateid { get; set; }

        public KahnoRestaurant(int id, string phone, string name, int coordID)
        {
            this.restaurantID = id;

            this.restaurantname = name;
            this.phone = phone;
            this.coodinateid = coordID;
        }

        public KahnoRestaurant()
        {
            this.restaurantID = 0;
        }

        public override string ToString()
        {
            return this.restaurantID + ", " + this.restaurantname + ", " + this.phone + ", " + this.coodinateid;
        }
    }
}