 
<form class="form-horizontal" method="post" id="new_register" name="new_register">
<!-- Modal -->
<div class="modal fade" id="modal_register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="card-rounded">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title fw-bolder">NUEVA CATEGORÍA</h4>
      </div>
      <div class="modal-body">
	  
      <div class="form-group">
		<label for="name" class="col-sm-3 control-label">Nombre</label>
		<div class="col-sm-6">
		  <input type="text" class="form-control form-rounded" id="name" name="name" placeholder="Ingresa la categoría" required>
		</div>
	  </div>
	  

	 
	  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-rounded" data-dismiss="modal">Cerrar</button>
        <button type="submit" id="guardar_datos" class="btn bg-buttons btn-rounded">Registrar</button>
      </div>
    </div>
  </div>
</div>
</form>