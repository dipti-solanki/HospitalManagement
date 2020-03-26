using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HospitalManagement
{
    class Program
    {
        static void Main(string[] args)
        {
            int option;
            var dbEntity = new HospitalManagementDbEntities();
            Console.WriteLine("1. Enter Patient Details");
            Console.WriteLine("2. Display Patient Details");
            Console.WriteLine("3. Enter Doctor Details");
            Console.WriteLine("4. Display Doctor Details");
            Console.WriteLine("5. Make an Appointment");
            Console.WriteLine("6. Make a Precsription");
            Console.WriteLine("7. Exit");
            Console.WriteLine("Enter the option you want to choose");
            option = Convert.ToInt32(Console.ReadLine());
            switch (option)
            {
                case 1:AddPatient();
                    break;
                case 2:var patient = new Patient();
                    patient.PatientList();
                    break;
                case 3:AddDoctor();
                    break;
                case 4: var doctor = new Doctor();
                    doctor.DoctorList();
                    break;
                case 5:AddAppointment();
                    break;
                case 6:AddPrescription();
                    break;
                case 7: Console.WriteLine("Exited Successfully");
                default:break;

            }

            void AddPatient()
            {
                using (dbEntity)
                {
                    var patient = new Patient();
                    patient.getDetails();
                    var check = dbEntity.Patients.SingleOrDefault(t => t.PatientFirstName== patient.PatientFirstName);
                    if (check == null)
                    {
                        try
                        {
                            dbEntity.Patients.Add(patient);
                            dbEntity.SaveChanges();
                            Console.WriteLine("Patient added to the list");
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine(e);
                        }
                    }
                    else
                    {
                        Console.WriteLine("Patient is already in the list");
                    }

                }
            }
            void AddDoctor()
            {
                using (dbEntity)
                {
                    var doctor = new Doctor();
                    doctor.getDetails();
                    var check = dbEntity.Doctors.SingleOrDefault(t => t.DoctorName == doctor.DoctorName);
                    if (check == null)
                    {
                        try
                        {
                            dbEntity.Doctors.Add(doctor);
                            dbEntity.SaveChanges();
                            Console.WriteLine("Doctor added to the list");
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine(e);
                        }
                    }
                    else
                    {
                        Console.WriteLine("Doctor is already in the list");
                    }

                }
            }

            void AddAppointment()
            {
                using (dbEntity)
                {
                    var appointment = new Appointment();

                    appointment.getDetails();

                    var check = dbEntity.Appointments.SingleOrDefault(t => t.PatientId == appointment.PatientId);
                    if (check == null)
                    {
                        try
                        {
                            dbEntity.Appointments.Add(appointment);
                            dbEntity.SaveChanges();
                            Console.WriteLine("Appointment is scheduled.");
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine(e);
                        }
                    }
                    else
                    {
                        Console.WriteLine("Appointment is made earlier.");
                    }
                }

            }
            void AddPrescription()
            {
                var prescription = new Prescription();
                var drugs = new Drug();
                prescription.getDetails();
                var check = dbEntity.Prescriptions.SingleOrDefault(t => t.PatientId == prescription.PatientId);
                if (check == null)
                {
                    try
                    {
                        dbEntity.Prescriptions.Add(prescription);
                        dbEntity.SaveChanges();
                        Console.WriteLine("See the below list to choose the drug mentioned in ur prescription");
                        drugs.getDetails();
                        Console.WriteLine("Enter the Name of the Drug");
                        drugs.DrugName = Console.ReadLine();
                        Console.WriteLine("Prescription is successfully made.");
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e);
                    }
                }
                else
                {
                    Console.WriteLine("Prescriptions is already made. Just Collect it.");
                }
            }
        }

        }
    }

