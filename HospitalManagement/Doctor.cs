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
    
    public partial class Doctor
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Doctor()
        {
            this.Appointments = new HashSet<Appointment>();
            this.Diagnostics = new HashSet<Diagnostic>();
            this.Diagnostics1 = new HashSet<Diagnostic>();
            this.Prescriptions = new HashSet<Prescription>();
        }
    
        public int DoctorId { get; set; }
        public string DoctorName { get; set; }
        public string DoctorQualification { get; set; }
        public string DoctorDesignation { get; set; }
        public int DepartmentId { get; set; }
        public string MobileNumber { get; set; }
        public string Gender { get; set; }
        public int Age { get; set; }
        public int RoleId { get; set; }
    
        public string TreatmentOfDisease { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Appointment> Appointments { get; set; }
        public virtual Department Department { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Diagnostic> Diagnostics { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Diagnostic> Diagnostics1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Prescription> Prescriptions { get; set; }
        HospitalManagementDbEntities db = new HospitalManagementDbEntities();
        Department departments = new Department();
        public void getDetails()
        {
            Console.WriteLine("Enter the name of Doctor ");
            DoctorName = Console.ReadLine();
            Console.WriteLine("Enter the qualification of Doctor ");
            DoctorQualification = Console.ReadLine();
            Console.WriteLine("Enter the designation of Doctor ");

            DoctorDesignation = Console.ReadLine();
            DepartmentId = 1;
           
            Console.WriteLine("Enter the Mobile Number of Doctor ");
            MobileNumber = Console.ReadLine();
            Console.WriteLine("Enter the gender of Doctor ");
            Gender = Console.ReadLine();
            Console.WriteLine("Enter the age of Doctor");
            Age = Convert.ToInt32(Console.ReadLine());
            RoleId = 1;
            Console.WriteLine("Enter the speciality ");
            TreatmentOfDisease = Console.ReadLine();



        }
        public void DoctorList()
        {
            var db = new HospitalManagementDbEntities();
            var doctorList = db.Doctors;
            try
            {
                foreach (var d in doctorList)
                {
                    Console.WriteLine("Id : " + d.DoctorId + "Name : " + d.DoctorName);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }
    }
}