using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace MaxDev.Prode.Web.Models
{

    public class ApplicationUser : IdentityUser
    {
        public string Nombre { get; set; }
        public string Apellido { get; set; }

        public string NombreCompleto
        {
            get { return Nombre + " " + Apellido; }
        }

        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager)
        {
            var userIdentity = await manager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ApplicationCookie);
            return userIdentity;
        }
    }
    
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection")
        {
        }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }

        protected override void OnModelCreating(System.Data.Entity.DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            
            modelBuilder.Entity<IdentityUser>().ToTable("Usuario", "membresia").Property(p => p.Id).HasColumnName("UserId");
            modelBuilder.Entity<ApplicationUser>().ToTable("Usuario", "membresia").Property(p => p.Id).HasColumnName("UserId");
            modelBuilder.Entity<IdentityUserRole>().ToTable("UsuarioRol", "membresia");
            modelBuilder.Entity<IdentityUserLogin>().ToTable("UsuarioLogin", "membresia");
            modelBuilder.Entity<IdentityUserClaim>().ToTable("UsuarioReclamo", "membresia");
            modelBuilder.Entity<IdentityRole>().ToTable("Rol", "membresia");
        }

    }


}