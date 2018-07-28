<div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary" href="<?php echo base_url("patient") ?>"> <i class="fa fa-list"></i>  <?php echo display('patient_list') ?> </a>  
                </div>
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
                    <div class="col-md-9 col-sm-12">
                  
                        <?php echo form_open_multipart('patient/create','class="form-inner"') ?>
                           
                            <?php echo form_hidden('id',$patient->id); ?>
                                <input type="hidden" name="latitude" id="latitude" value="<?php echo $patient->patient_detail->latitude ?>">
                                <input type="hidden" name="longitude" id="longitude" value="<?php echo $patient->patient_detail->longitude ?>">
                                <input type="hidden" name="patient_id" value="<?php echo $patient->patient_id ?>">
                            <div class="form-group row">
                                <label for="firstname" class="col-xs-3 col-form-label"><?php echo display('first_name') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="firstname" type="text" class="form-control" id="firstname" placeholder="<?php echo display('first_name') ?>" value="<?php echo $patient->firstname; ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="middlename" class="col-xs-3 col-form-label">Middle Name <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="middlename" type="text" class="form-control" placeholder="Middle Name" value="<?php echo $patient->middlename; ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="lastname" class="col-xs-3 col-form-label"><?php echo display('last_name') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="lastname" type="text" class="form-control" id="lastname" placeholder="<?php echo display('last_name') ?>" value="<?php echo $patient->lastname; ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="email" class="col-xs-3 col-form-label"><?php echo display('email') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="email" type="email" class="form-control" placeholder="<?php echo display('email') ?>" value="<?php echo $patient->email; ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password" class="col-xs-3 col-form-label"><?php echo display('password') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="password" type="password" class="form-control" placeholder="<?php echo display('password') ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="date_of_birth" class="col-xs-3 col-form-label"><?php echo display('date_of_birth') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="date_of_birth" class="datepicker form-control" type="text" placeholder="<?php echo display('date_of_birth') ?>" id="date_of_birth"  value="<?php echo $patient->date_of_birth; ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="name_of_village" class="col-xs-3 col-form-label">Name of Village <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="name_of_village" type="text" id="village" class="form-control" placeholder="Name of Village" value="<?php echo $patient->patient_detail->name_of_village; ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="quarter" class="col-xs-3 col-form-label">Quarter <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="quarter" type="text" class="form-control" placeholder="Quarter" value="<?php echo $patient->patient_detail->quarter; ?>">
                                </div>
                            </div>
                            

                            <div class="form-group row">
                                <label for="phone" class="col-xs-3 col-form-label"><?php echo display('phone') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="phone" class="form-control" type="text" placeholder="<?php echo display('phone') ?>" id="phone"  value="<?php echo $patient->phone; ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="income" class="col-xs-3 col-form-label">Income Per Month <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
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
                                            echo form_dropdown('income', $incomeList, $patient->patient_detail->income, 'class="form-control"'); 
                                        ?>
                                </div>
                                
                            </div>

                             <div class="form-group row">
                                <label for="education" class="col-xs-3 col-form-label">Education level <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <?php
                                            $eduList = array( 
                                                'No formal education'=> 'No formal education',
                                                'Primary' => 'Primary',
                                                'Secondary' => 'Secondary',
                                                'High school' => 'High school',
                                                'University' => 'University',
                                                'Other' => 'Other'
                                            );
                                            echo form_dropdown('education', $eduList, $patient->patient_detail->education, 'class="form-control"'); 
                                        ?>
                                </div>                                
                            </div>



                            <div class="form-group row">
                                <label for="education" class="col-xs-3 col-form-label">Employment Status <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
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
                                            echo form_dropdown('employment_status', $empList, $patient->patient_detail->employment_status, 'class="form-control"'); 
                                        ?>
                                </div>
                                
                            </div>

                            <div class="form-group row">
                                <label for="occupation" class="col-xs-3 col-form-label">Occupation <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="occupation" type="text" class="form-control" placeholder="Occupation" value="<?php echo $patient->patient_detail->occupation ?>"> 
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="marital_status" class="col-xs-3 col-form-label">Marital Status <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                     <?php
                                            $marialStatus = array( 
                                                'Married – Polygamy or Monogamy'=> 'Married – Polygamy or Monogamy',
                                                'Divorced' => 'Divorced',
                                                'Widowed' =>  'Widowed',
                                                'Single, never married' => 'Single, never married'                                                
                                            );
                                            echo form_dropdown('marital_status', $marialStatus, $patient->patient_detail->marital_status, 'class="form-control"'); 
                                        ?> 
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="language" class="col-xs-3 col-form-label">Language <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                     <?php
                                            $lang = array( 
                                                'Pidgin English'=> 'Pidgin English',
                                                'Local dialect-name of local dialect' => 'Local dialect-name of local dialect',
                                                'English' =>  'English',
                                                'French' =>  'French',
                                                'Fufulde' =>  'Fufulde',
                                                'Other' =>  'Other'                           
                                            );
                                            echo form_dropdown('language', $lang, $patient->patient_detail->language, 'class="form-control"'); 
                                        ?> 
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="religion" class="col-xs-3 col-form-label">Religion <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                     <?php
                                            $religion = array( 
                                                'Christian (Catholic, Presbyterian, Baptist)'=> 'Christian (Catholic, Presbyterian, Baptist)',
                                                'Pentecostal (full gospel, seventh day, Adventist etc)' => 'Pentecostal (full gospel, seventh day, Adventist etc)',
                                                'Muslim' =>  'Muslim',
                                                'Other' =>  'Other'                          
                                            );
                                            echo form_dropdown('religion', $religion, $patient->patient_detail->religion, 'class="form-control"'); 
                                        ?> 
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-xs-3"><?php echo display('sex') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <div class="form-check">
                                        <label class="radio-inline">
                                           
                                        <input type="radio" name="sex" value="Male" <?php if (isset($patient->sex) && $patient->sex=="Male") echo "checked"; ?>><?php echo display('male') ?>
                                        </label>
                                        <label class="radio-inline">
                                        <input type="radio" name="sex" value="Female" <?php if (isset($patient->sex) && $patient->sex=="Female") echo "checked"; ?> ><?php echo display('female') ?>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            
                            <div class="form-group row">
                                <label for="residence" class="col-xs-3 col-form-label">Place of residence <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                     <?php
                                            $residenceList = array( 
                                                'Urban'=> 'Urban',
                                                'semi–urban' => 'semi–urban',
                                                'rural' =>  'rural',
                                                'Other' =>  'Other'                          
                                            );
                                            echo form_dropdown('residence', $residenceList, $patient->patient_detail->residence, 'class="form-control"'); 
                                        ?> 
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="antenatal_visits" class="col-xs-3 col-form-label">Antenatal visits number <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="antenatal_visits" type="number" class="form-control" placeholder="Antenatal visits number" min="0" value="<?php echo $patient->patient_detail->antenatal_visits ?>">  
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="place_visits" class="col-xs-3 col-form-label">Place of antenatal visit <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <textarea name="place_visits" class="form-control" placeholder="Place of antenatal visit" rows="3"><?php echo $patient->patient_detail->place_visits ?></textarea>
                                </div>
                            </div>


                            <div class="form-group row">
                                <label class="col-xs-3">Delivery <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <div class="form-check">
                                        <label class="radio-inline">
                                            <?php 
                                                $section ='';
                                                $normal = '';
                                                if(isset( $patient->patient_detail->delivery) == 'C-section' ){
                                                    $section = 'checked="checked" ';
                                                }else if(isset( $patient->patient_detail->delivery) == 'Normal'){
                                                    $normal =  'checked="checked" ';
                                                }
                                             ?>
                                         <input type="radio" name="delivery" value="C-section" <?php echo $section ?> >C-section
                                        </label>
                                        <label class="radio-inline">
                                        <input type="radio" name="delivery" value="Normal" <?php echo $normal ?>>Normal
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="head_of_household" class="col-xs-3 col-form-label">Head of Household <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                     <?php
                                            $householdList = array( 
                                                'Male'=> 'Male',
                                                'Female' => 'Female',
                                                'Grandparent' =>  'Grandparent',
                                                'In law' =>  'In law'                          
                                            );
                                            echo form_dropdown('head_of_household', $householdList, $patient->patient_detail->head_of_household, 'class="form-control"'); 
                                        ?>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="antenatal_visits" class="col-xs-3 col-form-label">Number of deliveries/children <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <div class="row">
                                            <div class="col-sm-6">
                                                <input type="number" name="alive" class="form-control" placeholder="Alive" min="0" value="<?php echo  $patient->patient_detail->alive ?>">                                        
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="number" name="dead" class="form-control" placeholder="Dead" min="0" value="<?php echo  $patient->patient_detail->dead ?>">
                                            </div>
                                        </div>  
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="total_pregnancies" class="col-xs-3 col-form-label">Number of Pregnancies <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input type="number" name="total_pregnancies" class="form-control" placeholder="Number of Pregnancies" min="0" value="<?php echo  $patient->patient_detail->total_pregnancies ?>">  
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="medical_history" class="col-xs-3 col-form-label">Medical History <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <textarea name="medical_history" class="form-control" placeholder="Medical History" rows="7"><?php echo $patient->patient_detail->medical_history ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="history_of_diabetes" class="col-xs-3 col-form-label">History of Diabetes <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <textarea name="history_of_diabetes" class="form-control" placeholder="History of Diabetes" rows="7"><?php echo $patient->patient_detail->history_of_diabetes ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="history_of_hypertension" class="col-xs-3 col-form-label">History of Hypertension <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <textarea name="history_of_hypertension" class="form-control" placeholder="History of Hypertension" rows="7"><?php echo $patient->patient_detail->history_of_hypertension ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="examination" class="col-xs-3 col-form-label">Examination <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                   <textarea name="examination" class="form-control" placeholder="Examination" rows="7"><?php echo $patient->patient_detail->examination ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="echography" class="col-xs-3 col-form-label">Echography <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                   <textarea name="echography" class="form-control" placeholder="Echography" rows="7"><?php echo $patient->patient_detail->echography ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="foetal_movements" class="col-xs-3 col-form-label">Foetal movements <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                     <?php
                                            $foetalList = array( 
                                                'Yes (good)'=> 'Yes (good)',
                                                'No (poor)' => 'No (poor)'                    
                                            );
                                            echo form_dropdown('foetal_movements', $foetalList, $patient->patient_detail->foetal_movements, 'class="form-control"'); 
                                        ?> 
                                </div>
                            </div>

                             <div class="form-group row">
                                <label for="foetal_presentation" class="col-xs-3 col-form-label">Feotal Presentation <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                     <?php
                                        $foetalpresentList = array( 
                                            'Cephalic – Good'=> 'Cephalic – Good',
                                            'Breach - risky' => 'Breach - risky',
                                            'Hand - risky' => 'Hand - risky',
                                            'Others - risky' => 'Others - risky'
                                        );
                                        echo form_dropdown('foetal_presentation', $foetalpresentList, $patient->patient_detail->foetal_presentation, 'class="form-control" id="foetal_presentation"'); 
                                   ?> 
                                   <textarea name="foetal_presentation_detail" id="otherRisky" class="form-control" rows="7" placeholder="Foetal Presentation Detail"><?php echo $patient->patient_detail->foetal_presentation_detail ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="drug_history" class="col-xs-3 col-form-label">Drug History <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                   <textarea name="drug_history" class="form-control" placeholder="Drug History" rows="7"><?php echo $patient->patient_detail->drug_history ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="antenatal_history" class="col-xs-3 col-form-label">Antenatal History <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <textarea name="antenatal_history" class="form-control" placeholder="Antenatal History" rows="7"><?php echo $patient->patient_detail->antenatal_history ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="hiv_screening_test" class="col-xs-3 col-form-label">HIV/screening/test <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                   <textarea name="hiv_screening_test" class="form-control" placeholder="HIV/screening/test" rows="7"><?php echo $patient->patient_detail->hiv_screening_test ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="on_arv_anti_retrovirial" class="col-xs-3 col-form-label">On ARV (Anti Retrovirial) <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                  <textarea name="on_arv_anti_retrovirial" class="form-control" placeholder="On ARV (Anti Retrovirial)" rows="7"><?php echo $patient->patient_detail->on_arv_anti_retrovirial ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="malaria_screening_test" class="col-xs-3 col-form-label">Malaria/screening/test <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                  <textarea name="malaria_screening_test" class="form-control" placeholder="Malaria/screening/test" rows="7"><?php echo $patient->patient_detail->malaria_screening_test ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="hepatitis_b_screening_test" class="col-xs-3 col-form-label">Hepatitis B/screening/test <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                  <textarea name="hepatitis_b_screening_test" class="form-control" placeholder="Hepatitis B/screening/test" rows="7"><?php echo $patient->patient_detail->hepatitis_b_screening_test ?></textarea>
                                </div>
                            </div>


                            <div class="form-group row">
                                <label for="physical_exams" class="col-xs-3 col-form-label">Physical Exams <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                  <textarea name="physical_exams" class="form-control" placeholder="Physical Exams" rows="7"><?php echo $patient->patient_detail->physical_exams ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="treatments" class="col-xs-3 col-form-label">Treatments <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                  <textarea name="treatments" class="form-control" placeholder="Treatments" rows="7"><?php echo $patient->patient_detail->treatments ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="pih_anaemia_screening" class="col-xs-3 col-form-label">PIH and Anaemia Screening <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                 <textarea name="pih_anaemia_screening" class="form-control" placeholder="PIH and Anaemia Screening" rows="7"><?php echo $patient->patient_detail->pih_anaemia_screening ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="advise_counsel" class="col-xs-3 col-form-label">Advise/Counsel <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                  <textarea name="advise_counsel" class="form-control" placeholder="Advise/Counsel" rows="7"><?php echo $patient->patient_detail->advise_counsel ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="preventive_measures" class="col-xs-3 col-form-label">Preventive Measures <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                  <textarea name="preventive_measures" class="form-control" placeholder="Preventive Measures" rows="7"><?php echo $patient->patient_detail->preventive_measures ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="adherence_to_treatment" class="col-xs-3 col-form-label">Adherence to Treatment (HIV, malaria) <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                  <textarea name="adherence_to_treatment" class="form-control" placeholder="Adherence to treatment (HIV, malaria)" rows="7"><?php echo $patient->patient_detail->adherence_to_treatment ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="bleeding_during_pregnancy" class="col-xs-3 col-form-label">Bleeding during Pregnancy <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                  <textarea name="bleeding_during_pregnancy" class="form-control" placeholder="Bleeding during Pregnancy" rows="7"><?php echo $patient->patient_detail->bleeding_during_pregnancy ?></textarea>
                                </div>
                            </div>

                             <div class="form-group row">
                                <label for="vaccination_status" class="col-xs-3 col-form-label">Vaccination Status <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                  <textarea name="vaccination_status" class="form-control" placeholder="Vaccination Status" rows="7"><?php echo $patient->patient_detail->vaccination_status
                                   ?></textarea>
                                </div>
                            </div>



                            <!-- if patient picture is already uploaded -->
                            <!-- <?php if(!empty($patient->picture)) {  ?>
                            <div class="form-group row">
                                <label for="picturePreview" class="col-xs-3 col-form-label"></label>
                                <div class="col-xs-9">
                                    <img src="<?php echo base_url($patient->picture) ?>" alt="Picture" class="img-thumbnail" />
                                </div>
                            </div>
                            <?php } ?>

                            <div class="form-group row">
                                <label for="picture" class="col-xs-3 col-form-label"><?php echo display('picture') ?></label>
                                <div class="col-xs-9">
                                    <input type="file" name="picture" id="picture" value="<?php echo $patient->picture ?>">
                                    <input type="hidden" name="old_picture" value="<?php echo $patient->picture ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="address" class="col-xs-3 col-form-label"><?php echo display('address') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <textarea name="address" class="form-control"  placeholder="<?php echo display('address') ?>" maxlength="140" rows="7"><?php echo $patient->address ?></textarea>
                                </div>
                            </div>  -->
 
                            <div class="form-group row">
                                <label class="col-sm-3"><?php echo display('status') ?></label>
                                <div class="col-xs-9">
                                    <div class="form-check">
                                        <label class="radio-inline">
                                        <input type="radio" name="status" value="1" <?php echo  set_radio('status', '1', TRUE); ?> ><?php echo display('active') ?>
                                        </label>
                                        <label class="radio-inline">
                                        <input type="radio" name="status" value="0" <?php echo  set_radio('status', '0'); ?> ><?php echo display('inactive') ?>
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