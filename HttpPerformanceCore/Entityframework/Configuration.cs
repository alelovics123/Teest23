using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HttpPerformanceCore.Entityframework
{
    [Table("Configurations")]
    public class Configuration
    {
        /// <summary>
        /// Key for configurations valid values: urls(urls to check separated by ,), checkInterval(time in ms to check the urls), responseTimeThreshold( time in ms if response time above send notifications)
        /// </summary>
        [MaxLength(30),Key]
        public string Key{ get; set; }
        [NotNull]
        public string Value { get; set; }
    }
}
