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
    
    public partial class HealthcareAssistant
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HealthcareAssistant()
        {
            this.Patients = new HashSet<Patient>();
        }
    
        public int HealthcareAssistantId { get; set; }
        public string Name { get; set; }
        public string Designation { get; set; }
        public string Qualification { get; set; }
        public string Age { get; set; }
        public string Gender { get; set; }
        public string MobileNumber { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Patient> Patients { get; set; }
    }
}