@extends('layout')
@section('content')
	<meta name="csrf-token" content="{!! csrf_token() !!}">
	<style type="text/css">
		.description {
			text-overflow: ellipsis;
  			overflow: hidden; 
  			width: 200px; 
  			height: 1.2em; 
  			white-space: nowrap;
		}
	</style>
	
	<div class="card">
		<div class="card-header bg-blue bg-inverse">
			<h5>All Promotion</h5>
			<div style="float: right">
				<a class="btn btn-sm btn-info" href="{{ route('promotion.create') }}"><i class="fa fa-plus-circle" aria-hidden="true"></i> Add Promotion</a>
			</div>
		</div>
		<div class="card-block">
			<table class="table table-bordered" id="tbl_promotion">
				<thead>
					<tr>
						<th>#</th>
						<th>Image</th>
						<th>Title</th>
						<th>Category</th>
						<th>Date</th>
						<th>Settings</th>
					</tr>
				</thead>
				<tbody>
					<?php $i = 1; ?>
					@foreach($p as $p)
						<tr>
							<td>{{ $i++ }}</td>
							<td>
								<img src="{{ asset('storage/imgs/'.$p->image) }}" style="width: 100px; height: 100px;" />
							</td>
							<td><p class="description">{{ $p->title }}</p></td>
							@if ($p->id_cat == '1')
								<td>All</td>
							@elseif($p->id_cat == '2')
								<td>Battambang</td>
							@elseif($p->id_cat == '3')
								<td>BMC</td>
							@endif
							<td>{{ $p->post_date }}</td>
							<td>
								<a href="{{ route('promotion.edit', $p->id) }}" class="btn btn-primary btn-sm" id="edit_data"><i class="fa fa-pen"></i></a>
								<a class="btn btn-danger btn-sm" id="delete_data" data-id="{{ $p->id }}"><i class="fa fa-trash"></i></a>
							</td>
						</tr>
					@endforeach
				</tbody>
			</table>
		</div>
	</div>


@endsection

@section('footer')
	<script type="text/javascript">
		$(document).ready(function() {
			$.ajaxSetup({
		        headers: {
		            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
		        }
		    });

			var table = $('#tbl_promotion').DataTable();

			// when click button edit
			$('body').on('click', '#edit_data', function() {
	        	var id = $(this).data('id');
	        	$('input[name=_method]').val('PATCH');
	        	$.get('promotion/' + id + '/edit', function(data) {
	        		$('#modal_update').modal('show');
	        		$('#id').val(data.id);
	        		$('#title').val(data.title);
	        		$('#description').summernote('code', data.description);
	        		$('#photo').val(data.photo);
	        		$('#date').val(data.post_date);
	        	});
	        });

	        // when click button update
	       
			
			// when click button delete
			$(document).on('click', '#delete_data', function() {
				var id = $(this).data('id');
				var table = $('#tbl_promotion');
				Swal.fire({
  					title: 'Are you sure?',
  					text: "You won't be able to revert this!",
  					type: 'warning',
  					showCancelButton: true,
  					confirmButtonColor: '#3085d6',
  					cancelButtonColor: '#d33',
  					confirmButtonText: 'Yes, delete it!'
				}).then((result) => {
  					if (result.value) {
    					$.ajax({
    						type: "DELETE",
    						url: "{{ url('promotion') }}" + '/' + id,
    						data: {
    							'_token': $('input[name=_token]').val(),
    						},
    						success: function(data) {
    							$("#id_" + data['id']).remove();
		        				swal.fire({
	                                title: 'Success!',
	                                text: "Data has been deleted!",
	                                type: "success",
	                            }).then(function () {
			                        location.reload().delay(200)
			                    })
    						},
    					});
  					}
  				})
			});
		});
	</script>
@endsection