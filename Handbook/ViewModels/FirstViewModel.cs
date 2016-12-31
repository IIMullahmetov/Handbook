using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Data;
using System.Windows.Input;
using Handbook.Models;
using Handbook.Views;
using SampleMVVM.Commands;

namespace Handbook.ViewModels
{
    class FirstViewModel : ViewModelBase
    {
        private ObservableCollection<ShopsViewModel> AllShops { get; set; }
        private readonly ShopsModel _model = new ShopsModel();
        public ObservableCollection<ShopsViewModel> ShopsList { get; set; }
        public ObservableCollection<SpecializationsViewModel> SpecializationsList { get; set; }
        public ObservableCollection<OwnFormsViewModel> OwnFormsList { get; set; }

        private List<SHOP> _shops;
        private string _query = "";

        public string Query
        {
            get { return _query; }
            set
            {
                _query = value;
                OnPropertyChanged("Query");
            }
        }
        private DelegateCommand _getDelegateCommand;
        private DelegateCommand _getAddCommand;

        public ICommand GetSearchCommand => _getDelegateCommand ?? (_getDelegateCommand = new DelegateCommand(Search));
        public ICommand GetAddCommand => _getAddCommand ?? (_getAddCommand = new DelegateCommand(Add));

        public FirstViewModel()
        {

            _shops = _model.GetShops();
            var specializations = _model.GetSpecializations();
            var ownForms = _model.GetOwnForms();
            SpecializationsList = new ObservableCollection<SpecializationsViewModel>(specializations.Select(s => new SpecializationsViewModel(s)));
            OwnFormsList = new ObservableCollection<OwnFormsViewModel>(ownForms.Select(o => new OwnFormsViewModel(o)));
            ShopsList = new ObservableCollection<ShopsViewModel>(_shops.Select(s => new ShopsViewModel(s, this)));
            AllShops = new ObservableCollection<ShopsViewModel>(_model.GetShops().Select(s=> new ShopsViewModel(s)));
        }

        private void Search()
        {
            _shops = _model.SearchShop(Query);
            ShopsList.Clear();
            AllShops = new ObservableCollection<ShopsViewModel>(_model.GetShops().Select(s => new ShopsViewModel(s)));
            foreach (ShopsViewModel shopsViewModel in AllShops)
                if (_shops.Contains(shopsViewModel.shop))
                    ShopsList.Add(shopsViewModel);
        }

        private void Add()
        {
            AddWindow view = new AddWindow();
            AddViewModel viewModel = new AddViewModel(view, this);
            view.DataContext = viewModel;
            view.Show();
        }

        public void UpdateWindow()
        {
            ShopsList.Clear();
            AllShops = new ObservableCollection<ShopsViewModel>(_model.GetShops().Select(s => new ShopsViewModel(s)));
            foreach (ShopsViewModel shopsViewModel in AllShops)
                if (_shops.Contains(shopsViewModel.shop))
                    ShopsList.Add(shopsViewModel);
        }
    }
}
