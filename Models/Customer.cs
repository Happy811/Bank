using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Bank.Models
{
    // this is a model class for database table Customer
    public class Customer
    {
        // data annotation for setting primary key
        [Key]
        public int CustomerId { get; set; }
        // other member variables
        public string Name { get; set; }
        public string Contact { get; set; }
       
        // similar to above, stores billigacount id in foreign relationship
        public List<BillingAccount> BillingAccount { get; set; }
        public Customer()
        {
            // inistializing list of objects
          
            BillingAccount = new List<BillingAccount>();
        }
    }
}
