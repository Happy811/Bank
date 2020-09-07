using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Bank.Data;
using Bank.Models;

namespace Bank.Pages.BillingAccounts
{
    public class EditModel : PageModel
    {
        private readonly Bank.Data.BankContext _context;

        public EditModel(Bank.Data.BankContext context)
        {
            _context = context;
        }

        [BindProperty]
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
           ViewData["AccountId"] = new SelectList(_context.Account, "AccountId", "AccountId");
           ViewData["CustomerId"] = new SelectList(_context.Customer, "CustomerId", "CustomerId");
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(BillingAccount).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BillingAccountExists(BillingAccount.BillingId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool BillingAccountExists(int id)
        {
            return _context.BillingAccount.Any(e => e.BillingId == id);
        }
    }
}
