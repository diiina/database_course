using System;
using System.Collections.Generic;

namespace TtDb
{
    public partial class Payment
    {
        public long Id { get; set; }
        public int? UserId { get; set; }
        public double? PaymentSum { get; set; }
        public DateTimeOffset? PaymentDttm { get; set; }
    }
}
