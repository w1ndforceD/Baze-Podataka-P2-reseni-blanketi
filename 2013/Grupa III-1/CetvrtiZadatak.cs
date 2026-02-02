using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Oracle.ManagedDataAccess.Client;
using System.Data;
using System.Data.OracleClient;
using System.Web;
/*
 * 2013 II kolokvijum grupa: III-1
4)Korišćenjem programskog jezika C# i ADO.NET biblioteke napisati program (funkciju Main) koji za uneti naslov 
knjige prikazuje nazive biblioteka koje imaju primerke te knjige. (35 poona)
*/
namespace Zadatak4
{
    class Program
    {
        static void Main(string[] args)
        {
            string strConnection = "Data Source=160.99.12.92/GISLAB_PD;User Id=; Password=";
            OracleConnection g = new OracleConnection(strConnection);

            try{
                g.Open();
                Console.WriteLine("Unesite naziv knjige:");
                string naslov=Console.ReadLine() ?? string.Empty; //mng clean
                

                string upit = "select b.naziv from knjiga k, biblioteka b, knjiga_u_biblioteci kb where k.isbn=kb.isbn_knjige and b.id=kb.id_biblioteke and k.naslov='"+naslov+"'"; //ovde mora da se pazi razmak inace nece procita
                OracleCommand cmd = new OracleCommand(upit, g);

                OracleDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows){
                    while (dr.Read()){
                        Console.WriteLine(dr["naziv"]);
                    }
                }
                else{
                    Console.WriteLine("Ovu knjigu nema nijedna biblioteka!");
                }
            }
            catch(Exception ex) {
                 Console.WriteLine("Greska je: "+ex.ToString());
            }
            finally { 
                g.Close();
            }
        }
    }
}