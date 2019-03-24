using System;
using System.IO;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace TtDb
{
    public partial class SomebodyWrongContext : DbContext
    {
        public SomebodyWrongContext()
        {
        }

        public SomebodyWrongContext(DbContextOptions<SomebodyWrongContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Payment> Payments { get; set; }
        public virtual DbSet<Session> Sessions { get; set; }
        public virtual DbSet<Topic> Topic { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                var connect = File.ReadAllText("ConnectionString.txt");
                optionsBuilder.UseMySQL(connect);
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.3-servicing-35854");

            modelBuilder.Entity<Payment>(entity =>
            {
                entity.ToTable("payments", "somebodywrong");

                entity.HasIndex(e => e.Id)
                    .HasName("Id")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnType("bigint(20) unsigned");

                entity.Property(e => e.UserId).HasColumnType("int(11)");
            });

            modelBuilder.Entity<Session>(entity =>
            {
                entity.ToTable("sessions", "somebodywrong");

                entity.HasIndex(e => e.Id)
                    .HasName("Id")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnType("bigint(20) unsigned");

                entity.Property(e => e.UserId).HasColumnType("int(11)");
            });

            modelBuilder.Entity<Topic>(entity =>
            {
                entity.ToTable("topic", "somebodywrong");

                entity.HasIndex(e => e.Id)
                    .HasName("Id")
                    .IsUnique();

                entity.HasIndex(e => e.Name)
                    .HasName("indexName");

                entity.Property(e => e.Id).HasColumnType("bigint(20) unsigned");

                entity.Property(e => e.Description)
                    .HasMaxLength(1000)
                    .IsUnicode(false);

                entity.Property(e => e.DialogsCount).HasColumnType("bigint(20)");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("users", "somebodywrong");

                entity.HasIndex(e => e.Email)
                    .HasName("indexEmail");

                entity.HasIndex(e => e.Id)
                    .HasName("Id")
                    .IsUnique();

                entity.HasIndex(e => e.Name)
                    .HasName("indexName");

                entity.Property(e => e.Id).HasColumnType("bigint(20) unsigned");

                entity.Property(e => e.Email)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Score).HasColumnType("bigint(20)");

                entity.Property(e => e.WalletScore).HasColumnType("bigint(20)");
            });
        }
    }
}
