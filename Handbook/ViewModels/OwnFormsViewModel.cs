using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Handbook.Models;

namespace Handbook.ViewModels
{
    class OwnFormsViewModel : ViewModelBase
    {
        private ObservableCollection<OwnFormsViewModel> _ownFormsList { get; set; }
        private OWN_FORMS OwnForms { get; set; }
        private SHOP Shop { get; set; }
        private int _lastId;
        public OwnFormsViewModel(OWN_FORMS ownForms)
        {
            OwnForms = ownForms;
        }

        public OwnFormsViewModel(OWN_FORMS ownForms, SHOP shop, ObservableCollection<OwnFormsViewModel> ownFormsList)
        {
            _ownFormsList = ownFormsList;
            OwnForms = ownForms;
            Shop = shop;
            _lastId = shop.OWN_FORM_ID;
        }

        public string OwnForm => OwnForms.OWN_FORMS1;

        public bool IsMyOwnForm
        {
            get { return Shop.OWN_FORM_ID == OwnForms.ID; }
            set
            {
                if (OwnForms.ID != _lastId)
                {
                    Shop.OWN_FORM_ID = OwnForms.ID;
                    _ownFormsList.Add(null);
                }
                OnPropertyChanged("_of");
            }
        }
    }
}
