using System;
using System.Collections.Generic;
using System.Text;

namespace FrameworkCore.Utilities.Mappings
{
    public interface IAutoMapperBase
    {
        List<TDest> MapToSameTypeList<TSource, TDest>(List<TSource> list)
       where TSource : new();
        public TDest MapToSameType<TSource, TDest>(TSource obj)
         where TSource : new();
    }
}
