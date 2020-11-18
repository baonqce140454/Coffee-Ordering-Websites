namespace FormCoffee
{
    using System;

    /// <summary>
    /// Defines the <see cref="Feadbacks" />.
    /// </summary>
    public partial class Feadbacks : DevExpress.XtraEditors.XtraForm
    {
        /// <summary>
        /// Defines the db.
        /// </summary>
        internal SHOPINGCARTEntities db = new SHOPINGCARTEntities();

        /// <summary>
        /// Initializes a new instance of the <see cref="Feadbacks"/> class.
        /// </summary>
        public Feadbacks()
        {
            InitializeComponent();
        }

        /// <summary>
        /// The Feadbacks_Load.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void Feadbacks_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'feedbacksDataSet.FeedBacks' table. You can move, or remove it, as needed.
            this.feedBacksTableAdapter.Fill(this.feedbacksDataSet.FeedBacks);
            txtName.Enabled = false;
            txtEmail.Enabled = false;
            //txtContent.Enabled = false;
            txtPhone.Enabled = false;
            txtDate.Enabled = false;
        }

        /// <summary>
        /// The btnUpdate_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void btnUpdate_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt16(gridView1.GetRowCellValue(gridView1.FocusedRowHandle, "Id").ToString());
            FeedBack f = db.FeedBacks.Find(id);
            f.Status = cbStatus.Checked;

            db.SaveChanges();
            Feadbacks_Load(sender, e);
        }
    }
}
