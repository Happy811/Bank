﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Bank.Data;
using Bank.Models;

namespace Bank.Pages.BillingAccounts
{
    public class IndexModel : PageModel
    {
        private readonly Bank.Data.BankContext _context;

        public IndexModel(Bank.Data.BankContext context)
        {
            _context = context;
        }

        public IList<BillingAccount> BillingAccount { get;set; }

        public async Task OnGetAsync()
        {
            BillingAccount = await _context.BillingAccount
                .Include(b => b.Account)
                .Include(b => b.Customer).ToListAsync();
        }
    }
}
