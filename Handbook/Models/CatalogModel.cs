using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Handbook.Models
{
    class CatalogModel
    {
        private readonly int _id;
        private List<PRODUCT> _products = new List<PRODUCT>();
        private readonly Context _context = new Context();
        public CatalogModel(int id)
        {
            _id = id;
        }

        public List<PRODUCT> GetProducts()
        {
            _products.Clear();
            foreach (PRODUCT product in _context.PRODUCTS.Where(p => p.SHOP_ID == _id))
                _products.Add(product);
            return _products;
        }

        public List<PRODUCT> SearchProducts(string s)
        {
            _products.Clear();
            foreach (PRODUCT product in _context.PRODUCTS.Where(p=>p.SHOP_ID==_id).Where(p=>p.PRODUCT1.Contains(s)))
                _products.Add(product);
            return _products;
        }
    }
}
