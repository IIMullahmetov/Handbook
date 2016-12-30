using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Handbook.Models;
using SampleMVVM.Commands;
using Xceed.Wpf.Toolkit;

namespace Handbook.ViewModels
{
    class UpdateViewModel : ViewModelBase
    {
        private readonly ShopsModel _model;
        private readonly SHOP _shop;
        private DelegateCommand _getSaveCommand;

        public ObservableCollection<SpecializationsViewModel> SpecializationsList { get; set; }
        public ObservableCollection<OwnFormsViewModel> OwnFormsList { get; set; }
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
        
        public UpdateViewModel(SHOP shop)
        {
            _shop = shop;
            _model = new ShopsModel();
            var specializations = _model.GetSpecializations();
            var ownForms = _model.GetOwnForms();
            SpecializationsList = new ObservableCollection<SpecializationsViewModel>(specializations.Select(s => new SpecializationsViewModel(s)));
            OwnFormsList = new ObservableCollection<OwnFormsViewModel>(ownForms.Select(o => new OwnFormsViewModel(o)));
            WorkingHoursViewModels = new ObservableCollection<WorkingHoursViewModel>(_model.GetWorkingHours(_shop).Select(d => new WorkingHoursViewModel(d)));
        }

        public ICommand GetSaveCommand => _getSaveCommand ?? (_getSaveCommand = new DelegateCommand(Save));

        private void Save()
        {
            _model.Save();
        }
    }
}