//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Handbook.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class SPECIALIZATION
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SPECIALIZATION()
        {
            this.SHOP_SPECIALIZATION = new HashSet<SHOP_SPECIALIZATION>();
        }
    
        public int ID { get; set; }
        public string SPECIALIZATION1 { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SHOP_SPECIALIZATION> SHOP_SPECIALIZATION { get; set; }
    }
}
