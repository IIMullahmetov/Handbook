using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Handbook.Models;
using Handbook.Views;
using Microsoft.Win32;
using SampleMVVM.Commands;
using Xceed.Wpf.Toolkit;

namespace Handbook.ViewModels
{
    class UpdateViewModel : ViewModelBase
    {
        private readonly ShopsModel _model;
        public SHOP shop { get; set; }
        private DelegateCommand _getSaveCommand;
        private DelegateCommand _getCloseCommand;
        private DelegateCommand _getOpenFileCommand;
        private DelegateCommand _getRemoveCommand;
        private readonly UpdateWindow _view;
        public ObservableCollection<OwnFormsViewModel> OwnFormsList { get; set; }
        public ObservableCollection<WorkingHoursViewModel> WorkingHoursViewModels { get; set; }
        private CatalogWindow _catalogWindow;
        private FirstViewModel _viewModel;
        public string Shop
        {
            get { return shop.SHOP1; }
            set
            {
                shop.SHOP1 = value;
                OnPropertyChanged("Shop");
            }
        }
        public string Image
        {
            get { return shop.IMAGE; }
            set
            {
                shop.IMAGE = value;
                OnPropertyChanged("Image");
            }
        }
        public string Address
        {
            get { return shop.ADDRESS; }
            set
            {
                shop.ADDRESS = value;
                OnPropertyChanged("Address");
            }
        }
        public string Phone
        {
            get { return shop.PHONE; }
            set
            {
                shop.PHONE = value;
                OnPropertyChanged("Phone");
            }
        }
        
        public UpdateViewModel(SHOP shop, UpdateWindow view, FirstViewModel viewModel, CatalogWindow catalogWindow)
        {
            _view = view;
            _viewModel = viewModel;
            this.shop = shop;
            _catalogWindow = catalogWindow;
            _model = new ShopsModel();
            var ownForms = _model.GetOwnForms();
            OwnFormsList = new ObservableCollection<OwnFormsViewModel>(ownForms.Select(o => new OwnFormsViewModel(o, this.shop, OwnFormsList)));
            WorkingHoursViewModels = new ObservableCollection<WorkingHoursViewModel>(_model.GetWorkingHours(this.shop).Select(d => new WorkingHoursViewModel(d)));
        }

        public ICommand GetSaveCommand => _getSaveCommand ?? (_getSaveCommand = new DelegateCommand(Save));
        public ICommand GetCloseCommand => _getCloseCommand ?? (_getCloseCommand = new DelegateCommand(Close));
        public ICommand GetRemoveCommand => _getRemoveCommand ?? (_getRemoveCommand = new DelegateCommand(Remove));
        public ICommand GetOpenFileCommand => _getOpenFileCommand ?? (_getOpenFileCommand = new DelegateCommand(Open));

        private void Save()
        {
            _model.Save(this);
            try
            {
                _viewModel.UpdateWindow();
            }
            catch (NullReferenceException e)
            {
                MessageBox.Show("Изменения сохранены, возможно потребуется перезапуск программы");
                throw;
            }
            _view.Close();
        }

        private void Close()
        {
            _view.Close();
        }

        private void Remove()
        {
            _model.Remove(shop);
            try
            {
                _viewModel.UpdateWindow();
            }
            catch (NullReferenceException e)
            {
                MessageBox.Show("Изменения сохранены, возможно потребуется перезапуск программы");
                throw;
            }
            _catalogWindow.Close();
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