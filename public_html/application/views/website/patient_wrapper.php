<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keyword" content="<?= (!empty($setting->meta_keyword)?$setting->meta_keyword:null) ?>" />
        <meta name="description" content="<?= (!empty($setting->meta_tag)?$setting->meta_tag:null) ?>" />
        <!-- Favicon -->
        <link rel="shortcut icon" href="<?= (!empty($setting->favicon)?base_url($setting->favicon):base_url('assets_web/images/icons/favicon.png')) ?>"/>
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title><?= (!empty($setting->title)?$setting->title:null) ?></title>

        <link href="https://fonts.googleapis.com/css?family=Work+Sans:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="<?= base_url('assets_web/css/bootstrap.min.css') ?>" rel="stylesheet">
        <!-- Jquery Ui -->
        <link href="<?= base_url('assets_web/css/jquery-ui.min.css') ?>" rel="stylesheet" type="text/css"/>
        <!-- Font Awesome -->
        <link href="<?= base_url('assets_web/font-awesome/css/font-awesome.min.css') ?>" rel="stylesheet" type="text/css"/>
        <!-- Flaticon -->
        <link href="<?= base_url('assets_web/css/flaticon.css') ?>" rel="stylesheet" type="text/css"/>
        <!-- Owl Carousel -->
        <link href="<?= base_url('assets_web/owl-carousel/owl.carousel.css') ?>" rel="stylesheet" type="text/css"/>
        <link href="<?= base_url('assets_web/owl-carousel/owl.theme.css') ?>" rel="stylesheet" type="text/css"/>
        <link href="<?= base_url('assets_web/owl-carousel/owl.transitions.css') ?>" rel="stylesheet" type="text/css"/>
        <!-- Custom Style Sheet -->
        <link href="<?= base_url('assets_web/css/style.css') ?>" rel="stylesheet" type="text/css"/>
    </head>

    
    <body id="page-top">
        <!-- Loader icon -->
        <!-- <div class="se-pre-con"></div>  -->
        <a name="top"></a>

        <!-- Header section-->
        <?php @$this->load->view('website/includes/header2') ?>

        <section id="about">
            <div class="container"> 
                <div class="row">

                    <div class="col-sm-12" id="PrintMe">
                        <div  class="panel panel-info"> 

                            <div class="panel-body">  
                                <div class="row">
                                    <div class="col-sm-12" align="center">  
                                        <h1><?php echo display('patient_information') ?></h1>
                                    <br>
                                    </div>

                                    <div class="col-sm-3" align="center"> 
                                        <img alt="Picture" src="<?php echo (!empty($profile->picture)?base_url($profile->picture):base_url("assets/images/no-img.png")) ?>" class="img-thumbnail img-responsive">
                                        <h3><?php echo "$profile->firstname $profile->lastname " ?></h3>
                                    </div> 

                                    <div class="col-sm-9"> 
                                        <dl class="dl-horizontal">
                                            <dt><?php echo display('patient_id') ?></dt><dd><?php echo $profile->patient_id ?></dd>

                                            <dt><?php echo display('date_of_birth') ?></dt><dd><?php echo date('d M Y',strtotime($profile->date_of_birth)) ?></dd> 
                                            <dt><?php echo display('age') ?></dt><dd><?php echo date_diff(date_create($profile->date_of_birth), date_create('now'))->y; ?> <?php echo display('year') ?></dd> 
                                            <dt><?php echo display('sex') ?></dt><dd><?php echo $profile->sex ?></dd> 
                                            <dt><?php echo display('phone') ?></dt><dd><?php echo $profile->phone ?></dd> 
                                            <dt><?php echo display('create_date') ?></dt><dd><?php echo $profile->create_date ?></dd> 
                                        </dl>
                                        <hr>
                                            <div class="col-sm-12" align="center">  
                                                <h4>Patient Detail</h4>
                                            </div>
                                         <dl class="dl-horizontal">
                                            <dt>Name of village</dt><dd><?php echo $profile_detail->name_of_village ?></dd>
                                            <dt>Quarter</dt><dd><?php echo $profile_detail->quarter ?></dd>
                                            <dt>Income Per Month</dt><dd><?php echo $profile_detail->income ?></dd>
                                            <dt>Education level</dt><dd><?php echo $profile_detail->education ?></dd>
                                            <dt>Employment Status</dt><dd><?php echo $profile_detail->employment_status ?></dd>
                                            <dt>Occupation</dt><dd><?php echo $profile_detail->occupation ?></dd>
                                            <dt>Marital Status</dt><dd><?php echo $profile_detail->marital_status ?></dd>
                                            <dt>Language</dt><dd><?php echo $profile_detail->language ?></dd>
                                             <dt>Religion</dt><dd><?php echo $profile_detail->religion ?></dd>
                                             <dt>Place of residence</dt><dd><?php echo $profile_detail->residence ?></dd>
                                             <dt>Antenatal visits</dt><dd><?php echo $profile_detail->antenatal_visits ?></dd>
                                             <dt style="text-overflow: clip;">Place of antenatal visit</dt><dd><?php echo $profile_detail->place_visits ?></dd>

                                             <dt>Delivery</dt><dd><?php echo $profile_detail->delivery ?></dd>
                                             <dt>Head of Household</dt><dd><?php echo $profile_detail->head_of_household ?></dd>

                                             <dt style="width: auto;margin-left: -46px;">Number of deliveries/children </dt><dd><?php echo $profile_detail->alive, '/'.$profile_detail->dead ?></dd>

                                              <dt style="width: auto;">Number of Pregnancies</dt><dd><?php echo $profile_detail->total_pregnancies ?></dd>

                                             <dt>Medical History</dt><dd><?php echo $profile_detail->medical_history ?></dd>

                                             <dt>History of Diabetes</dt><dd><?php echo $profile_detail->history_of_diabetes ?></dd>

                                             <dt style="width: auto;margin-left: -5px;">History of Hypertension</dt><dd><?php echo $profile_detail->history_of_hypertension ?></dd>

                                             <dt>Examination</dt><dd><?php echo $profile_detail->examination ?></dd>

                                              <dt>Echography</dt><dd><?php echo $profile_detail->echography ?></dd>

                                              <dt>Foetal movements</dt><dd><?php echo $profile_detail->foetal_movements ?></dd>

                                              <dt>Feotal Presentation</dt><dd><?php echo (isset($profile_detail->foetal_presentation) && $profile_detail->foetal_presentation == 'Others - risky') ? $profile_detail->foetal_presentation .' '. $profile_detail->foetal_presentation_detail : $profile_detail->foetal_presentation  ?></dd>


                                              <dt>Drug History</dt><dd><?php echo $profile_detail->drug_history ?></dd>

                                              <dt>Antenatal History</dt><dd><?php echo $profile_detail->antenatal_history ?></dd>

                                               <dt>HIV/screening/test</dt><dd><?php echo $profile_detail->hiv_screening_test ?></dd>

                                               <dt style="width: auto;margin-left: -10px;">On ARV (Anti Retrovirial)</dt><dd><?php echo $profile_detail->on_arv_anti_retrovirial ?></dd>

                                               <dt>Malaria/screening/test</dt><dd><?php echo $profile_detail->malaria_screening_test ?></dd>

                                                <dt style="width: auto;margin-left: -22px;">Hepatitis B/screening/test</dt><dd><?php echo $profile_detail->hepatitis_b_screening_test ?></dd>

                                                <dt>Physical Exams</dt><dd><?php echo $profile_detail->physical_exams ?></dd>

                                                <dt>Treatments</dt><dd><?php echo $profile_detail->treatments ?></dd>

                                                <dt style="width: auto;margin-left: -30px;">PIH and Anaemia Screening</dt><dd><?php echo $profile_detail->pih_anaemia_screening ?></dd>

                                                <dt>Advise/Counsel</dt><dd><?php echo $profile_detail->advise_counsel ?></dd>

                                                <dt>Preventive Measures</dt><dd><?php echo $profile_detail->preventive_measures ?></dd>

                                                <dt style="width: auto;margin-left: -106px;">Adherence to Treatment (HIV, malaria)</dt><dd><?php echo $profile_detail->adherence_to_treatment ?></dd>

                                                <dt style="width: auto;margin-left: -24px;">Bleeding during Pregnancy</dt><dd><?php echo $profile_detail->bleeding_during_pregnancy ?></dd>

                                                <dt>Vaccination Status</dt><dd><?php echo $profile_detail->vaccination_status ?></dd>

                                         </dl> 
                                    </div>
                                </div>  

                            </div> 

                            <div class="panel-footer">
                                <div class="text-center">
                                    <strong><?= (!empty($setting->title)?$setting->title:null) ?></strong>
                                    <p class="text-center no-print"><?= (!empty($setting->copyright_text)?$setting->copyright_text:null) ?></p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12">
                         <div class="btn-group">
                            <button type="button" onclick="printContent('PrintMe')" class="btn btn-success" ><?php echo display('print') ?></button> 
                            <a href="<?php echo base_url() ?>" class="btn btn-warning" >Back to Home</a> 
                        </div>
                    </div>


                </div>
            </div>
        </section>
 
        <!-- Footer Section -->
        <?php @$this->load->view('website/includes/footer') ?>

        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="<?= base_url('assets_web/js/jquery.min.js" type="text/javascript') ?>"></script>
        <!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVtjo9eO4klWhYbHwL9jObfuke4rxSWWc"></script> -->
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="<?= base_url('assets_web/js/bootstrap.min.js') ?>"></script> 
        <!-- owl carousel js -->
        <script src="<?= base_url('assets_web/owl-carousel/owl.carousel.min.js') ?>" type="text/javascript"></script>
        <!-- Plugin JavaScript -->
        <script src="<?= base_url('assets_web/js/jquery.easing.min.js') ?>" type="text/javascript"></script>
        <!-- Jquery Ui -->
        <script src="<?= base_url('assets_web/js/jquery-ui.min.js') ?>" type="text/javascript"></script>
        <!-- Custom Js -->
        <script src="<?= base_url('assets_web/js/custom.js') ?>" type="text/javascript"></script>

       
    </body>
</html>

 