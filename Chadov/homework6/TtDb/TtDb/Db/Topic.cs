using System;
using System.Collections.Generic;

namespace TtDb
{
    public partial class Topic
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public long DialogsCount { get; set; }
    }
}
