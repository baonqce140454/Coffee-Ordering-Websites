namespace FormCoffee
{
    using FormCoffee.model;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Linq;
    using System.Windows.Forms;

    /// <summary>
    /// Defines the <see cref="Orders" />.
    /// </summary>
    public partial class Orders : DevExpress.XtraEditors.XtraForm
    {
        /// <summary>
        /// Defines the db.
        /// </summary>
        internal SHOPINGCARTEntities db = new SHOPINGCARTEntities();

        /// <summary>
        /// Initializes a new instance of the <see cref="Orders"/> class.
        /// </summary>
        public Orders()
        {
            InitializeComponent();

            ccbStatus.Properties.Items.Add("Chờ xác nhận");
            ccbStatus.Properties.Items.Add("Xác nhận");
            ccbStatus.Properties.Items.Add("Đang giao");
            ccbStatus.Properties.Items.Add("Đã giao");
            ccbStatus.Properties.Items.Add("Hoàn thành");
        }

        /// <summary>
        /// The Orders_Load.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void Orders_Load(object sender, EventArgs e)
        {

            // TODO: This line of code loads data into the 'sHOPINGCARTDataSet.Orders' table. You can move, or remove it, as needed.
            this.ordersTableAdapter.Fill(this.sHOPINGCARTDataSet.Orders);
        }

        /// <summary>
        /// The loadOrderDetails.
        /// </summary>
        public void loadOrderDetails()
        {
            int id = Convert.ToInt16(gridView1.GetRowCellValue(gridView1.FocusedRowHandle, "ID").ToString());
            var pro = db.OrderDetails.Where(p => p.Oder_ID == id);
            List<ListOrderPro> list = new List<ListOrderPro>();

            int i = 0;
            int total = 0;
            foreach (var p in pro)
            {
                ListOrderPro product = new ListOrderPro();
                product.stt = ++i;
                product.namePro = p.Product.Name.ToString();
                product.price = Convert.ToInt32(p.Price.ToString());
                product.quantity = Convert.ToInt32(p.Quantity.ToString());

                total = total + (Convert.ToInt32(p.Price.ToString()) * Convert.ToInt32(p.Quantity.ToString()));
                list.Add(product);
            }

            lbltotal.Text = total.ToString();






            listOrderProBindingSource1.DataSource = list;
        }

        /// <summary>
        /// The showStatus.
        /// </summary>
        internal void showStatus()
        {
            int status = Convert.ToInt32(gridView1.GetRowCellValue(gridView1.FocusedRowHandle, "Status").ToString());
            if (status.Equals(0))
            {
                ccbStatus.SelectedItem = ("Chờ xác nhận");
            }
            else if (status.Equals(1))
            {
                ccbStatus.SelectedItem = ("Xác nhận");
            }
            else if (status.Equals(2))
            {
                ccbStatus.SelectedItem = ("Đang giao");
            }
            else if (status.Equals(3))
            {
                ccbStatus.SelectedItem = ("Đã giao");
            }
            else if (status.Equals(4))
            {
                ccbStatus.SelectedItem = ("Hoàn thành");
            }
        }

        /// <summary>
        /// The updateStatus.
        /// </summary>
        internal void updateStatus()
        {
            int status = Convert.ToInt32(gridView1.GetRowCellValue(gridView1.FocusedRowHandle, "ID").ToString());
            Order or = db.Orders.Find(status);
            if (ccbStatus.SelectedItem.ToString().Equals("Chờ xác nhận"))
            {
                or.Status = 0;
            }
            else if (ccbStatus.SelectedItem.ToString().Equals("Xác nhận"))
            {
                or.Status = 1;
            }
            else if (ccbStatus.SelectedItem.ToString().Equals("Đang giao"))
            {
                or.Status = 2;
            }
            else if (ccbStatus.SelectedItem.ToString().Equals("Đã giao"))
            {
                or.Status = 3;
            }
            else if (ccbStatus.SelectedItem.ToString().Equals("Hoàn thành"))
            {
                or.Status = 4;
            }
            db.SaveChanges();
        }

        /// <summary>
        /// The gridControl1_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void gridControl1_Click(object sender, EventArgs e)
        {
            loadOrderDetails();
            showStatus();
        }

        /// <summary>
        /// The ccbStatus_SelectedValueChanged.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void ccbStatus_SelectedValueChanged(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// The ccbStatus_MouseClick.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="MouseEventArgs"/>.</param>
        private void ccbStatus_MouseClick(object sender, MouseEventArgs e)
        {
        }

        /// <summary>
        /// The btnUpdate_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void btnUpdate_Click(object sender, EventArgs e)
        {
            updateStatus();
            Orders_Load(sender, e);
        }
    }
}
