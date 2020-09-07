using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Bank.Models
{
    // this is model class for database table account
    public class Account
    {
        // Again using data annoation for setting primary key
        [Key]
        public int AccountId { get; set; }
        // other data members
        public string AccountNumber { get; set; }
        public double Balance { get; set; }

        // data annoation for setting foreign key attribute

        [ForeignKey("AccountType")]
        public int AccountTypeId { get; set; }
        public AccountType TypeAccount { get; set; }

        // used list of billing account for foreign key relationship with BiilingAccount table
        public List<BillingAccount> BillingAccount { get; set; }
        // initialization in ctr
        public Account() { BillingAccount = new List<BillingAccount>(); }

    }
}
