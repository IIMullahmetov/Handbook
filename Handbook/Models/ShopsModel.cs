using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Handbook.Models
{
    class ShopsModel
    {
        private readonly Context _context = new Context();
        private List<SHOP> _shops;
        private List<SPECIALIZATION> _specializations;
        private List<OWN_FORMS> _ownForms;

        public ShopsModel()
        {
            _shops = new List<SHOP>();
            _specializations = new List<SPECIALIZATION>();
            _ownForms = new List<OWN_FORMS>();
            foreach (SHOP shop in _context.SHOPs)
                _shops.Add(shop);
        }

        public List<SHOP> GetShops()
        {
            return _shops;
        }

        public List<SPECIALIZATION> GetSpecializations()
        {
            foreach (var specialization in _context.SPECIALIZATIONs)
                _specializations.Add(specialization);
            return _specializations;
        }

        public List<OWN_FORMS> GetOwnForms()
        {
            foreach (var forms in _context.OWN_FORMS)
                _ownForms.Add(forms);
            return _ownForms;
        }

        public List<SHOP> SearchShop(string s)
        {
            var shops = new List<SHOP>();
            foreach (SHOP shop in _context.SHOPs.Where(sh => sh.SHOP1.Contains(s)))
                shops.Add(shop);
            return shops;
        }

        public List<WORKING_HOURS> GetWorkingHours(SHOP shop)
        {
            var workingHours = new List<WORKING_HOURS>();
            foreach (WORKING_HOURS hours in _context.WORKING_HOURS.Where(h=>h.SHOP_ID==shop.ID))
                workingHours.Add(hours);
            return workingHours;
        }

        public List<WEEK_DAYS> GetWeekDays()
        {
            var weekDays = new List<WEEK_DAYS>();
            foreach (WEEK_DAYS day in _context.WEEK_DAYS)
                weekDays.Add(day);
            return weekDays;
        }

        public void Save()
        {
            _context.SaveChanges();
        }
    }
}