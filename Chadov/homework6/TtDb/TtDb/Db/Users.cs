using System;
using System.Collections.Generic;

namespace TtDb
{
    public partial class User
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public long WalletScore { get; set; }
        public long Score { get; set; }
        public DateTimeOffset? DateBirth { get; set; }
        public DateTimeOffset RegDttm { get; set; }
    }
}
