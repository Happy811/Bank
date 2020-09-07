using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Bank.Models;

namespace Bank.Data
{
    public class BankContext : DbContext
    {
        public BankContext (DbContextOptions<BankContext> options)
            : base(options)
        {
        }

        public DbSet<Bank.Models.Customer> Customer { get; set; }

        public DbSet<Bank.Models.Account> Account { get; set; }

        public DbSet<Bank.Models.AccountType> AccountType { get; set; }

        public DbSet<Bank.Models.BankLocation> BankLocation { get; set; }

        public DbSet<Bank.Models.BillingAccount> BillingAccount { get; set; }
    }
}
