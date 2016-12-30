using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Handbook.Models;

namespace Handbook.ViewModels
{
    class SpecializationsViewModel : ViewModelBase
    {
        private SPECIALIZATION _specialization;

        public SpecializationsViewModel(SPECIALIZATION specialization)
        {
            _specialization = specialization;
        }

        public string Specialization => _specialization.SPECIALIZATION1;
    }
}
