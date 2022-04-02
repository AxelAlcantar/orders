<?php
function recently_products(){
	global $con;
	$id_moneda=get_id('business_profile','currency_id','id','1');
	$array_moneda=get_currency($id_moneda);
	$precision_moneda=$array_moneda['currency_precision'];
	$simbolo_moneda=$array_moneda['currency_symbol'];
	$sepador_decimal_moneda=$array_moneda['currency_decimal_separator'];
	$sepador_millar_moneda=$array_moneda['currency_thousand_separator'];
	
	$sql=mysqli_query($con,"select * from  products, manufacturers where products.manufacturer_id=manufacturers.id order by product_id desc limit 0, 5");
	?>
	<ul class="products-list product-list-in-box">
	<?php
	while ($rw=mysqli_fetch_array($sql)){
		$product_id=$rw['product_id'];
		$product_name= $rw['product_name'];
		$selling_price= $rw['selling_price'];
		$model= $rw['model'];
		$image_path	= $rw['image_path'];
		?>
		<li class="item">
            <div class="product-img">
                <img src="<?php echo $image_path;?>" alt="Product Image">
            </div>
            <div class="product-info">
				<a href="edit_product.php?id=<?php echo $product_id;?>" class="h4 fw-bolder"><?php echo $product_name;?> <span class="label bg-buttons pull-right"><?php echo number_format($selling_price,$precision_moneda,$sepador_decimal_moneda,$sepador_millar_moneda);?></span></a>
                <span class="product-description">
                    <?php echo $model;?>
                </span>
            </div>
        </li><!-- /.item -->		
		<?php
	}
	?>
	</ul>
	<?php
	
}
function latest_order(){
	global $con;
	$id_moneda=get_id('business_profile','currency_id','id','1');
	$array_moneda=get_currency($id_moneda);
	$precision_moneda=$array_moneda['currency_precision'];
	$simbolo_moneda=$array_moneda['currency_symbol'];
	$sepador_decimal_moneda=$array_moneda['currency_decimal_separator'];
	$sepador_millar_moneda=$array_moneda['currency_thousand_separator'];
	
	$sql=mysqli_query($con,"select * from purchases_order where client_id>0 order by 	purchase_order_id desc limit 0,10");
	while ($rw=mysqli_fetch_array($sql)){
		$purchase_order_id=$rw['purchase_order_id'];
		
		$client_id=$rw['client_id'];
		$sql_s=mysqli_query($con,"select name from clients where id='".$client_id."'");
		$rw_s=mysqli_fetch_array($sql_s);
		$client_name=$rw_s['name'];
		$date_added=$rw['created_at'];
		list($date,$hora)=explode(" ",$date_added);
		list($Y,$m,$d)=explode("-",$date);
		$fecha=$d."-".$m."-".$Y;
		$total=$rw['total'];
		?>
	<tr>
        <td><a href="edit_purchase_order.php?id=<?php echo $purchase_order_id;?>"><?php echo $purchase_order_id;?></a></td>
        <td><?php echo $client_name;?></td>
        <td><?php echo $fecha;?></td>
        <td class='text-right'><?php echo number_format($total,$precision_moneda,$sepador_decimal_moneda,$sepador_millar_moneda);?></td>
    </tr>
		<?php
		
	}
}


	
?>