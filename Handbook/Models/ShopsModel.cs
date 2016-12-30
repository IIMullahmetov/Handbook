using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Handbook.ViewModels;

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

        public List<SHOP_SPECIALIZATION> GetShopSpecializations(int id)
        {
            var list = new List<SHOP_SPECIALIZATION>();
            foreach (var VARIABLE in _context.SHOP_SPECIALIZATION.Where(s => s.SHOP_ID == id))
                list.Add(VARIABLE);
            return list;
        }

        public void Save(UpdateViewModel viewModel)
        {
            SHOP shop = _context.SHOPs.First(s => s.ID == viewModel.shop.ID);
            shop.SHOP1 = viewModel.Shop;
            shop.ADDRESS = viewModel.Address;
            shop.IMAGE = viewModel.Image;
            shop.PHONE = viewModel.Phone;
            shop.OWN_FORM_ID = viewModel.shop.OWN_FORM_ID;
            _context.SaveChanges();
        }

        public void Remove(SHOP shop)
        {
            SHOP sh = _context.SHOPs.First(s => s.ID == shop.ID);
            _context.SHOPs.Attach(sh);
            _context.SHOPs.Remove(sh);
            _context.SaveChanges();
        }

        public SHOP AddShop()
        {
            SHOP shop = new SHOP()
            {
                SHOP1 = "Example",
                ADDRESS = "Example",
                PHONE = "Example",
                IMAGE = "../../Images/not found.jpg",
                OWN_FORM_ID = 1
            };
            _context.SHOPs.Add(shop);
            _context.SaveChanges();
            Generate(shop);
            return shop;
        }

        private void Generate(SHOP shop)
        {
            List<int> days = new List<int>();
            foreach (var day in _context.WEEK_DAYS)
                days.Add(day.ID);
            foreach (var day in days)
            {
                _context.WORKING_HOURS.Add(new WORKING_HOURS()
                {
                    SHOP_ID = shop.ID,
                    OPEN_TIME = "8:00",
                    CLOSE_TIME = "22:00",
                    DAY_OF_WEEK_ID = day
                });
                _context.SaveChanges();
            }
        }

        public void SaveShop(AddViewModel viewModel)
        {
            SHOP shop = _context.SHOPs.First(s => s.ID == viewModel._shop.ID);
            shop.SHOP1 = viewModel.Shop;
            shop.ADDRESS = viewModel.Address;
            shop.IMAGE = viewModel.Image;
            shop.PHONE = viewModel.Phone;
            _context.SaveChanges();
        }
    }
}