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
        <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script>
       <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script>
     <script>
          var OneSignal = window.OneSignal || [];
          OneSignal.push(function() {
            OneSignal.init({
              appId: "09e16407-d5dc-41f9-a631-4318034eb85d",
            });
          });
    </script>
    </head>

    
    <body id="page-top">
        <!-- Loader icon -->
        <div class="se-pre-con"></div> 

        <!-- Header section-->
        <?php @$this->load->view('website/includes/header') ?>

        <!-- Slider section-->
        <?php @$this->load->view('website/includes/slider') ?>

        <!-- About section -->
        <?php @$this->load->view('website/includes/about') ?>
 
        <!-- Service Section -->
        <?php @$this->load->view('website/includes/service') ?>

        <!-- Appointment Section / Choose Us Section -->
        <?php @$this->load->view('website/includes/appointment') ?>

        <!-- Doctor Section -->
        <?php @$this->load->view('website/includes/doctor') ?>

        <!-- Department Section -->
        <?php @$this->load->view('website/includes/department') ?>
    
        <!-- Blog Section -->
        <?php @$this->load->view('website/includes/blog') ?>

        <!-- Footer Section -->
        <?php @$this->load->view('website/includes/footer') ?>



        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="<?= base_url('assets_web/js/jquery.min.js" type="text/javascript') ?>"></script>
        
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

         </script>
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