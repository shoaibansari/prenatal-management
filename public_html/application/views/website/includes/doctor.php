<section id="doctor" class="doctor-inner">
    <div class="container">
        <div class="row">
            <!-- Main Title -->
            <div class="col-md-6 col-md-offset-3">
                <div class="title-block">
                    <h3><?= (!empty($section['doctor']['title'])?$section['doctor']['title']:null) ?></h3>
                    <p><?= (!empty($section['doctor']['description'])?$section['doctor']['description']:null) ?></p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="owl_wrapper">
                <div id="owl-doctor" class="owl-carousel">
                    <?php if (!empty($doctors)): ?>
                        <?php foreach ($doctors as $doctor): ?>
                            <div class="item">
                                <div class="single-item">
                                    <div class="doctor-img">
                                        <a class="primary-img" href="#"><img src="<?= (!empty($doctor->picture)?base_url($doctor->picture):base_url('assets_web/images/icons/no-img.png')) ?>" class="img-responsive" alt=""></a>
                                    </div>
                                    <div class="doctor-name">
                                        <h4><?= $doctor->firstname ?> <?= $doctor->lastname ?></h4>
                                        <h5><?= $doctor->department ?></h5>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    <?php endif; ?> 
                </div>
            </div>
        </div>
    </div>
</section>