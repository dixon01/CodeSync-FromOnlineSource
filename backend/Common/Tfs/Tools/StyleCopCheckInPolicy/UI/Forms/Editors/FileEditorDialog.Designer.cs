﻿// <auto-generated/>
namespace Gorba.Common.Tfs.Tools.StyleCopCheckInPolicy.UI.Forms.Editors
{
    using Gorba.Common.Tfs.Tools.StyleCopCheckInPolicy.Properties;
    using Gorba.Common.Tfs.Tools.StyleCopCheckInPolicy.UI.Controls;

    partial class FileEditorDialog
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (this.components != null))
            {
                this.components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FileEditorDialog));
            this.FileBrowser = new BrowseFileControl();
            this.FileNameLabel = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // ExclusionTypeComboBox
            // 
            this.ExclusionTypeComboBox.Items.AddRange(new object[] {
            resources.GetString("ExclusionTypeComboBox.Items"),
            resources.GetString("ExclusionTypeComboBox.Items1"),
            resources.GetString("ExclusionTypeComboBox.Items2"),
            resources.GetString("ExclusionTypeComboBox.Items3"),
            resources.GetString("ExclusionTypeComboBox.Items4")});
            resources.ApplyResources(this.ExclusionTypeComboBox, "ExclusionTypeComboBox");
            // 
            // ExclusionTypeLabel
            // 
            resources.ApplyResources(this.ExclusionTypeLabel, "ExclusionTypeLabel");
            // 
            // SubmitButton
            // 
            resources.ApplyResources(this.SubmitButton, "SubmitButton");
            // 
            // AbortButton
            // 
            resources.ApplyResources(this.AbortButton, "AbortButton");
            // 
            // FileBrowser
            // 
            resources.ApplyResources(this.FileBrowser, "FileBrowser");
            this.FileBrowser.FileName = "";
            this.FileBrowser.Name = "FileBrowser";
            this.FileBrowser.TextChanged += new System.EventHandler<System.EventArgs>(this.FileBrowser_TextChanged);
            // 
            // FileNameLabel
            // 
            resources.ApplyResources(this.FileNameLabel, "FileNameLabel");
            this.FileNameLabel.Name = "FileNameLabel";
            // 
            // label2
            // 
            resources.ApplyResources(this.label2, "label2");
            this.label2.Name = "label2";
            // 
            // label3
            // 
            resources.ApplyResources(this.label3, "label3");
            this.label3.Name = "label3";
            // 
            // label4
            // 
            resources.ApplyResources(this.label4, "label4");
            this.label4.Name = "label4";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = Resources.Warning;
            resources.ApplyResources(this.pictureBox1, "pictureBox1");
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.TabStop = false;
            // 
            // FileEditorDialog
            // 
            resources.ApplyResources(this, "$this");
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.FileNameLabel);
            this.Controls.Add(this.FileBrowser);
            this.Name = "FileEditorDialog";
            this.Load += new System.EventHandler(this.FileEditorDialog_Load);
            this.Controls.SetChildIndex(this.ExclusionTypeLabel, 0);
            this.Controls.SetChildIndex(this.ExclusionTypeComboBox, 0);
            this.Controls.SetChildIndex(this.FileBrowser, 0);
            this.Controls.SetChildIndex(this.FileNameLabel, 0);
            this.Controls.SetChildIndex(this.AbortButton, 0);
            this.Controls.SetChildIndex(this.SubmitButton, 0);
            this.Controls.SetChildIndex(this.label4, 0);
            this.Controls.SetChildIndex(this.label3, 0);
            this.Controls.SetChildIndex(this.label2, 0);
            this.Controls.SetChildIndex(this.pictureBox1, 0);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private BrowseFileControl FileBrowser;
        private System.Windows.Forms.Label FileNameLabel;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.PictureBox pictureBox1;
    }
}
