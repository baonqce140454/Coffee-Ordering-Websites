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
    /// Defines the <see cref="Categories" />.
    /// </summary>
    public partial class Categories : DevExpress.XtraEditors.XtraForm
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
        internal Boolean add;

        /// <summary>
        /// Initializes a new instance of the <see cref="Categories"/> class.
        /// </summary>
        public Categories()
        {
            InitializeComponent();
        }

        /// <summary>
        /// The Categories_Load.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void Categories_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'categoryDataSet.Categories' table. You can move, or remove it, as needed.
            categoriesBindingSource.DataSource = db.Categories.ToList();
            txtCategory.Enabled = false;
            txtSlug.Enabled = false;
        }

        /// <summary>
        /// The checkCategory.
        /// </summary>
        /// <param name="a">The a<see cref="string"/>.</param>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkCategory(string a)
        {
            var pro = db.Categories.Where(p => p.Name == a);
            foreach (var item in pro)
            {
                if (item.Name.Equals(a))
                {
                    return false;
                }
            }
            return true;
        }

        /// <summary>
        /// The checkSlug.
        /// </summary>
        /// <param name="a">The a<see cref="string"/>.</param>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkSlug(string a)
        {
            var pro = db.Categories.Where(p => p.Slug == a);
            foreach (var item in pro)
            {
                if (item.Slug.Equals(a))
                {
                    return false;
                }
            }
            return true;
        }

        /// <summary>
        /// The txtCategory_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void txtCategory_Validating(object sender, CancelEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtCategory.Text))
            {
                errorProvider.SetError(txtCategory, null);
            }
        }

        /// <summary>
        /// The txtSlug_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void txtSlug_Validating(object sender, CancelEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSlug.Text))
            {
                errorProvider.SetError(txtSlug, null);
            }
        }

        /// <summary>
        /// The checkInputCategory.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkInputCategory()
        {
            if (string.IsNullOrEmpty(txtCategory.Text))
            {
                errorProvider.SetError(txtCategory, "Không được bỏ trống");
                return false;
            }
            else
            {
                errorProvider.SetError(txtCategory, null);
                return true;
            }
        }

        /// <summary>
        /// The checkInputSlug.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkInputSlug()
        {
            if (string.IsNullOrEmpty(txtSlug.Text))
            {
                errorProvider.SetError(txtSlug, "Không được bỏ trống");
                return false;
            }
            else
            {
                errorProvider.SetError(txtSlug, null);
                return true;
            }
        }

        /// <summary>
        /// The btnInsert_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void btnInsert_Click(object sender, EventArgs e)
        {
            add = true;
            txtSlug.Enabled = true;
            categoriesBindingSource.AddNew();
            txtCategory.Focus();
            txtCategory.Enabled = true;
            txtSlug.Enabled = true;
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
                int id = Convert.ToInt16(gridView1.GetRowCellValue(gridView1.FocusedRowHandle, "ID").ToString());
                Category p = db.Categories.Find(id);
                db.Categories.Remove(p);
                db.SaveChanges();
                Categories_Load(sender, e);
            }
            catch (Exception)
            {
                XtraMessageBox.Show("Chọn Sản Phẩm Xóa", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                Categories_Load(sender, e);
            }
        }

        /// <summary>
        /// The btnSave_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void btnSave_Click(object sender, EventArgs e)
        {
            Boolean cate = checkInputCategory();
            Boolean slug = checkInputSlug();

            if (!cate || !slug)
            {
                XtraMessageBox.Show("Nhập Đầy đủ thông tin", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {

                if (add)
                {
                    Boolean category = checkCategory(txtCategory.Text);
                    Boolean Cslug = checkSlug(txtSlug.Text);
                    if (!category)
                    {
                        XtraMessageBox.Show("Category đã tồn tại", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        errorProvider.SetError(txtCategory, "Category đã tồn tại");
                    }
                    else if (!Cslug)
                    {
                        XtraMessageBox.Show("Slug đã tồn tại", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        errorProvider.SetError(txtSlug, "Slug đã tồn tại");
                    }
                    else
                    {
                        errorProvider.SetError(txtSlug, null);
                        errorProvider.SetError(txtCategory, null);
                        Category c = new Category();
                        string date = DateTime.Now.ToString("yyyy/MM/dd");
                        c.Name = txtCategory.Text;
                        c.Slug = txtSlug.Text;
                        c.CreatedDate = DateTime.Parse(date);
                        c.ModifileDate = DateTime.Parse(date);
                        c.Status = cbStatus.Checked;

                        db.Categories.Add(c);
                        db.SaveChanges();
                        Categories_Load(sender, e);
                        add = false;
                    }
                }

                else
                {
                    int id = Convert.ToInt16(gridView1.GetRowCellValue(gridView1.FocusedRowHandle, "ID").ToString());
                    errorProvider.SetError(txtSlug, null);
                    errorProvider.SetError(txtCategory, null);
                    Category c = db.Categories.Find(id);
                    string date = DateTime.Now.ToString("yyyy/MM/dd");
                    c.Name = txtCategory.Text;
                    c.Slug = txtSlug.Text;
                    //c.CreatedDate = DateTime.Parse(date);
                    c.ModifileDate = DateTime.Parse(date);
                    c.Status = cbStatus.Checked;

                    db.SaveChanges();
                    Categories_Load(sender, e);

                }

            }
        }
    }
}
