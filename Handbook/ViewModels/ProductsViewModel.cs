using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Handbook.Models;

namespace Handbook.ViewModels
{
    class ProductsViewModel : ViewModelBase
    {
        public PRODUCT product { get; set; }
        public string Product => product.PRODUCT1;
        public string Image => product.IMAGE;
        public Decimal Price => product.PRICE;
        public int Count => product.COUNT;
        public string Description => product.DESCRIPTION;

        public string Isnt
        {
            get
            {
                if (product.COUNT != 0)
                    return "Есть на складе";
                return "Нет в наличии";
            }
        }


        public ProductsViewModel(PRODUCT product)
        {
            this.product = product;
        }
    }
}
