using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Web;
using Oracle.ManagedDataAccess.Client;
/*
 * Random Godina II kolokvijum /
4) Korišdenjem programskog jezika C# projektovati konzolnu aplikaciju koja za uneti jedinstveni
identifikator radnika prikazuje model i serijski broj svih uređaja koji su servisirani u 2024. godini. (35 poena)
*/
//TEST PRIMER 2
namespace Zadatak4
{
    class Program
    {
        static void Main(string[] args)
        {
            string Con = "Data Source=160.99.12.92/GISLAB_PD; User Id= ; Password= ";
            OracleConnection con = new OracleConnection(Con);
            
            try
            {
                con.Open();
                Console.WriteLine("Unesite ID: ");
                int ID = int.Parse(Console.ReadLine() ?? "0");
                string upit = "select u.model, u.serijski_broj from uredjaj u , radnik r, servisiranje s where s.uredjaj_id=u.id and s.radnik_id=r.id and s.datum_pocetka like '%24' and s.datum_zavrsetka like '%24'  and r.id=" + ID.ToString();

                using (OracleCommand cmd = new OracleCommand(upit, con)){
                    using (OracleDataReader dr= cmd.ExecuteReader()){
                        if (dr.HasRows) {
                            while (dr.Read()){
                                Console.WriteLine(dr["model"] + " " + dr["serijski_broj"]);
                            }
                        }
                        else{
                            Console.WriteLine("Nema uredjaja po ovom kriterijumu");
                        }
                    }
                }          
            }
            catch (Exception ex){
                Console.WriteLine("Greska: " + ex.ToString());
            }
            finally{
                con.Close();
            }  
        }
    }
}
