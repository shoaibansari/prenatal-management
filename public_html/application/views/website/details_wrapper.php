<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- Facebook -->
        <meta property="og:url"           content="<?= current_url() ?>" />
        <meta property="og:type"          content="website" />
        <meta property="og:title"         content="<?= (!empty($setting->title)?strip_tags($setting->title):null) ?>" />
        <meta property="og:description"   content="<?= (!empty($item->description)?character_limiter(strip_tags($item->description),140):null) ?>" />
        <meta property="og:image"         content="<?= (!empty($setting->logo)?base_url($setting->logo):base_url('assets_web/images/icons/logo.png')) ?>" />


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
        <!-- Load Facebook SDK for JavaScript -->
        <div id="fb-root"></div>
        <script>(function(d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.8";
          fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>


        <!-- Loader icon -->
        <div class="se-pre-con"></div> 

        <!-- Header section-->
        <?php @$this->load->view('website/includes/header2') ?>
 
        <!-- Slider section--> 
        <section class="blog-headding">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="header-content">
                            <div class="header-content-inner"> 
                                <div class="ui breadcrumb">
                                    <a href="index.html" class="section"><?php echo display('home') ?></a>
                                    <div class="divider"> / </div>
                                    <div class="active section"><?php echo display('blog') ?></div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Blog Section -->
        <section id="blog" class="blog-inner">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-sm-8">

                        <div class="blog-post"> 
                            <img src="<?= (!empty($item->icon_image)?base_url($item->icon_image):null) ?>" alt="" class="img-responsive"/> 
                            <div class="content-box">
                                <div class="date-box">
                                    <div class="inner">
                                        <div class="date">
                                            <b><?= date('d',strtotime($item->date)) ?></b> <?= date('M',strtotime($item->date)) ?>
                                        </div>
                                        <div class="comment">
                                            <i class="flaticon-chat-comment-oval-speech-bubble-with-text-lines"></i> <?= (!empty($item->counter)?$item->counter:0) ?>
                                        </div>
                                    </div>
                                </div>
                                <div class="post-inner">
                                    <h3><?= (!empty($item->title)?$item->title:null) ?></h3>
                                    <p><?= (!empty($item->description)?$item->description:null) ?></p>
                                </div>
                            </div>
                        </div>  


                        <div class="btn-inner">
                           <div class="btn-group">

                                <!-- facebook -->
                                <div class="btn">
                                    <div class="fb-share-button" data-href="<?= current_url() ?>" data-layout="button_count"></div>
                                </div>

                                <!-- twitter -->
                                <div class="btn">
                                    <a class="twitter-share-button"
                                      href="https://twitter.com/intent/tweet?text=<?= (!empty($setting->title)?strip_tags($setting->title):null) ?>">
                                    Tweet</a>
                                </div>

                                <!-- google+ -->
                                <div class="btn">
                                    <script src="https://apis.google.com/js/platform.js" async defer></script>
                                    <div class="g-plus" data-action="share" data-annotation="bubble" data-href="<?= current_url() ?>"></div>
                                </div>

                                <!-- pinterest -->
                                <div class="btn">
                                    <a data-pin-do="buttonPin" data-pin-count="beside" data-pin-save="true" href="https://www.pinterest.com/pin/create/button/?url=<?= current_url() ?>&media=<?= (!empty($item->icon_image)?base_url($item->icon_image):null) ?>&description=<?= (!empty($item->description)?strip_tags($item->description):null) ?>"></a>
                                    <script async defer src="//assets.pinterest.com/js/pinit.js"></script>
                                </div>

                                <!-- linkedin -->
                                <div class="btn">
                                    <script src="//platform.linkedin.com/in.js" type="text/javascript"> lang: en_US</script>
                                    <script type="IN/Share" data-counter="right"></script> 
                                </div>

                                <!-- reddit -->
                                <div class="btn">
                                    <a href="<?= current_url() ?>" onclick="window.location = '//www.reddit.com/submit?url=' + encodeURIComponent(window.location); return false"> <img src="//www.redditstatic.com/spreddit7.gif" alt="submit to reddit" border="0" /> </a>
                                </div>

                                <!-- telegram -->
                                <div class="btn">
                                    <div onclick="javascript:void(location.href='https://telegram.me/share/url?url='+encodeURIComponent(location.href))"><img src="http://telegram.wiki/_media/tips:sharewebsite:share.png" height="20" alt="telegram"></div>
                                </div>
 

                            </div> 
                        </div>
 
                        <!-- Comment -->
                        <div class="comments-container">
                            <h2>COMMENTS (<?= (!empty($comments)?sizeof($comments):0) ?>)</h2>
                            <ul id="comments-list" class="comments-list">

                                <?php
                                if(!empty($comments)):
                                    foreach ($comments as $value):
                                ?>
                                <li>
                                    <div class="comment-main-level">
                                        <!-- Avatar -->
                                        <div class="comment-avatar"><i class="fa fa-user fa-5x"></i></div>
                                        <div class="comment-box">
                                            <div class="comment-content">
                                                <div class="comment-header"> <cite class="comment-author">- <?= $value->name ?></cite>
                                                    <time class="comment-datetime">
                                                    <?= date('d F Y h.m a', strtotime($value->date)) ?> 
                                                    </time>
                                                </div>
                                                <p><?= $value->comment ?></p> 
                                            </div>
                                        </div>
                                    </div> 
                                </li> 
                                <?php
                                    endforeach;
                                endif;
                                ?>
                            </ul>
                        </div>
                    </div>



                    <div class="col-md-4 col-sm-4">
                        <div class="post-widget details-post">
                            <h4 class="blog-title"><?php echo display('recent_post') ?></h4>
                            <ul>
                            <?php 
                            if (!empty($recent_news)):
                            foreach ($recent_news as $news):
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
            </div>
        </section>



        <!-- Comment Form -->
        <section class="comment-form">
            <div class="container">
                <div class="col-sm-8">
                    
                    <div class="alert">
                    </div> 


                    <?= form_open('website/comment/create', 'id="createComment"') ?>
                        <?= form_hidden('item_id',$item->id) ?>
                        <h3><?php echo display('leave_a_comment') ?></h3>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="name" name="name" placeholder="<?php echo display('full_name') ?>">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="email" name="email" placeholder="<?php echo display('email') ?>">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" id="comment" name="comment" placeholder="<?php echo display('comments') ?>" rows="5"></textarea>
                        </div>
                        <button type="submit" class="thm-btn page-scroll"><?php echo display('submit') ?></button>
                    <?= form_close() ?>
                </div>
                <div class="col-sm-4"></div>
            </div>
        </section>

        <!-- Footer Section -->
        <?php @$this->load->view('website/includes/footer') ?>



        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="<?= base_url('assets_web/js/jquery.min.js" type="text/javascript') ?>"></script> 
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

 