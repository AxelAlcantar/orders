<?php
	if ($permisos_ver==1){
	
	$purchase_order_id=intval($_GET['id']);
	list ($purchase_order_id,$create_at,$terms,$ship_via,$status,$note,$employee_id	,$client_id,$subtotal,$tax,$total,$includes_tax,$currency_id)=get_data("purchases_order","purchase_order_id",$purchase_order_id);
	$fecha=date("d/m/Y",strtotime($create_at));
	$_SESSION['purchase_order_id']=$purchase_order_id;
	list($id_cliente,$fecha_registro_cliente, $nombre_cliente)=get_data("clients","id",$client_id);
	
	}
	
?>
<!DOCTYPE html>
<html>
  <head>
  
	<?php include("head.php");?>
  </head>
  <body class="hold-transition <?php echo $skin;?> sidebar-mini">
  	<?php 
		if ($permisos_ver==1){
		include("modal/buscar_productos.php");
		}
	?>
    <div class="wrapper">
      <header class="main-header">
		<?php include("main-header.php");?>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
		<?php include("main-sidebar.php");?>
      </aside>
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
		<?php if ($permisos_ver==1){?>
        <section class="content-header">
		
		
		

                        <!-- *********************** Purchase ************************** -->
                        <div class="col-md-12 col-sm-12">
                            <form method="post">
                            <div class="">
                                <div class="box-header-background-light with-border">
                                    <h2 class="box-title fw-bolder p-4">DETALLES DE ORDEN</h2>
                                </div>

                                <div class="box-background">
                                <div class="box-body">
                                    <div class="row">

                                    <div class="col-md-4">

                                        <label class='fw-bolder'>CLIENTE:</label>
                                        <p><?php echo $nombre_cliente;?></p>


                                    </div>
                                    <div class="col-md-2">
                                        <label class='fw-bolder'>FECHA:</label>
                                        <p><?php echo $fecha;?></p>
                                    </div>
									<div class="col-md-2">

                                        <label class='fw-bolder'>NÚMERO DE ORDEN:</label>
                                       <p><?php echo $purchase_order_id;?></p>
                                    </div>
									
									<div class="col-md-2">
										<label class='fw-bolder'>ESTADO:</label>
                                        <br>
										<select class="form-rounded border-0 bg-transparent" disabled="">
											<option value="0" selected="" <?php if ($status==0){echo "selected";}?>>Pendiente</option>
											<option value="1" <?php if ($status==1){echo "selected";}?>>Aceptada</option>
											<option value="2" <?php if ($status==2){echo "selected";}?>>Rechazada</option>
											<option value="2" <?php if ($status==3){echo "selected";}?>>Compra</option>
										</select>

                                        
                                    </div>
									
									<div class="col-md-2">
										<label class='fw-bolder'>INCLUYE IVA: <?php (tax_txt);?></label>
                                        <br>
										<select name="is_taxeable" id="is_taxeable" class='form-rounded border-0 bg-transparent' disabled="">
											<option value="0" <?php if ($includes_tax==0){echo "selected";}?>>No</option>
											<option value="1" <?php if ($includes_tax==1){echo "selected";}?>>SÍ </option>
										</select>
									</div>
									
									
                                    </div>
									
									
									<div class="row">

                                    <div class="col-md-4">
										<label class='fw-bolder'>CODICIONES DE PAGO:</label>
                                        <br>
										<input type="text" class="form-rounded border-0 bg-transparent" name="condiciones"  value="<?php echo $terms;?>" disabled="">
										
                                    </div>
                                    <div class="col-md-3">
                                       <label class='fw-bolder'>NOMBRE DEL REPARTIDOR:</label>
										<input type="text" class="form-rounded border-0 bg-transparent" name="envio" value="<?php echo $ship_via;?>" disabled="">
                                    </div>
									<div class="col-md-5">
										<label class='fw-bolder'>RUTA DE ENVÍO:</label>
                                        <p><?php echo $note;?></p>
                                    </div>
									
									
                                    </div>
									

                                </div><!-- /.box-body -->
                                    </div>


                                <div class="box-footer">
									<?php 
										if($status!=3){
									?>
							
									
									<?php }?>
									
                                


                            </div>
                            <!-- /.box -->
                            </form>
                        </div>
                        <!--/.col end -->
						


                    </div>
					<div id="resultados" class='col-md-12' style="margin-top:4px;"></div><!-- Carga los datos ajax -->
            </div><!-- /.box-body -->
            
          </div><!-- /.box -->	
     
        </section><!-- /.content -->
		<?php 
		} else{
		?>	
		<section class="content">
			<div class="alert alert-danger">
				<h3>Acceso denegado! </h3>
				<p>No cuentas con los permisos necesario para acceder a este módulo.</p>
			</div>
		</section>		
		<?php
		}
		?>
      </div><!-- /.content-wrapper -->
      <?php include("footer.php");?>
    </div><!-- ./wrapper -->
	<?php include("js.php");?>
	<!-- Select2 -->
	
    <script src="plugins/select2/select2.full.min.js"></script>
	<script src="dist/js/VentanaCentrada.js"></script>
	<script>
	$(function () {
        //Initialize Select2 Elements
		$(".select2").select2();
		$( "#resultados" ).load("./ajax/detalles_orden_compra.php");
		
	});
	
		$(document).ready(function(){
			load(1);
			
		});

		function load(page){
			var q= $("#q").val();
			$("#loader").fadeIn('slow');
			$.ajax({
				url:'./ajax/productos_compras.php?action=ajax&page='+page+'&q='+q,
				 beforeSend: function(objeto){
				 $('#loader').html('<img src="./img/ajax-loader.gif"> Cargando...');
			  },
				success:function(data){
					$(".outer_div").html(data).fadeIn('slow');
					$('#loader').html('');
					
				}
			})
		}
		
					
				

	</script>
	
	
	
  </body>
</html>
