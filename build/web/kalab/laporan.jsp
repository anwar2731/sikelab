<%-- 
    Document   : laporan
    Created on : Feb 7, 2022, 3:23:25 PM
    Author     : Mario Dimas
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pembelian"%>
<%@page import="model.PembelianM"%>
<%@page import="model.Pengajuan"%>
<%@page import="model.PengajuanM"%>
<jsp:useBean id= "Pengajuan" class = "model.Pengajuan"/>
<jsp:useBean id= "PengajuanModel" class = "model.PengajuanM"/>
<jsp:useBean id= "Pembelian" class = "model.Pembelian"/>
<jsp:useBean id= "PembelianModel" class = "model.PembelianM"/>
<%
    if (session.getAttribute("id") == null) response.sendRedirect("../login.jsp");
    else {
        String role = session.getAttribute("role").toString();
        if (!role.equals("kalab")){
            if (role.equals("kajur")) response.sendRedirect("../kajur/dashboard.jsp");
            else if (role.equals("ail")) response.sendRedirect("../ail/dashboard.jsp");
        }
    }
%>

<%
    Pengajuan[] daftarPengajuan = PengajuanModel.getDaftarPengajuan();
%>
<%
    Pembelian[] daftarPembelian = PembelianModel.getDaftarPembelian();
%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Dashboard Kalab</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
    <meta name="description" content="This is an example dashboard created using build-in elements and components.">
    <meta name="msapplication-tap-highlight" content="no">
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
<body>
    <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
            <%@include file="../layout/headerkalab.jsp"%> 
          <div class="app-main">
                <div class="app-sidebar sidebar-shadow">
                    <div class="app-header__logo">
                        <div class="logo-src"></div>
                        <div class="header__pane ml-auto">
                            <div>
                                <a href="../layout/sidebar.html"></a>
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
                    </div>    
                    
                     <div class="scrollbar-sidebar">
                        <div class="app-sidebar__inner">
                            <ul class="vertical-nav-menu">
                                <li class="app-sidebar__heading">Dashboard</li>
                                <li>
                                    <a href="../kalab/dashboard.jsp">
                                        <i class="metismenu-icon pe-7s-rocket"></i>
                                        Dashboard
                                    </a>
                                </li>
                                <li class="app-sidebar__heading">Pengajuan</li>
                                <li>
                                    <a href="../kalab/pengajuan.jsp">
                                        <i class="metismenu-icon pe-7s-display2"></i>
                                        Kelola Data Pengajuan
                                    </a>
                                </li>
                                <li>
                                   <a href="../kalab/history.jsp">
                                        <i class="metismenu-icon pe-7s-display2"></i>
                                        Data Pembelian
                                    </a>
                                </li>
                                <li class="app-sidebar__heading">Persetujuan</li>
                                <li>
                                    <a href="../kalab/laporan.jsp" class="mm-active">
                                        <i class="metismenu-icon pe-7s-pendrive"></i>
                                        Konfirmasi Laporan
                                    </a>
                                </li>
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
                                    <div>Konfirmasi Laporan
                                        <div class="page-title-subheading">This is an example dashboard created using build-in elements and components.
                                        </div>
                                    </div>
                                </div>
                                  </div>
                        </div>            
                        <div class="row">
                           <div class="col-lg-12">
                                <div class="main-card mb-3 card">
                                    <div class="card-body"><h5 class="card-title">Laporan</h5>
                                    
                                        <table class="mb-0 table">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>AIL</th>
                                                <th>Nama Barang</th>
                                                <th>Jumlah</th>
                                                <th>Total Harga</th>
                                                <th>Status</th>
                                                <th>Bukti</th>
                                                <th>Tanggal Pembelian</th>
                                                <th>Aksi</th>
                                                
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <%
          for(int i=0;i<daftarPembelian.length;i++){ 
            Pembelian = daftarPembelian[i];
            %>
                                            <tr>
                                                <th scope="row"><%=Pembelian.getId_Pembelian()%></th>
                                                <td><%=Pembelian.getId_Ail()%></td>
                                                <td><%=Pembelian.getId_Pengajuan()%></td>
                                                <td><%=Pembelian.getJumlah()%></td>
                                                <td><%=Pembelian.getTotal_Harga()%></td>
                                                <td>
                                                  <%
                                                    if (Pembelian.getStatus().equals("Acc")) {
                                                        %>
                                                        <div class="mb-2 mr-2 badge badge-info"><%=Pembelian.getStatus()%></div>
                                                    <%} else if (Pembelian.getStatus().equals("Ditolak")) {
                                                        %>
                                                         <div class="mb-2 mr-2 badge badge-danger"><%=Pembelian.getStatus()%></div>
                                                        <%
                                                    }else{
                                                        %>
                                                        <div class="mb-2 mr-2 badge badge-warning"><%=Pembelian.getStatus()%></div>
                                                        <%
                                                        
                                                    }%>
                                                </td>
                                                <td><img  src = "../gambar/<%=Pembelian.getBukti_Pembelian()%>"  style="width:50px"/></td>
                                                <td><%=Pembelian.getTanggal_Pembelian()%></td>
                                                 <td><a href="laporanaksi.jsp?id_pembelian=<%=Pembelian.getId_Pembelian()%>"><i class="fa fa-search-plus"></i></a></td>
                                            </tr>
                                            <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                          
                        </div>
                            </div>
                        </div>
                    </div>
                   <jsp:include page ="../layout/footer.html"/>    
                </div>
                <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
        </div>
    </div>
<script type="text/javascript" src="../assets/scripts/main.js"></script></body>
</html>
