@extends('layout')
@section('content')
	<div class="card">
		<div class="card-header bg-blue bg-inverse">
			<h5>All Student</h5>
		</div>
		<div class="card-block">
			<a href="{{ route('student.create') }}" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Register</a>
			<div class="table-responsive" style="margin-top: 23px">
				<table class="table table-bordered" id="student">
					<thead>
						<tr>
							<th>Student ID</th>
							<th>KH Name</th>
							<th>EN Name</th>
							<th>Gender</th>
							<th>DOB</th>
							<th>Settings</th>
						</tr>
					</thead>
					<tbody>
						@foreach($student as $student)
							<tr>
								<td>{{ $student->student_id }}</td>
								<td>{{ $student->kh_name }}</td>
								<td>{{ $student->en_name }}</td>
								<td>{{ $student->sex }}</td>
								<td>{{ $student->dob }}</td>
								<td>
									<a href="{{ route('student.show', $student->id) }}" class="btn btn-md btn-pill btn-app-blue"><i class="fa fa-search"></i></a>
										<a href="{{ route('student.edit', $student->id) }}" class="btn btn-md btn-pill btn-app-red"><i class="fa fa-edit"></i></a>
								</td>
							</tr>
						@endforeach
					</tbody>
				</table>
			</div>
		</div>
	</div>
@endsection

@section('footer')
	<script type="text/javascript">

		$('#student').DataTable();

	</script>
@endsection
