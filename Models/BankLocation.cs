using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Bank.Models
{
    // this is a model class for database table BankLocation
    public class BankLocation
    {
        // Data annotation for primary key
        [Key]
        public int BranchId { get; set; }
        // Stores address of bank
        public string Address { get; set; }
    }
}
