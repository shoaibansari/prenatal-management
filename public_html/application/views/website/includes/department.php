<section id="department">
    <div class="container">
        <div class="row">
            <!-- Main Title -->
            <div class="col-md-6 col-md-offset-3">
                <div class="title-block">
                    <h3><?= (!empty($section['department']['title'])?$section['department']['title']:null) ?></h3>
                    <p><?= (!empty($section['department']['description'])?$section['department']['description']:null) ?></p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 bhoechie-tab-container">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 bhoechie-tab-menu">
                        <div class="list-group">
                            <?php 
                            $num = 1;
                            if (!empty($departments)):
                                foreach ($departments as $value):
                            ?>
                                <a href="#" class="list-group-item text-center <?= (($num++ == 1)?'active':null) ?>"> 
                                    <h4><?= $value->name ?></h4>
                                </a>
                            <?php
                                endforeach;
                            endif;
                            ?> 
                        </div>
                    </div>

                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 bhoechie-tab">


                        <?php 
                        $num = 1;
                        if (!empty($departments)):
                            foreach ($departments as $value):
                        ?>
                            <div class="bhoechie-tab-content  <?= (($num++ == 1)?'active':null) ?>">
                                <div class="row"> 
                                    <div class="col-sm-12">
                                        <div class="disease-des">
                                            <h2><?= $value->name ?></h2>
                                            <p><?= $value->description ?></p> 
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
            </div>
        </div>
    </div>
</section>