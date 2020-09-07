using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Bank.Data;
using Bank.Models;

namespace Bank.Pages.BankLocations
{
    public class DeleteModel : PageModel
    {
        private readonly Bank.Data.BankContext _context;

        public DeleteModel(Bank.Data.BankContext context)
        {
            _context = context;
        }

        [BindProperty]
        public BankLocation BankLocation { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            BankLocation = await _context.BankLocation.FirstOrDefaultAsync(m => m.BranchId == id);

            if (BankLocation == null)
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

            BankLocation = await _context.BankLocation.FindAsync(id);

            if (BankLocation != null)
            {
                _context.BankLocation.Remove(BankLocation);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
