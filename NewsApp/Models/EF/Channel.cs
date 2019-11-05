namespace Models.EF
{
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;

    public partial class Channel
    {
        [Key]
        [DisplayName("STT")]
        public int IDChannel { get; set; }

        [StringLength(15)]
        [DisplayName("Tên danh mục")]
        public string Name { get; set; }

        [StringLength(50)]
        [DisplayName("Ảnh")]
        public string Image { get; set; }

        [StringLength(500)]
        [DisplayName("Nội dung")]
        public string Summary { get; set; }
    }
}
