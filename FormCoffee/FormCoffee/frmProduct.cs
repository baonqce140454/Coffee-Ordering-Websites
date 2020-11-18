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
    /// Defines the <see cref="frmProduct" />.
    /// </summary>
    public partial class frmProduct : DevExpress.XtraEditors.XtraForm
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
        /// Defines the img1.
        /// </summary>
        internal string img1 = "";

        /// <summary>
        /// Defines the img2.
        /// </summary>
        internal string img2 = "";

        /// <summary>
        /// Defines the add.
        /// </summary>
        internal Boolean add = false;

        /// <summary>
        /// Initializes a new instance of the <see cref="frmProduct"/> class.
        /// </summary>
        public frmProduct()
        {
            InitializeComponent();
        }

        /// <summary>
        /// The frmProduct_Load.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void frmProduct_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'productDataSet.Products' table. You can move, or remove it, as needed.
            this.productsTableAdapter.Fill(this.productDataSet.Products);
            productsBindingSource.DataSource = db.Products.ToList();

            txtSlug.Enabled = false;
            loadCategory();
        }

        /// <summary>
        /// The loadCategory.
        /// </summary>
        public void loadCategory()
        {
            var ca = db.Categories;
            foreach (var item in ca)
            {
                ccbCategory.Properties.Items.Add(item.Name);
            }
        }

        /// <summary>
        /// The blindingCategory.
        /// </summary>
        public void blindingCategory()
        {
            int idCate = Convert.ToInt32(gridView1.GetRowCellValue(gridView1.FocusedRowHandle, "Category_ID").ToString());
            if (idCate > 0)
            {
                Category cate = db.Categories.Find(idCate);
                ccbCategory.SelectedItem = cate.Name;
            }
        }

        /// <summary>
        /// The LoadAnh.
        /// </summary>
        public void LoadAnh()
        {
            int id = Convert.ToInt16(gridView1.GetRowCellValue(gridView1.FocusedRowHandle, "Id").ToString());
            if (id > 0)
            {
                Product tb = db.Products.Find(id);
                string img = @"C:\Users\Admin\Desktop\sourceweb\FormCoffee\FormCoffee\ShopingCart" + gridView1.GetRowCellValue(gridView1.FocusedRowHandle, "Images").ToString();
                pcImg1.ImageLocation = img;
                if (tb.MoreImages != null)
                {
                    string img2 = @"C:\Users\Admin\Desktop\sourceweb\FormCoffee\FormCoffee\ShopingCart" + tb.MoreImages;
                    pcImg2.ImageLocation = img2;
                }
            }
        }

        /// <summary>
        /// The CheckSlug.
        /// </summary>
        /// <param name="a">The a<see cref="string"/>.</param>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean CheckSlug(string a)
        {
            var pro = db.Products.Where(p => p.Slug == a);
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
        /// The btnImg1_EditValueChanged.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void btnImg1_EditValueChanged(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// The gridControl1_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void gridControl1_Click(object sender, EventArgs e)
        {
            LoadAnh();
            blindingCategory();
        }

        /// <summary>
        /// The loadFile.
        /// </summary>
        /// <returns>The <see cref="string"/>.</returns>
        public string loadFile()
        {
            OpenFileDialog openFileDialog1 = new OpenFileDialog();
            openFileDialog1.Filter = "Database files (*.jpg, *.png)|*.jpg;*.png";
            openFileDialog1.FilterIndex = 0;
            openFileDialog1.RestoreDirectory = true;

            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                string selectedFileName = openFileDialog1.SafeFileName;
                return selectedFileName;
            }
            return null;
        }

        /// <summary>
        /// The btnImg1_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void btnImg1_Click(object sender, EventArgs e)
        {
            img1 = "/Contents/Uploads/files/" + loadFile();
            lblImg.Text = img1;
            string img = @"C:\Users\Admin\Desktop\sourceweb\FormCoffee\FormCoffee\ShopingCart" + img1;
            pcImg1.ImageLocation = img;
        }

        /// <summary>
        /// The btnImg2_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void btnImg2_Click(object sender, EventArgs e)
        {
            img2 = "/Contents/Uploads/files/" + loadFile();
            lblImg2.Text = img2;
            string img = @"C:\Users\Admin\Desktop\sourceweb\FormCoffee\FormCoffee\ShopingCart" + img2;
            pcImg2.ImageLocation = img;
        }

        /// <summary>
        /// The btnAdd_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void btnAdd_Click(object sender, EventArgs e)
        {
            add = true;
            txtSlug.Enabled = true;
            productsBindingSource.AddNew();
            txtName.Focus();
            pcImg1.ImageLocation = "";
            pcImg2.ImageLocation = "";
            ccbCategory.SelectedItem = "";
        }

        /// <summary>
        /// The getCateguryId.
        /// </summary>
        /// <param name="name">The name<see cref="string"/>.</param>
        /// <returns>The <see cref="int"/>.</returns>
        public int getCateguryId(string name)
        {
            var ca = db.Categories.Where(p => p.Name.Equals(name));
            foreach (var item in ca)
            {
                return item.ID;
            }
            return 0;
        }

        /// <summary>
        /// The btnSave_Click.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void btnSave_Click(object sender, EventArgs e)
        {
            Boolean name = checkInputName();
            Boolean slug = checkInputSlug();
            Boolean content = checkInputContent();
            Boolean category = checkInputCategory();
            Boolean price = checkInputPrice();
            Boolean salePrice = checkInputSalePrice();
            Boolean img = checkInputImg();

            if (!name || !slug || !content || !category || !price || !salePrice || !img)
            {
                XtraMessageBox.Show("Nhập Đầy đủ thông tin", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {

                if (add)
                {
                    Boolean check = CheckSlug(txtSlug.Text);
                    if (!check)
                    {
                        XtraMessageBox.Show("Username đã tồn tại", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        errorProvider.SetError(txtSlug, "Slug đã tồn tại");
                    }
                    else
                    {
                        errorProvider.SetError(txtSlug, null);
                        Product p = new Product();
                        string date = DateTime.Now.ToString("yyyy/MM/dd");
                        p.Name = txtName.Text;
                        p.Slug = txtSlug.Text;
                        p.Content = txtContent.Text;
                        p.Images = lblImg.Text;
                        p.Price = Convert.ToInt32(txtPrice.Text);
                        p.Sale_Price = Convert.ToInt32(txtSalePreice.Text);
                        p.Category_ID = getCateguryId(ccbCategory.SelectedItem.ToString());
                        p.MoreImages = lblImg2.Text;
                        p.Created = DateTime.Parse(date);
                        p.ModifileDate = DateTime.Parse(date);
                        p.Status = cbStatus.Checked;
                        p.TopHot = cbHot.Checked;
                        db.Products.Add(p);
                        db.SaveChanges();
                        frmProduct_Load(sender, e);
                        add = false;
                    }

                }
                else
                {
                    int id = Convert.ToInt16(gridView1.GetRowCellValue(gridView1.FocusedRowHandle, "Id").ToString());
                    Product p = db.Products.Find(id);
                    string date = DateTime.Now.ToString("yyyy/MM/dd");
                    p.Name = txtName.Text;
                    //p.Slug = txtSlug.Text;
                    p.Content = txtContent.Text;
                    p.Images = lblImg.Text;
                    p.Price = Convert.ToInt32(txtPrice.Text);
                    p.Sale_Price = Convert.ToInt32(txtSalePreice.Text);
                    p.Category_ID = getCateguryId(ccbCategory.SelectedItem.ToString());
                    p.MoreImages = lblImg2.Text;
                    p.ModifileDate = DateTime.Parse(date);
                    p.Status = cbStatus.Checked;
                    p.TopHot = cbHot.Checked;
                    db.SaveChanges();
                    frmProduct_Load(sender, e);

                }



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
                int id = Convert.ToInt16(gridView1.GetRowCellValue(gridView1.FocusedRowHandle, "Id").ToString());
                Product p = db.Products.Find(id);
                db.Products.Remove(p);
                db.SaveChanges();
                frmProduct_Load(sender, e);
            }
            catch (Exception)
            {
                XtraMessageBox.Show("Chọn Sản Phẩm Xóa", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                frmProduct_Load(sender, e);
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
        /// The txtContent_EditValueChanged.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="EventArgs"/>.</param>
        private void txtContent_EditValueChanged(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// The txtContent_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void txtContent_Validating(object sender, CancelEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtContent.Text))
            {
                errorProvider.SetError(txtContent, null);
            }
        }

        /// <summary>
        /// The ccbCategory_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void ccbCategory_Validating(object sender, CancelEventArgs e)
        {
            if (!string.IsNullOrEmpty(ccbCategory.Text))
            {
                errorProvider.SetError(ccbCategory, null);
            }
        }

        /// <summary>
        /// The txtPrice_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void txtPrice_Validating(object sender, CancelEventArgs e)
        {
            try
            {
                int a = Convert.ToInt32(txtPrice.Text);
                if (!string.IsNullOrEmpty(txtPrice.Text))
                {
                    errorProvider.SetError(txtPrice, null);
                }
                else if (a > 0)
                {
                    errorProvider.SetError(txtPrice, null);
                }
                else
                {
                    errorProvider.SetError(txtPrice, null);
                }
            }
            catch (Exception)
            {
                errorProvider.SetError(txtPrice, "Chỉ nhập số");

            }
        }

        /// <summary>
        /// The txtSalePreice_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void txtSalePreice_Validating(object sender, CancelEventArgs e)
        {
            try
            {
                int a = Convert.ToInt32(txtPrice.Text);
                int b = Convert.ToInt32(txtSalePreice.Text);
                if (!string.IsNullOrEmpty(txtSalePreice.Text))
                {
                    errorProvider.SetError(txtSalePreice, null);
                }
                else if (b > 0 || b < a)
                {
                    errorProvider.SetError(txtSalePreice, null);
                }
                else
                {
                    errorProvider.SetError(txtSalePreice, null);
                }
            }
            catch (Exception)
            {
                errorProvider.SetError(txtSalePreice, "Chỉ nhập số");


            }
        }

        /// <summary>
        /// The lblImg_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void lblImg_Validating(object sender, CancelEventArgs e)
        {
            if (!string.IsNullOrEmpty(lblImg.Text))
            {
                errorProvider.SetError(lblImg, null);
            }
        }

        /// <summary>
        /// The lblImg2_Validating.
        /// </summary>
        /// <param name="sender">The sender<see cref="object"/>.</param>
        /// <param name="e">The e<see cref="CancelEventArgs"/>.</param>
        private void lblImg2_Validating(object sender, CancelEventArgs e)
        {
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
        /// The checkInputContent.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkInputContent()
        {
            if (string.IsNullOrEmpty(txtContent.Text))
            {

                errorProvider.SetError(txtContent, "Không được bỏ trống");
                return false;
            }
            else
            {

                errorProvider.SetError(txtContent, null);
                return true;
            }
        }

        /// <summary>
        /// The checkInputCategory.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkInputCategory()
        {
            if (string.IsNullOrEmpty(ccbCategory.Text))
            {

                errorProvider.SetError(ccbCategory, "Không được bỏ trống");
                return false;
            }
            else
            {

                errorProvider.SetError(ccbCategory, null);
                return true;
            }
        }

        /// <summary>
        /// The checkInputPrice.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkInputPrice()
        {
            try
            {
                int a = Convert.ToInt32(txtPrice.Text);
                if (string.IsNullOrEmpty(txtPrice.Text))
                {

                    errorProvider.SetError(txtPrice, "Không được bỏ trống");
                    return false;
                }
                else if (a <= 0)
                {

                    errorProvider.SetError(txtPrice, "Giá Phải lớn hơn 0");
                    return false;
                }
                else
                {

                    errorProvider.SetError(txtPrice, null);
                    return true;
                }
            }
            catch (Exception)
            {

                errorProvider.SetError(txtPrice, "Chỉ nhập số");
                return false;
            }
        }

        /// <summary>
        /// The checkInputSalePrice.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkInputSalePrice()
        {
            try
            {
                int a = Convert.ToInt32(txtPrice.Text);
                int b = Convert.ToInt32(txtSalePreice.Text);
                if (string.IsNullOrEmpty(txtSalePreice.Text))
                {

                    errorProvider.SetError(txtSalePreice, "Không được bỏ trống");
                    return false;
                }
                else if (b < 0 || b > a)
                {

                    errorProvider.SetError(txtSalePreice, "Giá giảm phải lớn hơn 0 và nhỏ hơn hoặc bằng giá bán");
                    return false;
                }
                else
                {

                    errorProvider.SetError(txtSalePreice, null);
                    return true;
                }
            }
            catch (Exception)
            {

                errorProvider.SetError(txtSalePreice, "Chỉ nhập số");
                return false;

            }
        }

        /// <summary>
        /// The checkInputImg.
        /// </summary>
        /// <returns>The <see cref="Boolean"/>.</returns>
        internal Boolean checkInputImg()
        {
            if (string.IsNullOrEmpty(lblImg.Text))
            {

                errorProvider.SetError(lblImg, "Không được bỏ trống");
                return false;
            }
            else
            {

                errorProvider.SetError(lblImg, null);
                return true;
            }
        }
    }
}
