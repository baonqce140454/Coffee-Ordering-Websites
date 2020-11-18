using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormCoffee.model
{
    class ListOrderPro
    {
    
        public int stt { get; set; }
        public String namePro { get; set; }
        public int price { get; set; }
        public int quantity { get; set; }

        public ListOrderPro()
        {
        }

        public ListOrderPro(int stt, String namePro, int price, int quantity)
        {
            this.stt = stt;
            this.namePro = namePro;
            this.price = price;
            this.quantity = quantity;
        }
    }
}
