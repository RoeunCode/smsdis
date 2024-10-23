@extends('layout')
@section('content')
	<link href="https://fonts.googleapis.com/css2?family=Battambang&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="{{asset('css/main.css')}}">
	<link rel="stylesheet" type="text/css" href="{{asset('css/placement.css')}}">
	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<div>
				<div class="card">
					<div class="card-block">
						<div id="placement_test">
							<div class="row">
								<div class="col-lg-12">
									<div class="table-header">
										<table border="1px" width="100%" cellpadding="2" style="margin-bottom: 10px;">
											<tbody>
												<tr>
													<td rowspan="3" style="text-align: center;">
														<img src="{{ asset('theme/pic/logo.png') }}" width="70px">
													</td>
													<td colspan="2">
														<div class="header-text">
															<h4 style="font-size: 15px; margin-bottom: -20px;">Dewey International School</h4>
															<span><h4 style="font-size: 15px;">American Curriculum</h4></span>
														</div>
													</td>
												</tr>
												<tr>
													<td><span class="font-weight-bold">Effective Date:</span> October 14, 2019</td>
													<td><span class="font-weight-bold">Title:</span> Placement Test Result</td>
												</tr>
												<tr>
													<td><span class="font-weight-bold">No:</span> ................................ AC</td>
													<td><span class="font-weight-bold">Page No:</span> 1 of 1</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<h4 class="main-text" style="text-transform: uppercase;">Student's Placement Test Result</h4>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<table border="0px" width="100%">
										<tbody>
											<tr>
												<td>
													<p><span class="font-weight-bold">Student's Name:</span> Sim Neymar</p>
												</td>
												<td>
													<div class="check">
														<p><span class="font-weight-bold">Sex:</span>&nbsp;&nbsp; </p><input type="checkbox" name="sex" value="M">&nbsp; Male / &nbsp;<input type="checkbox" name="sex" value="F">&nbsp; Female
													</div>
												</td>
												<td>
													<p><span class="font-weight-bold">Age:</span> 06</p>
												</td>
											</tr>
										</tbody>
									</table>
									<table border="0px" width="100%">
										<tbody>
											<tr>
												<td>
													<p><span class="font-weight-bold">ID:</span> 3A-0971</p>
												</td>
												<td>
													<p><span class="font-weight-bold">Telephone N<sup>0</sup>:</span> 093 52 55 38</p>
												</td>
												<td>
													<p><span class="font-weight-bold">Emergency Contact:</span> 093 52 55 38 </p>
												</td>
											</tr>
										</tbody>
									</table>
									<table border="0px" width="100%">
										<tbody>
											<tr>
												<td>
													<p><span class="font-weight-bold">Khmer Grade:</span> <span class="font-battambang text-center">មត្តេយ្យ</span></p>
												</td>
												<td colspan="2">
													<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="font-weight-bold">School:</span> <span class="font-battambang">២ធ្នូ</span></p>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<div class="check">
														<p><span class="font-weight-bold">Paper-based test result:</span></p>
														<span class="text-center" style="margin: 0 70px;">100</span>
														<p class="text-right"><span class="font-weight-bold">/ 100 points</span></p>
													</div>
												</td>
												<td></td>
											</tr>
											<tr>
												<td colspan="1">
													<div class="check">
														<p><span class="font-weight-bold">Interviewing result:</span> </p>
														<span class="text-center" style="margin: 0 50px;">100</span>
														<p class="text-right"><span class="font-weight-bold">/ 100 points,</span> </p>
													</div>
												</td>
												<td colspan="2">
													<div class="check">
														<p>&nbsp;<span class="font-weight-bold">Average:</span></p>
														<span class="text-center" style="margin: 0 50px;">100</span>
														<p class="text-right"><span class="font-weight-bold">/ 100 points</span> </p>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="col-lg-6">
											
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<h4 class="main-text">Service enrollment American Curriculum</h4>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<table border="0px" width="100%">
										<tbody>
											<tr>
												<td colspan="2">
													<p><span class="font-weight-bold">Grade:</span> Prep</p>
												</td>
												<td><span class="font-weight-bold">Room:</span> 103</td>
											</tr>
											<tr>
												<td colspan="2">
													<p><span class="font-weight-bold">Study Time:</span> 1:00 - 4:00</p>
												</td>
												<td>
													<p><span class="font-weight-bold">Academic Year:</span> 2020 - 2021</p>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"></div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
									<p style="line-height: 5px;"><span class="font-weight-bold">Battambang, date:</span> 01 - 10 - 2020</p>
									<p style="line-height: 5px;"><span class="font-weight-bold">Seen and approved by</span></p>
								</div>
							</div>
						</div>
					</div>
					<div class="card-block b-t">
						<div class="row">
							<div class="col-lg-6"></div>
							<div class="col-lg-6 text-right">
								<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><i class="fas fa-times"></i> Cancel</button>
		        				<button type="button" class="btn btn-primary btn-sm" id="print_placement_test"><i class="fas fa-print"></i> Print</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3"></div>
	</div>
@endsection
@section('footer')
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/printThis/1.15.0/printThis.js"></script>
	<script type="text/javascript">
		$('.app-layout-drawer').hide();
		$('#myModal').modal('show')

		$('#print_placement_test').click(function(){
            $("#placement_test").printThis();
        });

        $('[type="checkbox"]').change(function(){
  
    if(this.checked){
       $('[type="checkbox"]').not(this).prop('checked', false);
    }    
  });
	</script>
@endsection