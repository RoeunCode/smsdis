@extends('layout')
@section('content')
	<meta name="_token" content="{{ csrf_token() }}"/>
	<style type="text/css">
		img {
  max-width: 100%; /* This rule is very important, please do not ignore this! */
}

#canvas {
  height: 300px;
  width: 300px;
  background-color: #ffffff;
  cursor: default;
  border: 1px solid black;
}
.cropper-crop {
	display: none;
}
.cropper-bg {
	background: none;
}
	</style>
	<div class="card">
		<div class="card-header bg-blue bg-inverse">
			<h5>Add New Promotion</h5>
			<div style="float: right">
				<a class="btn btn-sm btn-info" href="{{ route('promotion.index') }}"><i class="fa fa-list" aria-hidden="true"></i> All Promotion</a>
			</div>
		</div>
		<div class="card-block">
			@if(session()->has('msg'))
    			<div class="alert alert-success" id="msg_success">
        			{{ session()->get('msg') }}
    			</div>
			@endif
			<form id="form_add" method="POST" autocomplete="off" enctype="multipart/form-data">
				@csrf
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-4">
						<label>Title</label>
						<input type="text" class="form-control" id="title" name="title" placeholder="Enter Your Title Promotion">
						<p>@error('title') {{$message}} @enderror</p>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4">
						<label>Category</label>
						<select class="form-control" id="cat" name="cat">
							<option selected="true" disabled="true">Choose Category</option>
							<option value="1">All</option>
							<option value="2">BattamBang</option>
							<option value="3">BMC</option>
						</select>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4">
						<label>Image</label>
						<input type="file" class="form-control item-img file" id="file" name="file" accept="image/*"/>
						<p>@error('file') {{$message}} @enderror</p>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<label>Description</label>
						<textarea class="form-control description" id="description" name="description" rows="10" cols="80"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6">
	                    <button class="btn btn-success btn-sm" type="submit" id="save_data"><i class="fa fa-plus"></i> Save</button>
	                </div>
				</div>
			</form>
		</div>
	</div>

	<div class="modal fade" id="cropImagePop" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Crop Image</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body">
				    <div>
  						<canvas id="canvas">
    						Your browser does not support the HTML5 canvas element.
  						</canvas>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="btnCrop" class="btn btn-primary">Crop</button>
        			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      			</div>
			</div>
		</div>
	</div>

@endsection

@section('footer')
	<script type="text/javascript">
        // when click save button
            $('#form_add').on('submit', function(e) {
              	e.preventDefault()
                $.ajax({
                    url:'{{ route('promotion.store') }}',
				    type:'POST',
				    data: new FormData(this),
				    contentType: false,
				    cache:false,
				    processData: false,
				    dataType:"json",
				    success: function(data) {
                        swal.fire({
                            title: 'Success!',
                            text: "Data has been inserted!",
                            type: "success"
                        })
                    },
                    error: function() {
                        swal.fire({
                            title: 'Oops...',
                            text: "Something went wrong!",
                            type: "error"
                        })
                    },
                    complete: function() {
		       			$('#form_add').each(function() {
							this.reset();
						})
						$('.description').summernote('reset');
		        	},
        		});
            });
	</script>
@endsection