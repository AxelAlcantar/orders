<?php
	if (!isset($con)){
		exit;
	}
?>
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="dist/img/profile.png" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p><?php echo $_SESSION['full_name']; ?></p>
              <a href="#"><i class="fa fa-circle text-success"></i> En línea</a>
            </div>
          </div>
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="<?php if (isset($home) and $home==1){echo "active";}?>">
              <a href="index.php">
                <i class="fa fa-home"></i><span>Inicio</span> 
              </a>
              
            </li>
			
			<?php 
				permisos_menu('Pedidos',$cadena_permisos);
				if ($permisos_ver_menu==1){
			?>
			<li class="<?php if (isset($purchase_order) and $purchase_order==1){echo "active";}?>">
              <a href="purchase_order.php">
                <i class="fa fa-shopping-cart"></i> <span>Órdenes</span>
              </a>
            </li>
			<?php } ?>
			
			<?php 
				permisos_menu('Productos',$cadena_permisos);
				$permisos_productos=$permisos_ver_menu;
				
				if ($permisos_productos==1){
			?>
            <li class="<?php if (isset($catalog) and $catalog==1){echo "active";}?> treeview">
              <a href="#">
                <i class="fa fa-th-large"></i>
                <span>Inventario</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
			<?php 
				if ($permisos_productos==1){
			?>	
               	<li class="<?php if (isset($products) and $products==1){echo "active";}?>"><a href="products.php"><i class="glyphicon glyphicon-barcode"></i> Productos</a></li>
			<?php } ?>
				
			<?php 
				permisos_menu('Fabricantes',$cadena_permisos);
				if ($permisos_ver_menu==1){
			?>
				 <li class="<?php if (isset($manufacturers) and $manufacturers==1){echo "active";}?>"><a href="manufacturers.php"><i class="fa fa-tag"></i> Fabricantes</a></li>
            <?php } ?>
			
			<?php 
				permisos_menu('Categorias',$cadena_permisos);
				if ($permisos_ver_menu==1){
			?>
				 <li class="<?php if (isset($categories) and $categories==1){echo "active";}?>"><a href="categories.php"><i class="fa fa-tags"></i> Categorías</a></li>
            <?php } ?>  
			
			<?php 
				permisos_menu('Producción',$cadena_permisos);
				if ($permisos_ver_menu==1){
			?>
				 <li class="<?php if (isset($productions) and $productions==1){echo "active";}?>"><a href="production.php"><i class="fa fa-tag"></i> Producción</a></li>
            <?php } ?>

			  </ul>
            </li>
			<?php } ?>


			
			
			
			<?php 
				
				permisos_menu('Clientes',$cadena_permisos);
				$permisos_clientes=$permisos_ver_menu;
				if ($permisos_clientes==1){
			?>
			
			<li class="<?php if (isset($clients) and $clients==1){echo "active";}?>">
              <a href="clients.php">
                <i class="fa fa-users"></i> <span>Clientes</span>
              </a>
            </li>
			
          
			<?php } ?>
			
			
			
			
			
			
			
			
			<?php 
				permisos_menu('Reportes',$cadena_permisos);
				if ($permisos_ver_menu==1){
			?>
            <li class="<?php if (isset($reports) and $reports==1){echo "active";}?> treeview">
              <a href="#">
                <i class="glyphicon glyphicon-signal"></i> <span>Reportes</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
				<li class="<?php if (isset($purchases_order_report) and $purchases_order_report==1){echo "active";}?>"><a href="purchases_order_report.php"><i class="fa fa-pie-chart "></i> Pedidos</a></li>
              	
			 </ul>
            </li>
			<?php } ?>
			<?php 
				permisos_menu('Configuracion',$cadena_permisos);
				$permisos_perfil=$permisos_ver_menu;
				permisos_menu('Sucursales',$cadena_permisos);
				$permisos_sucursales=$permisos_ver_menu;
				
				
				
				if ($permisos_perfil=1 or $permisos_sucursales==1){
				
			?>
			
			<li class="<?php if (isset($config) and $config==1){echo "active";}else {echo "";}?> treeview">
              <a href="#">
                <i class="fa fa-cog"></i> <span>Ajustes</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
			  <?php if ($permisos_perfil==1){ ?>
                <li class="<?php if (isset($business_profile) and $business_profile==1){echo "active";}else {echo "";}?>"><a href="business_profile.php"><i class="glyphicon glyphicon-briefcase"></i> Perfil de la empresa</a></li>
			  <?php }?>
				<?php if ($permisos_sucursales==1){ ?>	   
				<li class="<?php if (isset($branch_offices) and $branch_offices==1){echo "active";}else {echo "";}?>"><a href="branch_offices.php"><i class="fa fa-shopping-bag "></i> Sucursales</a></li>
				<?php }?>
				
              </ul>
            </li>
			
			<?php } ?>
			<?php 
				permisos_menu('Permisos',$cadena_permisos);
				$permisos_grupos=$permisos_ver_menu;
				permisos_menu('Usuarios',$cadena_permisos);
				$permisos_usuarios=$permisos_ver_menu;
				if ($permisos_grupos==1 or $permisos_usuarios==1){
			?>
			<li class="<?php if (isset($access) and $access==1){echo "active";}else {echo "";}?> treeview">
              <a href="#">
                <i class="fa fa-lock"></i> <span>Administrar usuarios</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
			<?php 
				if ($permisos_grupos==1){
			?>  
                <li class="<?php if (isset($groups) and $groups==1){echo "active";}else {echo "";}?>"><a href="group_list.php"><i class="glyphicon glyphicon-briefcase"></i> Grupos de usuarios</a></li>
			<?php } ?>	
			<?php 
				if ($permisos_usuarios==1){
			?>
				<li class="<?php if (isset($users) and $users==1){echo "active";}else {echo "";}?>"><a href="user_list.php"><i class="fa fa-users"></i> Usuarios</a></li>
			<?php } ?>	
              </ul>
            </li>
            <?php } ?>
            
           
          </ul>
        </section>
        <!-- /.sidebar -->