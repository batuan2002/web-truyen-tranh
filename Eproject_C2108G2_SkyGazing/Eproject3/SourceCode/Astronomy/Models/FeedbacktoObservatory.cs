//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Astronomy.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class FeedbacktoObservatory
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Description { get; set; }
        public Nullable<int> ObservatoryID { get; set; }
        public System.DateTime Date { get; set; }
        public Nullable<bool> Status { get; set; }
    
        public virtual Observatory Observatory { get; set; }
    }
}
