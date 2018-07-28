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
                            <dt><?php echo display('package_name') ?></dt><dd>&nbsp;<?php echo $package->name ?></dd>
                            <dt><?php echo display('description') ?></dt><dd>&nbsp;<?php echo $package->description ?></dd>
                            <dt><?php echo display('disease_details') ?></dt>
                            <dd>&nbsp;
                            <?php 
                                $services = json_decode($package->services, true);  
                                echo "<table border='1' width='50%'>";
                                echo "<tr class='bg-primary'><th style='padding:2px 5px'>SL</th><th style='padding:2px 5px'>Name</th><th style='padding:2px 5px'>Quantity</th><th style='padding:2px 5px'>Rate</th></tr>";
                                for($i=0;$i<count($services);$i++)
                                {
                                    if(isset($services[$i]))
                                    echo "<tr><td style='padding:2px 5px'>".($i+1)."</td><td style='padding:2px 5px'>".$services[$i]['name']."</td><td style='padding:2px 5px'>".$services[$i]['quantity']."</td><td style='padding:2px 5px'>".$services[$i]['amount']."</td></tr>"; 
                                } 
                                echo "</table>";
                            ?>
                            </dd> 
                            <dt><?php echo display('discount') ?></dt><dd>&nbsp;<?php echo $package->discount ?></dd>
                            <dt><?php echo display('status') ?></dt><dd>&nbsp;<?php echo (!empty($package->status)?
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
