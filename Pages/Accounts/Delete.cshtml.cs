﻿using System;
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
    public class DeleteModel : PageModel
    {
        private readonly Bank.Data.BankContext _context;

        public DeleteModel(Bank.Data.BankContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Account Account { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Account = await _context.Account
                .Include(a => a.TypeAccount).FirstOrDefaultAsync(m => m.AccountId == id);

            if (Account == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Account = await _context.Account.FindAsync(id);

            if (Account != null)
            {
                _context.Account.Remove(Account);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
