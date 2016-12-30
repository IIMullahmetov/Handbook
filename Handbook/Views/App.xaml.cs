using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Documents;
using Handbook.Models;
using Handbook.ViewModels;
using Handbook.Views;

namespace Handbook
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        private void Application_Startup(object sender, StartupEventArgs e)
        {
            ShopsModel shopsModel = new ShopsModel();
            ShopsWindow view = new ShopsWindow();
            FirstViewModel viewModel = new FirstViewModel();
            view.DataContext = viewModel;
            view.Show();
        }
    }
}
