<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="page_prodi.aspx.cs" Inherits="PRG4_MG4P3_0320180002_B2.page_prodi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Program Studi
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="heading" runat="server">
    Program Studi
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <% #region View Prodi %>
    <div class="row" id="ViewProdi" runat="server">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header">View Prodi</div>
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

                    <asp:GridView runat="server" ID="gridDataProdi" CssClass="table table-striped table-bordered table-hover" AllowPaging="true"
                        AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="idProdi" EmptyDataText="Tidak Ada Data" PageSize="5" PagerStyle-CssClass="pagination.ys"
                        ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridDataProdi_PageIndexChanging" OnRowCommand="gridDataProdi_RowCommand" OnSorting="gridDataProdi_Sorting">
                        <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                        <Columns>
                            <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="namaProdi" HeaderText="Nama Program Studi" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="namaProdi" />
                            <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                        ToolTip="Ubah Data Table"><i class="fa fa-edit fa-fw"></i></asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="linkShow" CommandName="LihatDetail" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                        ToolTip="Lihat Detail Prodi"><i class="fa fa-eye fa-fw"></i></asp:LinkButton>
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

    <% #region View Detail Prodi %>
    <div class="row" id="ViewDetailProdi" runat="server">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header">Detail Prodi</div>
                <!-- /.card-header -->
                <div class="card-body">
                    <asp:GridView runat="server" ID="gridDataDetailProdi" CssClass="table table-striped table-bordered table-hover" AllowPaging="true"
                        AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="NIM" EmptyDataText="Tidak Ada Data" PageSize="5" PagerStyle-CssClass="pagination.ys"
                        ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridDataDetailProdi_PageIndexChanging" OnSorting="gridDataDetailProdi_Sorting">
                        <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                        <Columns>
                            <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="NIM" HeaderText="NIM" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="NIM" />
                            <asp:BoundField DataField="NamaMahasiswa" HeaderText="Nama Mahasiswa" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" SortExpression="NamaMahasiswa" />
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

    <% #region Edit Prodi %>
    <div class="row" id="EditProdi" runat="server">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header">Add Prodi</div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="form-group">
                        <asp:Label ID="lblEditNamaProdi" runat="server" Text="Nama Prodi"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:TextBox ID="txtEditNamaProdi" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </div>
                        <asp:RequiredFieldValidator ID="valEditNamaProdi" ControlToValidate="txtEditNamaProdi" runat="server" Display="Dynamic" ForeColor="Red" Text="Nama Prodi Wajib Diisi" SetFocusOnError="true" ValidationGroup="valEdit">
                        </asp:RequiredFieldValidator>
                    </div>

                    <%-- Prodi ID label --%>
                    <asp:Label ID="lblId" runat="server" Text="" Visible="false"></asp:Label>

                    <asp:Button ID="btnSubmitEdit" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSubmitEdit_Click" ValidationGroup="valEdit" />
                    <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" CssClass="btn" OnClick="btnCancelAdd_Click" />
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-xl-12 -->
    </div>
    <% #endregion %>
    <% #region Add Prodi %>
    <div class="row" id="AddProdi" runat="server">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header">Add Prodi</div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="form-group">
                        <asp:Label ID="lblAddNamaProdi" runat="server" Text="Nama Prodi"></asp:Label>
                        <div style="display: flex; align-items: flex-start">
                            <asp:TextBox ID="txtAddNamaProdi" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </div>
                        <asp:RequiredFieldValidator ID="valAddNamaProdi" ControlToValidate="txtAddNamaProdi" runat="server" Display="Dynamic" ForeColor="Red" Text="Nama Prodi Wajib Diisi" SetFocusOnError="true" ValidationGroup="valAdd">
                        </asp:RequiredFieldValidator>
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
</asp:Content>
