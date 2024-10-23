@extends('layout')
@section('content')
	<meta name="_token" content="{{ csrf_token() }}"/>
	<div class="card">
		<div class="card-header bg-blue bg-inverse">
			<h5>Update New Promotion</h5>
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
			<form id="form_add" method="POST" action="{{ route('promotion.update', $p->id) }}" autocomplete="off" enctype="multipart/form-data">
				@csrf  @method('PATCH')
				<input type="hidden" id="id" name="id" value="{{ $p->id }}">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label>Title</label>
							<input type="text" class="form-control" id="title" name="title" placeholder="Enter Your Title Promotion" value="{{ $p->title }}">
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label>Image</label>
							<input type="file" class="form-control" id="image" name="image" value="{{ $p->image }}">
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label>Category</label>
							<select class="form-control" id="cat" name="cat">
								@if ($p->id_cat == '1')
									<option value="1">All</option>
									<option value="2">BattamBang</option>
									<option value="3">BMC</option>
									<option disabled="true">Choose Category</option>
								@elseif($p->id_cat == '2')
									<option value="2">BattamBang</option>
									<option value="3">BMC</option>
									<option value="1">All</option>
									<option disabled="true">Choose Category</option>
								@elseif($p->id_cat == '3')
									<option value="3">BMC</option>
									<option value="2">BattamBang</option>
									<option value="1">All</option>
									<option disabled="true">Choose Category</option>
								@else
									<option selected="true" disabled="true">Choose Category</option>
									<option value="1">All</option>
									<option value="2">BattamBang</option>
									<option value="3">BMC</option>
								@endif
							</select>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<label>Description</label>
						<textarea class="form-control" id="description" name="description" rows="10" cols="80">{{ $p->description }}</textarea>
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

@endsection
