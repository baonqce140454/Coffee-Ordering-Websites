namespace FormCoffee
{
    using DevExpress.XtraEditors;
    using DevExpress.XtraEditors.DXErrorProvider;
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Linq;
    using System.Security.Cryptography;
    using System.Text;
    using System.Text.RegularExpressions;
    using System.Windows.Forms;

    /// <summary>
    /// Defines the <see cref="Users" />.
    /// </summary>
    public partial class Users : DevExpress.XtraEditors.XtraForm
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
        /// Defines the add.
        /// </summary>
        internal Boolean add = false;

        /// <summary>
        /// Initializes a new instance of the <see cref="Users"/> class.
        /// </summary>
        public Users()
        {
            InitializeComponent();
        }

        /// <summary>
        /// The Users_Load.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void Users_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'sHOPINGCARTDataSet1.Users' table. You can move, or remove it, as needed.
            this.usersTableAdapter.Fill(this.sHOPINGCARTDataSet1.Users);
            txtUsername.Enabled = false;
        }

        /// <summary>
        /// The BindingCbb.
        /// </summary>
        public void BindingCbb()
        {
            int role = Convert.ToInt32(gridView1.GetRowCellValue(gridView1.FocusedRowHandle, "RoleId").ToString());
            if (role == 2)
            {
                ccbRole.SelectedItem = "Admin";
                txtPassword.Enabled = true;
                txtRessetPass.Enabled = true;
                txtName.Enabled = true;
                txtEmail.Enabled = true;
                txtPhone.Enabled = true;
                txtAddress.Enabled = true;
                ccbRole.Enabled = true;
            }
            else if (role == 1)
            {
                txtPassword.Enabled = false;
                txtRessetPass.Enabled = false;
                txtName.Enabled = false;
                txtEmail.Enabled = false;
                txtPhone.Enabled = false;
                txtAddress.Enabled = false;
                ccbRole.Enabled = false;
                ccbRole.SelectedItem = "User";
            }
        }

        /// <summary>
        /// The CheckUsername.
        /// </summary>
        /// <param name="a">The a<see cref="string"/>.</param>
        /// <returns>The <see cref="Boolean"/>.</returns>
        public Boolean CheckUsername(string a)
        {
            var u = db.Users.Where(p => p.UserName == a);
            foreach (var item in u)
            {
                if (item.UserName.Equals(a))
                {
                    return false;
                }
            }
            return true;
        }

        /// <summary>
        /// The checkRole.
        /// </summary>
        /// <param name="role">The role<see cref="string"/>.</param>
        /// <returns>The <see cref="int"/>.</returns>
        public int checkRole(string role)
        {
            if (role.Equals("Admin"))
            {
                return 2;
            }
            else if (role.Equals("User"))
            {
                return 1;
            }
            return 0;
        }

        /// <summary>
        /// The checkEmail.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        public Boolean checkEmail()
        {
            Regex mRegxExpression;

            if (txtEmail.Text.Trim() != string.Empty)

            {

                mRegxExpression = new Regex(@"^([a-zA-Z0-9_\-])([a-zA-Z0-9_\-\.]*)@(\[((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}|((([a-zA-Z0-9\-]+)\.)+))([a-zA-Z]{2,}|(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\])$");

                if (!mRegxExpression.IsMatch(txtEmail.Text.Trim()))

                {

                    return false;
                }
            }
            return true;
        }

        /// <summary>
        /// The gridControl1_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void gridControl1_Click(object sender, EventArgs e)
        {
            add = false;
            txtUsername.Enabled = false;
            BindingCbb();
        }

        /// <summary>
        /// The btnInsert_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                add = true;
                txtUsername.Enabled = true;
                usersBindingSource.AddNew();
                txtUsername.Focus();
            }
            catch (Exception)
            {

            }
        }

        /// <summary>
        /// The btnDelete_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt16(gridView1.GetRowCellValue(gridView1.FocusedRowHandle, "UserId").ToString());
                User u = db.Users.Find(id);
                db.Users.Remove(u);
                db.SaveChanges();
                Users_Load(sender, e);
            }
            catch (Exception)
            {

                XtraMessageBox.Show("Xóa Không thành công", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /// <summary>
        /// The btnSave_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void btnSave_Click(object sender, EventArgs e)
        {
            checkInputUsername();
            checkInputPassword();
            checkInputResetPassword();
            checkInputName();
            checkInputEmail();
            checkInputAddress();
            checkInputPhone();
            checkInputRole();

            if (!checkInputUsername() || !checkInputPassword() || !checkInputResetPassword() || !checkInputName() || !checkInputEmail() || !checkInputAddress() || !checkInputPhone() || !checkInputRole())
            {
                XtraMessageBox.Show("Nhập Đầy đủ thông tin", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                if (add)
                {
                    Boolean check = CheckUsername(txtUsername.Text);
                    if (!check)
                    {
                        XtraMessageBox.Show("Username đã tồn tại", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        errorProvider.SetError(txtUsername, "Username đã tồn tại");
                    }
                    else
                    {
                        errorProvider.SetError(txtUsername, null);
                        errorProvider.SetError(txtUsername, null);
                        User u = new User();
                        string date = DateTime.Now.ToString("yyyy/MM/dd");
                        u.RoleId = checkRole(ccbRole.SelectedItem.ToString());
                        u.UserName = txtUsername.Text;
                        if (ccbRole.SelectedItem.ToString().Equals("User"))
                        {
                            u.Password = MD5Hash(txtPassword.Text);
                        }
                        else
                        {
                            u.Password = txtPassword.Text;
                        }

                        u.CreatedDate = DateTime.Parse(date);
                        u.EditedDate = DateTime.Parse(date);
                        u.FullName = txtName.Text;
                        u.Phone = txtPhone.Text;
                        u.Email = txtEmail.Text;
                        u.Address = txtAddress.Text;
                        u.Status = cbStatus.Checked;

                        if (ccbRole.SelectedItem.ToString().Equals("User"))
                        {
                            u.RessetPasswordCode = MD5Hash(txtRessetPass.Text);
                        }
                        else
                        {
                            u.RessetPasswordCode = txtRessetPass.Text;
                        }

                        db.Users.Add(u);
                        db.SaveChanges();
                        Users_Load(sender, e);
                        add = false;

                    }

                }
                else
                {
                    int id = Convert.ToInt16(gridView1.GetRowCellValue(gridView1.FocusedRowHandle, "UserId").ToString());
                    User u = db.Users.Find(id);
                    string date = DateTime.Now.ToString("yyyy/MM/dd");
                    u.RoleId = checkRole(ccbRole.SelectedItem.ToString());
                    // u.UserName = txtUsername.Text;
                    if (ccbRole.SelectedItem.ToString().Equals("User"))
                    {
                        u.Password = MD5Hash(txtPassword.Text);
                    }
                    else
                    {
                        u.Password = txtPassword.Text;
                    }
                    //u.CreatedDate = DateTime.Parse(date);
                    u.EditedDate = DateTime.Parse(date);
                    u.FullName = txtName.Text;
                    u.Phone = txtPhone.Text;
                    u.Email = txtEmail.Text;
                    u.Address = txtAddress.Text;
                    u.Status = cbStatus.Checked;
                    if (ccbRole.SelectedItem.ToString().Equals("User"))
                    {
                        u.RessetPasswordCode = MD5Hash(txtRessetPass.Text);
                    }
                    else
                    {
                        u.RessetPasswordCode = txtRessetPass.Text;
                    }

                    db.SaveChanges();
                    Users_Load(sender, e);
                }
            }
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
        /// The txtPassword_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void txtPassword_Validating(object sender, CancelEventArgs e)
        {

            if (!string.IsNullOrEmpty(txtPassword.Text))
            {
                errorProvider.SetError(txtPassword, null);
            }
        }

        /// <summary>
        /// The txtRessetPass_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void txtRessetPass_Validating(object sender, CancelEventArgs e)
        {

            if (!string.IsNullOrEmpty(txtRessetPass.Text))
            {
                errorProvider.SetError(txtRessetPass, null);
            }
        }

        /// <summary>
        /// The txtName_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void txtName_Validating(object sender, CancelEventArgs e)
        {

            if (!string.IsNullOrEmpty(txtName.Text))
            {
                errorProvider.SetError(txtName, null);
            }
        }

        /// <summary>
        /// The txtEmail_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void txtEmail_Validating(object sender, CancelEventArgs e)
        {
            Boolean c = checkEmail();


            if (string.IsNullOrEmpty(txtEmail.Text))
            {
                e.Cancel = true;
                errorProvider.SetError(txtEmail, "Không được bỏ trống");
            }
            else if (!c)
            {
                e.Cancel = true;
                errorProvider.SetError(txtEmail, "Eamil không hợp lệ");
            }
            else
            {
                e.Cancel = false;
                errorProvider.SetError(txtEmail, null);
            }
        }

        /// <summary>
        /// The txtPhone_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void txtPhone_Validating(object sender, CancelEventArgs e)
        {

            if (!string.IsNullOrEmpty(txtPhone.Text))
            {

                errorProvider.SetError(txtPhone, null);
            }
        }

        /// <summary>
        /// The txtAddress_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void txtAddress_Validating(object sender, CancelEventArgs e)
        {

            if (!string.IsNullOrEmpty(txtAddress.Text))
            {

                errorProvider.SetError(txtAddress, null);
            }
        }

        /// <summary>
        /// The ccbRole_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void ccbRole_Validating(object sender, CancelEventArgs e)
        {

            if (!string.IsNullOrEmpty(ccbRole.Text))
            {

                errorProvider.SetError(ccbRole, null);
            }
        }

        /// <summary>
        /// The txtUsername_Leave.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void txtUsername_Leave(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// The checkInputUsername.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkInputUsername()
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
        /// The checkInputPassword.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkInputPassword()
        {
            if (string.IsNullOrEmpty(txtPassword.Text))
            {

                errorProvider.SetError(txtPassword, "Không được bỏ trống");
                return false;
            }
            else
            {
                errorProvider.SetError(txtPassword, null);
                return true;
            }
        }

        /// <summary>
        /// The checkInputResetPassword.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkInputResetPassword()
        {
            if (string.IsNullOrEmpty(txtRessetPass.Text))
            {
                errorProvider.SetError(txtRessetPass, "Không được bỏ trống");
                return false;
            }
            else
            {
                errorProvider.SetError(txtRessetPass, null);
                return true;
            }
        }

        /// <summary>
        /// The checkInputName.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkInputName()
        {
            if (string.IsNullOrEmpty(txtName.Text))
            {

                errorProvider.SetError(txtName, "Không được bỏ trống");
                return false;
            }
            else
            {

                errorProvider.SetError(txtName, null);
                return true;
            }
        }

        /// <summary>
        /// The checkInputEmail.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkInputEmail()
        {
            Boolean c = checkEmail();


            if (string.IsNullOrEmpty(txtEmail.Text))
            {

                errorProvider.SetError(txtEmail, "Không được bỏ trống");
                return false;
            }
            else if (!c)
            {

                errorProvider.SetError(txtEmail, "Eamil không hợp lệ");
                return false;
            }
            else
            {

                errorProvider.SetError(txtEmail, null);
                return true;
            }
        }

        /// <summary>
        /// The checkInputPhone.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkInputPhone()
        {
            if (string.IsNullOrEmpty(txtPhone.Text))
            {

                errorProvider.SetError(txtPhone, "Không được bỏ trống");
                return false;
            }
            else
            {

                errorProvider.SetError(txtPhone, null);
                return true;
            }
        }

        /// <summary>
        /// The checkInputAddress.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkInputAddress()
        {
            if (string.IsNullOrEmpty(txtAddress.Text))
            {

                errorProvider.SetError(txtAddress, "Không được bỏ trống");
                return false;
            }
            else
            {

                errorProvider.SetError(txtAddress, null);
                return true;
            }
        }

        /// <summary>
        /// The checkInputRole.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkInputRole()
        {
            if (string.IsNullOrEmpty(ccbRole.Text))
            {

                errorProvider.SetError(ccbRole, "Không được bỏ trống");
                return false;
            }
            else
            {

                errorProvider.SetError(ccbRole, null);
                return true;
            }
        }

        /// <summary>
        /// The label10_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void label10_Click(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// The MD5Hash.
        /// </summary>
        /// <param name="input">The input<see cref="string"/>.</param>
        /// <returns>The <see cref="string"/>.</returns>
        public static string MD5Hash(string input)
        {
            StringBuilder hash = new StringBuilder();
            MD5CryptoServiceProvider md5provider = new MD5CryptoServiceProvider();
            byte[] bytes = md5provider.ComputeHash(new UTF8Encoding().GetBytes(input));

            for (int i = 0; i < bytes.Length; i++)
            {
                hash.Append(bytes[i].ToString("x2"));
            }
            return hash.ToString();
        }
    }
}
