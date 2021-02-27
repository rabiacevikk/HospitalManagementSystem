using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HospitalManagementSystem
{
    public partial class FrmLogin : Form
    {
        public FrmLogin()
        {
            InitializeComponent();
        }

        private void BtnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUserName.Text;
            string pass = txtPassword.Text;
            if (username=="rabia" &&pass=="123321")      //If this username and password is entered, the other form is opened.
            {
                MessageBox.Show("You have entered right username and password.");
                FrmDashboard fr = new FrmDashboard();
                fr.ShowDialog();
                this.Hide();

            }
            else     ///If it is wrong, a message will appear
            {
                MessageBox.Show("Wrong user id or password","Warning",MessageBoxButtons.OK,MessageBoxIcon.Warning);
            }
        }

        private void FrmLogin_Load(object sender, EventArgs e)
        {

        }
    }
}
