@extends('layout')
@section('content')
	<style type="text/css">
		.more  {display:  none;}
		#show {cursor: pointer; color: #b9b9b9;}
	</style>
	<div class="card">
		<div class="card-header bg-blue bg-inverse">
			<h5>All Feedback</h5>
		</div>
		<div class="card-block">
			<table class="table table-bordered" id="tbl_feedback">
				<thead>
					<tr>
						<th>#</th>
						<th>Name</th>
						<th>Number Phone</th>
						<th>Description</th>
						<th>Setting</th>
					</tr>
				</thead>
				<tbody> 
					<?php $i = 1; ?>
					@foreach($f as $f)
						<tr>
							<td>{{ $i++ }}</td>
							<td>{{ $f->name }}</td>
							<td>{{ $f->number_phone }}</td>
							<td>
								{{ str_limit($f->description, 60, '') }}
								@if (strlen($f->description) > 60)
        							<span class="dots">...</span>
        							<span class="more">{{ substr($f->description, 60) }}</span>
        							<a class="readmorebtn" id="show">Read more</a>
    							@endif
							</td>
							<td>
								<a class="btn btn-danger btn-sm" id="delete_data" data-id="{{ $f->id }}"><i class="fa fa-trash"></i></a>
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
		$('#tbl_feedback').DataTable();

		$('.readmorebtn').click(function() {
			$(this).prev().toggle();
			$().siblings('.dots').toggle();

			if ($(this).text() == 'Read more') {
				$(this).text('Read less');
			} else {
				$(this).text('Read more');
			}
		});

		// when click button delete
			$(document).on('click', '#delete_data', function() {
				var id = $(this).data('id');
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
    						url: "{{ url('feedback') }}" + '/' + id,
    						data: {
    							'_token': $('input[name=_token]').val(),
    						},
    						success: function(data) {
    							$("#id_" + data['id']).remove();
		        				swal.fire({
	                                title: 'Success!',
	                                text: "Data has been deleted!",
	                                type: "success",
	                            })
    						},
    						complete: function() {
			        			$('#tbl_feedback').each(function() {
									location.reload(true);
								})
			        		},
    					});
  					}
  				})
			});
	</script>
@endsection