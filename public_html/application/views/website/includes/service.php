<section id="service">
    <div class="container">
        <div class="row">
            <!-- Main Title -->
            <div class="col-md-6 col-md-offset-3">
                <div class="title-block">
                    <h3><?= (!empty($section['service']['title'])?$section['service']['title']:null) ?></h3>
                    <p><?= (!empty($section['service']['description'])?$section['service']['description']:null) ?></p>
                </div>
            </div>
        </div>
        <div class="row" id="service-content">

            <?php 
            if (!empty($items['service'])):
            foreach ($items['service'] as $service):
            ?>   
                <div class="col-sm-6 col-md-4">
                    <div class="service-grid">
                        <div class="service-icon">
                            <?php if (!empty($service['icon_image'])): ?>
                                <img src="<?= $service['icon_image'] ?>" alt="" class="hvr-buzz-out"/>
                            <?php endif; ?>
                        </div>
                        <div class="service-text" >
                            <h4><?= $service['title'] ?></h4>
                            <p><?= character_limiter($service['description'],120) ?></p>
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