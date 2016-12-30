using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Handbook.Models;

namespace Handbook.ViewModels
{
    class OwnFormsViewModel
    {
        private OWN_FORMS _ownForms;

        public OwnFormsViewModel(OWN_FORMS ownForms)
        {
            _ownForms = ownForms;
        }

        public string OwnForm => _ownForms.OWN_FORMS1;
    }
}
