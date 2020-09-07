using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Bank.Models
{
    // this is a model class for database table AccountType
    public class AccountType
    {
        // data annoataion for setting primary key of table
        [Key]
        public int AccountTypeId { get; set; }
        // other members
        public string TypeAccount { get; set; }

        // will store acount id related to account table used as foreign key
        public List<Account> Account { get; set; }
        public AccountType()
        {
            // initalization in ctr
            Account = new List<Account>();
        }


    }
}
