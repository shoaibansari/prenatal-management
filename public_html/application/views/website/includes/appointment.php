<section id="appointment" class="choose-form-inner">
    <div class="container">

        <div class="row">

            <!-- Main Title -->
            <div class="col-md-6 col-md-offset-3">
                <div class="title-block">
                    <h3><?= (!empty($section['appointment']['title'])?$section['appointment']['title']:null) ?></h3>
                    <p><?= (!empty($section['appointment']['description'])?$section['appointment']['description']:null) ?></p>
                </div>
            </div> 
        </div>


            <!-- Message & exception -->
            <div class="col-sm-12">
                <?php if ($this->session->flashdata('success') != null) {  ?>
                <div class="alert alert-info"> 
                    <?php echo $this->session->flashdata('success'); ?>
                </div> 
                <?php } ?>
                
                <?php if ($this->session->flashdata('exception') != null) {  ?>
                <div class="alert alert-danger">
                <?php echo $this->session->flashdata('exception'); ?>
                </div>
                <?php } ?> 
            </div>


            <!-- Appointment Form -->
            <div class="col-sm-12 col-md-12">
 
              <!-- Nav tabs -->
              <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="<?= ($this->session->flashdata('p_status')!=2?"active":null) ?>">
                    <a href="#appRegister" aria-controls="appRegister" role="tab" data-toggle="tab"><?php echo display('appointment') ?></a>
                </li>
             <!--    <li role="presentation" class="<?= ($this->session->flashdata('p_status')==2?"active":null) ?>">
                    <a href="#patientRegister" aria-controls="patientRegister" role="tab" data-toggle="tab"><?php echo display('registration') ?></a>
                </li>  -->
              </ul>


              <!-- Tab panes -->
              <div class="tab-content">
                <!-- Login -->
                <div role="tabpanel" class="tab-pane <?= ($this->session->flashdata('p_status')!=2?"active":null) ?>" id="appRegister">
                    <div id="form" class="form-area">
                        <?= form_open('website/appointment/create','id="appointmentForm"') ?> 
                        <div class="form-padding">
                            <h4><?php echo display('appointment_form') ?></h4>

                            <!-- patient id -->
                            <div class="form-group">
                                <label><?php echo display('patient_id') ?> <i class="text-danger">*</i></label>
                                <input name="patient_id" autocomplete="off" type="text" class="form-control" id="patient_id" placeholder="<?php echo display('patient_id') ?>" value="<?php echo $appointment->patient_id ?>">
                                <span></span>
                            </div>
     
                            <div class="form-group">
                                <label><?php echo display('department_name') ?> <i class="text-danger">*</i></label>
                                <?php echo form_dropdown('department_id',$department_list,$appointment->department_id,'class="form-control" id="department_id"') ?>
                                <span class="doctor_error"></span>
                            </div>
     
                            <div class="form-group">
                                <label><?php echo display('doctor_name') ?><i class="text-danger">*</i></label>
                                <?php echo form_dropdown('doctor_id','','','class="form-control" id="doctor_id"') ?>
                                <p class="help-block" id="available_days"></p>
                            </div>

                            <div class="form-group">
                                <label><?php echo display('appointment_date') ?> <i class="text-danger">*</i></label>
                                <input name="date" type="text" class="datepicker-avaiable-days form-control" id="date" placeholder="<?php echo display('appointment_date') ?>" >
                            </div>
     
                            <div class="form-group">
                                <label><?php echo display('serial_no') ?> <i class="text-danger">*</i></label>
                                <div id="serial_preview">
                                    <div class="btn btn-success disabled btn-sm"> 01</div>
                                    <div class="btn btn-success disabled btn-sm"> 02</div>
                                    <div class="btn btn-success disabled btn-sm"> 03</div>...
                                    <div class="slbtn btn btn-success disabled btn-sm"> N</div>

                                </div>
                                <input type="hidden" name="schedule_id" id="schedule_id"/>
                                <input type="hidden" name="serial_no" id="serial_no"/>
                            </div>

                            <div class="form-group">
                                <label><?php echo display('problem') ?> </label>
                                <textarea name="problem" class="form-control" placeholder="<?php echo display('problem') ?>"  rows="7"></textarea>
                            </div> 

                        </div>

                        <div class="form-footer">
                            <div class="checkbox">
                                <label></label>
                            </div>
                            <button type="submit" id="submit" class="btn thm-btn"><?php echo display('submit') ?></button>
                        </div> 

                        <?= form_close() ?>
                    </div>
                </div>

                <!-- Register -->
                <div role="tabpanel" class="tab-pane <?= ($this->session->flashdata('p_status')==2?"active":null) ?>" id="patientRegister">
                    <div id="form" class="form-area"> 

                        <?= form_open_multipart('website/patient/create','id="appointmentForm"') ?> 
                              <input type="hidden" name="latitude" id="latitude">
                              <input type="hidden" name="longitude" id="longitude">
                        <div class="form-padding">
                            <h4><?php echo display('registration_form') ?></h4>

                            <div class="form-group">
                                <label><?php echo display('full_name') ?> <i class="text-danger">*</i></label>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <input name="firstname" type="text" class="form-control" placeholder="<?php echo display('first_name') ?>">
                                    </div>

                                    <div class="col-sm-4">
                                        <input name="middlename" type="text" class="form-control" placeholder="Middle Name">
                                    </div>

                                    <div class="col-sm-4">
                                        <input name="lastname" type="text" class="form-control" placeholder="<?php echo display('last_name') ?>"> 
                                    </div>  
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <label><?php echo display('email') ?> <i class="text-danger">*</i></label>
                                         <input name="email" type="email" class="form-control" placeholder="<?php echo display('email') ?>">
                                    </div>

                                    <div class="col-sm-4">
                                        <label><?php echo display('email') ?> <i class="text-danger">*</i></label>
                                         <input name="password" type="password" class="form-control" placeholder="<?php echo display('password') ?>">
                                    </div>
                                </div>
                            </div>

                             <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <label><?php echo display('date_of_birth') ?> <i class="text-danger">*</i></label>
                                        <input name="date_of_birth" type="text" class="datepicker form-control" placeholder="<?php echo display('date_of_birth') ?>" >
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Name of Village <i class="text-danger">*</i></label>
                                        <input name="name_of_village" type="text" id="village" class="form-control" placeholder="Name of Village" >
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Quarter <i class="text-danger">*</i></label>
                                        <input name="quarter" type="text" class="form-control" placeholder="Quarter" >
                                    </div>
                                    

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">   

                                    <div class="col-sm-4">
                                        <label><?php echo display('phone') ?> <i class="text-danger">*</i></label>
                                        <input name="phone" type="text" class="form-control" placeholder="xxx-xxx-xxxxxxx"> 
                                    </div> 

                                    <div class="col-sm-4">
                                        <label>Income Per Month <i class="text-danger">*</i></label>
                                        <?php
                                            $incomeList = array( 
                                                'No income'   => 'No income',
                                                'Less than 10,000 CFA' => 'Less than 10,000 CFA',
                                                '10,001-30,000 CFA' => '10,001-30,000 CFA',
                                                '30,001-50,000 CFA' => '30,001-50,000 CFA',
                                                '50,001-70,000 CFA' => '50,001-70,000 CFA',
                                                '70001-90000' => '70001-90000',
                                                'More than 90,000 CFA' => 'More than 90,000 CFA' 
                                            );
                                            echo form_dropdown('income', $incomeList, null, 'class="form-control"'); 
                                        ?>
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Education level <i class="text-danger">*</i></label>
                                        <?php
                                            $eduList = array( 
                                                'No formal education'=> 'No formal education',
                                                'Primary' => 'Primary',
                                                'Secondary' => 'Secondary',
                                                'High school' => 'High school',
                                                'University' => 'University',
                                                'Other' => 'Other'
                                            );
                                            echo form_dropdown('education', $eduList, null, 'class="form-control"'); 
                                        ?>
                                    </div> 

                                </div>
                            </div>

                             <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <label>Employment Status <i class="text-danger">*</i></label>
                                        <?php
                                            $empList = array( 
                                                'Employed for salary'=> 'Employed for salary',
                                                'Self-employed' => 'Self-employed',
                                                'Housewife' => 'Housewife',
                                                'Student' => 'Student',
                                                'Retired' => 'Retired',
                                                'Unable to work' => 'Unable to work',
                                                'Not working' => 'Not working'
                                            );
                                            echo form_dropdown('employment_status', $empList, null, 'class="form-control"'); 
                                        ?>
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Occupation <i class="text-danger">*</i></label>
                                        <input name="occupation" type="text" class="form-control" placeholder="Occupation"> 
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Marital Status <i class="text-danger">*</i></label>
                                        <?php
                                            $marialStatus = array( 
                                                'Married – Polygamy or Monogamy'=> 'Married – Polygamy or Monogamy',
                                                'Divorced' => 'Divorced',
                                                'Widowed' =>  'Widowed',
                                                'Single, never married' => 'Single, never married'                                                
                                            );
                                            echo form_dropdown('marital_status', $marialStatus, null, 'class="form-control"'); 
                                        ?> 
                                    </div> 


                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">

                                    <div class="col-sm-4">
                                        <label>Language <i class="text-danger">*</i></label>
                                        <?php
                                            $lang = array( 
                                                'Pidgin English'=> 'Pidgin English',
                                                'Local dialect-name of local dialect' => 'Local dialect-name of local dialect',
                                                'English' =>  'English',
                                                'French' =>  'French',
                                                'Fufulde' =>  'Fufulde',
                                                'Other' =>  'Other'                           
                                            );
                                            echo form_dropdown('language', $lang, null, 'class="form-control"'); 
                                        ?> 
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Religion <i class="text-danger">*</i></label>
                                        <?php
                                            $religion = array( 
                                                'Christian (Catholic, Presbyterian, Baptist)'=> 'Christian (Catholic, Presbyterian, Baptist)',
                                                'Pentecostal (full gospel, seventh day, Adventist etc)' => 'Pentecostal (full gospel, seventh day, Adventist etc)',
                                                'Muslim' =>  'Muslim',
                                                'Other' =>  'Other'                          
                                            );
                                            echo form_dropdown('religion', $religion, null, 'class="form-control"'); 
                                        ?> 
                                    </div>

                                    <div class="col-sm-4">
                                        <div class="form-check" style="margin-top: 30px;">
                                        <label><?php echo display('sex') ?> <i class="text-danger">*</i></label>
                                            <label class="radio-inline">
                                            <input type="radio" name="sex" value="Male"><?php echo display('male') ?>
                                            </label>
                                            <label class="radio-inline">
                                            <input type="radio" name="sex" value="Female"><?php echo display('female') ?>
                                            </label>
                                        </div> 
                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">

                                    <div class="col-sm-4">
                                        <label>Place of residence <i class="text-danger">*</i></label>
                                        <?php
                                            $residenceList = array( 
                                                'Urban'=> 'Urban',
                                                'semi–urban' => 'semi–urban',
                                                'rural' =>  'rural',
                                                'Other' =>  'Other'                          
                                            );
                                            echo form_dropdown('residence', $residenceList, null, 'class="form-control"'); 
                                        ?> 
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Antenatal visits number <i class="text-danger">*</i></label>
                                        <input name="antenatal_visits" type="number" class="form-control" placeholder="Antenatal visits number" min="0"> 
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Place of antenatal visit <i class="text-danger">*</i></label>
                                        <textarea name="place_visits" class="form-control" placeholder="Place of antenatal visit" rows="3"></textarea>
                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">

                                    <div class="col-sm-4">
                                        <div class="form-check" style="margin-top: 30px;">
                                        <label>Delivery <i class="text-danger">*</i></label>
                                            <label class="radio-inline">
                                            <input type="radio" name="delivery" value="C-section">C-section 
                                            </label>
                                            <label class="radio-inline">
                                            <input type="radio" name="delivery" value="C-section">Normal
                                            </label>
                                        </div> 
                                    </div>
                                    
                                    <div class="col-sm-4">
                                        <label>Head of Household <i class="text-danger">*</i></label>
                                        <?php
                                            $householdList = array( 
                                                'Male'=> 'Male',
                                                'Female' => 'Female',
                                                'Grandparent' =>  'Grandparent',
                                                'In law' =>  'In law'                          
                                            );
                                            echo form_dropdown('head_of_household', $householdList, null, 'class="form-control"'); 
                                        ?> 
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Number of deliveries/children <i class="text-danger">*</i></label>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <input type="number" name="alive" class="form-control" placeholder="Alive" min="0">                                        
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="number" name="dead" class="form-control" placeholder="Dead" min="0">
                                            </div>
                                        </div>
                                        
                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">

                                    <div class="col-sm-4">
                                        <label>Number of Pregnancies <i class="text-danger">*</i></label>
                                        <input type="number" name="total_pregnancies" class="form-control" placeholder="Number of Pregnancies" min="0">
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Medical History <i class="text-danger">*</i></label>
                                        <textarea name="medical_history" class="form-control" placeholder="Medical History" rows="7"></textarea>
                                    </div>

                                    <div class="col-sm-4">
                                        <label>History of Diabetes <i class="text-danger">*</i></label>
                                        <textarea name="history_of_diabetes" class="form-control" placeholder="History of Diabetes" rows="7"></textarea>
                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">

                                    <div class="col-sm-4">
                                        <label>History of Hypertension <i class="text-danger">*</i></label>
                                        <textarea name="history_of_hypertension" class="form-control" placeholder="History of Hypertension" rows="7"></textarea>
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Examination <i class="text-danger">*</i></label>
                                        <textarea name="examination" class="form-control" placeholder="Examination" rows="7"></textarea>
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Echography <i class="text-danger">*</i></label>
                                        <textarea name="echography" class="form-control" placeholder="Echography" rows="7"></textarea>
                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">

                                    <div class="col-sm-4">
                                        <label>Foetal movements <i class="text-danger">*</i></label>
                                        <?php
                                            $foetalList = array( 
                                                'Yes (good)'=> 'Yes (good)',
                                                'No (poor)' => 'No (poor)'                    
                                            );
                                            echo form_dropdown('foetal_movements', $foetalList, null, 'class="form-control"'); 
                                        ?> 
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Feotal Presentation <i class="text-danger">*</i></label>
                                        
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <?php
                                                    $foetalpresentList = array( 
                                                        'Cephalic – Good'=> 'Cephalic – Good',
                                                        'Breach - risky' => 'Breach - risky',
                                                        'Hand - risky' => 'Hand - risky',
                                                        'Others - risky' => 'Others - risky'
                                                    );
                                                    echo form_dropdown('foetal_presentation', $foetalpresentList, null, 'class="form-control" id="foetal_presentation"'); 
                                               ?> 
                                        
                                            </div>
                                            <div class="col-sm-6">
                                                <textarea name="foetal_presentation_detail" id="otherRisky" class="form-control" rows="7" placeholder="Foetal Presentation Detail"></textarea>
                                            </div>
                                        </div>
                                    </div> 

                                    <div class="col-sm-4">
                                        <label>Drug History <i class="text-danger">*</i></label>
                                        <textarea name="drug_history" class="form-control" placeholder="Drug History" rows="7"></textarea>
                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">

                                    <div class="col-sm-4">
                                        <label>Antenatal History <i class="text-danger">*</i></label>
                                        <textarea name="antenatal_history" class="form-control" placeholder="Antenatal History" rows="7"></textarea>
                                    </div>

                                    <div class="col-sm-4">
                                        <label>HIV/screening/test <i class="text-danger">*</i></label>
                                        <textarea name="hiv_screening_test" class="form-control" placeholder="HIV/screening/test" rows="7"></textarea>
                                    </div>

                                    <div class="col-sm-4">
                                        <label>On ARV (Anti Retrovirial) <i class="text-danger">*</i></label>
                                        <textarea name="on_arv_anti_retrovirial" class="form-control" placeholder="On ARV (Anti Retrovirial)" rows="7"></textarea>
                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">

                                    <div class="col-sm-4">
                                        <label>Malaria/screening/test <i class="text-danger">*</i></label>
                                        <textarea name="malaria_screening_test" class="form-control" placeholder="Malaria/screening/test" rows="7"></textarea>
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Hepatitis B/screening/test <i class="text-danger">*</i></label>
                                        <textarea name="hepatitis_b_screening_test" class="form-control" placeholder="Hepatitis B/screening/test" rows="7"></textarea>
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Physical Exams <i class="text-danger">*</i></label>
                                        <textarea name="physical_exams" class="form-control" placeholder="Physical Exams" rows="7"></textarea>
                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">

                                    <div class="col-sm-4">
                                        <label>Treatments <i class="text-danger">*</i></label>
                                        <textarea name="treatments" class="form-control" placeholder="Treatments" rows="7"></textarea>
                                    </div>

                                    <div class="col-sm-4">
                                        <label>PIH and Anaemia Screening <i class="text-danger">*</i></label>
                                        <textarea name="pih_anaemia_screening" class="form-control" placeholder="PIH and Anaemia Screening" rows="7"></textarea>
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Advise/Counsel <i class="text-danger">*</i></label>
                                        <textarea name="advise_counsel" class="form-control" placeholder="Advise/Counsel" rows="7"></textarea>
                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">

                                    <div class="col-sm-4">
                                        <label>Preventive Measures <i class="text-danger">*</i></label>
                                        <textarea name="preventive_measures" class="form-control" placeholder="Preventive Measures" rows="7"></textarea>
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Adherence to Treatment (HIV, malaria) <i class="text-danger">*</i></label>
                                        <textarea name="adherence_to_treatment" class="form-control" placeholder="Adherence to treatment (HIV, malaria)" rows="7"></textarea>
                                    </div>

                                    <div class="col-sm-4">
                                        <label>Bleeding during Pregnancy <i class="text-danger">*</i></label>
                                        <textarea name="bleeding_during_pregnancy" class="form-control" placeholder="Bleeding during Pregnancy" rows="7"></textarea>
                                    </div>

                                </div>
                            </div>

                             <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <label>Vaccination Status <i class="text-danger">*</i></label>
                                        <textarea name="vaccination_status" class="form-control" placeholder="Vaccination Status" rows="7"></textarea>
                                    </div>
                                </div>
                            </div>

                            <!-- <div class="form-group">
                                <label><?php echo display('blood_group') ?> </label>
                                <?php
                                    // $bloodList = array( 
                                    //     ''   => display('select_option'),
                                    //     'A+' => 'A+',
                                    //     'A-' => 'A-',
                                    //     'B+' => 'B+',
                                    //     'B-' => 'B-',
                                    //     'O+' => 'O+',
                                    //     'O-' => 'O-',
                                    //     'AB+' => 'AB+',
                                    //     'AB-' => 'AB-'
                                    // );
                                    // echo form_dropdown('blood_group', $bloodList, null, 'class="form-control"'); 
                                ?>
                            </div> --> 
     
                           <!--  <div class="form-group">
                                <label><?php echo display('picture') ?></label>
                                <input name="picture" type="file">
                            </div>

                            <div class="form-group">
                                <label><?php echo display('address') ?> <i class="text-danger">*</i></label>
                                <textarea name="address" class="form-control" placeholder="<?php echo display('address') ?>"  rows="7"></textarea>
                            </div> 

                        </div> -->

                        <div class="form-footer">
                            <div class="checkbox">
                                <label></label>
                            </div>
                            <button type="submit" id="submit" class="btn thm-btn"><?php echo display('submit') ?></button>
                        </div> 

                        <?= form_close() ?>
                    </div>
                </div> 

              </div>
  

            </div>



            <!-- Section Image -->
            <div class="col-md-4 hidden-sm">
                <div class="doctor_img">
                    <img src="<?= (!empty($section['appointment']['featured_image'])?base_url($section['appointment']['featured_image']):null) ?>" class="img-responsive" alt="">
                </div>
            </div>



            <!-- Why Choose Us -->
            <div class="col-sm-6 col-md-4">
            <?php 
            if (!empty($items['appointment'])):
            foreach ($items['appointment'] as $appointment):
            ?>   
                <div class="choose">
                    <div class="choose-icon"> 
                        <?php if (!empty($appointment['icon_image'])): ?>
                            <img src="<?= $appointment['icon_image'] ?>" alt=""/>
                        <?php endif; ?>
                    </div>
                    <div class="choose-content">
                        <h4><?= $appointment['title'] ?></h4>
                        <p><?= character_limiter($appointment['description'],120) ?></p>
                    </div>
                </div> 
            <?php
            endforeach;
            endif;
            ?>   
            </div>

            
        </div>

    </div>
