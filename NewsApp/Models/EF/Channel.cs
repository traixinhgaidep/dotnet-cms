namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Channel
    {
        [Key]
        public int IDChannel { get; set; }

        [StringLength(15)]
        public string Name { get; set; }

        [StringLength(50)]
        public string Image { get; set; }

        [StringLength(500)]
        public string Summary { get; set; }
    }
}
