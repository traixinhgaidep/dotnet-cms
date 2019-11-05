namespace Models.EF
{
    using System;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.Web.Mvc;

    public partial class Article
    {
        [Key]
        [DisplayName("ID báo")]
        public int IDArticle { get; set; }

        [StringLength(200)]
        [DisplayName("Tên báo")]
        public string Title { get; set; }

        [DisplayName("Tên danh mục")]
        public int? IDChannel { get; set; }

        [StringLength(100)]
        [DisplayName("Ảnh")]
        public string Image { get; set; }

        [StringLength(500)]
        [DisplayName("Tóm tắt")]
        public string Summary { get; set; }

        [AllowHtml]
        [DisplayName("Nội dung")]
        public string Content { get; set; }

        [StringLength(50)]
        [DisplayName("Tác giả")]
        public string Author { get; set; }

        [DisplayName("Ngày đăng")]
        public DateTime? Date { get; set; }
    }
}
