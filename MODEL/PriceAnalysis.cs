using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MODEL
{
    public class PriceAnalysis
    {
        public Int32 PriceID { get; set; }
        public String PriceName { get; set; }
        public Int32 Complex { get; set; }
        public Decimal Price { get; set; }
        public String Unit { get; set; }
        public String Code { get; set; }
        public String ReferenceID { get; set; }
        public String ReferenceNumber { get; set; } 
    }
}
