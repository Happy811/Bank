using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Bank.Data;
using Bank.Models;

namespace Bank.Pages.BillingAccounts
{
    public class CreateModel : PageModel
    {
        private readonly Bank.Data.BankContext _context;

        public CreateModel(Bank.Data.BankContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
        ViewData["AccountId"] = new SelectList(_context.Account, "AccountId", "AccountId");
        ViewData["CustomerId"] = new SelectList(_context.Customer, "CustomerId", "CustomerId");
            return Page();
        }

        [BindProperty]
        public BillingAccount BillingAccount { get; set; }

        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.BillingAccount.Add(BillingAccount);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
