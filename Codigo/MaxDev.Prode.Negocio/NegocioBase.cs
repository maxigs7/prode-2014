using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using System.Web;

namespace MaxDev.Prode.Negocio
{
    public class NegocioBase<T> where T : class, new ()
    {
        private static T _repository;
        protected static T Repository
        {
            get
            {
                if (_repository == null)
                {
                    _repository = new T();
                }

                return _repository;
            }
            set { _repository = value; }
        }
    }
}