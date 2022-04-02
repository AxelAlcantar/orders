<?php
	
	if (isset($_GET['id'])){
		$product_id=intval($_GET['id']);
		$sql_product=mysqli_query($con,"select * from products where  product_id='$product_id'");
		$count=mysqli_num_rows($sql_product);
		$rw_product=mysqli_fetch_array($sql_product);
		$product_code=$rw_product['product_code'];
		$product_name=$rw_product['product_name'];
		$stock=$rw_product['stock'];
		$image_path=$rw_product['image_path'];
	}
	
	if (!isset($_GET['id']) or $count!=1){
		header("location: production.php");
	}
	
	
	
	
?>
<!DOCTYPE html>
<html>
  <head>
	<?php include("head.php");?>
  </head>
  <body class="hold-transition <?php echo $skin;?> sidebar-mini">
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
		  <h1 class="fw-bolder">EDITAR PRODUCTO</h1>
		
		</section>
		<!-- Main content -->
        <section class="content">
		<div class="row">
		
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="borde-redondeado">
            <div class="box-body box-profile">
			<div id="load_img">
              <img class=" img-responsive" src="<?php echo 	$image_path;?>" alt="Bussines profile picture">
			  </div>

              <h3 class="profile-username text-center"><?php echo $product_name;?></h3>
              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          
        </div>
        <!-- /.col -->
        <div class="col-md-9">
			<form name="update_register" id="update_register" class="form-horizontal" method="post" enctype="multipart/form-data">
				
			
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#details" data-toggle="tab" aria-expanded="false">Detalles del producto</a></li>
            </ul>
            <div class="tab-content">
              <div id="resultados_ajax"></div>
           
             

              <div class="tab-pane active" id="details">
              
                  <div class="form-group ">
                    <label for="product_code" class="col-sm-2 control-label">Código</label>

                    <div class="col-sm-4">
                      <input type="text" class="form-control form-rounded disabled" id="product_code" name="product_code"  value="<?php echo $product_code;?>" required>
					  <input type="hidden"  id="product_id" name="product_id"  value="<?php echo $product_id;?>" >  
                    </div>
					
					<label for="product_name" class="col-sm-2 control-label">Nombre</label>

                    <div class="col-sm-4">
                      <input type="text" class="form-control form-rounded disabled" id="product_name" name="product_name" value="<?php echo $product_name;?>" required>
                    </div>
					
                  </div>
                  <div class="form-group">
					<label for="stock" class="col-sm-2 control-label">Stock</label>
                    <div class="col-sm-4">
						<input type="number" class="form-control form-rounded" name="stock" id="stock" value="<?php echo $stock;?>">
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-6">
                      <button type="submit" class="btn bg-buttons btn-rounded actualizar_datos">Guardar datos</button>
                    </div>
                  </div>
               
              </div>
              <!-- /.tab-pane -->
			  
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
		  </form>
        </div>
        <!-- /.col -->
      </div>
     
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
	

	<script>
		function upload_image(product_id){
				$("#load_img").text('Cargando...');
				var inputFileImage = document.getElementById("imagefile");
				var file = inputFileImage.files[0];
				var data = new FormData();
				data.append('imagefile',file);
				data.append('product_id',product_id);
				
				
				$.ajax({
					url: "ajax/imagen_product_ajax.php",        // Url to which the request is send
					type: "POST",             // Type of request to be send, called as method
					data: data, 			  // Data sent to server, a set of key/value pairs (i.e. form fields and values)
					contentType: false,       // The content type used when sending data to the server.
					cache: false,             // To unable request pages to be cached
					processData:false,        // To send DOMDocument or non processed data file it is set to false
					success: function(data)   // A function to be called if request succeeds
					{
						$("#load_img").html(data);
						
					}
				});
				
			}
    </script>
	<script>
		$( "#update_register" ).submit(function( event ) {
		  $('.actualizar_datos').attr("disabled", true);
		  var parametros = $(this).serialize();
		  $.ajax({
				type: "POST",
				url: "./ajax/modificar/production.php",
				data: parametros,
				 beforeSend: function(objeto){
					$("#resultados_ajax").html("Mensaje: Cargando...");
				  },
				success: function(datos){
				$("#resultados_ajax").html(datos);
				$('.actualizar_datos').attr("disabled", false);
				window.setTimeout(function() {
				$(".alert").fadeTo(500, 0).slideUp(500, function(){
				$(this).remove();});}, 5000);
				
			  }
		});		
		  event.preventDefault();
		});
	</script>
	
  </body>
</html>
