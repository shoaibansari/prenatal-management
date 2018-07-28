<div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary" href="<?php echo base_url("family_planning/") ?>"> <i class="fa fa-list"></i>  <?php echo display('audio_messages') ?> </a>  
                </div>
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
                    <div class="col-md-9 col-sm-12">
                        <?php echo form_open_multipart('family_planning/create','class="form-inner"') ?> 


                            <?php echo form_hidden('user_id',isset($audio_list) ? $audio_list->id : '') ?>

                            <div class="form-group row">
                                <label for="name" class="col-xs-3 col-form-label"><?php echo display('name')?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="name" type="text" class="form-control" id="name" placeholder="<?php echo display('name')?>" value="<?php echo isset($audio_list) ? $audio_list->name : ''; ?>" >
                                </div>
                            </div>

                             <div class="form-group row">
                                <label for="language" class="col-xs-3 col-form-label"><?php echo display('language') ?> </label>
                                <div class="col-xs-9">

                                    <?php echo form_dropdown('language',$language, isset($audio_list) ? $audio_list->language : '',    'class="form-control" id="department_id"') ?>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="description" class="col-xs-3 col-form-label"><?php echo display('description') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <textarea name="description" class="form-control"  placeholder="<?php echo display('description') ?>" maxlength="140" rows="7" id="address"><?php echo isset($audio_list) ? $audio_list->description : '';  ?></textarea>
                                </div>
                            </div> 
                          
                            <!-- if representative picture is already uploaded -->
                            <?php if(isset($audio_list)){
                             if(!empty($audio_list->file_name)) {  ?>
                            <div class="form-group row">
                                <label for="picturePreview" class="col-xs-3 col-form-label"></label>
                                <div class="col-xs-9">
                                    <!-- <img src="<?php echo base_url('assets/audio/'.$audio_list->file_name) ?>" alt="Audio" class="img-thumbnail" /> -->

                                    <audio controls>
                                          <source src="<?php echo base_url('assets/audio/'.$audio_list->file_name) ?>" type="audio/ogg">
                                    </audio>

                                </div>
                            </div>
                             <?php } 
                               
                            } ?>

                            <div class="form-group row">
                                <label for="picture" class="col-xs-3 col-form-label"><?php echo display('audio') ?></label>
                                <div class="col-xs-9">
                                    <input type="file" name="picture" id="picture" value="<?php echo isset($audio_list) ? $audio_list->file_name : ''; ?>">
                                    <input type="hidden" name="old_picture" value="<?php echo isset($audio_list) ? $audio_list->file_name : ''; ?>">
                                </div>
                            </div>


                            <div class="form-group row">
                                <label class="col-sm-3"><?php echo display('status') ?></label>
                                <div class="col-xs-9">
                                    <?php 
                                            $active = '';
                                            $inactive = '';
                                            if(isset( $audio_list ) && $audio_list->status == 1  ){
                                               $active = 'checked';  
                                            }else{
                                                $inactive = 'checked';
                                            }
                                            
                                    ?>
                                    <div class="form-check">
                                        <label class="radio-inline">
                                        <input type="radio" name="status" value="1" <?php echo  set_radio('status', '1', TRUE); ?> <?php echo $active ?>><?php echo display('active') ?>
                                        </label>
                                        <label class="radio-inline">
                                        <input type="radio" name="status" value="0" <?php echo  set_radio('status', '0'); ?> <?php echo $inactive ?>><?php echo display('inactive') ?>
                                        </label>
                                    </div>
                                </div>
                            </div>
                      

                            <div class="form-group row">
                                <div class="col-sm-offset-3 col-sm-6">
                                    <div class="ui buttons">
                                        <button type="reset" class="ui button"><?php echo display('reset') ?></button>
                                        <div class="or"></div>
                                        <button class="ui positive button"><?php echo display('save') ?></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-3"></div>
                </div>
            </div>
        </div>
    </div>

</div>