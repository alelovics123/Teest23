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
    [Table("Responses")]
    public class Response
    {
        [Key]
        public int ID { get; set; }
        [NotNull]
        public DateTime Date { get; set; }
        public int ResponseTime { get; set; }
        [NotNull]
        public string Url { get; set; }
    }
}
