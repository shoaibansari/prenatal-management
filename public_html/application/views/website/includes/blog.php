<!-- Testimonial Section --> 
<section id="testimonial" class="testimonial-inner">
    <div class="container">
        <div class="row">
            <!-- Image -->
            <div class="col-md-5 col-sm-8 hidden-xs hidden-sm">
                <div class="costom-img">
                    <img src="<?= (!empty($section['blog']['featured_image'])?base_url($section['blog']['featured_image']):null) ?>" alt="" class="img-responsive center-block">
                </div>
            </div>

            <!-- Customer Comments -->
            <div class="col-xs-12 col-md-7 col-sm-12">
                <div class="comment-wrapper">
                    <div class="comment-title"><h1><?php echo display('customer_comments') ?></h1></div>
                    <div id="owl-testimonial" class="owl-carousel owl-theme">
                        <?php if (!empty($comments)): ?>
                            <?php foreach ($comments as $comment): ?>
                                <div class="item">
                                    <div class="article">
                                        <p><?=  $comment->comment ?></p>
                                        <div class="customers"> - <?=  $comment->name ?></div>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        <?php endif; ?> 
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
            <!-- Main Title -->
            <div class="col-md-6 col-md-offset-3">
                <div class="title-block">
                    <h3><?= (!empty($section['blog']['title'])?$section['blog']['title']:null) ?></h3>
                    <p><?= (!empty($section['blog']['description'])?$section['blog']['description']:null) ?></p>
                </div>
            </div>
        </div>
        <div class="row">
            <?php 
            if (!empty($latest_news)):
            foreach ($latest_news as $news):
            ?> 
                <div class="col-xs-12 col-md-4 col-sm-6">
                    <div class="blog-post">
                        <div class="frame">
                            <a href="<?= base_url("details/$news->id/".url_title($news->title)) ?>" class="zoom">
                                <i class="fa fa-link"></i></a>
                            <img src="<?= (!empty($news->icon_image)?base_url($news->icon_image):base_url('assets_web/images/icons/no-img.png')) ?>" class="img-responsive" alt="img">
                        </div>
                        <div class="content-box">
                            <div class="date-box">
                                <div class="inner">
                                    <div class="date"><b><?= date('d',strtotime($news->date)) ?></b> <?= date('M',strtotime($news->date)) ?></div>
                                    <div class="comment"><i class="flaticon-chat-comment-oval-speech-bubble-with-text-lines"></i> <?= $news->counter ?></div>
                                </div>
                            </div>
                            <div class="post-inner">
                                <h3><a href="<?= base_url("details/$news->id/".url_title($news->title)) ?>"><?= $news->title ?></a></h3>
                                <p><?= character_limiter(strip_tags($news->description),100) ?></p>
                                <a href="<?= base_url("details/$news->id/".url_title($news->title)) ?>" class="thm-btn"><?php echo display('read_more') ?></a>
                            </div>
                        </div>
                    </div>
                </div>  
            <?php
            endforeach;
            endif;
            ?>  
        </div>
    </div>
</section>

 