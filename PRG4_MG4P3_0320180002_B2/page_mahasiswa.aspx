<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="page_mahasiswa.aspx.cs" Inherits="PRG4_MG4P3_0320180002_B2.page_mahasiswa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Mahasiswa
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="heading" runat="server">
    Mahasiswa
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <style>
        .rbl-jenis-kelamin label {
            margin-left: 5px;
        }
    </style>


    <% #region View Mahasiswa %>
    <div class="row" id="ViewMahasiswa" runat="server">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header">View Mahasiswa</div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="col-xl-12" style="display: flex; margin-left: -2%; justify-content: space-between">
                        <div style="display: flex;">
                            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                            <asp:Button ID="btnCari" runat="server" Text="Cari" CssClass="btn btn-primary" OnClick="btnCari_Click" />
                        </div>

                        <asp:Button ID="btnTambah" runat="server" Text="Tambah" CssClass="btn btn-primary" OnClick="btnTambah_Click" />
                    </div>

                    <br />

                    <asp:GridView runat="server" ID="gridDataMahasiswa" CssClass="table table-striped table-bordered table-hover" AllowPaging="true"
                        AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="NIM" EmptyDataText="Tidak Ada Data" PageSize="5" PagerStyle-CssClass="pagination.ys"
                        ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridDataMahasiswa_PageIndexChanging" OnRowCommand="gridDataMahasiswa_RowCommand" OnSorting="gridDataMahasiswa_Sorting">
                        <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                        <Columns>
                            <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="namaProdi" HeaderText="Nama Program Studi" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="namaProdi" />
                            <asp:BoundField DataField="namaMahasiswa" HeaderText="Nama Mahasiswa" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="NamaMahasiswa" />
                            <asp:BoundField DataField="JenisKelamin" HeaderText="Jenis Kelamin" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="JenisKelamin" />
                            <asp:BoundField DataField="Alamat" HeaderText="Alamat" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Alamat" />
                            <asp:BoundField DataField="Email" HeaderText="Email" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Email" />
                            <asp:BoundField DataField="NoHp" HeaderText="No HP" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="NoHp" />
                            <asp:BoundField DataField="Angkatan" HeaderText="Angkatan" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="Angkatan" />
                            <asp:BoundField DataField="TempatLahir" HeaderText="Tempat Lahir" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="TempatLahir" />
                            <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                        ToolTip="Ubah Data Table"><i class="fa fa-edit fa-fw"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <!-- /.card-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-xl-12 -->
    </div>
    <% #endregion %>

    <% #region Add Mahasiswa %>
    <div class="row" id="AddMahasiswa" runat="server">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header">Add Mahasiswa</div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="form-group">
                        <asp:Label ID="lblAddNim" runat="server" Text="NIM"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:TextBox ID="txtAddNim" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:Label ID="Label9" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </div>
                        <asp:RequiredFieldValidator ID="valAddNim" ControlToValidate="txtAddNim" runat="server" Display="Dynamic" ForeColor="Red" Text="Nim Wajib Diisi" SetFocusOnError="true" ValidationGroup="valAdd">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblAddNamaMahasiswa" runat="server" Text="Nama Mahasiswa"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:TextBox ID="txtAddNamaMahasiswa" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </div>
                        <asp:RequiredFieldValidator ID="valAddNamaMahasiswa" ControlToValidate="txtAddNamaMahasiswa" runat="server" Display="Dynamic" ForeColor="Red" Text="Nama Mahasiswa Wajib Diisi" SetFocusOnError="true" ValidationGroup="valAdd">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblAddProdi" runat="server" Text="Program Studi"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:DropDownList ID="ddlAddProdi" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblAddTempatLahir" runat="server" Text="Tempat Lahir"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:TextBox ID="txtAddTempatLahir" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </div>
                        <asp:RequiredFieldValidator ID="valAddTempatLahir" ControlToValidate="txtAddTempatLahir" runat="server" Display="Dynamic" ForeColor="Red" Text="Tempat Lahir Wajib Diisi" SetFocusOnError="true" ValidationGroup="valAdd">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblAddJenisKelamin" runat="server" Text="Jenis Kelamin"></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:RadioButtonList ID="rblAddJenisKelamin" runat="server" CssClass="rbl-jenis-kelamin">
                                <asp:ListItem Text="Laki-Laki" Value="0" />
                                <asp:ListItem Text="Perempuan" Value="1" />
                            </asp:RadioButtonList>
                        </div>
                        <asp:RequiredFieldValidator ID="valAddJenisKelamin" ControlToValidate="rblAddJenisKelamin" runat="server" Display="Dynamic" ForeColor="Red" Text="Jenis Kelamin Wajib Diisi" SetFocusOnError="true" ValidationGroup="valAdd">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblAddEmail" runat="server" Text="Email"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:TextBox ID="txtAddEmail" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </div>
                        <asp:RequiredFieldValidator ID="valAddEmail" ControlToValidate="txtAddEmail" runat="server" Display="Dynamic" ForeColor="Red" Text="Email Wajib Diisi" SetFocusOnError="true" ValidationGroup="valAdd">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valAddEmailRegex" ValidationExpression="^[A-Za-z0-9+-_.]+@[A-Za-z0-9+-_.]+[.][A-Za-z]+$" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtAddEmail" ErrorMessage="Format Email salah" SetFocusOnError="true" ValidationGroup="valAdd">
                        </asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblAddNoHp" runat="server" Text="No Hp"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:TextBox ID="txtAddNoHp" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:Label ID="Label6" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </div>
                        <asp:RequiredFieldValidator ID="valAddNoHp" ControlToValidate="txtAddNoHp" runat="server" Display="Dynamic" ForeColor="Red" Text="NoHp Wajib Diisi" SetFocusOnError="true" ValidationGroup="valAdd">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valAddNoHpRegex" ValidationExpression="^(?:[+]|[0-9])[0-9]+$" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtAddNoHp" ErrorMessage="Format NoHp salah" SetFocusOnError="true" ValidationGroup="valAdd">
                        </asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblAddAlamat" runat="server" Text="Alamat"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:TextBox ID="txtAddAlamat" CssClass="form-control" Columns="50" Rows="5" TextMode="MultiLine" runat="server"></asp:TextBox>
                            <asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </div>
                        <asp:RequiredFieldValidator ID="valAddAlamat" ControlToValidate="txtAddAlamat" runat="server" Display="Dynamic" ForeColor="Red" Text="Alamat Wajib Diisi" SetFocusOnError="true" ValidationGroup="valAdd">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblAddAngkatan" runat="server" Text="Angkatan"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:TextBox ID="txtAddAngkatan" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:Label ID="Label8" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </div>
                        <asp:RequiredFieldValidator ID="valAddAngkatan" ControlToValidate="txtAddAngkatan" runat="server" Display="Dynamic" ForeColor="Red" Text="Angkatan Wajib Diisi" SetFocusOnError="true" ValidationGroup="valAdd">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valAddAngkatanRegex" ValidationExpression="^[0-9]+$" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtAddAngkatan" ErrorMessage="Format Angkatan salah" SetFocusOnError="true" ValidationGroup="valAdd">
                        </asp:RegularExpressionValidator>
                    </div>

                    <asp:Button ID="btnSubmitAdd" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSubmitAdd_Click" ValidationGroup="valAdd" />
                    <asp:Button ID="btnCancelAdd" runat="server" Text="Cancel" CssClass="btn" OnClick="btnCancelAdd_Click" />
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-xl-12 -->
    </div>
    <% #endregion %>

    <% #region Edit Mahasiswa %>
    <div class="row" id="EditMahasiswa" runat="server">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header">Edit Mahasiswa</div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="form-group">
                        <asp:Label ID="lblEditNim" runat="server" Text="NIM"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:TextBox ID="txtEditNim" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:Label ID="Label10" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </div>
                        <asp:RequiredFieldValidator ID="valEditNim" ControlToValidate="txtEditNim" runat="server" Display="Dynamic" ForeColor="Red" Text="Nim Wajib Diisi" SetFocusOnError="true" ValidationGroup="valEdit">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblEditNamaMahasiswa" runat="server" Text="Nama Mahasiswa"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:TextBox ID="txtEditNamaMahasiswa" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:Label ID="Label12" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </div>
                        <asp:RequiredFieldValidator ID="valEditNamaMahasiswa" ControlToValidate="txtEditNamaMahasiswa" runat="server" Display="Dynamic" ForeColor="Red" Text="Nama Mahasiswa Wajib Diisi" SetFocusOnError="true" ValidationGroup="valEdit">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblEditProdi" runat="server" Text="Program Studi"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:DropDownList ID="ddlEditProdi" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblEditTempatLahir" runat="server" Text="Tempat Lahir"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:TextBox ID="txtEditTempatLahir" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:Label ID="Label15" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </div>
                        <asp:RequiredFieldValidator ID="valEditTempatLahir" ControlToValidate="txtEditTempatLahir" runat="server" Display="Dynamic" ForeColor="Red" Text="Tempat Lahir Wajib Diisi" SetFocusOnError="true" ValidationGroup="valEdit">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblEditJenisKelamin" runat="server" Text="Jenis Kelamin"></asp:Label>
                        <asp:Label ID="Label17" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:RadioButtonList ID="rblEditJenisKelamin" runat="server" CssClass="rbl-jenis-kelamin">
                                <asp:ListItem Text="Laki-Laki" Value="0" />
                                <asp:ListItem Text="Perempuan" Value="1" />
                            </asp:RadioButtonList>
                        </div>
                        <asp:RequiredFieldValidator ID="valEditJenisKelamin" ControlToValidate="rblEditJenisKelamin" runat="server" Display="Dynamic" ForeColor="Red" Text="Jenis Kelamin Wajib Diisi" SetFocusOnError="true" ValidationGroup="valEdit">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblEditEmail" runat="server" Text="Email"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:TextBox ID="txtEditEmail" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:Label ID="Label19" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </div>
                        <asp:RequiredFieldValidator ID="valEditEmail" ControlToValidate="txtEditEmail" runat="server" Display="Dynamic" ForeColor="Red" Text="Email Wajib Diisi" SetFocusOnError="true" ValidationGroup="valEdit">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valEditEmailRegex" ValidationExpression="^[A-Za-z0-9+-_.]+@[A-Za-z0-9+-_.]+[.][A-Za-z]+$" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtEditEmail" ErrorMessage="Format Email salah" SetFocusOnError="true" ValidationGroup="valEdit">
                        </asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblEditNoHp" runat="server" Text="No Hp"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:TextBox ID="txtEditNoHp" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:Label ID="Label21" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </div>
                        <asp:RequiredFieldValidator ID="valEditNoHp" ControlToValidate="txtEditNoHp" runat="server" Display="Dynamic" ForeColor="Red" Text="NoHp Wajib Diisi" SetFocusOnError="true" ValidationGroup="valEdit">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valEditNoHpRegex" ValidationExpression="^(?:[+]|[0-9])[0-9]+$" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtEditNoHp" ErrorMessage="Format NoHp salah" SetFocusOnError="true" ValidationGroup="valEdit">
                        </asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblEditAlamat" runat="server" Text="Alamat"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:TextBox ID="txtEditAlamat" CssClass="form-control" Columns="50" Rows="5" TextMode="MultiLine" runat="server"></asp:TextBox>
                            <asp:Label ID="Label23" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </div>
                        <asp:RequiredFieldValidator ID="valEditAlamat" ControlToValidate="txtEditAlamat" runat="server" Display="Dynamic" ForeColor="Red" Text="Alamat Wajib Diisi" SetFocusOnError="true" ValidationGroup="valEdit">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblEditAngkatan" runat="server" Text="Angkatan"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:TextBox ID="txtEditAngkatan" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:Label ID="Label25" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </div>
                        <asp:RequiredFieldValidator ID="valEditAngkatan" ControlToValidate="txtEditAngkatan" runat="server" Display="Dynamic" ForeColor="Red" Text="Angkatan Wajib Diisi" SetFocusOnError="true" ValidationGroup="valEdit">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valEditAngkatanRegex" ValidationExpression="^[0-9]+$" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtEditAngkatan" ErrorMessage="Format Angkatan salah" SetFocusOnError="true" ValidationGroup="valEdit">
                        </asp:RegularExpressionValidator>
                    </div>

                    <asp:Button ID="btnSubmitEdit" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSubmitEdit_Click" ValidationGroup="valAdd" />
                    <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" CssClass="btn" OnClick="btnCancelAdd_Click" />
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-xl-12 -->
    </div>
    <% #endregion %>
</asp:Content>
