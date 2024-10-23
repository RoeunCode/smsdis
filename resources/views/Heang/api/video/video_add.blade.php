@extends('layout')
@section('content')
<meta name="csrf-token" content="{!! csrf_token() !!}">

	<div class="card">
		<div class="card-header bg-blue bg-inverse">
			<h5>Add New Video</h5>
			<div style="float: right">
				<a class="btn btn-sm btn-info" href="{{ route('video.index') }}"><i class="fa fa-angle-left" aria-hidden="true"></i> All Video</a>
			</div>
		</div>
		<div class="card-block">
			<form id="form_add" autocomplete="off">
				<table class="table table-borderless" id="dynamic_field">
					<tr>
						<td>
							<label>Class</label>
							<select class="form-control" id="cid" name="cid[]">
								<option value="" selected="true" disabled="true">Choose Class</option>
							    @foreach($array_class as $key => $value)
							        <option value="{{ $value["id"] }}">{{ $value["name"] }}</option>
							    @endforeach
							</select>
							<p class="errorCid hidden" style="color: red; font-size: 12px; font-weight: 500;"></p>
						</td>

						<td>
							<label>Subject</label>
							<select class="form-control" id="sid" name="sid[]">
						        <option value="" selected="true" disabled="true">Choose Subject</option>
						        @foreach($array_subject as $key => $value)
						          	<option value="{{ $value["id"] }}">{{ $value["subject_title"] }}</option>
					            @endforeach
					        </select>
					        <p class="errorSid hidden" style="color: red; font-size: 12px; font-weight: 500;"></p>
						</td>
						<td>
							<label>Title Video</label>
							<input type="text" class="form-control" id="title" name="title[]" placeholder="Enter Title Video">
							<p class="errorTitle hidden" style="color: red; font-size: 12px; font-weight: 500;"></p>
						</td>
						<td>
							<label>URL Video</label>
							<input type="url" class="form-control" id="url" name="url[]" placeholder="https://www.example.com">
							<p class="errorUrl hidden" style="color: red; font-size: 12px; font-weight: 500;"></p>
						</td>
						<td>
							<a href="#" class="btn btn-primary btn-sm addRow" style="margin-top: 30px;"><i class="fas fa-plus-circle"></i></a>
						</td>
					</tr>
				</table>
				<div class="row">
					<button type="button" class="btn btn-success btn-sm" id="save_data">Save</button>
				</div>
			</form>
		</div>
	</div>
	


@endsection
@section('footer')
	<script type="text/javascript">
		
		var i = 1;
		$('.addRow').click(function() {
            i++;
            $('#dynamic_field').append(
            	'<tr id="row'+i+'" class="dynamic-added">'+
            		'<td>'+
	            		'<select class="form-control" id="cid" name="cid[]">'+
	            			'<option value="" selected="true" disabled="true">Choose Class</option>'+
	            			'@foreach($array_class as $key => $value)'+
	            				'<option value="{{ $value["id"] }}">{{ $value["name"] }}</option>'+
	            			'@endforeach'+
	            		'</select>'+
	            		'<p class="errorCid hidden" style="color: red; font-size: 12px; font-weight: 500;"></p>'+
	            	'</td>'+
	            	'<td>'+
	            		'<select class="form-control" id="sid" name="sid[]">'+
	            			'<option value="" selected="true" disabled="true">Choose Subject</option>'+
	            			'@foreach($array_subject as $key => $value)'+
	            				'<option value="{{ $value["id"] }}">{{ $value["subject_title"] }}</option>'+
	            			'@endforeach'+
	            		'</select>'+
	            		'<p class="errorSid hidden" style="color: red; font-size: 12px; font-weight: 500;"></p>'+
	            	'</td>'+
	            	'<td>'+
	            		'<input type="text" class="form-control" id="title" name="title[]" placeholder="Enter Title Video">'+
	            		'<p class="errorTitle hidden" style="color: red; font-size: 12px; font-weight: 500;"></p>'+
	            	'</td>'+
	            	'<td>'+
	            		'<input type="url" class="form-control" id="url" name="url[]" placeholder="https://www.example.com">'+
	            		'<p class="errorUrl hidden" style="color: red; font-size: 12px; font-weight: 500;"></p>'+
	            	'</td>'+
	            	'<td>'+
	            		'<a href="#" class="btn btn-danger btn-sm remove" id="'+i+'"><i class="fas fa-times-circle"></i></a>'+
	            	'</td>'+
	            '</tr>'
	        );
        });

        $(document).on('click', '.remove', function () {
            var button_id = $(this).attr('id');
            $('#row'+button_id+'').remove(); 
        });

        $.ajaxSetup({
          	headers: {
            	'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          	}
      	});



        // when click button save
        
        $(function() {
            $('#save_data').on('click', function(e) {
                if (!e.isDefaultPrevented()) {
                    $.ajax({
                        url: '{{ url('video') }}',
                        type: "POST",
                        data: $('#form_add').serialize(),
                        success: function(data) {
                            swal.fire({
                                title: 'Success!',
                                text: "Data has been inserted!",
                                type: "success",
                                timer: '1500'
                            })
                        },
                        error: function() {
                            swal.fire({
                                title: 'Oops...',
                                text: "Something went wrong!",
                                type: "error",
                                timer: '1500'
                            })
                        },
                        complete: function() {
		        			$('#form_add').each(function() {
								this.reset();
							})
		        		},
                    });
                    return false;
                }
            });
        });
	</script>
@endsection