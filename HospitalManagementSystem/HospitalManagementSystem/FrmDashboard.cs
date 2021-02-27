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

namespace HospitalManagementSystem
{
    //Code Writer:Rabia Çevik
    public partial class FrmDashboard : Form
    {
        public FrmDashboard()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-387VI6I\\MSSQLSERVER01;Initial Catalog=Hospital;Integrated Security=True");
        private void btnAddNewPatient_Click(object sender, EventArgs e)
        {
            lblindicator1.ForeColor = System.Drawing.Color.Red; //The label changes color when clicking the button
            lblindicator1.ForeColor = System.Drawing.Color.Red;    
            lblindicator2.ForeColor = System.Drawing.Color.Black;
            lblindicator3.ForeColor = System.Drawing.Color.Black; 
            lblindicator4.ForeColor = System.Drawing.Color.Black;
            panel2.Visible = true;
            panel3.Visible = false;
            panel4.Visible = false;  
            panel5.Visible = false;  //the relevant panel opens
        }

        private void btnAddDiagnosisInfo_Click(object sender, EventArgs e)
        {
            lblindicator2.ForeColor = System.Drawing.Color.Red;
            lblindicator1.ForeColor = System.Drawing.Color.Black;
            lblindicator3.ForeColor = System.Drawing.Color.Black;
            lblindicator4.ForeColor = System.Drawing.Color.Black;
            panel3.Visible = true;
            panel4.Visible = false;
            panel5.Visible = false;
        }

        private void btnFullHistoryofPatient_Click(object sender, EventArgs e)
        {
            lblindicator3.ForeColor = System.Drawing.Color.Red;
            lblindicator2.ForeColor = System.Drawing.Color.Black;
            lblindicator1.ForeColor = System.Drawing.Color.Black;
            lblindicator4.ForeColor = System.Drawing.Color.Black;
            panel4.Visible = true;
            panel5.Visible = false;
            SqlCommand cmd = new SqlCommand("select * from AddPatient inner join PatientMore on AddPatient.pid=PatientMore.pid", con);
            SqlDataAdapter DA = new SqlDataAdapter(cmd);  //printing information in two tables to dataridview
            DataSet DS = new DataSet("AddPatient");
            DA.Fill(DS,"AddPatient");
            dataGridView2.DataSource = DS.Tables["AddPatient"];


        }

        private void btnHospitalInfo_Click(object sender, EventArgs e)
        {
            lblindicator4.ForeColor = System.Drawing.Color.Red;
            lblindicator2.ForeColor = System.Drawing.Color.Black;
            lblindicator3.ForeColor = System.Drawing.Color.Black;
            lblindicator1.ForeColor = System.Drawing.Color.Black;
            panel5.Visible = true;
        }

        private void BtnExit_Click(object sender, EventArgs e)
        {
            lblindicator1.ForeColor = System.Drawing.Color.Black;
            lblindicator2.ForeColor = System.Drawing.Color.Black;
            lblindicator3.ForeColor = System.Drawing.Color.Black;
            lblindicator4.ForeColor = System.Drawing.Color.Black;
            this.Close();
        }

        private void FrmDashboard_Load(object sender, EventArgs e)
        {
            panel2.Visible = false;
            panel3.Visible = false;
            panel4.Visible = false;
            panel5.Visible = false;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into AddPatient (Name,Full_Address,Contact,Age,Gender,Blood_Group,Major_Disease,pid) values (@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8)", con);
                cmd.Parameters.AddWithValue("@p1", txtName.Text);
                cmd.Parameters.AddWithValue("@p2", txtAddress.Text);
                cmd.Parameters.AddWithValue("@p3", txtContactNumber.Text);   //save entered information
                cmd.Parameters.AddWithValue("@p4", txtAge.Text);
                cmd.Parameters.AddWithValue("@p5", cmbGender.Text);
                cmd.Parameters.AddWithValue("@p6", txtBloodGroup.Text);
                cmd.Parameters.AddWithValue("@p7", txtAny.Text);
                cmd.Parameters.AddWithValue("@p8", txtPatientid.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox.Show("Data Saved!");
            }
            catch (Exception)
            {
                //message appears if something is wrong
                MessageBox.Show("Patient id already exit or Any field is empty or Data is WRONG Format.");
            }
            txtName.Clear();
            txtAddress.Clear();
            txtContactNumber.Clear();
            txtAge.Clear();
            txtBloodGroup.Clear();
            txtAny.Clear();
            txtPatientid.Clear();
            cmbGender.ResetText();
           

        }

        private void txtPid_TextChanged(object sender, EventArgs e)
        {
            if (txtPid.Text!="")
            {
                con.Open();
                int pid = Convert.ToInt32(txtPid.Text);
                SqlCommand cmd = new SqlCommand("select * from AddPatient where pid=" + pid + "", con);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet DS = new DataSet("AddPatient");
                DA.Fill(DS,"AddPatient");
                dataGridView1.DataSource = DS.Tables["AddPatient"];
                con.Close();
            }
        }

        private void BtnSav_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into PatientMore (pid,Symptoms,Diagnosis,Medicines,Ward,Ward_Type) values (@x1,@x2,@x3,@x4,@x5,@x6)", con);
                cmd.Parameters.AddWithValue("@x1", txtPatientid.Text);
                cmd.Parameters.AddWithValue("@x2", txtSymptoms.Text);
                cmd.Parameters.AddWithValue("@x3", txtDiagnosis.Text);
                cmd.Parameters.AddWithValue("@x4", txtMedicines.Text);
                cmd.Parameters.AddWithValue("@x5", cmbWardR.Text);
                cmd.Parameters.AddWithValue("@x6", cmbTypeWard.Text);    //saving patient information
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox.Show("Data Saved.");
            }
            catch (Exception)
            {

                MessageBox.Show("Any field is empty or Data is wrong format");
            }
            txtDiagnosis.Text = "";
            txtMedicines.Text = "";
            txtPatientid.Clear();
            cmbWardR.Text = "";
            cmbTypeWard.Text = "";
            txtSymptoms.Text = "";
        }

    }
}
