<footer id="contact">
    <div class="container">
        <div class="row"> 

            <div class="col-sm-12">
               <div class="output hide alert"></div>
            </div>

            <div class="col-sm-9">
                <div class="appointment-link">
                    <div class="ap-inner">
                        <div class="ap-icon">
                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                        </div>
                        <div class="ap-text">
                            <h3><?php echo display('need_a_doctor_for_checkup') ?></h3>
                            <h2><?php echo display('just_make_an_appointment_and_you_are_done') ?></h2>
                        </div>
                    </div>
                    <div class="ap-btn">
                        <a href="<?php echo base_url('#appointment') ?>" class="thm-btn page-scroll"><?php echo display('get_an_appointment') ?></a>
                    </div>
                </div>
            </div>

            <div class="col-sm-3"> 
                <?= form_open('enquiry/create', 'id="enquiryForm"') ?>
                  <div class="form-group">
                    <input type="name" name="name" class="form-control" placeholder="<?php echo display('full_name') ?>">
                  </div>
                  <div class="form-group">
                    <input type="email" name="email" class="form-control" placeholder="<?php echo display('email') ?>">
                  </div>
                  <div class="form-group">
                    <input type="phone" name="phone" class="form-control" placeholder="<?php echo display('phone') ?>">
                  </div>
                  <div class="form-group">
                    <textarea name="enquiry" class="form-control" placeholder="<?php echo display('enquiry') ?>"></textarea> 
                  </div> 
                  <div class="form-group"> 
                    <button type="submit" class="thm-btn page-scroll pull-right"><?php echo display('submit') ?></button>
                  </div>  
                <?= form_close(); ?>
            </div>   
        </div>
        <div class="row">
            <!-- Address -->
            <div class="col-md-3 col-sm-6">
                <div class="footer-box address-inner">
                    <img src="<?= (!empty($setting->logo)?base_url($setting->logo):base_url('assets_web/images/icons/logo.png')) ?>" alt="">
                    <p><?= (!empty($setting->description)?character_limiter($setting->description,100):null) ?></p>
                    <div class="address">
                        <?php if (!empty($setting->address)): ?>
                        <i class="flaticon-placeholder"></i>
                        <p><?= $setting->address ?></p>
                        <?php endif; ?>
                    </div>
                    <div class="address">
                        <?php if (!empty($setting->phone)): ?>
                        <i class="flaticon-customer-service"></i>
                        <p><?= $setting->phone ?></p>
                        <?php endif; ?>
                    </div>
                    <div class="address">
                        <?php if (!empty($setting->email)): ?>
                        <i class="flaticon-mail"></i>
                        <p><a href="mailto:<?= $setting->email ?>"><?= $setting->email ?></a> </p>
                        <?php endif; ?>
                    </div>
                </div>
            </div>

            <!-- Latest News -->
            <div class="col-md-3 col-sm-6">
                <div class="footer-box">
                    <h4 class="footer-title"><?php echo display('latest_news') ?></h4>
                    <div class="post-widget">
                        <ul>
                            <?php 
                            if (!empty($latest_news)):
                            foreach ($latest_news as $news):
                            ?>
                                <li>
                                    <a href="<?= base_url("details/$news->id/".url_title($news->title)) ?>"><img src="<?= (!empty($news->icon_image)?base_url($news->icon_image):base_url('assets_web/images/icons/no-img.png')) ?>"  alt="" ></a>
                                    <a href="<?= base_url("details/$news->id/".url_title($news->title)) ?>"><?= $news->title ?></a>
                                    <span class="post-date"><?= date('d, M Y',strtotime($news->date)) ?></span>
                                </li>
                            <?php
                            endforeach;
                            endif;
                            ?> 
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Latest Tweet -->
            <div class="col-md-3 col-sm-6">
                <div class="footer-box">
                    <h4 class="footer-title"><?php echo display('latest_tweet') ?></h4>
                    <div class="latest-tweet"> 
                     <?= (!empty($setting->twitter_api)?$setting->twitter_api:null) ?> 
                     </div>
                </div>
            </div>
            <!-- Map -->
            <div class="col-md-3 col-sm-6">
                <div class="map">
                    <h4 class="footer-title"><?php echo display('google_map') ?></h4> 
                    <div id="map"><?= (!empty($setting->google_map)?$setting->google_map:null) ?></div>
                </div>
            </div>
        </div>
    </div>
</footer> 

<div class="sub-footer">
    <div class="container">
        <div class="row">
            <p><?= (!empty($setting->copyright_text)?$setting->copyright_text:null) ?></p>
        </div>
    </div>
</div>