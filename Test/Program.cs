using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RegexParsers;
using System.Data.SqlTypes;

namespace Test
{
    class Program
    {
        static void Main(string[] args)
        {
            Parsers test = new Parsers();
           // SqlInt32 c = Parsers.GetCost(@"Выданы кр.Линии 4400 РУБЛЕЙ п.Краснооктябрьски 100руб");
            //Console.WriteLine(c);


            var result = Parsers.ParserValya("142, 144, 145-148, 149-150");
            Console.WriteLine(result);
            Console.ReadKey();
        }
    }
}
