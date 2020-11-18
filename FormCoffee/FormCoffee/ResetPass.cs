namespace FormCoffee
{
    using DevExpress.XtraEditors;
    using DevExpress.XtraEditors.DXErrorProvider;
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Linq;
    using System.Windows.Forms;

    /// <summary>
    /// Defines the <see cref="ResetPass" />.
    /// </summary>
    public partial class ResetPass : DevExpress.XtraEditors.XtraForm
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
        /// Initializes a new instance of the <see cref="ResetPass"/> class.
        /// </summary>
        public ResetPass()
        {
            InitializeComponent();
        }

        /// <summary>
        /// The ResetPass_Load.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void ResetPass_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// The btnRestore_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void btnRestore_Click(object sender, EventArgs e)
        {
            Boolean u = checkUsername();
            Boolean re_pass = checkRestorePass();
            Boolean n_pass = checkNewPass();
            Boolean c_pass = checkComfirmPass();

            if (!u || !re_pass || !n_pass || !c_pass)
            {
                XtraMessageBox.Show("Nhập không hợp lệ", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                if (checkAcc() > 0)
                {
                    if (resetPass(checkAcc()))
                    {
                        XtraMessageBox.Show("Khôi phục thành công", "Thành Công", MessageBoxButtons.OK);
                        CallLoginFrm();
                    }
                    else
                    {
                        XtraMessageBox.Show("Khôi phục không thành công", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                else
                {
                    XtraMessageBox.Show("Tài khoản hoặc mã khôi phục không hợp lệ", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }


            }
        }

        /// <summary>
        /// The checkAcc.
        /// </summary>
        /// <returns>The <see cref="int"/>.</returns>
        public int checkAcc()
        {
            int id = 0;
            var tb = db.Users.Where(p => p.UserName == txtUsername.Text && p.RessetPasswordCode == txtRestorePass.Text);
            if (tb != null)
            {
                foreach (var i in tb)
                {
                    id = i.UserId;
                }
                if (id > 0)
                {
                    return id;
                }
            }
            else
            {
                return 0;
            }

            return 0;
        }

        /// <summary>
        /// The resetPass.
        /// </summary>
        /// <param name="id">The id<see cref="int"/>.</param>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean resetPass(int id)
        {
            try
            {
                User u = db.Users.Find(id);
                u.Password = txtNewPass.Text;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// The CallLoginFrm.
        /// </summary>
        public void CallLoginFrm()
        {
            Login l = new Login();
            this.Hide();
            l.Show();
        }

        /// <summary>
        /// The btnCancel_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void btnCancel_Click(object sender, EventArgs e)
        {
            CallLoginFrm();
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
        /// The txtRestorePass_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void txtRestorePass_Validating(object sender, CancelEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtRestorePass.Text))
            {
                errorProvider.SetError(txtRestorePass, null);
            }
        }

        /// <summary>
        /// The txtNewPass_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void txtNewPass_Validating(object sender, CancelEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtNewPass.Text))
            {
                errorProvider.SetError(txtNewPass, null);
            }
        }

        /// <summary>
        /// The txtConfirmPass_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void txtConfirmPass_Validating(object sender, CancelEventArgs e)
        {

            if (txtConfirmPass.Text.Equals(txtNewPass.Text))
            {

                errorProvider.SetError(txtConfirmPass, null);
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
        /// The checkRestorePass.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkRestorePass()
        {
            if (string.IsNullOrEmpty(txtRestorePass.Text))
            {
                errorProvider.SetError(txtRestorePass, "Không được bỏ trống");
                return false;
            }
            else
            {
                errorProvider.SetError(txtRestorePass, null);
                return true;
            }
        }

        /// <summary>
        /// The checkNewPass.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkNewPass()
        {
            if (string.IsNullOrEmpty(txtNewPass.Text))
            {
                errorProvider.SetError(txtNewPass, "Không được bỏ trống");
                return false;
            }
            else
            {
                errorProvider.SetError(txtNewPass, null);
                return true;
            }
        }

        /// <summary>
        /// The checkComfirmPass.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkComfirmPass()
        {
            if (!txtConfirmPass.Text.Equals(txtNewPass.Text))
            {
                errorProvider.SetError(txtConfirmPass, "Nhập lại mật khẩu không đúng");
                return false;
            }
            else
            {
                errorProvider.SetError(txtConfirmPass, null);
                return true;
            }
        }
    }
}
