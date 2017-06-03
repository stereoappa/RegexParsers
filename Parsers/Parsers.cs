using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace RegexParsers
{
    public class Parsers
    {
        [SqlFunction]
        public static SqlInt32 GetCost(string memo)
        {
            SqlInt32 sum = 0;
            if (memo != null)
            {
                Regex pattern = new Regex(@"[0-9]{1,2}\s?\d+(\s{0,5}(?=(р(у(б)?)?(л)?(е)?(й)?\.?)))");
                MatchCollection matchCollection = pattern.Matches(memo.ToLower());

                for (int i = 0; i < matchCollection.Count; i++)
                {
                    sum += SqlInt32.Parse((matchCollection[i].Value.Replace(" ", "")));
                }
            }
            return sum;
        }

        [SqlFunction]  //ДЛЯ ЗРок типа 123-128, 135
        public static string ParseNumRazresh(string numRazresh)
        {
            List<int> results = new List<int>();
            string commaNumRazresh = "";
            if (numRazresh != null)
            {
                Regex pattern = new Regex(@"\d{1,4}\s{0,2}-\s{0,2}\d{1,4}");
                MatchCollection matchCollection = pattern.Matches(numRazresh);
                if (matchCollection.Count > 0)
                {
                    foreach (Match item in matchCollection)
                    {
                        int index = item.Index; int length = item.Length;

                        string[] tireValues = item.Value.Replace(" ", "").Split('-');
                        int min = Math.Min(int.Parse(tireValues[0]), int.Parse(tireValues[1]));
                        int max = Math.Max(int.Parse(tireValues[0]), int.Parse(tireValues[1]));
                        //results = new string[max - min];

                        string commaResult = "";
                        results.Clear();
                        for (int i = min, k = 0; i <= max; i++, k++)
                        {

                            results.Add(i);
                            commaResult += results[k] + ",";
                        }
                        numRazresh = numRazresh.Replace(item.Value.Trim().ToString(), commaResult);
                    }

                    //string[] commaValues = numRazresh.Replace(" ", "").Split(',');

                    //for (int i = 0; i < commaValues.Length; i++)
                    //{
                    //    results.Add(int.Parse(commaValues[i]));
                    //}
                }
            }
            return numRazresh;

        }

        [SqlFunction]  //ДЛЯ ЗРок типа 123-128, 135
        public static SqlString ParserValya(string numRazresh)
        {
            List<int> results = new List<int>();

            if (numRazresh != null)
            {

                Regex pattern = new Regex(@"\d{1,4}\s{0,2}-\s{0,2}\d{1,4}");
                MatchCollection matchCollection = pattern.Matches(numRazresh);
                if (matchCollection.Count > 0)
                {
                    foreach (Match item in matchCollection)
                    {
                        string[] tireValues = item.Value.Replace(" ", "").Split('-');
                        if (int.Parse(tireValues[0]) > int.Parse(tireValues[1]))
                               return "ошибка последовательности";
                        if (Math.Abs(int.Parse(tireValues[0]) - int.Parse(tireValues[1])) > 50)
                          return "больше 50";

                        int min = Math.Min(int.Parse(tireValues[0]), int.Parse(tireValues[1]));
                        int max = Math.Max(int.Parse(tireValues[0]), int.Parse(tireValues[1]));

                        for (int i = min, k = 0; i <= max; i++, k++)
                        {
                            results.Add(i);
                        }
                        numRazresh = numRazresh.Replace(item.Value.ToString(), "");
                    }
                }

                numRazresh = numRazresh.Replace(";", ",");
                numRazresh = numRazresh.Replace(".", ",");
                string[] commaValues = numRazresh.Replace(" ", "").Split(',');

                for (int i = 0; i < commaValues.Length; i++)
                {
                    if (commaValues[i] != "")
                        results.Add(int.Parse(commaValues[i]));
                }

            }

            SqlString retStr = "";
            foreach (var item in results)
            {
                retStr += item + ",";
            }
            return retStr;
        }
    }
}
