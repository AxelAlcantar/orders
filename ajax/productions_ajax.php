<?php
	include("is_logged.php");//Archivo comprueba si el usuario esta logueado
	/* Connect To Database*/
	require_once ("../config/db.php");
	require_once ("../config/conexion.php");
	require_once ("../libraries/inventory.php");//Contiene funcion que controla stock en el inventario
	//Inicia Control de Permisos
	include("../config/permisos.php");
	$user_id = $_SESSION['user_id'];
	get_cadena($user_id);
	$modulo="Productos";
	permisos($modulo,$cadena_permisos);
	//Finaliza Control de Permisos
	if (isset($_REQUEST["id"])){//codigo para eliminar 
	$id=$_REQUEST["id"];
	$id=intval($id);
	if ($permisos_eliminar==1){//Si cuenta por los permisos bien
	$query_validate=mysqli_query($con,"SELECT product_id from products where product_id='".$id."'");
	$count=mysqli_num_rows($query_validate);
	
	if ($count==0){
		if($delete=mysqli_query($con, "DELETE FROM products WHERE product_id='$id'") ){
				$aviso="Bien hecho!";
				$msj="Datos eliminados satisfactoriamente.";
				$classM="alert alert-success";
				$times="&times;";	
			}
			else
			{
				$aviso="¡Aviso!";
				$msj="Error al eliminar los datos ".mysqli_error($con);
				$classM="alert alert-danger";
				$times="&times;";					
			}
	} 
	else 
		{
			$aviso="¡Aviso!";
			$msj="Error al eliminar los datos. El producto se encuentra vinculado al inventario";
			$classM="alert alert-danger";
			$times="&times;";
		}
	
			
		
		
	} else {//No cuenta con los permisos
		$aviso="¡Acceso denegado!";
		$msj="No cuentas con los permisos necesario para acceder a este m?dulo.";
		$classM="alert alert-danger";
		$times="&times;";
	}
}
$action = (isset($_REQUEST['action'])&& $_REQUEST['action'] !=NULL)?$_REQUEST['action']:'';
if($action == 'ajax'){
	echo $product_code = mysqli_real_escape_string($con,(strip_tags($_REQUEST['product_code'], ENT_QUOTES)));
	$query = mysqli_real_escape_string($con,(strip_tags($_REQUEST['query'], ENT_QUOTES)));
	$tables="products, manufacturers";
	$campos="products.product_id, products.product_name, products.status, products.image_path, products.product_code, products.stock";
	$sWhere="products.manufacturer_id=manufacturers.id";
	$sWhere.=" and products.product_name LIKE '%".$query."%'";
	$sWhere.=" and products.product_code LIKE '%".$product_code."%'";
	
	
	
	include 'pagination.php'; //include pagination file
	//pagination variables
	$page = (isset($_REQUEST['page']) && !empty($_REQUEST['page']))?$_REQUEST['page']:1;
	$per_page = intval($_REQUEST['per_page']); //how much records you want to show
	$adjacents  = 4; //gap between pages after number of adjacents
	$offset = ($page - 1) * $per_page;
	//Count the total number of row in your table*/
	$count_query   = mysqli_query($con,"SELECT count(*) AS numrows FROM $tables where $sWhere ");
	if ($row= mysqli_fetch_array($count_query)){$numrows = $row['numrows'];}
	else {echo mysqli_error($con);}
	$total_pages = ceil($numrows/$per_page);
	$reload = './permisos.php';
	//main query to fetch the data
	$query = mysqli_query($con,"SELECT $campos FROM  $tables where $sWhere LIMIT $offset,$per_page");
	//loop through fetched data
	
	if (isset($_REQUEST["id"])){
	?>
			<div class="<?php echo $classM;?>">
				<button type="button" class="close" data-dismiss="alert"><?php echo $times;?></button>
				<strong><?php echo $aviso?> </strong>
				<?php echo $msj;?>
			</div>	
	<?php
		}
	
	if ($numrows>0){
		include("../currency.php");//Archivo que obtiene los datos de la moneda
	?>
	
	<div class="row">
		<div class="col-md-12">
			<div class="borde-redondeado">
				<div class="box-header">
				<h2 class="fw-bolder">PRODUCTOS</h2>
				</div><!-- /.box-header -->
				<div class="box-body">
				<div class="table-responsive">
					<table class="table table-condensed table-hover">
						<tr>
							<th class='text-center'>Código</th>
							<th class='text-center'>Imagen</th>
							<th>Producto </th>
							<th class='text-center'>Estado</th>
							<th class='text-center'>Stock</th>
							<th></th>
						</tr>
						<?php 
						$finales=0;
						while($row = mysqli_fetch_array($query)){	
							$product_id=$row['product_id'];
							$product_code=$row['product_code'];
							$product_name=$row['product_name'];
							$status=$row['status'];
							$stock=$row['stock'];
							$image_path=$row['image_path'];
							if ($status==1){
								$lbl_status="Disponible";
								$lbl_class='label label-success';
							}else {
								$lbl_status="Inactivo";
								$lbl_class='label label-danger';
							}						
							$finales++;
						?>	
						<tr>
							<td class='text-center'><?php echo $product_code;?></td>
							<td class='text-center'>
								<img src="<?php echo $image_path;?>" alt="Product Image" class='img-rounded' width="60">
							</td>
							<td><?php echo $product_name;?></td>
							<td class='text-center'>
								<span class="<?php echo $lbl_class;?>"><?php echo $lbl_status;?></span>
							</td>
							<td class="text-center"><?php echo $stock;?></td>
							
							<td class="pull-right">
							<div class="btn-group">
									<button type="button" class="btn btn-default  btn-rounded dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Acciones <span class="fa fa-caret-down"></span></button>
								<ul class="dropdown-menu">
									<?php if ($permisos_editar==1){?>
									<li><a href="edit_production.php?id=<?php echo $product_id;?>"><i class='fa fa-edit'></i> Editar</a></li>
									<?php } ?>
								</ul>
							</div><!-- /btn-group -->
                    		</td>
						</tr>
						<?php }?>
						<tr>
							<td colspan='12'> 
								<?php 
									$inicios=$offset+1;
									$finales+=$inicios -1;
									echo "Mostrando $inicios al $finales de $numrows registros";
									echo paginate($reload, $page, $total_pages, $adjacents);
								?>
							</td>
						</tr>			
					</table>
				</div>	
				</div><!-- /.box-body -->
				
			</div><!-- /.box -->
		</div><!-- /.col -->
	</div><!-- /.row -->	
	<?php	
	}	
}
?>          
		  
