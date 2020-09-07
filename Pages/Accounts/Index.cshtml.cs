using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Bank.Data;
using Bank.Models;

namespace Bank.Pages.Accounts
{
    public class IndexModel : PageModel
    {
        private readonly Bank.Data.BankContext _context;

        public IndexModel(Bank.Data.BankContext context)
        {
            _context = context;
        }

        public IList<Account> Account { get;set; }

        public async Task OnGetAsync()
        {
            Account = await _context.Account
                .Include(a => a.TypeAccount).ToListAsync();
        }
    }
}
