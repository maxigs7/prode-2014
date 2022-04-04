using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace MaxDev.Prode.Negocio.Configuracion
{
    public class AppSettings
    {
        private static string _version;

        public static string Version
        {
            get
            {
                if (String.IsNullOrEmpty(_version))
                {
                    Assembly assembly = Assembly.GetExecutingAssembly();
                    FileVersionInfo fvi = FileVersionInfo.GetVersionInfo(assembly.Location);
                    _version = fvi.ProductVersion;
                }
                return _version;
            }
        }

        public static bool IsDebugging
        {
            get { return HttpContext.Current.IsDebuggingEnabled; }
        }
    }
}
