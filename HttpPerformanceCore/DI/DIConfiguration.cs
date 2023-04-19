using HttpPerformanceCore.Entityframework;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HttpPerformanceCore.DI
{
    public class DIConfiguration
    {
        public static ServiceProvider Configure()
        {
            var serviceCollection = new ServiceCollection().AddScoped<IAlertService, MailAlertService>();
            serviceCollection.AddDbContext<HttpPerformanceContext>((options) => { options.UseSqlServer("Server=localhost\\SQLEXPRESS;Database=HttpPerformance;Trusted_Connection=True;"); });
            return serviceCollection.BuildServiceProvider();
        }
    }
}
