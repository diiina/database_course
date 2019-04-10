using System;
using System.Collections.Generic;

namespace TtDb
{
    public partial class Session
    {
        public long Id { get; set; }
        public int? UserId { get; set; }
        public DateTimeOffset? BeginDttm { get; set; }
        public DateTimeOffset? EndDttm { get; set; }
    }
}
