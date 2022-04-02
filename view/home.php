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
      <!-- Columna lateral izquierda. contiene el logo y la barra lateral -->
      <aside class="main-sidebar">
		<?php include("main-sidebar.php");?>
      </aside>

      <!-- Content Wrapper. Contiene contenido de página -->
      <div class="content-wrapper">
        <!-- Content Header (Paguina header) -->
		<?php if ($permisos_ver==1){?>
		<section class="content-header">
          <h1 class="fw-bolder">
            Y & M | HOME
          </h1>
          <ol class="breadcrumb">
            <li class="active"><i></i> Inicio</li>
            
          </ol>
        </section>
		
		
		        <!-- Main content -->
        <section class="content">
          <!-- Info boxes -->


          <!-- Main row -->
          <div class="row">
            <!-- Left col -->
            <div class="col-md-8">
              <!-- TABLA: ORDENES RECIENTES -->
              <div class="borde-redondeado">
                <div class="box-header with-border">
                  <h4 class="fw-bolder">ÓRDENES RECIENTES</h4>

                </div><!-- /.box-header -->
                <div class="box-body">
                  <div class="table-responsive">
                    <table class="table no-margin">
                      <thead>
                        <tr>
                          <th>Número</th>
                          <th>Cliente</th>
                          <th>Fecha</th>
                          <th class='text-right'>Total	</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php 
						latest_order();
						?>
                      </tbody>
                    </table>
                  </div><!-- /.table-responsive -->
                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
                  <a href="new_purchase_order.php" class="btn btn-sm bg-buttons btn-rounded pull-left">Nueva orden</a>
                  <a href="purchase_order.php" class="btn btn-sm bg-buttons btn-rounded pull-right">Ver todas las órdenes</a>
                </div><!-- /.box-footer -->
              </div><!-- /.box -->
            </div><!-- /.col -->

            <div class="col-md-4">
 
              <!-- NUEVOS PRODUCTOS -->
              <div class="borde-redondeado">
                <div class="box-header with-border">
                  <h4 class="fw-bolder">NUEVOS PRODUCTOS</h4>
                </div><!-- /.box-header -->
                <div class="box-body">
				<?php 
					recently_products();
				?>
                 
                </div><!-- /.box-body -->
                <div class="box-footer text-center">
                  <a href="products.php"  class="btn btn-sm bg-buttons btn-flat btn-block btn-rounded pull-center">Ver todos los productos</a>
                </div><!-- /.box-footer -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
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
	<?php //include("js.php");?>
  </body>
</html>

 <!-- jQuery -->
    <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap  -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- ChartJS  -->
    <script src="plugins/chartjs/Chart.min.js"></script>
    <!-- FastClick -->
    <script src="plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js"></script>
    <script>
      $(function () {
        /* ChartJS
         * -------
         * Aquí SE crean los gráficos usando ChartJS
         */

        //--------------
        //- AREA CHART -
        //--------------
        var areaChartData = {
          labels: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio","Agosto","Septiembre","Octubre","Noviembre",
          "Diciembre"],
          datasets: [
            {
              label: "Compras",
              fillColor: "rgba(210, 214, 222, 1)",
              strokeColor: "rgba(210, 214, 222, 1)",
              pointColor: "rgba(210, 214, 222, 1)",
              pointStrokeColor: "#c1c7d1",
              pointHighlightFill: "#fff",
              pointHighlightStroke: "rgba(220,220,220,1)",
              data: [<?php echo sum_purchases_month(1);?>, <?php echo sum_purchases_month(2);?>, <?php echo sum_purchases_month(3);?>, 
              <?php echo sum_purchases_month(4);?>, <?php echo sum_purchases_month(5);?>, <?php echo sum_purchases_month(6);?>,
               <?php echo sum_purchases_month(7);?>,<?php echo sum_purchases_month(8);?>,<?php echo sum_purchases_month(9);?>,
               <?php echo sum_purchases_month(10);?>,<?php echo sum_purchases_month(11);?>,<?php echo sum_purchases_month(12);?>]
            },
            {
              label: "Ventas",
              fillColor: "rgba(60,141,188,0.9)",
              strokeColor: "rgba(60,141,188,0.8)",
              pointColor: "#3b8bba",
              pointStrokeColor: "rgba(60,141,188,1)",
              pointHighlightFill: "#fff",
              pointHighlightStroke: "rgba(60,141,188,1)",
              data: [<?php echo sum_sales_month(1);?>, <?php echo sum_sales_month(2);?>, <?php echo sum_sales_month(3);?>,
               <?php echo sum_sales_month(4);?>, <?php echo sum_sales_month(5);?>, <?php echo sum_sales_month(6);?>, 
               <?php echo sum_sales_month(7);?>,<?php echo sum_sales_month(8);?>,<?php echo sum_sales_month(9);?>,
               <?php echo sum_sales_month(10);?>,<?php echo sum_sales_month(11);?>,<?php echo sum_sales_month(12);?>]
            }
          ]
        };
        //-------------
        //- BAR CHART -
        //-------------
        var barChartCanvas = $("#barChart").get(0).getContext("2d");
        var barChart = new Chart(barChartCanvas);
        var barChartData = areaChartData;
        barChartData.datasets[1].fillColor = "#00a65a";
        barChartData.datasets[1].strokeColor = "#00a65a";
        barChartData.datasets[1].pointColor = "#00a65a";
        var barChartOptions = {
          //Boolean - Si la escala debe comenzar en cero o un orden de magnitud hacia abajo desde el valor más bajo
          scaleBeginAtZero: true,
          //Boolean - Si las líneas de cuadrícula se muestran en el gráfico
          scaleShowGridLines: true,
          //String - Color de las líneas de la cuadrícula
          scaleGridLineColor: "rgba(0,0,0,.05)",
          //Number - Ancho de las líneas de la cuadrícula
          scaleGridLineWidth: 1,
          //Boolean - Ya sea para mostrar líneas horizontales (excepto el eje X)
          scaleShowHorizontalLines: true,
          //Boolean - Ya sea para mostrar líneas verticales (excepto el eje Y)
          scaleShowVerticalLines: true,
          //Boolean - Si hay un trazo en cada barra
          barShowStroke: true,
          //Number - Ancho de píxel del trazo de la barra
          barStrokeWidth: 2,
          //Number - Espaciado entre cada uno de los conjuntos de valores X
          barValueSpacing: 5,
          //Number - Espaciado entre conjuntos de datos dentro de valores X
          barDatasetSpacing: 1,
          //String - A legend template
          legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
          //Boolean - Hacer que el gráfico sea responsibo
          responsive: true,
          maintainAspectRatio: true
        };

        barChartOptions.datasetFill = false;
        barChart.Bar(barChartData, barChartOptions);
      });
    </script>


	

