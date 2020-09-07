using System;
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
    public class DetailsModel : PageModel
    {
        private readonly Bank.Data.BankContext _context;

        public DetailsModel(Bank.Data.BankContext context)
        {
            _context = context;
        }

        public BillingAccount BillingAccount { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            BillingAccount = await _context.BillingAccount
                .Include(b => b.Account)
                .Include(b => b.Customer).FirstOrDefaultAsync(m => m.BillingId == id);

            if (BillingAccount == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
