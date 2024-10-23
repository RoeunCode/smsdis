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
			<h5>All Video</h5>
			<div style="float: right">
				<a class="btn btn-sm btn-info" href="{{ route('video.create') }}"><i class="fa fa-plus-circle" aria-hidden="true"></i> Add Video</a>
			</div>
		</div>
		<div class="card-block">
			<table class="table table-bordered" id="tbl_video">
				<thead>
					<tr>
						<th>#</th>
						<th>Title</th>
						<th>Class</th>
						<th>Subject</th>
						<th hidden></th>
						<th>Settings</th>
					</tr>
				</thead>
				<tbody>
					<?php $i = 1; ?>
					@foreach($v as $v)
						<tr>
							<td>{{ $i++ }}</td>
							<td>{{ $v->title }}</td>
							<td>{{ $v->name }}</td>
							<td>{{ $v->subject_title }}</td>
							<td hidden>{{ $v->url }}</td>
							<td>
								<a href="javascript:void(0)" id="edit_video" class="btn btn-primary btn-sm" data-id="{{ $v->id }}"><i class="fa fa-pen"></i></a>
								<a href="javascript:void(0)" id="delete_video" class="btn btn-danger btn-sm delete_video" data-id="{{ $v->id }}"><i class="fa fa-trash"></i></a>
							</td>
						</tr>
					@endforeach
				</tbody>
			</table>
		</div>
	</div>

	{{-- update data --}}
	<div class="modal fade" id="update_video_form" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-blue bg-inverse">
					<h4 class="modal-title"></h4>
					<ul class="card-actions">
                        <li>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </li>
                    </ul>
				</div>
				<div class="modal-body">
					<form method="POST" autocomplete="off" id="form_update">
						{{ csrf_field() }} {{ method_field('POST') }}
					<input type="hidden" id="uid" name="uid">
					<div class="row">
						<div class="col-lg-6">
							<div class="form-group">
								<label>Class</label>
								<select class="form-control" id="ucid" name="ucid">
									<option value=""​​ selected="true" disabled="true">Choose Class</option>
									@foreach($c as $c)
							          	<option value="{{ $c->id }}">{{ $c->name }}</option>
							        @endforeach
								</select>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<label>Subject</label>
								<select class="form-control" id="usid" name="usid">
									<option value="" selected="true" disabled="true">Choose Subject</option>
									@foreach($s as $s)
						            	<option value="{{ $s->id }}">{{ $s->subject_title }}</option>
						            @endforeach
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="form-group">
								<label>Title Video</label>
								<input type="text" class="form-control" id="utitle" name="utitle" required="" placeholder="Enter Title Video">
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<label>URL Video</label>
								<input type="text" class="form-control" id="uurl" name="uurl" required="" placeholder="https://example.com">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success btn-sm" id="update">Update</button>
					</form>
				</div>
			</div>
		</div>
	</div>


@endsection

@section('footer')
	<script type="text/javascript">

		$('#tbl_video').DataTable();

        $(document).ready(function() {
        	$.ajaxSetup({
		        headers: {
		            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
		        }
		    });

	    	// when click button delete
	        $('body').on('click', '.delete_video', function() {
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
    						url: "{{ url('video') }}" + '/' + id,
    						success: function() {
    							$("#id_" + id).remove();
		        				swal.fire({
	                                title: 'Success!',
	                                text: "Data has been deleted!",
	                                type: "success",
	                            }).then(function () {
			                        location.reload().delay(200)
			                    })
    						}
    					});
  					}
  				})
			});

	        // when click button edit
	        $('body').on('click', '#edit_video', function() {
	        	save_method = "edit";
	        	var id = $(this).data('id');
	        	$('input[name=_method]').val('PATCH');
	        	$.get('video/' + id + '/edit', function(data) {
	        		$('#update_video_form').modal('show');
	        		$('.modal-title').text('Update Video');
	        		$('.modal tr th:nth-child(3), .modal tr td:nth-child(3)').hide();
	        		$('#save_data').text('Update');
	        		$('#uid').val(data.id);
	        		$('#utitle').val(data.title);
	        		$('#ucid').val(data.type_class);
	        		$('#usid').val(data.subject_id);
	        		$('#uurl').val(data.url);
	        	})
	        });

	        // when click button update
	        $(function() {
	            $('#form_update').on('submit', function(e) {
	                if (!e.isDefaultPrevented()) {
	                    var id = $('#uid').val();
	                    var ucid = $('#ucid').val();
			        	var usid = $('#usid').val();
			        	var utitle = $('#utitle').val();
			        	var uurl = $('#uurl').val();
			        	if (ucid == '' && usid == '' && utitle == '' && uurl == '') {
			        		swal.fire({
				                title: 'Oops...',
				                text: "Please enter required fields!",
				                type: "error",
				                timer: '1500'
				            })
			        	} else {
			        		$.ajax({
		                        url: "{{ url('video') . '/' }}" + id,
		                        type: "POST",
		                        data: $('#form_update').serialize(),
		                        success: function(data) {
		                            swal.fire({
		                                title: 'Success!',
		                                text: "Data has been updated!",
		                                type: "success"
		                            }).then(function () {
				                        location.reload().delay(200)
				                    })
		                        },
		                        error: function() {
		                            swal.fire({
		                                title: 'Oops...',
		                                text: "Something went wrong!",
		                                type: "error",
		                                timer: '1500'
		                            })
		                        }
		                    });
		                    return false;
			        	}
	                }
	            });
	        });
        });

	</script>
@endsection