using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication1
{
    public class ENUM
    {
        public String[,] getUnidades()
        {
            String[,] array = new String[19, 2]
            {
                {"BET", @"\\10.18.182.11\"},    
                {"ALP", @"\\10.18.214.11\"},
                {"DIA", @"\\10.23.85.11\"},
                {"DIV", @"\\10.18.188.11\"},
                {"GOV", @"\\10.44.165.11\"},
                {"HJK", @"\\10.18.180.11\"},
                {"ITU", @"\\10.18.200.11\"},
                {"JFO", @"\\10.18.194.11\"},
                {"MCU", @"\\10.23.86.11\"},
                {"MOC", @"\\10.18.222.11\"},
                {"PAL", @"\\10.18.198.11\"},
                {"PAS", @"\\10.18.204.11\"},
                {"PMI", @"\\10.18.190.11\"},
                {"PNO", @"\\10.18.206.11\"},
                {"POC", @"\\10.44.239.11\"},
                {"SJR", @"\\10.23.87.11\"},
                {"SLA", @"\\10.18.210.11\"},
                {"UDI", @"\\10.18.186.11\"},
                {"URA", @"\\10.18.184.11\"}
            };
            
            return array;
        }
    }
}
