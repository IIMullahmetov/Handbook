using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using Handbook.Models;
using Handbook.Views;
using Microsoft.Win32;
using SampleMVVM.Commands;

namespace Handbook.ViewModels
{
    class AddViewModel : ViewModelBase
    {
        public SHOP _shop;
        private AddWindow _view;
        private DelegateCommand _getSaveCommand;
        private DelegateCommand _getCloseCommand;
        private DelegateCommand _getOpenFileCommand;
        private ShopsModel _model = new ShopsModel();
        private FirstViewModel _viewModel;
        public ObservableCollection<WorkingHoursViewModel> WorkingHoursViewModels { get; set; }

        public string Shop
        {
            get { return _shop.SHOP1; }
            set
            {
                _shop.SHOP1 = value;
                OnPropertyChanged("Shop");
            }
        }
        public string Image
        {
            get { return _shop.IMAGE; }
            set
            {
                _shop.IMAGE = value;
                OnPropertyChanged("Image");
            }
        }
        public string Address
        {
            get { return _shop.ADDRESS; }
            set
            {
                _shop.ADDRESS = value;
                OnPropertyChanged("Address");
            }
        }
        public string Phone
        {
            get { return _shop.PHONE; }
            set
            {
                _shop.PHONE = value;
                OnPropertyChanged("Phone");
            }
        }
        public AddViewModel(AddWindow view, FirstViewModel viewModel)
        {
            _shop = _model.AddShop();
            _view = view;
            _model = new ShopsModel();
            _viewModel = viewModel;
            WorkingHoursViewModels = new ObservableCollection<WorkingHoursViewModel>(_model.GetWorkingHours(_shop).Select(d => new WorkingHoursViewModel(d)));

        }

        public ICommand GetSaveCommand => _getSaveCommand ?? (_getSaveCommand = new DelegateCommand(Save));
        public ICommand GetCloseCommand => _getCloseCommand ?? (_getCloseCommand = new DelegateCommand(Close));
        public ICommand GetOpenFileCommand => _getOpenFileCommand ?? (_getOpenFileCommand = new DelegateCommand(Open));

        private void Save()
        {
            _model.SaveShop(this);
            _viewModel.UpdateWindow();
            _view.Close();
        }

        private void Close()
        {
            _model.Remove(_shop);
            _view.Close();
        }

        private void Open()
        {
            OpenFileDialog openFile = new OpenFileDialog();
            openFile.Filter = "Image Files(*.BMP;*.JPG;*.GIF)|*.BMP;*.JPG;*.GIF";
            openFile.ShowDialog();
            Image = openFile.FileName;
        }
    }
}