</section>



 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {

    //check patient id
    $('#patient_id').keyup(function(){
        var pid = $(this);

        $.ajax({
            url  : '<?= base_url('website/appointment/check_patient/') ?>',
            type : 'post',
            dataType : 'JSON',
            data : {
                '<?= $this->security->get_csrf_token_name(); ?>' : '<?= $this->security->get_csrf_hash(); ?>',
                patient_id : pid.val()
            },
            success : function(data) 
            {
                if (data.status == true) {
                    pid.next().text(data.message).addClass('text-success').removeClass('text-danger');
                } else if (data.status == false) {
                    pid.next().text(data.message).addClass('text-danger').removeClass('text-success');
                } else {
                    pid.next().text(data.message).addClass('text-danger').removeClass('text-success');
                }
            }, 
            error : function()
            {
                alert('failed');
            }
        });
    });
 
    //department_id
    $("#department_id").change(function(){
        var output = $('.doctor_error'); 
        var doctor_list = $('#doctor_id');
        var available_day = $('#available_day');

        $.ajax({
            url  : '<?= base_url('website/appointment/doctor_by_department/') ?>',
            type : 'post',
            dataType : 'JSON',
            data : {
                '<?= $this->security->get_csrf_token_name(); ?>' : '<?= $this->security->get_csrf_hash(); ?>',
                department_id : $(this).val()
            },
            success : function(data) 
            {
                if (data.status == true) {
                    doctor_list.html(data.message);
                    available_day.html(data.available_days);
                    output.html('');
                } else if (data.status == false) {
                    doctor_list.html('');
                    output.html(data.message).addClass('text-danger').removeClass('text-success');
                } else {
                    doctor_list.html('');
                    output.html(data.message).addClass('text-danger').removeClass('text-success');
                }
            }, 
            error : function()
            {
                alert('failed');
            }
        });
    }); 


    //doctor_id
    $("#doctor_id").change(function(){
        var doctor_id = $('#doctor_id'); 
        var output = $('#available_days'); 

        $.ajax({
            url  : '<?= base_url('website/appointment/schedule_day_by_doctor/') ?>',
            type : 'post',
            dataType : 'JSON',
            data : {
                '<?= $this->security->get_csrf_token_name(); ?>' : '<?= $this->security->get_csrf_hash(); ?>',
                doctor_id : $(this).val()
            },
            success : function(data) 
            {
                if (data.status == true) {
                    output.html(data.message).addClass('text-success').removeClass('text-danger');
                } else if (data.status == false) {
                    output.html(data.message).addClass('text-danger').removeClass('text-success');
                } else {
                    output.html(data.message).addClass('text-danger').removeClass('text-success');
                }
            }, 
            error : function()
            {
                alert('failed');
            }
        });
    });


    //date
    $("#date").change(function(){
        var date        = $('#date'); 
        var serial_preview   = $('#serial_preview'); 
        var doctor_id   = $('#doctor_id'); 
        var schedule_id = $("#schedule_id"); 
        var patient_id  = $("#patient_id"); 
 
        $.ajax({
            url  : '<?= base_url('website/appointment/serial_by_date/') ?>',
            type : 'post',
            dataType : 'JSON',
            data : {
                '<?= $this->security->get_csrf_token_name(); ?>' : '<?= $this->security->get_csrf_hash(); ?>',
                doctor_id  : doctor_id.val(),
                patient_id : patient_id.val(), 
                date : $(this).val()
            },
            success : function(data) 
            { 
                if (data.status == true) {
                    //set schedule id
                    schedule_id.val(data.schedule_id); 
                    serial_preview.html(data.message);
                } else if (data.status == false) {
                    schedule_id.val('');
                    serial_preview.html(data.message).addClass('text-danger').removeClass('text-success');
                } else {
                    schedule_id.val('');
                    serial_preview.html(data.message).addClass('text-danger').removeClass('text-success');
                }
            }, 
            error : function()
            {
                alert('failed');
            }
        });
    });

    //serial_no 
    $("body").on('click','.serial_no',function(){
        var serial_no = $(this).attr('data-item');
        $("#serial_no").val(serial_no);
        $('.serial_no').removeClass('btn-danger').addClass('btn-success').not(".disabled");
        $(this).removeClass('btn-success').addClass('btn-danger').not(".disabled");
    });

    $( ".datepicker-avaiable-days" ).datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        showButtonPanel: false,
        minDate: 0,  
        // beforeShowDay: DisableDays 
     });

    $("#otherRisky").hide();

    $( "#foetal_presentation" ).change(function() {
       var val = $("#foetal_presentation").val();
    if(val=="Others - risky"){
        $("#otherRisky").show();
    } else {
        $("#otherRisky").hide();
    }
    });
   
            
          

});
</script>

