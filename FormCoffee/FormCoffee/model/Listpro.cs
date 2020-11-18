using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormCoffee.model
{
    class Listpro
    {
        public int stt { get; set; }
        public string namePro { get; set; }
        public int price { get; set; }
        public int quantity { get; set; }

        public Listpro()
        {
        }

        public Listpro(int stt, string namePro, int price, int quantity)
        {
            this.stt = stt;
            this.namePro = namePro;
            this.price = price;
            this.quantity = quantity;
        }
    }
}

