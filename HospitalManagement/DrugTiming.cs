//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HospitalManagement
{
    using System;
    using System.Collections.Generic;
    
    public partial class DrugTiming
    {
        public int DrugId { get; set; }
        public int PatientId { get; set; }
        public string TimeOfDrug { get; set; }
    
        public virtual Drug Drug { get; set; }
        public virtual Patient Patient { get; set; }
    }
}
