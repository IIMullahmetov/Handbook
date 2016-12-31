using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using Handbook.Models;
using Handbook.Views;
using SampleMVVM.Commands;

namespace Handbook.ViewModels
{
    class ShopsViewModel : ViewModelBase
    {
        public SHOP shop { get;}

        public FirstViewModel _ViewModel;
        private int ID => shop.ID;

        public string Shop => shop.SHOP1;

        public string Address => shop.ADDRESS;

        public string Phone => "Телефон:  " + shop.PHONE;

        public string Image => shop.IMAGE;

        public ShopsViewModel(SHOP shop, FirstViewModel viewModel)
        {
            this.shop = shop;
            _ViewModel = viewModel;
        }

        public ShopsViewModel(SHOP shop)
        {
            this.shop = shop;
        }

        private DelegateCommand _getDelegateCommand;

        public ICommand OpenShopCatalog => _getDelegateCommand ?? (_getDelegateCommand = new DelegateCommand(OpenCatalog));

        private void OpenCatalog()
        {
            CatalogWindow view = new CatalogWindow();
            view.Title = Shop;
            CatalogViewModel viewModel = new CatalogViewModel(shop, _ViewModel, view);
            view.DataContext = viewModel;
            view.Show();
        }

    }
}
