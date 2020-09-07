using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Bank.Models
{
    // this is a model class for database table BillingAccount
    public class BillingAccount
    {
        // used data annoataion for primary key 

        [Key]
        public int BillingId { get; set; }
      // other data members will be used as fields of table
        public double BillAmount { get; set; }
        public string Comment { get; set; }
        public DateTime BillDate { get; set; }
        // setting foreign key attribute for table customer
        [ForeignKey("Customer")]
        public int CustomerId { get; set; }
        public Customer Customer { get; set; }
        // setting foregin key attribute for table Account
        [ForeignKey("Account")]
        public int AccountId { get; set; }
        public Account Account { get; set; }

    }
}
