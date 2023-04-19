using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HttpPerformanceCore.Entityframework
{
    public class HttpPerformanceContext: Microsoft.EntityFrameworkCore.DbContext
    {
        public DbSet<Configuration> Configurations { get; set; }
        public DbSet<Response> Responses { get; set; }
        public HttpPerformanceContext(DbContextOptions dbContextOptions):base(dbContextOptions)
        {
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            
            base.OnConfiguring(optionsBuilder);
        }
    }
}
