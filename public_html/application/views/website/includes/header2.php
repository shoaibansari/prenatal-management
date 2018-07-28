<header>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="info-outer hidden-xs">
                    <div class="info-box">
                        <?php if (!empty($setting->email)): ?>
                        <div class="icon"><span class="flaticon-mail"></span></div>
                        <a href="mailto:<?= $setting->email ?>"><?= $setting->email ?></a>
                        <?php endif; ?>
                    </div>
                    <div class="info-box">
                        <?php if (!empty($setting->phone)): ?>
                            <div class="icon"><span class="flaticon-customer-service"></span></div>
                            <a class="phone" href="#"><?= $setting->phone ?></a>
                        <?php endif; ?>
                    </div>
                </div>
                <!--Header Social Icon -->
                <div class="social">
                    <ul>
                        <li><a href="<?php echo base_url('login') ?>" target="_blank" class="black"><i class="fa fa-lg fa-sign-in"> </i> <?php echo display('login') ?></a> </li>

                        <?php if (!empty($setting->facebook)): ?>
                        <li><a href="<?= $setting->facebook ?>"><i class="fa fa-lg fa-facebook"></i></a></li>
                        <?php endif; ?>

                        <?php if (!empty($setting->twitter)): ?>
                        <li><a href="<?= $setting->twitter ?>"><i class="fa fa-lg fa-twitter"></i></a></li>
                        <?php endif; ?>

                        <?php if (!empty($setting->instagram)): ?>
                        <li><a href="<?= $setting->instagram ?>"><i class="fa fa-lg fa-instagram"></i></a></li> 
                        <?php endif; ?>

                        <?php if (!empty($setting->vimeo)): ?>
                        <li><a href="<?= $setting->vimeo ?>"><i class="fa fa-lg fa-vimeo-square"></i></a></li>
                        <?php endif; ?>

                        <?php if (!empty($setting->dribbble)): ?>
                        <li><a href="<?= $setting->dribbble ?>"><i class="fa fa-lg fa-dribbble"></i></a></li>
                        <?php endif; ?>
                        
                        <?php if (!empty($setting->skype)): ?>
                        <li><a href="<?= $setting->skype ?>"><i class="fa fa-lg fa-skype"></i></a></li>
                        <?php endif; ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>


<!-- Navbar section-->
<nav id="mainNav" class="navbar navbar-default  navbar-fixed">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display --> 
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> <?php echo display('menu') ?> <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand page-scroll" href="#page-top"></a>
            <a href="<?= base_url() ?>">
            <img src="<?= (!empty($setting->logo)?base_url($setting->logo):base_url('assets_web/images/icons/logo.png')) ?>" alt="">
            </a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling --> 
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="<?= base_url('#home') ?>"><?php echo display('home') ?> <span class="sr-only">(current)</span></a></li>
                <li><a href="<?= base_url('#about') ?>"><?php echo display('about') ?></a></li>
                <li><a href="<?= base_url('#service') ?>"><?php echo display('service') ?></a></li>
                <li><a href="<?= base_url('#appointment') ?>"><?php echo display('appointment') ?></a></li>
                <li><a href="<?= base_url('#doctor') ?>"><?php echo display('doctor') ?></a></li>
                <li><a href="<?= base_url('#department') ?>"><?php echo display('department') ?></a></li>
                <li><a href="<?= base_url('#blog') ?>"><?php echo display('blog') ?></a></li>
                <li><a href="<?= base_url('#contact') ?>"><?php echo display('contact') ?></a></li>
            </ul>
        </div> <!-- /.navbar-collapse --> 
    </div> <!--/.container --> 
</nav>