<?php  
defined('BASEPATH') OR exit('No direct script access allowed'); 
//get site_align setting
$settings = $this->db->select("site_align")
    ->get('setting')
    ->row();
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title><?= display('dashboard') ?> - <?php echo (!empty($title)?$title:null) ?></title>

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="<?= base_url($this->session->userdata('favicon')) ?>">

        <!-- jquery ui css -->
        <link href="<?php echo base_url('assets/css/jquery-ui.min.css') ?>" rel="stylesheet" type="text/css"/>

        <!-- Bootstrap --> 
        <link href="<?php echo base_url(); ?>assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <?php if (!empty($settings->site_align) && $settings->site_align == "RTL") {  ?>
            <!-- THEME RTL -->
            <link href="<?php echo base_url(); ?>assets/css/bootstrap-rtl.min.css" rel="stylesheet" type="text/css"/>
            <link href="<?php echo base_url('assets/css/custom-rtl.css') ?>" rel="stylesheet" type="text/css"/>
        <?php } ?>



        <!-- Font Awesome 4.7.0 -->
        <link href="<?php echo base_url('assets/css/font-awesome.min.css') ?>" rel="stylesheet" type="text/css"/>

        <!-- semantic css -->
        <link href="<?php echo base_url(); ?>assets/css/semantic.min.css" rel="stylesheet" type="text/css"/> 
        <!-- sliderAccess css -->
        <link href="<?php echo base_url(); ?>assets/css/jquery-ui-timepicker-addon.min.css" rel="stylesheet" type="text/css"/> 
        <!-- slider  -->
        <link href="<?php echo base_url(); ?>assets/css/select2.min.css" rel="stylesheet" type="text/css"/> 
        <!-- DataTables CSS -->
        <link href="<?= base_url('assets/datatables/css/dataTables.min.css') ?>" rel="stylesheet" type="text/css"/> 
  

        <!-- pe-icon-7-stroke -->
        <link href="<?php echo base_url('assets/css/pe-icon-7-stroke.css') ?>" rel="stylesheet" type="text/css"/> 
        <!-- themify icon css -->
        <link href="<?php echo base_url('assets/css/themify-icons.css') ?>" rel="stylesheet" type="text/css"/> 
        <!-- Pace css -->
        <link href="<?php echo base_url('assets/css/flash.css') ?>" rel="stylesheet" type="text/css"/>

        <!-- Theme style -->
        <link href="<?php echo base_url('assets/css/custom.css') ?>" rel="stylesheet" type="text/css"/>
        <?php if (!empty($settings->site_align) && $settings->site_align == "RTL") {  ?>
            <!-- THEME RTL -->
            <link href="<?php echo base_url('assets/css/custom-rtl.css') ?>" rel="stylesheet" type="text/css"/>
        <?php } ?>


        <!-- jQuery  -->
        <script src="<?php echo base_url('assets/js/jquery.min.js') ?>" type="text/javascript"></script>
    </head>

    <body class="hold-transition sidebar-mini">
        <div class="se-pre-con"></div>

        <!-- Site wrapper -->
        <div class="wrapper">
            <header class="main-header"> 
                <?php $logo = $this->session->userdata('logo'); ?>
                <a href="<?php echo base_url('dashboard_midwife/home') ?>" class="logo"> <!-- Logo -->
                    <span class="logo-mini">
                        <img src="<?php echo (!empty($logo)?base_url($logo):base_url("assets/images/logo.png")) ?>" alt="">
                    </span>
                    <span class="logo-lg">
                        <img src="<?php echo (!empty($logo)?base_url($logo):base_url("assets/images/logo.png")) ?>" alt="">
                    </span>
                </a>

                <!-- Header Navbar -->
                <nav class="navbar navbar-static-top">
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"> <!-- Sidebar toggle button-->
                        <span class="sr-only">Toggle navigation</span>
                        <span class="pe-7s-keypad"></span>
                    </a>
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- settings -->
                            <li class="dropdown dropdown-user">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="pe-7s-settings"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="<?php echo base_url('dashboard_midwife/home/profile'); ?>"><i class="pe-7s-users"></i> <?php echo display('profile') ?></a></li>
                                    <li><a href="<?php echo base_url('dashboard_midwife/home/form'); ?>"><i class="pe-7s-settings"></i> <?php echo display('edit_profile') ?></a></li>
                                    <li><a href="<?php echo base_url('dashboard_midwife/home/logout') ?>"><i class="pe-7s-key"></i> <?php echo display('logout') ?></a></li>
                                </ul>
                            </li>

                            <?php 
                                
                                if($this->session->userdata('user_role') == 1 or $this->session->userdata('user_role') == 2 or $this->session->userdata('user_role') == 5 || $this->session->userdata('user_role') == 11 ){ ?>
                                    <i class="num" style="font-size: 15px;color: #21ba45;position: absolute;top: 10px;z-index: 1;right: 33px;"><?php echo isset($count) ? $count : '' ;  ?></i>
                                    <li><a href="<?php echo base_url('Emergency_alert'); ?>"><i class="pe-7s-bell"></i></a></li>
                             <?php       
                               }
                            ?>
                        </ul>
                    </div>
                </nav>
            </header>

            <!-- =============================================== -->
            <!-- Left side column. contains the sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel text-center">
                        <?php $picture = $this->session->userdata('picture'); ?>
                        <div class="image">
                            <img src="<?php echo (!empty($picture)?base_url($picture):base_url("assets/images/no-img.png")) ?>" class="img-circle" alt="User Image">
                        </div>
                        <div class="info">
                            <p><?php echo $this->session->userdata('fullname') ?></p>
                            <a href="#"><i class="fa fa-circle text-success"></i>
                            <?php   
                                $userRoles = array( 
                                    '1' => display('admin'),
                                    '2' => display('doctor'),
                                    '3' => display('accountant'),
                                    '4' => display('laboratorist'),
                                    '5' => display('nurse'),
                                    '6' => display('pharmacist'),
                                    '7' => display('receptionist'),
                                    '8' => display('representative') ,
                                    '11' => display('midwife') 
                                ); 
                                echo $userRoles[$this->session->userdata('user_role')];
                            ?></a>
                        </div>
                    </div> 

                    <!-- sidebar menu -->
                    <ul class="sidebar-menu"> 
                        <li class="<?php echo (($this->uri->segment(2) == 'home') ? "active" : null) ?>">
                            <a href="<?php echo base_url('dashboard_midwife/home') ?>"><i class="fa ti-home"></i> <?php echo display('dashboard') ?></a>
                        </li> 

                        <li class="treeview <?php echo (($this->uri->segment(2) == "patient") ? "active" : null) ?>">
                            <a href="#">
                                <i class="fa fa-wheelchair"></i><span><?php echo display('patient') ?></span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="<?php echo base_url("dashboard_midwife/patient/patient/create") ?>"><?php echo display('add_patient') ?></a></li>
                                <li><a href="<?php echo base_url("dashboard_midwife/patient/patient") ?>"><?php echo display('patient_list') ?></a></li> 

                                <li><a href="<?php echo base_url("dashboard_midwife/patient/patient/document_form") ?>"><?php echo display('add_document') ?></a></li> 
                                <li><a href="<?php echo base_url("dashboard_midwife/patient/patient/document") ?>"><?php echo display('document_list') ?></a></li> 
                            </ul>
                        </li>

                        <li class="treeview <?php echo (($this->uri->segment(2) == "schedule") ? "active" : null) ?>">
                            <a href="#">
                                <i class="fa ti-calendar"></i><span><?php echo display('schedule') ?></span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="<?php echo base_url("dashboard_midwife/schedule/schedule/create") ?>"><?php echo display('add_schedule') ?></a></li>
                                <li><a href="<?php echo base_url("dashboard_midwife/schedule/schedule") ?>"><?php echo display('schedule_list') ?></a></li> 
                            </ul>
                        </li>

                        <li class="treeview <?php echo (($this->uri->segment(2) == "appointment" || $this->uri->segment(2) == "report") ? "active" : null) ?>">
                            <a href="#">
                                <i class="fa ti-pencil-alt"></i><span><?php echo display('appointment') ?></span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            
                            <ul class="treeview-menu">
                                <li><a href="<?php echo base_url("dashboard_midwife/appointment/appointment/create") ?>"><?php echo display('add_appointment') ?></a></li>
                                <li><a href="<?php echo base_url("dashboard_midwife/appointment/appointment") ?>"><?php echo display('appointment_list') ?></a></li> 
                                <li><a href="<?php echo base_url("dashboard_midwife/appointment/report/assign_to_me") ?>"> <?php echo display('assign_to_me') ?></a></li> 
                                <li><a href="<?php echo base_url("dashboard_midwife/appointment/report/assign_by_me") ?>"> <?php echo display('assign_by_me') ?> </a></li>
                            </ul>
                        </li>

                        <li class="treeview <?php echo (($this->uri->segment(2) == "prescription") ? "active" : null) ?>">
                            <a href="#">
                                <i class="fa ti-book"></i><span><?php echo display('prescription') ?></span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu"> 
                                <li><a href="<?php echo base_url("dashboard_midwife/prescription/case_study/create") ?>"><?php echo display('add_patient_case_study') ?></a></li>
                                <li><a href="<?php echo base_url("dashboard_midwife/prescription/case_study") ?>"><?php echo display('patient_case_study_list') ?></a></li> 
                                <li><a href="<?php echo base_url("dashboard_midwife/prescription/prescription/create") ?>"><?php echo display('add_prescription') ?></a></li>
                                <li><a href="<?php echo base_url("dashboard_midwife/prescription/prescription") ?>"><?php echo display('prescription_list') ?></a></li> 
                            </ul>
                        </li>
  
                        <li class="<?php echo (($this->uri->segment(2) == 'noticeboard') ? "active" : null) ?>">
                            <a href="<?php echo base_url('dashboard_midwife/noticeboard/notice') ?>"><i class="fa fa-bell"></i> <?php echo display('noticeboard') ?></a>
                        </li>  
   
                        <li class="treeview <?php echo (($this->uri->segment(2) == "bed_manager") ? "active" : null) ?>">
                            <a href="#">
                                <i class="fa fa-bed"></i> <span><?php echo display('bed_manager') ?> </span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="<?php echo base_url("dashboard_midwife/bed_manager/bed") ?>"><?php echo display('bed_list') ?></a></li> 
                                <li><a href="<?php echo base_url("dashboard_midwife/bed_manager/bed_assign") ?>"><?php echo display('bed_assign_list') ?></a></li> 
                                <li><a href="<?php echo base_url("dashboard_midwife/bed_manager/report") ?>"><?php echo display('report') ?></a></li> 
                            </ul>
                        </li>


                        <li class="treeview <?php echo (($this->uri->segment(2) == "messages") ? "active" : null) ?>">
                            <a href="#">
                                <i class="fa fa-comments-o"></i><span><?php echo display('messages') ?></span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a> 
                            <ul class="treeview-menu">
                                <li><a href="<?php echo base_url("dashboard_midwife/messages/message/new_message") ?>"> <?php echo display('new_message') ?> </a></li> 
                                <li><a href="<?php echo base_url("dashboard_midwife/messages/message") ?>"> <?php echo display('inbox') ?> </a></li> 
                                <li><a href="<?php echo base_url("dashboard_midwife/messages/message/sent") ?>"><?php echo display('sent') ?> </a></li>
                            </ul>
                        </li>


                        <li class="<?php echo (($this->uri->segment(2) == 'mail') ? "active" : null) ?>">
                            <a href="<?php echo base_url('dashboard_midwife/mail/email') ?>"><i class="fa ti-email"></i> <?php echo display('send_mail') ?></a>
                        </li>  



                        <li class="treeview <?php echo (($this->uri->segment(2) == "sms") ? "active" : null) ?>">
                            <a href="#">
                                <i class="fa ti-comment-alt"></i><span><?php echo display('send_sms') ?></span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a> 
                            <ul class="treeview-menu">
                                <li><a href="<?php echo base_url("dashboard_midwife/sms/sms/new_sms") ?>"> <?php echo display('new_sms') ?> </a></li> 
                                <li><a href="<?php echo base_url("dashboard_midwife/sms/sms/sms_list") ?>"> <?php echo display('sms_list') ?> </a></li> 
                            </ul>
                        </li> 



     
                    </ul>
                </div> <!-- /.sidebar -->
            </aside>

            <!-- =============================================== -->
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><i class="pe-7s-world"></i></div>
                        <div class="header-title">
                            <h1><?php echo ucwords(str_replace('_', ' ', $this->uri->segment(1))) ?></h1>
                            <small><?php echo (!empty($title)?$title:null) ?></small> 
                        </div>
                    </div>
                </section>
                <!-- Main content -->
                <div class="content"> 

                    <!-- alert message -->
                    <?php if ($this->session->flashdata('message') != null) {  ?>
                    <div class="alert alert-info alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <?php echo $this->session->flashdata('message'); ?>
                    </div> 
                    <?php } ?>
                    
                    <?php if ($this->session->flashdata('exception') != null) {  ?>
                    <div class="alert alert-danger alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <?php echo $this->session->flashdata('exception'); ?>
                    </div>
                    <?php } ?>
                    
                    <?php if (validation_errors()) {  ?>
                    <div class="alert alert-danger alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <?php echo validation_errors(); ?>
                    </div>
                    <?php } ?>
                   


                    <!-- content -->
                    <?php echo (!empty($content)?$content:null) ?>

                </div> <!-- /.content -->
            </div> <!-- /.content-wrapper -->

            <footer class="main-footer">
                <?= ($this->session->userdata('footer_text')!=null?$this->session->userdata('footer_text'):null) ?>
            </footer>
        </div> <!-- ./wrapper -->

        
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfV6AdqMtB6PFHYnNEH8tmiHdd19T-uGY"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/gmaps.js/0.4.25/gmaps.js"></script>
         <script type="text/javascript">
               $('#village').change(function(event){

                        GMaps.geocode({
                            address: $('#village').val(),
                            callback: function(results, status) {
                                if (status == 'OK') {
                                    var latlng = results[0].geometry.location;
                                    $("#latitude").val(latlng.lat());
                                    $("#longitude").val(latlng.lng());
                                }
                            }
                        });

                    });
               $("#otherRisky").hide();

                $( "#foetal_presentation" ).change(function() {
                   var val = $("#foetal_presentation").val();
                if(val=="Others - risky"){
                    $("#otherRisky").show();
                } else {
                    $("#otherRisky").hide();
                }
                });

         </script>

        <!-- jquery-ui js -->
        <script src="<?php echo base_url('assets/js/jquery-ui.min.js') ?>" type="text/javascript"></script> 
        <!-- bootstrap js -->
        <script src="<?php echo base_url('assets/js/bootstrap.min.js') ?>" type="text/javascript"></script>  
        <!-- pace js -->
        <script src="<?php echo base_url('assets/js/pace.min.js') ?>" type="text/javascript"></script>  
        <!-- SlimScroll -->
        <script src="<?php echo base_url('assets/js/jquery.slimscroll.min.js') ?>" type="text/javascript"></script>  

        <!-- bootstrap timepicker -->
        <script src="<?php echo base_url() ?>assets/js/jquery-ui-sliderAccess.js" type="text/javascript"></script> 
        <script src="<?php echo base_url() ?>assets/js/jquery-ui-timepicker-addon.min.js" type="text/javascript"></script> 
        <!-- select2 js -->
        <script src="<?php echo base_url() ?>assets/js/select2.min.js" type="text/javascript"></script>

        <script src="<?php echo base_url('assets/js/sparkline.min.js') ?>" type="text/javascript"></script> 
        <!-- Counter js -->
        <script src="<?php echo base_url('assets/js/waypoints.js') ?>" type="text/javascript"></script>
        <script src="<?php echo base_url('assets/js/jquery.counterup.min.js') ?>" type="text/javascript"></script> 
        <!-- semantic js -->
        <script src="<?php echo base_url() ?>assets/js/semantic.min.js" type="text/javascript"></script>
        <!-- DataTables JavaScript -->
        <script src="<?php echo base_url("assets/datatables/js/dataTables.min.js") ?>"></script>
        <!-- tinymce texteditor -->
        <script src="<?php echo base_url() ?>assets/tinymce/tinymce.min.js" type="text/javascript"></script> 

        <!-- Admin Script -->
        <script src="<?php echo base_url('assets/js/frame.js') ?>" type="text/javascript"></script> 

        <!-- Custom Theme JavaScript -->
        <script src="<?php echo base_url() ?>assets/js/custom.js" type="text/javascript"></script>
    </body>
</html>