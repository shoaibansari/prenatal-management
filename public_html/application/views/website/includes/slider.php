<div id="home"> 
    <div id="owl-slider" class="owl-carousel owl-theme">

        <?php 
        if (!empty($sliders)):
            foreach ($sliders as $slider):
        ?>
        <div class="item" style="background-image: url(<?= $slider->image ?>)">
            <div class="item-text-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <h4><?= $slider->title ?></h4>
                            <h1>
                                <span><?= explode(' ',trim($slider->subtitle))[0] ?></span>
                                <?php echo substr(strstr($slider->subtitle," "), 1) ?>
                            </h1>
                            <?php if (!empty($slider->description)): ?>
                                <p><?= character_limiter(strip_tags($slider->description),500) ?></p>
                                <a href="<?= base_url("slider/$slider->id/".url_title($slider->subtitle)) ?>" class="thm-btn"><?php echo display('read_more') ?></a>
                            <?php endif; ?>
                        </div>
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