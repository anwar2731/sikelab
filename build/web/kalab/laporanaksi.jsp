<%-- 
    Document   : aksilaporan
    Created on : Feb 7, 2022, 3:53:21 PM
    Author     : Mario Dimas
--%>

<%@page import="java.sql.*"%>
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
    String idPem=request.getParameter("id_pembelian");
    if(idPem !=null){
      Pembelian = PembelianModel.getBeliById(idPem);
    }
//    Pembelian[] daftarPembelian = PembelianModel.getDaftarPembelian();
%>

<%--
//    String idPenga=request.getParameter("id_pengajuan");
    String idPenga= Pembelian.getId_Pengajuan();
//    if(idPenga !=null){
//      Pengajuan = PengajuanModel.getPengajuanById(idPenga);
//    }
//    Pengajuan[] daftarPengajuan = PengajuanModel.getDaftarPengajuan();
    
--%>  

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
                                    <a href="../kalab/index.jsp">
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
                                    <a href="../kalab/laporan.jsp">
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
                                 <%
                                    try {
                                        String host = "jdbc:mysql://localhost:3306/sikelab";
                                        Connection con = null;
                                        Statement stmt = null;
                                        ResultSet rs = null;
                                        Class.forName("com.mysql.jdbc.Driver");
                                        con = DriverManager.getConnection(host, "root", "");
                                        stmt = con.createStatement();
                                        String data = "SELECT * FROM pengajuan JOIN pembelian USING (id_pengajuan) WHERE id_pembelian = " + idPem;
                                        rs = stmt.executeQuery(data);
                                        while (rs.next()){
                                %>
                            <div class="main-card mb-3 card">
                                <form action = "../UpStatusL" method = "post">
                                    <div class="card-body"><h5 class="card-title">Konfirmasi Laporan</h5>
                                            <div class="form-row">
                                                 <input type="hidden" class="form-control" name="id_pembelian" value = <%=Pembelian.getId_Pembelian()%>>
                                                <div class="col-md-6">
                                                    <div class="position-relative form-group"><label for="exampleEmail11" class="">AIL</label><input name="id_ail" id="exampleEmail11" value="<%=rs.getString("id_ail")%>" class="form-control" readonly></div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="position-relative form-group"><label for="examplePassword11" class="">Nama Barang</label><input name="namaB" id="examplePassword11" value="<%=rs.getString("nama_barang")%>"
                                                                                                                                               class="form-control" readonly></div>
                                                </div>
                                            </div>
                                          <div class="form-row">
                                                <div class="col-md-6">
                                                    <div class="position-relative form-group"><label for="exampleEmail11" class="">Jumlah</label><input name="jlh" id="jlh" value="<%=rs.getString("jumlah")%>" class="form-control" readonly></div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="position-relative form-group"><label for="examplePassword11" class="">Total Harga</label><input name="tot" id="tot" value="<%=rs.getString("total_harga")%>"
                                                                                                                                                           class="form-control" readonly=""></div>
                                                </div>
                                          
                                            </div>
                                            <div class="form-row">
                                               
                                                <div class="col-md-4">
                                                    <div class="position-relative form-group"><label for="exampleState" class="">Tanggal Pengajuan</label><input name="tanggal_pembelian" id="tanggal_pembelian" value="<%=rs.getString("tanggal_pengajuan")%>" class="form-control" readonly=""></div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="position-relative form-group"><label for="exampleZip" class="">Lab</label><input name="zip" id="exampleZip" value="<%=rs.getString("id_lab")%>" class="form-control" readonly=""></div>
                                                </div>
                                                 <div class="col-md-4">
                                                    <div class="position-relative form-group"><label for="exampleCity" class="">Status</label>
                                                        <select name="status" id="exampleCity" class="form-control">
                                                                <option value="">--- Status ---</option>
                                                                <option value="Acc">Acc</option>
                                                                <option value="Ditolak">Ditolak</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                         
                                                
                                           
                                            <button type ="submit" class="mt-2 btn btn-primary">Konfirmasi</button>
                                            </form>
                                        </form>
                                    </div>
                                        <%
                                            }
                                            rs.close();
                                            stmt.close();
                                            con.close();
                                            } catch (Exception e){
                                                out.println("Can't connect to database, with error = " + e.getMessage());
                                            }
                                        %>
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