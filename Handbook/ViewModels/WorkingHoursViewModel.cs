using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using Handbook.Models;
using SampleMVVM.Commands;

namespace Handbook.ViewModels
{
    class WorkingHoursViewModel : ViewModelBase
    {
        private WORKING_HOURS _workingHours { get; set; }
        
        public WorkingHoursViewModel(WORKING_HOURS workingHours)
        {
            _workingHours = workingHours;
        }

        public string Open => "O" + _workingHours.ID;
        public string Close => "C" + _workingHours.ID;

        public string OpenTime
        {
            get { return _workingHours.OPEN_TIME; }
            set
            {
                _workingHours.OPEN_TIME = value;
                OnPropertyChanged("_0");
            }
        }

        public string CloseTime
        {
            get { return _workingHours.CLOSE_TIME; }
            set
            {
                _workingHours.CLOSE_TIME = value;
                OnPropertyChanged("_1");
            }
        }
    }
}
