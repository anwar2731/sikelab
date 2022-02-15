<%-- 
    Document   : upengajuan
    Created on : Feb 1, 2022, 3:55:13 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pengajuan"%>
<%@page import="model.PengajuanM"%>

<jsp:useBean id= "Pengajuan" class = "model.Pengajuan"/>
<jsp:useBean id= "PengajuanModel" class = "model.PengajuanM"/>

<%
    if (session.getAttribute("id") == null) response.sendRedirect("../login.jsp");
    else {
        String role = session.getAttribute("role").toString();
        if (!role.equals("ail")){
            if (role.equals("kajur")) response.sendRedirect("../kajur/dashboard.jsp");
            else if (role.equals("kalab")) response.sendRedirect("../kalab/dashboard.jsp");
        }
    }
Pengajuan[] daftarPengajuan = PengajuanModel.getDaftarPengajuan();
%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Analytics Dashboard - This is an example dashboard created using build-in elements and components.</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
    <meta name="description" content="This is an example dashboard created using build-in elements and components.">
    <meta name="msapplication-tap-highlight" content="no">
    <script>
    function myFunction() {

alert("Apakah Anda Yakin Akan Melakukan Konfirmasi?");

}
function myF($pesan) {

alert('pesan');

}
</script>
    <!--
    =========================================================
    * ArchitectUI HTML Theme Dashboard - v1.0.0
    =========================================================
    * Product Page: https://dashboardpack.com
    * Copyright 2019 DashboardPack (https://dashboardpack.com)
    * Licensed under MIT (https://github.com/DashboardPack/architectui-html-theme-free/blob/master/LICENSE)
    =========================================================
    * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
    -->
<link href="../main.css" rel="stylesheet"></head>
<link href="../main.css" rel="stylesheet"></head>
<body>
    <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
        <%@include file="../layout/headerail.jsp"%>
        <div class="app-main">
                <div class="app-sidebar sidebar-shadow">
                    <div class="app-header__logo">
                        <div class="logo-src"></div>
                        <div class="header__pane ml-auto">
                            <div>
                                <button type="button" class="hamburger close-sidebar-btn hamburger--elastic" data-class="closed-sidebar">
                                    <span class="hamburger-box">
                                        <span class="hamburger-inner"></span>
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="app-header__mobile-menu">
                        <div>
                            <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
                            </button>
                        </div>
                    </div>
                    <div class="app-header__menu">
                        <span>
                            <button type="button" class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
                                <span class="btn-icon-wrapper">
                                    <i class="fa fa-ellipsis-v fa-w-6"></i>
                                </span>
                            </button>
                        </span>
                    </div>    <div class="scrollbar-sidebar">
                        <div class="app-sidebar__inner">
                            <ul class="vertical-nav-menu">
                                <li class="app-sidebar__heading">Dashboard</li>
                                <li>
                                    <a href="dashboard.jsp">
                                        <i class="metismenu-icon pe-7s-rocket"></i>
                                        Dashboard
                                    </a>
                                </li>
                                <li class="app-sidebar__heading">Pengajuan</li>
                                <li>
                                    <!-- insert link di sini -->
                                    <a href="#"> 
                                        <i class="metismenu-icon pe-7s-display2"></i>
                                        Pengajuan Pembelian
                                    </a>
                                </li>
                                <li>
                                    <a href="kelola_pengajuan.jsp" class="mm-active">
                                        <i class="metismenu-icon pe-7s-mouse"></i>
                                        Kelola Pengajuan
                                    </a>

                                </li>
                                
                                <li class="app-sidebar__heading">Persetujuan</li>
                                <li>
                                    <a href="#">
                                        <i class="metismenu-icon pe-7s-pendrive"></i>
                                        Status Persetujuan
                                    </a>
                                </li>
                                <li>
                                    <a href="unggahbeli.jsp">
                                        <i class="metismenu-icon pe-7s-eyedropper"></i>
                                        Unggah Bukti Pembelian
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>    <div class="app-main__outer">
                    <div class="app-main__inner">
                        <div class="app-page-title">
                            <div class="page-title-wrapper">
                                <div class="page-title-heading">
                                    <div class="page-title-icon">
                                        <i class="pe-7s-car icon-gradient bg-mean-fruit">
                                        </i>
                                    </div>
                                    <div>Analytics Dashboard
                                        <div class="page-title-subheading">This is an example dashboard created using build-in elements and components.
                                        </div>
                                    </div>
                                </div>
                                 </div>
                        </div>            
                        #####
                         <div class="row">
                            <div class="col-lg-12">
                                <div class="main-card mb-3 card">
                                    <div class="card-body"><h5 class="card-title">Data Pengajuan</h5>
                                        <div class="mb-2 mr-2 badge badge-info">
                                        <b>${param.message}</b></div>
                                        <table class="mb-0 table">
                                            <thead>
                                            <tr>
                                                <th>#</th>                                              
                                                <th>Barang</th>
                                                <th>Harga</th>
                                                <th>jumlah</th>
                                                <th>total harga</th>
                                                <th>Aksi</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                                              <%
                for (int i = 0; i < daftarPengajuan.length; i++) {
                    Pengajuan = daftarPengajuan[i];
            %>
                                            <tr>
                                                <th scope="row">*</th>
                                                
                                                <td><%=Pengajuan.getNama_Barang()%></td>
                                                <td><%=Pengajuan.getHarga()%></td>
                                                <td><%=Pengajuan.getJumlah()%></td>
                                                <td><%=Pengajuan.getTotal_Harga()%></td>
                                                <td><a href="update_pengajuan.jsp?id_pengajuan=<%=Pengajuan.getId_Pengajuan()%>"><i class="fa fa-pencil-alt"></i></a></td>
                                            </tr>
                                             <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                          
                        </div>
<!--                        <div class="row">
                            <div class="col-lg-12">
                                <div class="main-card mb-3 card">
                                    <div class="card-body"><h5 class="card-title"> Form Pengajuan</h5>
                                        
                                         <form class="">
                                                    <div class="position-relative form-group"><label for="id_ail" class="">Nama AIL</label><input name="id_ail" id="id_ail" placeholder="" type="text" class="form-control">value="<%=Pengajuan.getId_Ail()%>"</div>
                                                    <div class="position-relative form-group"><label for="nama_barang" class="">Nama Barang</label><input name="nama_barang" id="nama_barang" placeholder="" type="text"
                                                                                                                                                           class="form-control"></div>
                                               <div class="position-relative form-group"><label for="jumlah" class="">Jumlah Barang</label><input name="jumlah" id="jumlah" placeholder="" type="number"
                                                                                                                                                           class="form-control"></div>     
                                                    <div class="position-relative form-group"><label for="tanggal_pengajuan" class="">Tanggal Pengajuan</label><input name="tanggal_pengajuan" id="tanggal_pengajuan" placeholder="" type="text"
                                                                                                                                                           class="form-control"></div>
                                  
                                                    <div class="position-relative form-group"><label for="harga" class="">Harga Barang</label><input name="harga" id="harga" placeholder="" type="number"
                                                                                                                                                           class="form-control"></div>
                                                    <div class="position-relative form-group"><label for="total_harga" class="">Total Harga</label><input name="total_harga" id="total_harga" placeholder="" type="number"
                                                                                                                                                           class="form-control"></div>                                                                                                      
                                                    <div class="position-relative form-group"><label for="status" class="">Keterangan</label><textarea name="text" id="status" class="form-control"></textarea></div>
                                                    
                                                    <button class="mt-1 btn btn-primary">Save</button>
                                                </form>
                                        
                                        </table>
                                    </div>
                                </div>
                            </div>
                          
                        </div>-->
                        
                    </div>
                    <%@include file="../layout/footer.html"%>   </div>
                <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
        </div>
    </div>
<script type="text/javascript" src="../assets/scripts/main.js"></script></body>
</html>

