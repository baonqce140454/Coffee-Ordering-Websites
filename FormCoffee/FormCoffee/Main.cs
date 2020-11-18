namespace FormCoffee
{
    using System;
    using System.Windows.Forms;

    /// <summary>
    /// Defines the <see cref="Main" />.
    /// </summary>
    public partial class Main : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        /// <summary>
        /// Defines the p.
        /// </summary>
        internal frmProduct p = new frmProduct();

        /// <summary>
        /// Defines the or.
        /// </summary>
        internal Orders or = new Orders();

        /// <summary>
        /// Defines the c.
        /// </summary>
        internal Categories c = new Categories();

        /// <summary>
        /// Defines the u.
        /// </summary>
        internal Users u = new Users();

        /// <summary>
        /// Defines the f.
        /// </summary>
        internal Feadbacks f = new Feadbacks();

        /// <summary>
        /// Defines the checkPro.
        /// </summary>
        internal Boolean checkPro = false;

        /// <summary>
        /// Defines the checkOr.
        /// </summary>
        internal Boolean checkOr = false;

        /// <summary>
        /// Defines the checkCate.
        /// </summary>
        internal Boolean checkCate = false;

        /// <summary>
        /// Defines the checkFead.
        /// </summary>
        internal Boolean checkFead = false;

        /// <summary>
        /// Defines the checkUser.
        /// </summary>
        internal Boolean checkUser = false;

        /// <summary>
        /// Initializes a new instance of the <see cref="Main"/> class.
        /// </summary>
        public Main()
        {
            InitializeComponent();
        }

        /// <summary>
        /// The checkFrm.
        /// </summary>
        public void checkFrm()
        {
            foreach (Form fm in Application.OpenForms)
            {
                if (fm.Text == "Orders")
                {
                    checkOr = true;
                }
                else
                {
                    checkOr = false;
                }
                if (fm.Text == "Feadbacks")
                {
                    checkFead = true;
                }
                else
                {
                    checkFead = false;
                }
                if (fm.Text == "Categories")
                {
                    checkCate = true;
                }
                else
                {
                    checkCate = false;
                }
                if (fm.Text == "Users")
                {
                    checkUser = true;
                }
                else
                {
                    checkUser = false;
                }
                if (fm.Text == "frmProduct")
                {
                    checkPro = true;
                }
                else
                {
                    checkPro = false;
                }

            }
        }

        /// <summary>
        /// The btnProduct_ItemClick.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="DevExpress.XtraBars.ItemClickEventArgs"/>.</param>
        private void btnProduct_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            checkFrm();
            if (checkPro)
            {
                p.Focus();
            }
            else
            {
                p = new frmProduct();
                p.MdiParent = this;
                or.Close();
                c.Close();
                u.Close();
                f.Close();
                p.Show();
            }
        }

        /// <summary>
        /// The btnOrder_ItemClick.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="DevExpress.XtraBars.ItemClickEventArgs"/>.</param>
        private void btnOrder_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            checkFrm();
            if (checkOr)
            {
                c.Focus();
            }
            else
            {
                or = new Orders();
                or.MdiParent = this;
                c.Close();
                p.Close();
                u.Close();
                f.Close();
                or.Show();
            }
        }

        /// <summary>
        /// The btnCategory_ItemClick.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="DevExpress.XtraBars.ItemClickEventArgs"/>.</param>
        private void btnCategory_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            checkFrm();
            if (checkCate)
            {
                c.Focus();
            }
            else
            {
                c = new Categories();
                c.MdiParent = this;
                p.Close();
                or.Close();
                u.Close();
                f.Close();
                c.Show();
            }
        }

        /// <summary>
        /// The btnAccount_ItemClick.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="DevExpress.XtraBars.ItemClickEventArgs"/>.</param>
        private void btnAccount_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            checkFrm();
            if (checkUser)
            {
                u.Focus();
            }
            else
            {
                u = new Users();
                u.MdiParent = this;
                p.Close();
                or.Close();
                c.Close();
                f.Close();
                u.Show();
            }
        }

        /// <summary>
        /// The btnFeedback_ItemClick.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="DevExpress.XtraBars.ItemClickEventArgs"/>.</param>
        private void btnFeedback_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            checkFrm();
            if (checkFead)
            {
                f.Focus();
            }
            else
            {
                f = new Feadbacks();
                f.MdiParent = this;
                p.Close();
                c.Close();
                u.Close();
                or.Close();
                f.Show();
            }
        }

        /// <summary>
        /// The barButtonItem1_ItemClick.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="DevExpress.XtraBars.ItemClickEventArgs"/>.</param>
        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Login l = new Login();
            this.Hide();
            l.Show();
        }
    }
}
