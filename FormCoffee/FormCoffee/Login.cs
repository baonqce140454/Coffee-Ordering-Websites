namespace FormCoffee
{
    using DevExpress.XtraEditors;
    using DevExpress.XtraEditors.DXErrorProvider;
    using System;
    using System.ComponentModel;
    using System.Windows.Forms;

    /// <summary>
    /// Defines the <see cref="Login" />.
    /// </summary>
    public partial class Login : DevExpress.XtraEditors.XtraForm
    {
        /// <summary>
        /// Defines the errorProvider.
        /// </summary>
        internal DXErrorProvider errorProvider = new DXErrorProvider();

        /// <summary>
        /// Defines the db.
        /// </summary>
        internal SHOPINGCARTEntities db = new SHOPINGCARTEntities();

        /// <summary>
        /// Initializes a new instance of the <see cref="Login"/> class.
        /// </summary>
        public Login()
        {
            InitializeComponent();
        }

        /// <summary>
        /// The btnForgot_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void btnForgot_Click(object sender, EventArgs e)
        {


            ResetPass r = new ResetPass();
            this.Hide();
            r.Show();
        }

        /// <summary>
        /// The Login_Load.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void Login_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// The btnLogin_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void btnLogin_Click(object sender, EventArgs e)
        {
            Boolean u = checkUsername();
            Boolean p = checkPass();
            if (!u || !p)
            {
                XtraMessageBox.Show("Tài khoản hoặc mật khẩu không hợp lệ", "Lỗi", MessageBoxButtons.OK);
            }
            else
            {
                checkLogin();
                errorProvider.SetError(txtUsername, null);
                errorProvider.SetError(txtPass, null);
            }
        }

        /// <summary>
        /// The checkLogin.
        /// </summary>
        public void checkLogin()
        {
            var tb = db.Users;
            string user = txtUsername.Text;
            string pass = txtPass.Text;
            foreach (var i in tb)
            {

                if (i.UserName.Equals(user) && i.Password.Equals(pass))
                {
                    if (i.RoleId == 2)
                    {
                        Main m = new Main();
                        this.Hide();
                        m.Show();
                    }
                    else
                    {
                        XtraMessageBox.Show("Phải đăng nhập bằng tài khoản admin", "Lỗi", MessageBoxButtons.OK);

                    }
                    break;
                }
                else
                {
                    XtraMessageBox.Show("Tài khoản hoặc mật khẩu không đúng!!!", "Lỗi", MessageBoxButtons.OK);
                    break;
                }
            }
        }

        /// <summary>
        /// The txtUsername_TextChanged.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void txtUsername_TextChanged(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// The txtUsername_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void txtUsername_Validating(object sender, CancelEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtUsername.Text))
            {
                errorProvider.SetError(txtUsername, null);
            }
        }

        /// <summary>
        /// The txtPass_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void txtPass_Validating(object sender, CancelEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtPass.Text))
            {
                errorProvider.SetError(txtPass, null);
            }
        }

        /// <summary>
        /// The checkUsername.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkUsername()
        {

            if (string.IsNullOrEmpty(txtUsername.Text))
            {
                errorProvider.SetError(txtUsername, "Không được bỏ trống");
                return false;
            }
            else
            {
                errorProvider.SetError(txtUsername, null);
                return true;
            }
        }

        /// <summary>
        /// The checkPass.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkPass()
        {

            if (string.IsNullOrEmpty(txtPass.Text))
            {
                errorProvider.SetError(txtPass, "Không được bỏ trống");
                return false;
            }
            else
            {
                errorProvider.SetError(txtPass, null);
                return true;
            }
        }
    }
}
