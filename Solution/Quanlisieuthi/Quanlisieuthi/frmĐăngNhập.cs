using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Quanlisieuthi
{
    public partial class frmĐăngNhập : Form
    {
        public frmĐăngNhập()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }


        private void label7_Click(object sender, EventArgs e)
        {

        }

      
        private void txtUser_TextChanged(object sender, EventArgs e)
        {

        }

        private void but_HangHoa_Click(object sender, EventArgs e)
        {
            frmHangHoa frmdg = new frmHangHoa();
            frmdg.ShowDialog();
            frmdg.Close();
            frmdg.Dispose();
        }

        private void but_HoaDon_Click(object sender, EventArgs e)
        {
            frmHoaDon frmdg = new frmHoaDon();
            frmdg.ShowDialog();
            frmdg.Close();
            frmdg.Dispose();

        }

        private void but_KhachHang_Click(object sender, EventArgs e)
        {
            frmKhachHang frmdg = new frmKhachHang();
            frmdg.ShowDialog();
            frmdg.Close();
            frmdg.Dispose();
        }

        private void but_NhanVien_Click(object sender, EventArgs e)
        {
            frmNhanVien frmdg = new frmNhanVien();
            frmdg.ShowDialog();
            frmdg.Close();
            frmdg.Dispose();
        }

        private void but_QuanLi_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void txtPass_TextChanged(object sender, EventArgs e)
        {

        }

        private void pAcc_Paint(object sender, PaintEventArgs e)
        {

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
               frmHuongDan frmhd = new frmHuongDan();
            frmhd.ShowDialog();
            frmhd.Close();
            frmhd.Dispose();
        }
    }
}
