using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Handbook.Models;

namespace Handbook.ViewModels
{
    class WeekDaysViewModel : ViewModelBase
    {
        private WEEK_DAYS _weekDays;

        public WeekDaysViewModel(WEEK_DAYS weekDays)
        {
            _weekDays = weekDays;
        }

        public string WeekDay => _weekDays.DAY_OF_WEEK;
    }
}
