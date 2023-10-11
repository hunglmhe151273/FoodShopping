using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;

#nullable disable

namespace MyProjectWeb.Models
{
    public partial class ProjectPRJContext : DbContext
    {
        public ProjectPRJContext()
        {
        }

        public ProjectPRJContext(DbContextOptions<ProjectPRJContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Feature> Features { get; set; }
        public virtual DbSet<Group> Groups { get; set; }
        public virtual DbSet<GroupAccount> GroupAccounts { get; set; }
        public virtual DbSet<GroupFeature> GroupFeatures { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductRegion> ProductRegions { get; set; }
        public virtual DbSet<Region> Regions { get; set; }
        public virtual DbSet<SubCategory> SubCategories { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.

                var config = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build();
                optionsBuilder.UseSqlServer(config.GetConnectionString("MyConStr"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Account>(entity =>
            {
                entity.HasKey(e => e.Username);

                entity.ToTable("Account");

                entity.Property(e => e.Username)
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("username");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("password");
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.ToTable("Category");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CategoryName).HasMaxLength(255);
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.ToTable("Customer");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Address).HasMaxLength(255);

                entity.Property(e => e.City).HasMaxLength(255);

                entity.Property(e => e.Country).HasMaxLength(255);

                entity.Property(e => e.CustomerName).HasMaxLength(255);

                entity.Property(e => e.PhoneNumber).HasMaxLength(255);

                entity.Property(e => e.State).HasMaxLength(255);
            });

            modelBuilder.Entity<Feature>(entity =>
            {
                entity.HasKey(e => e.Fid);

                entity.ToTable("Feature");

                entity.Property(e => e.Fid)
                    .ValueGeneratedNever()
                    .HasColumnName("fid");

                entity.Property(e => e.Url)
                    .IsRequired()
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("url");
            });

            modelBuilder.Entity<Group>(entity =>
            {
                entity.HasKey(e => e.Gid);

                entity.ToTable("Group");

                entity.Property(e => e.Gid)
                    .ValueGeneratedNever()
                    .HasColumnName("gid");

                entity.Property(e => e.Gname)
                    .IsRequired()
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("gname");
            });

            modelBuilder.Entity<GroupAccount>(entity =>
            {
                entity.HasKey(e => new { e.Gid, e.Username });

                entity.ToTable("GroupAccount");

                entity.Property(e => e.Gid).HasColumnName("gid");

                entity.Property(e => e.Username)
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("username");

                entity.HasOne(d => d.GidNavigation)
                    .WithMany(p => p.GroupAccounts)
                    .HasForeignKey(d => d.Gid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GroupAccount_Group");

                entity.HasOne(d => d.UsernameNavigation)
                    .WithMany(p => p.GroupAccounts)
                    .HasForeignKey(d => d.Username)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GroupAccount_Account");
            });

            modelBuilder.Entity<GroupFeature>(entity =>
            {
                entity.HasKey(e => new { e.Gid, e.Fid });

                entity.ToTable("GroupFeature");

                entity.Property(e => e.Gid).HasColumnName("gid");

                entity.Property(e => e.Fid).HasColumnName("fid");

                entity.HasOne(d => d.FidNavigation)
                    .WithMany(p => p.GroupFeatures)
                    .HasForeignKey(d => d.Fid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GroupFeature_Feature");

                entity.HasOne(d => d.GidNavigation)
                    .WithMany(p => p.GroupFeatures)
                    .HasForeignKey(d => d.Gid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GroupFeature_Group1");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasMaxLength(255)
                    .HasColumnName("ID");

                entity.Property(e => e.CustomerId).HasColumnName("CustomerID");

                entity.Property(e => e.OrderDate).HasColumnType("datetime");

                entity.Property(e => e.OrderNote)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.ShipDate).HasColumnType("datetime");

                entity.Property(e => e.ShipMode).HasMaxLength(255);

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.CustomerId)
                    .HasConstraintName("FK__Orders__Customer__300424B4");
            });

            modelBuilder.Entity<OrderDetail>(entity =>
            {
                entity.HasKey(e => new { e.OrderId, e.ProductId })
                    .HasName("PK__OrderDet__08D097C1500028FD");

                entity.Property(e => e.OrderId)
                    .HasMaxLength(255)
                    .HasColumnName("OrderID");

                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__OrderDeta__Order__2E1BDC42");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__OrderDeta__Produ__2F10007B");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("Product");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Img)
                    .HasMaxLength(255)
                    .HasColumnName("img");

                entity.Property(e => e.ProductName).HasMaxLength(255);

                entity.Property(e => e.SubCategoryId).HasColumnName("SubCategoryID");

                entity.HasOne(d => d.SubCategory)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.SubCategoryId)
                    .HasConstraintName("FK__Product__SubCate__30F848ED");
            });

            modelBuilder.Entity<ProductRegion>(entity =>
            {
                entity.HasKey(e => new { e.Pid, e.Rid });

                entity.ToTable("ProductRegion");

                entity.Property(e => e.Pid).HasColumnName("pid");

                entity.Property(e => e.Rid).HasColumnName("rid");

                entity.HasOne(d => d.PidNavigation)
                    .WithMany(p => p.ProductRegions)
                    .HasForeignKey(d => d.Pid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductRegion_Product");

                entity.HasOne(d => d.RidNavigation)
                    .WithMany(p => p.ProductRegions)
                    .HasForeignKey(d => d.Rid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductRegion_Region");
            });

            modelBuilder.Entity<Region>(entity =>
            {
                entity.HasKey(e => e.Rid);

                entity.ToTable("Region");

                entity.Property(e => e.Rid).HasColumnName("rid");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(150)
                    .HasColumnName("name");
            });

            modelBuilder.Entity<SubCategory>(entity =>
            {
                entity.ToTable("SubCategory");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CategoryId).HasColumnName("CategoryID");

                entity.Property(e => e.SubCategoryName).HasMaxLength(255);

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.SubCategories)
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("FK__SubCatego__Categ__31EC6D26");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
