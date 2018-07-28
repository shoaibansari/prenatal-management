<div class="row">
    <div class="col-sm-12" id="PrintMe">
        <div  class="panel panel-default thumbnail"> 
            <div class="panel-heading no-print">
                 <div class="btn-group">
                    <button type="button" onclick="printContent('PrintMe')" class="btn btn-success" ><i class="fa fa-print"></i></button>
                </div>
            </div>

            <div class="panel-body">  
                <div class="row">
                    <div class="col-sm-12"> 
                        <dl class="dl-horizontal"> 
                            <dt><?php echo display('insurance_name') ?></dt><dd><?php echo $insurance->insurance_name ?></dd>
                            <dt><?php echo display('service_tax') ?></dt><dd><?php echo $insurance->service_tax ?></dd>
                            <dt><?php echo display('discount') ?></dt><dd><?php echo $insurance->discount ?></dd>
                            <dt><?php echo display('remark') ?></dt><dd><?php echo $insurance->remark ?></dd>
                            <dt><?php echo display('insurance_no') ?></dt><dd><?php echo $insurance->insurance_no ?></dd>
                            <dt><?php echo display('insurance_code') ?></dt><dd><?php echo $insurance->insurance_code ?></dd>
                            <dt><?php echo display('disease_charge') ?></dt>
                            <dd>
                                <?php 
                                $disease = json_decode($insurance->disease_charge, true);
                                echo "<table border='1' width='50%'>";
                                echo "<tr class='bg-primary'><th style='padding:2px 5px'>".display('name')."</th><th style='padding:2px 5px'>".display('charge')."</th></tr>";
                                if ($disease>0)
                                foreach ($disease as $key => $value)
                                echo "<tr style='padding:2px 5px'><td style='padding:2px 5px'>$key</td><td style='padding:2px 5px'>$value</td></tr>";
                                echo "</table>";
                                ?>
                            </dd> 
                            <dt><?php echo display('hospital_rate') ?></dt><dd><?php echo $insurance->hospital_rate ?></dd>
                            <dt><?php echo display('insurance_rate') ?></dt><dd><?php echo $insurance->insurance_rate ?></dd>
                            <dt><?php echo display('total') ?></dt><dd><?php echo $insurance->total ?></dd>
                            <dt><?php echo display('status') ?></dt><dd><?php echo (!empty($insurance->status)?
                            display('active'):display('inactive')) ?></dd>
                        </dl> 
                    </div>
                </div>  

            </div> 

            <div class="panel-footer">
                <div class="text-center">
                    <strong><?php echo $this->session->userdata('title') ?></strong>
                    <p class="text-center"><?php echo $this->session->userdata('address') ?></p>
                </div>
            </div>
        </div>
    </div>
</div>

