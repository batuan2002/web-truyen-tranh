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
    
    public partial class Observatory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Observatory()
        {
            this.FeedbacktoObservatories = new HashSet<FeedbacktoObservatory>();
            this.ImageOfObservatories = new HashSet<ImageOfObservatory>();
        }
    
        public int ObservatoryID { get; set; }
        public string ObservatoryName { get; set; }
        public string Elevation { get; set; }
        public string ObservatorySite { get; set; }
        public string Location { get; set; }
        public string coordinates { get; set; }
        public Nullable<int> Established { get; set; }
        public string TypeOfObservatory { get; set; }
        public string MajorInstruments { get; set; }
        public Nullable<bool> Status { get; set; }
        public int EmployeeID { get; set; }
        public string Description { get; set; }
    
        public virtual Employee Employee { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FeedbacktoObservatory> FeedbacktoObservatories { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ImageOfObservatory> ImageOfObservatories { get; set; }
    }
}