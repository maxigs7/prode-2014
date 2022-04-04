using System.Web;
using System.Web.Optimization;
using MaxDev.Prode.Negocio.Configuracion;

namespace MaxDev.Prode.Web
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            
            bundles.Add(new ScriptBundle("~/js/modernizr").Include(
                        "~/static/js/modernizr-*"));

            bundles.Add(new ScriptBundle("~/js").Include(
                      "~/static/js/lib.js",
                      "~/static/js/app.js"));


            bundles.Add(new StyleBundle("~/css").Include(
                      "~/static/css/lib.css",
                      "~/static/css/app.css"));

            if (!AppSettings.IsDebugging)
            {
                BundleTable.EnableOptimizations = true;  
            }
        }
    }
}
