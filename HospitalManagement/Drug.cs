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
    
    public partial class Drug
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Drug()
        {
            this.DrugTimings = new HashSet<DrugTiming>();
        }
    
        public int DrugId { get; set; }
        public string DrugName { get; set; }
        public string DrugContent { get; set; }
        public string UsedFor { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DrugTiming> DrugTimings { get; set; }
        
        public void getDetails()
        {
            var db = new HospitalManagementDbEntities();
            var drugList = db.Drugs;
            try
            {
                foreach (var drug in drugList)
                {
                    Console.WriteLine("Id: " + drug.DrugId + "Name : " + drug.DrugName +"Durg Content"+ drug.DrugContent);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }
    }
    }

