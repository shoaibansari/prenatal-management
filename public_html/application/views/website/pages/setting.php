<div class="row">
    <!--  form area -->
    <div class="col-sm-12">

       <div  class="panel panel-default thumbnail"> 

            <div class="panel-body  panel-form"> 
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <?php echo form_open_multipart('website/setting/create','class="form-inner"') ?>
                            <?php echo form_hidden('id',$setting->id) ?>
  
                            <div class="form-group row">
                                <label for="title" class="col-xs-3 col-form-label"><?php echo display('application_title') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="title" type="text" class="form-control" id="title" placeholder="<?php echo display('application_title') ?>" value="<?php echo $setting->title ?>">
                                </div>
                            </div> 

                            <div class="form-group row">
                                <label for="description" class="col-xs-3 col-form-label"><?php echo display('description') ?></label>
                                <div class="col-xs-9">
                                    <textarea name="description" class="form-control"  placeholder="<?php echo display('description') ?>" rows="2"><?php echo $setting->description ?></textarea>
                                </div>
                            </div> 

                            <div class="form-group row">
                                <label for="meta_keyword" class="col-xs-3 col-form-label"><?php echo display('meta_keyword') ?></label>
                                <div class="col-xs-9">
                                    <textarea name="meta_keyword" class="form-control"  placeholder="<?php echo display('meta_keyword') ?>" rows="2"> <?php echo $setting->meta_keyword ?></textarea>
                                </div>
                            </div> 

                            <div class="form-group row">
                                <label for="meta_tag" class="col-xs-3 col-form-label"><?php echo display('meta_description') ?></label>
                                <div class="col-xs-9">
                                    <textarea name="meta_tag" class="form-control"  placeholder="<?php echo display('meta_description') ?>" rows="2"><?php echo $setting->meta_tag ?></textarea>
                                </div>
                            </div>                             

                            <div class="form-group row">
                                <label for="email" class="col-xs-3 col-form-label"><?php echo display('email') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="email" type="text" class="form-control" id="email" placeholder="<?php echo display('email') ?>"  value="<?php echo $setting->email ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="address" class="col-xs-3 col-form-label"><?php echo display('address') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <textarea name="address" class="form-control"  placeholder="<?php echo display('address') ?>" rows="2"><?php echo $setting->address ?></textarea>
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="phone" class="col-xs-3 col-form-label"><?php echo display('phone') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="phone" type="text" class="form-control" id="phone" placeholder="<?php echo display('phone') ?>"  value="<?php echo $setting->phone ?>" >
                                </div>
                            </div>


                            <!-- if setting favicon is already uploaded -->
                            <?php if(!empty($setting->favicon)) {  ?>
                            <div class="form-group row">
                                <label for="faviconPreview" class="col-xs-3 col-form-label"></label>
                                <div class="col-xs-9">
                                    <img src="<?php echo base_url($setting->favicon) ?>" alt="Favicon" class="img-thumbnail" />
                                </div>
                            </div>
                            <?php } ?>

                            <div class="form-group row">
                                <label for="favicon" class="col-xs-3 col-form-label"><?php echo display('favicon') ?> </label>
                                <div class="col-xs-9">
                                    <input type="file" name="favicon" placeholder="Logo" id="favicon" value="<?php echo $setting->favicon ?>">
                                    <input type="hidden" name="old_favicon" value="<?php echo $setting->favicon ?>">
                                </div>
                            </div>

                            

                            <!-- if setting logo is already uploaded -->
                            <?php if(!empty($setting->logo)) {  ?>
                            <div class="form-group row">
                                <label for="logoPreview" class="col-xs-3 col-form-label"></label>
                                <div class="col-xs-9">
                                    <img src="<?php echo base_url($setting->logo) ?>" alt="Logo" class="img-thumbnail" />
                                </div>
                            </div>
                            <?php } ?>

                            <div class="form-group row">
                                <label for="logo" class="col-xs-3 col-form-label"><?php echo display('logo') ?> </label>
                                <div class="col-xs-9">
                                    <input type="file" name="logo"  id="logo" value="<?php echo $setting->logo ?>">
                                    <input type="hidden" name="old_logo" value="<?php echo $setting->logo ?>">
                                </div>
                            </div>


                            <div class="form-group row">
                                <label for="copyright_text" class="col-xs-3 col-form-label"><?php echo display('copyright_text') ?></label>
                                <div class="col-xs-9">
                                    <textarea name="copyright_text" class="form-control tinymce"  placeholder="<?php echo display('copyright_text') ?>" rows="2"><?php echo $setting->copyright_text ?></textarea>
                                </div>
                            </div>  

                            <div class="form-group row">
                                <label for="twitter_api" class="col-xs-3 col-form-label"><?php echo display('twitter_api') ?></label>
                                <div class="col-xs-9">
                                    <textarea name="twitter_api" class="form-control"  placeholder="<?php echo display('twitter_api') ?>" rows="2"><?php echo $setting->twitter_api ?></textarea>
                                </div>
                            </div>  

                            <div class="form-group row">
                                <label for="google_map" class="col-xs-3 col-form-label"><?php echo display('google_map') ?></label>
                                <div class="col-xs-9">
                                    <textarea name="google_map" class="form-control"  placeholder="<?php echo display('google_map') ?>" rows="2"><?php echo $setting->google_map ?></textarea>
                                </div>
                            </div>  

                            <div class="form-group row">
                                <label for="facebook" class="col-xs-3 col-form-label"><?php echo display('facebook_url') ?></label>
                                <div class="col-xs-9">
                                    <input name="facebook" type="text" class="form-control" id="facebook" placeholder="http://facebook/"  value="<?php echo $setting->facebook ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="twitter" class="col-xs-3 col-form-label"><?php echo display('twitter_url') ?></label>
                                <div class="col-xs-9">
                                    <input name="twitter" type="text" class="form-control" id="twitter" placeholder="http://twitter.com/"  value="<?php echo $setting->twitter ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="instagram" class="col-xs-3 col-form-label"><?php echo display('instagram_url') ?></label>
                                <div class="col-xs-9">
                                    <input name="instagram" type="text" class="form-control" id="instagram" placeholder="http://instagram.com/"  value="<?php echo $setting->instagram ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="google_plus" class="col-xs-3 col-form-label"><?php echo display('google_plus_url') ?></label>
                                <div class="col-xs-9">
                                    <input name="google_plus" type="text" class="form-control" id="google_plus" placeholder="http://plus.google.com/"  value="<?php echo $setting->google_plus ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="dribbble" class="col-xs-3 col-form-label"><?php echo display('dribbble_url') ?></label>
                                <div class="col-xs-9">
                                    <input name="dribbble" type="text" class="form-control" id="dribbble" placeholder="http://dribbble.com/"  value="<?php echo $setting->dribbble ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="skype" class="col-xs-3 col-form-label"><?php echo display('skype_url') ?></label>
                                <div class="col-xs-9">
                                    <input name="skype" type="text" class="form-control" id="skype" placeholder="http://skype.com/"  value="<?php echo $setting->skype ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="vimeo" class="col-xs-3 col-form-label"><?php echo display('vimeo_url') ?></label>
                                <div class="col-xs-9">
                                    <input name="vimeo" type="text" class="form-control" id="vimeo" placeholder="http://vimeo.com/"  value="<?php echo $setting->vimeo ?>">
                                </div>
                            </div> 


                            <div class="form-group row">
                                <label class="col-sm-3"><?php echo display('website_status') ?></label>
                                <div class="col-xs-9">
                                    <div class="form-check">
                                        <label class="radio-inline">
                                        <input type="radio" name="status" value="1"  <?= ($setting->status==1?"checked":null) ?> ><?php echo display('active') ?>
                                        </label>
                                        <label class="radio-inline">
                                        <input type="radio" name="status" value="0" <?= ($setting->status==0?"checked":null) ?> ><?php echo display('inactive') ?>
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
                        <?php echo form_close() ?>
                    </div>
                    <div class="col-md-3"></div>
                </div>
            </div>
        </div>
    </div>

</div>

     