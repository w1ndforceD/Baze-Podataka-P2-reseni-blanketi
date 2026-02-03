using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Oracle.ManagedDataAccess.Client;
using System.Data;
using System.Web;
/*
 * 2014 II kolokvijum grupa: I-2
4) Korišćenjem programskog jezika C# projektovati
konzolnu aplikaciju koja za uneti naziv hotela prikazuje imena i prezimena svih turista iz Srbije koji su boravili u tom hotelu. (35 poena)
*/
//TEST Sunset Resort
namespace Zadatak4{
    class Program{
        static void Main(string[] args){
            string command = "Data Source=160.99.12.92/GISLAB_PD; User Id=; Password= ";
            OracleConnection con = new OracleConnection(command);

            try
            {
                con.Open();
                Console.WriteLine("Unesite naziv hotela:");
                string nazivHotela=Console.ReadLine() ?? string.Empty;

                using (OracleCommand cmd = new OracleCommand("select t.ime,t.prezime from turista t, turista_hotel th, hotel h where t.id=th.turista_id and h.id=th.hotel_id and t.drzava='Srbija' and h.naziv='" + nazivHotela + "'", con)){
                    using (OracleDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.HasRows){
                            while (rdr.Read()){
                                Console.WriteLine(rdr["ime"] + " " + rdr["prezime"]);
                            }
                        }
                        else{
                            Console.WriteLine("Niko nije odseo u ovom hotelu");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Greska: "+ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}
