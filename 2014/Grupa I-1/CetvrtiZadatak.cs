using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Oracle.ManagedDataAccess.Client;
using System.Data;
using System.Web;
/*
 * 2014 II kolokvijum grupa: I-1
4) Korišćenjem programskog jezika C# projektovati konzolnu aplikaciju koja za unetu registarsku oznaku vozila prikazuje imena i prezimena svih klijenata iz Srbije koji su iznajmljivali to vozilo. (35 poena)
*/
//TEST PRIMER BG-222-BB
namespace Zadatak4
{
    class Program
    {
        static void Main(string[] args)
        {
            string strConnection = "Data Source=160.99.12.92/GISLAB_PD;User Id= ; Password= ";
            OracleConnection g = new OracleConnection(strConnection);

            try{
                g.Open();

                Console.WriteLine("Unesite tablice: ");
                string tablice = Console.ReadLine() ?? string.Empty, upit= "select k.ime, k.prezime from klijent_1 k, klijent_vozilo_1 kv, vozilo_1 v where k.id=kv.klijent_id and v.id=kv.vozilo_id and k.drzava='Srbija' and v.registracija='"+tablice.ToString()+"'";

                OracleCommand cmd = new OracleCommand(upit, g);

                OracleDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows){
                    while (dr.Read()){
                        Console.WriteLine(dr["ime"] + " " + dr["prezime"]);
                    }
                }
                else{
                    Console.WriteLine("Niko nije koristio vozilo sa ovim tablicama");
                }
                dr.Close();
                cmd.Dispose();
            }
            catch(Exception ex){
                Console.WriteLine("Greska: " + ex.ToString());
            }
            finally{
                g.Close();
            }
        }
    }
}