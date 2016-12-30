using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Handbook.Models;
using Handbook.Views;
using SampleMVVM.Commands;

namespace Handbook.ViewModels
{
    class CatalogViewModel : ViewModelBase
    {
        private string _query;
        private readonly CatalogModel _model;
        private DelegateCommand _getSearchCommand;
        private DelegateCommand _getUpdateCommand;
        private readonly SHOP _shop;
        private List<PRODUCT> _products;

        public ObservableCollection<ProductsViewModel> ProductsList { get; set; }
        private ObservableCollection<ProductsViewModel> AllProducts { get; set; }

        public CatalogViewModel(SHOP shop)
        {
            _shop = shop;
            _model = new CatalogModel(_shop.ID);
            _products = _model.GetProducts();
            ProductsList = new ObservableCollection<ProductsViewModel>(_products.Select(p=>new ProductsViewModel(p)));
            AllProducts = new ObservableCollection<ProductsViewModel>(_products.Select(p => new ProductsViewModel(p)));
        }

        private void SearchProduct()
        {
            ProductsList.Clear();
            _products = _model.SearchProducts(Query);
            AllProducts = new ObservableCollection<ProductsViewModel>(_model.GetProducts().Select(p => new ProductsViewModel(p)));
            foreach (ProductsViewModel viewModel in AllProducts)
                if (_products.Contains(viewModel.product))
                    ProductsList.Add(viewModel);
        }

        public string Query
        {
            get { return _query; }
            set
            {
                _query = value;
                OnPropertyChanged("Query");
            }
        }


        private void Update()
        {
            UpdateWindow view = new UpdateWindow();
            UpdateViewModel viewModel = new UpdateViewModel(_shop);
            view.DataContext = viewModel;
            view.Show();
        }

        public ICommand GetSearchCommand => _getSearchCommand ?? (_getSearchCommand = new DelegateCommand(SearchProduct));

        public ICommand GetUpdateCommand => _getUpdateCommand ?? (_getUpdateCommand = new DelegateCommand(Update));

    }
}
