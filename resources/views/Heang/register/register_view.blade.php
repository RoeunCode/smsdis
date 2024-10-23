@extends('layout')
@section('header')

@endsection
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

	.app-layout-drawer-scroll{
		display: none;
		visibility: hidden;
	}
	.layout-has-drawer .app-layout-drawer{
		display: none;
		visibility: hidden;
	}

	.app-layout-header{
		display: none;
		visibility: hidden;
	}
    .table-bordered > thead > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > th, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > th, .table-bordered > tfoot > tr > td {
        border: 1px solid #eee;
        text-align: center;
    }
    /*show_data_infor_iteam*/
    .dataTables_info{
        display: none;
        visibility: hidden;
    }
    .pagination{

        float: left;
        padding-top: 10px;
    }
    .pagination > li {
        font-size: 12px;

    }
    .pagination > li > a, .pagination > li > span {
        padding: 8px 10px;
    }
    .pagination > .active > a, .pagination > .active > a:hover, .pagination > .active > a:focus, .pagination > .active > span, .pagination > .active > span:hover, .pagination > .active > span:focus {
        border-radius: 30% !important;
        margin-left: 2px;
        margin-right: 2px;
        background-color: #26557d;
        border-color: #26557d;
        box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16), 0 2px 10px 0 rgba(0,0,0,0.12);
		font-size: 9px;
    }
    .pagination > li > a:hover {
        border-radius: 50% !important;
        background-color: #f7f7f7;
    }
    .pagination > li > span:hover {
        background-color: transparent;
    }
    .myFont{
        font-size:12px;

    }
    .modal{
        display: block;
    }
   .font_style {
        width: 40%;
    }
    #table_validate_pay td
    {
        text-align: center;
        vertical-align: middle;
        font-size: 11px;
    }
    #tabs_service .active a,
    #tabs_service .active a:hover {
        background-color: #5897FB;

    }
    #show_report td
    {
        text-align: left;
        vertical-align: middle;
        font-size: 11px;
    }
    #tbl_exp_peroid td{

        vertical-align: middle;
    }
    #tbl_confirm_paid td{

        vertical-align: middle;
    }
</style>
<style>@page { size: A4 }</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paper-css/0.3.0/paper.css">
@section('content')
	{{--<link href="https://fonts.googleapis.com/css2?family=Battambang&display=swap" rel="stylesheet">--}}
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<link rel="stylesheet" type="text/css" href="{{asset('css/main.css')}}">
	<link rel="stylesheet" type="text/css" href="{{asset('css/register_view.css')}}">
    {{--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" />--}}
    <link rel="stylesheet" type="text/css" href="{{asset('css/cash_collection.css')}}">
	<link rel="stylesheet" href="https://cdn.datatables.net/rowgroup/1.0.4/css/rowGroup.dataTables.min.css"/>
	<div class="row">
		<div class="col-lg-1 col-md-1 col-sm-1"></div>
		<div class="col-lg-10 col-md-10 col-sm-10">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-4" style="padding-right: 5px;">
					<div class="card">
						<div class="card-header  bg-blue bg-inverse" style="padding: 10px">

							<a href="{{ route('register.create') }}" class="btn btn-app-blue btn-sm" style="margin: 5px;"><i class="fa fa-plus-circle"></i>&nbsp;&nbsp;New Student</a>
						</div>
						<div class="card-block" style="min-height: 400px;">
							<div class="form-header">

									{{-- <select class="form-control form-control-sm">
										<option>Select Type...</option>
									</select> --}}
									<div class="form-group">
										<select class="form-control form-control-sm" id="student_name" name="student_name">
											<option value="" selected></option>
											@foreach($student as $row)
												<option value="{{ $row->id }}">{{ $row->en_name }}</option>
											@endforeach
										</select>
									</div>

							</div>
							<div class="data-body">
								<ul class="list-group">
									<div id="result"></div>
								</ul>
							</div>
						</div>

					</div>
				</div>
				<div class="col-lg-9 col-md-9 col-sm-8" style="padding-left: 5px;">
					<div class="card" style="min-height: 80%" >
                        <div class="card-header  bg-blue bg-inverse" >
                            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a  style="background-color: #358ED7" class="nav-link " id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true"><i class="fa fa-cog"></i>&nbsp;<span style="font-size: 10px">DASHBOARD</span></a>
                                </li>
                                <li class="nav-item">
                                    <a  style="background-color: #358ED7" class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false"><i class="fa fa-server"></i>&nbsp;<span style="font-size: 10px">SET UP PAYMENT</span></a>
                                </li>
                                <li class="nav-item">
                                    <a  style="background-color: #358ED7;" class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false"><i class="fa fa-file"></i>&nbsp;<span style="font-size: 10px">REPORT SETTING</span></a>
                                </li>
                            </ul>
                            {{--<p style="font-size: 12px">&nbsp;Login By : {{ucfirst(\Illuminate\Support\Facades\Auth::user()->username)}}--}}
                                {{--&nbsp;&nbsp;Date & Time &nbsp;&nbsp;:--}}
                                {{--<span id="clock_time"></span>--}}
                            {{--</p>--}}
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12">

                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12">
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
											<div class="dropdown">
												<a href="" style="float: right;" class="dropdown-toggle" data-toggle="dropdown">
													<div class="notification">
														@if($notification->count() > 0)
															<svg viewbox="-10 0 35 35">
																<path class="notification--bell" d="M14 12v1H0v-1l0.73-0.58c0.77-0.77 0.81-3.55 1.19-4.42 0.77-3.77 4.08-5 4.08-5 0-0.55 0.45-1 1-1s1 0.45 1 1c0 0 3.39 1.23 4.16 5 0.38 1.88 0.42 3.66 1.19 4.42l0.66 0.58z"></path>
																<path class="notification--bellClapper" d="M7 15.7c1.11 0 2-0.89 2-2H5c0 1.11 0.89 2 2 2z"></path>
															</svg>
															<span class="notification--num">{{$notification->count()}}</span>
														@elseif($notification->count() <= 0)
															<svg viewbox="-10 0 35 35">
																<path class="" d="M14 12v1H0v-1l0.73-0.58c0.77-0.77 0.81-3.55 1.19-4.42 0.77-3.77 4.08-5 4.08-5 0-0.55 0.45-1 1-1s1 0.45 1 1c0 0 3.39 1.23 4.16 5 0.38 1.88 0.42 3.66 1.19 4.42l0.66 0.58z"></path>
																<path class="" d="M7 15.7c1.11 0 2-0.89 2-2H5c0 1.11 0.89 2 2 2z"></path>
															</svg>
														@endif
													</div>
													{{-- <span class="label label-danger">{{$notification->count()}}</span> --}}
												</a>
												<ul class="dropdown-menu">
													<li class="header">You have {{$notification->count()}} notifications</li>
													<li>
														<ul class="menu">
															@foreach($notification as $count =>$row)
																{{--@if($count< 5)--}}
																	<li>
																		<a href="#" data-toggle="tooltip" title="Expired Date: {{ \Carbon\Carbon::createFromTimestamp(strtotime( $row->expired_date))->format('d-m-Y')}}">
																			<div style="float: left;">

																				<img src="{{ asset('theme/pic/boy.png') }}">

																			</div>
																			<h4>{{ $row->en_name }}</h4>
																			<p>Expired Date: {{ \Carbon\Carbon::createFromTimestamp(strtotime( $row->expired_date))->format('d-m-Y')}}</p>
																		</a>
																	</li>
																{{--@endif--}}
															@endforeach
														</ul>
													</li>
													<li class="footer"><a href="#view_all" id="view_all" >View all</a></li>
												</ul>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
											<a class="btn btn-app-blue btn-sm" href="{{ route('logout') }}"
											   onclick="event.preventDefault();
		                                                     document.getElementById('logout-form').submit();" style="margin-top: 10px; float: right;">
												<i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;Logout
											</a>
										</div>
									</div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade in active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                                <div class="card-block" >
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="card name_header">
                                                        <div class="card-block">
                                                            <h4 id="h_name_en" style="font-size: 15px"></h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4 col-md-4 col-sm-4" style="padding-right: 5px;">
                                                    <div class="card">
                                                        <div class="card-block">
                                                            <input type="file" name="file-5[]" id="file-5" class="inputfile inputfile-4"/>
                                                            <label for="file-5"><figure><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg></figure> <span style="font-size: 15px;">Choose a file&hellip;</span></label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-8 col-md-8 col-sm-8" style="padding-left: 5px;">
                                                    <div class="card card-name info " style="font-size: 12px">
                                                        <div class="card-block">
                                                            <p>Student ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;<span id="stuid"></span></p>
                                                            <p>Name KH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;<span id="name_kh"></span></p>
                                                            <p>Name EN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;<span id="name_en"></span></p>
                                                            <p>Phone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;<span id="tel"></span></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-right: 5px; padding-bottom: 5px;">
                                                    <div class="card" style="cursor: pointer">
                                                        <div class="card-content bg-primary">
                                                            <div class="card-body">
                                                                <div class="media d-flex">
                                                                    <div class="align-self-center">
                                                                        <i class="fas fa-coins"></i>
                                                                    </div>
                                                                    <div class="media-body text-right">
                                                                        <h4>Balance</h4>
                                                                        <span id="balance">$0.00</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-bottom: 5px;">
                                                    <div class="card" style="cursor: pointer" id="btn_show_modal_deposit">
                                                        <div class="card-content bg-dark">
                                                            <div class="card-body">
                                                                <div class="media d-flex">
                                                                    <div class="align-self-center">
                                                                        <i class="fa fa-briefcase" aria-hidden="true"></i>
                                                                    </div>
                                                                    <div class="media-body text-right">
                                                                        <h4>Deposit</h4>
                                                                        <span class="text-white" id="deposit">$0.00</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-right: 5px; padding-top: 5px;">
                                                    <a  id="open_invoice">
                                                        <div class="card" style="margin-top: -24px;cursor: pointer;" >
                                                            <div class="card-content bg-green">
                                                                <div class="card-body">
                                                                    <div class="media d-flex">
                                                                        <div class="align-self-center">
                                                                            <i class="fa fa-info-circle" aria-hidden="true"></i>
                                                                        </div>
                                                                        <div class="media-body text-right">
                                                                            <span class="text-white" id="invoice">0</span>
                                                                            <h4>Open Invoice</h4>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left: 5px; padding-top: 5px;">
                                                    <div class="card" style="margin-top: -24px;cursor: pointer;" id="btn_over_due">
                                                        <div class="card-content bg-gray">
                                                            <div class="card-body">
                                                                <div class="media d-flex">
                                                                    <div class="align-self-center">
                                                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                                                    </div>
                                                                    <div class="media-body text-right">
                                                                        <span class="text-white" id="over_due">0</span>
                                                                        <h4>Expired Paid</h4>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom: 10px;">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <a id="edit_data" class="btn btn-blue-sea btn-sm" style="position: relative; left: 40%;"><i class="far fa-edit"></i> View/Edit Profile</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" style="padding-right: 0px;">
                                            <div class="form-group">

                                                <select class="form-control form-control-sm" id="pay_method" >
                                                    <option value="allpay">Cash & Bank</option>
                                                    @foreach($pay_method as $row)
                                                        <option value="{{ $row->id }}">{{ $row->payment_method }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" style="padding-left: 5px; padding-right: 0px;">
                                            <input type="date" placeholder="From..." class="form-control form-control-sm" id="from" name="from">
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" style="padding-left: 5px; padding-right: 0px;">
                                            <input type="date" placeholder="To..." class="form-control form-control-sm" id="to" name="to">
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" style="padding-left: 5px;">
                                            <button class="btn btn-default btn-md" id="btn_search_by_date"><i class="fa fa-search" aria-hidden="true"></i></button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <table id="table_invoice" class="table table-bordered" >
                                                <thead style="text-align: center">
                                                    <tr style="text-align: center">
                                                        <th style="text-align: center">Date</th>
                                                        <th style="text-align: center">Payment Method</th>
                                                        <th style="text-align: center">REFERENCE Nº</th>
                                                        <th style="text-align: center">AMOUNT</th>
                                                        <th style="text-align: center">STATUS</th>
                                                        <th style="text-align: center">View</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                                <div class="row">
                                    <div class="col-md-2 col-sm-2">
                                        <ul class="nav nav-pills nav-stacked " id="tabs_service" >
                                            <li class="active"><a style="font-size: 10px" href="#tab_des" data-toggle="pill" id="btn_das">DASHBOARD</a></li>
                                            <li><a style="font-size: 10px"  id="btn_service" href="#tab_service" data-toggle="pill">PRO/SERVICE</a></li>
                                            <li><a style="font-size: 10px" id="btn_service_type" href="#tab_b" data-toggle="pill">SERVICE TYPE</a></li>
                                            <li><a style="font-size: 10px" href="#tab_c" data-toggle="pill" id="discount_tab">DISCOUNT</a></li>
                                            <li><a style="font-size: 10px" id="btn_academic" href="#tab_d" data-toggle="pill">ACADEMIC</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-10 col-lg-10 col-sm-10">
                                        <div class="tab-content">
                                            <div class="tab-pane active " id="tab_des">
                                                <h5 style="font-size: 14px">DASHBOARD</h5>
                                                <div class="container">
                                                    <div class="col-lg-6">
                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-right: 5px; padding-bottom: 5px;">
                                                                <div class="card" style="cursor: pointer">
                                                                    <div class="card-content bg-primary">
                                                                        <div class="card-body">
                                                                            <div class="media d-flex">
                                                                                <div class="align-self-center">
                                                                                    <i class="fab fa-product-hunt"></i>
                                                                                </div>
                                                                                <div class="media-body text-right">
                                                                                    <h4>Product Service</h4>
                                                                                    <span id="proserive"></span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-right: 5px; padding-bottom: 5px;">
                                                                <div class="card" style="cursor: pointer">
                                                                    <div class="card-content bg-gray">
                                                                        <div class="card-body">
                                                                            <div class="media d-flex">
                                                                                <div class="align-self-center">
                                                                                    <i class="fab fa-stripe-s"></i>
                                                                                </div>
                                                                                <div class="media-body text-right">
                                                                                    <h4>Service Type</h4>
                                                                                    <span id="servicetype" style="color: white"></span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-right: 5px; padding-bottom: 5px;">
                                                                <div class="card" style="cursor: pointer">
                                                                    <div class="card-content bg-green">
                                                                        <div class="card-body">
                                                                            <div class="media d-flex">
                                                                                <div class="align-self-center">
                                                                                    <i class="fas fa-percent"></i>
                                                                                </div>
                                                                                <div class="media-body text-right">
                                                                                    <h4>Disccount</h4>
                                                                                    <span id="discount" style="color: white"></span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-right: 5px; padding-bottom: 5px;">
                                                                <div class="card" style="cursor: pointer">
                                                                    <div class="card-content bg-dark">
                                                                        <div class="card-body">
                                                                            <div class="media d-flex">
                                                                                <div class="align-self-center">
                                                                                    <i class="fas fa-school"></i>
                                                                                </div>
                                                                                <div class="media-body text-right">
                                                                                    <h4>Academic</h4>
                                                                                    <span id="academic" style="color: white"></span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane " id="tab_service">
                                                <h5 style="font-size: 14px">PRODUCT SERVICE
                                                </h5>
                                                <div class="container">
                                                    <button id="btn_add_service" class="btn btn-primary " style="margin-bottom: 10px;font-size: 12px"><i class="fa fa-plus"></i>&nbsp;បញ្ជូលតម្លៃសិក្សាកម្មវិធីខ្មែរ</button>
                                                    <button id="btn_add_service_ac" class="btn btn-primary " style="margin-bottom: 10px;font-size: 12px"><i class="fa fa-plus"></i>&nbsp;បញ្ជូលតម្លៃសិក្សាកម្មវិធីអាមេរិកាំង</button>
                                                    <div class="card">
                                                        <div class="card-header ">
                                                            <p> Search Service </p>
                                                        </div>
                                                        <div class="card-body bg-gray">
                                                            <div class="row">
                                                                <div class="col-lg-4">
                                                                    <select class="form-control" id="select_paid">
                                                                        <option selected disabled>Please Select Pay</option>
                                                                        <option value="1">Per Month</option>
                                                                        <option value="3">Per Term</option>
                                                                        <option value="6">Per Semester</option>
                                                                        <option value="12">Per Year</option>
                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <select class="form-control" id="select_academic">
                                                                        <option selected disabled>Please Select Academic</option>
                                                                          @foreach($academic as $row)
                                                                            <option value="{{ $row->id }}">{{ $row->name}}</option>
                                                                          @endforeach
                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <button class="form-control btn btn-primary" id="btn_search_service"><i class="fa fa-search" aria-hidden="true"></i>&nbsp;Search</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div id="div_title_service">
                                                        {{--<p style="text-align: center;font-family: Battambang;font-size: 12px;font-weight: bold">សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី ទីតាំងរំចេក</p>--}}
                                                        <p style="text-align: center;font-family: Battambang;font-size: 14px;margin-top: -10px;">តម្លៃសិក្សា <span id="span_permonth" style="color: red">Per Month</span> សម្រាប់ឆ្នាំសិក្សា <span id="span_year_kh" style="color: red"> 2020 - 2021</span> </p>
                                                        <p style="text-align: center;font-family: Battambang;font-size: 12px;margin-top: -10px;" >Tuition Fees For School Year  <span id="span_year_en" style="color: red"> 2020 - 2021</span></p>
                                                    </div>
                                                    <table class="table table-bordered" id="table_pro_service">
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>PRODUCT / SERVICE</th>
                                                                <th>PRO/TYPE</th>
                                                                <th>PRICE ($)</th>
                                                                <th>PAID TYPE</th>
                                                                <th >ACTION</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="tab_b">
                                                <h5 style="font-size: 14px">SERVICE TYPE</h5>
                                                <div class="container">
                                                    <button id="show_modal_type" class="btn btn-primary btn-xs" style="margin-bottom: 10px;font-size: 12px"><i class="fa fa-plus"></i>&nbsp;Create Service Type</button>
                                                    <table class="table table-bordered" id="table_service_type">
                                                        <thead>
                                                        <tr>
                                                            <th>SERVICE TYPE</th>
                                                            <th >ACTION</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="tab_c">
                                                <h5 style="font-size: 14px">DISCOUNT</h5>
                                                <div class="container">
                                                    <button id="show_modal_discount" class="btn btn-primary btn-xs" style="margin-bottom: 10px;font-size: 12px"><i class="fa fa-plus"></i>&nbsp;Create Discount</button>
                                                    <table class="table table-bordered" id="table_discount">
                                                        <thead>
                                                            <tr>
                                                                <th>Nº</th>
                                                                <th >DESCRIPTION</th>
                                                                <th>DISCOUNT [%]</th>
                                                                <th>FROM DATE</th>
                                                                <th>EXP DATE</th>
                                                                <th>NOTE</th>
                                                                <th>ACTION</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="tab_d">
                                                <h5 style="font-size: 14px">ACADEMIC</h5>
                                                <div class="container">
                                                    <button id="show_modal_academic" class="btn btn-primary btn-xs" style="margin-bottom: 10px;font-size: 12px"><i class="fa fa-plus"></i>&nbsp;Create Academic</button>
                                                    <table class="table table-bordered" id="table_acdemic">
                                                        <thead>
                                                            <tr>
                                                                <th>Nº</th>
                                                                <th >ACADEMIC YEAR</th>
                                                                <th>START DATE</th>
                                                                <th>END DATE</th>
                                                                <th>ACTION</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div><!-- tab content -->
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
                                <div class="row">
                                    <div class="col-md-2 col-sm-2">
                                        <ul class="nav nav-pills nav-stacked " id="tabs_service" >
                                            <li class="active"><a style="font-size: 12px" href="#tab_collecton" data-toggle="pill">Cash Collection Report</a></li>
                                            <li><a style="font-size: 12px"  id="#tab_invoice" href="#tab_invoice" data-toggle="pill">Search By Invoice</a></li>
                                            <li><a style="font-size: 12px" id="#due_schedule" href="#due_schedule" data-toggle="pill">Report Peroid</a></li>
                                            {{-- <li><a style="font-size: 12px" href="#" data-toggle="pill" id="#">Report By Year</a></li> --}}
                                            <li><a style="font-size: 12px" id="#due_exepired_date" href="#due_exepired_date" data-toggle="pill">Expired Date</a></li>
                                            <li><a style="font-size: 12px" id="#tab_confirm_paid" href="#tab_confirm_paid" data-toggle="pill">Confirm Paid</a></li>
                                            <li><a style="font-size: 12px" id="btn_cancel_paid" href="#tab_cancel_paid" data-toggle="pill">Cancel Paid</a></li>
                                            <li><a style="font-size: 12px" id="btn_view_history_cancel" href="#tab_view_history_cancel" data-toggle="pill">History Cancel Paid</a></li>

                                        </ul>
                                    </div>
                                    <div class="col-lg-10 col-md-10 col-sm-10">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_collecton">
                                                <h5 style="font-size: 12px;font-weight:bold">Cash Collection Report</h5>
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                                <div class="card">
                                                                    <div class="card-block">
                                                                        <div class="form-inline">
                                                                            <div class="form-group">
                                                                               <label for="email">Start Date:</label>
                                                                               <input type="date" class="form-control input-sm" id="start_from_date" name="start" style="font-size: 12px">
                                                                             </div>
                                                                             <div class="form-group">
                                                                               <label for="email">End Date</label>
                                                                               <input type="date" class="form-control input-sm" id="from_date" name="from" style="font-size: 12px">
                                                                             </div>
                                                                             <div class="form-group">
                                                                               <button class="btn btn-default btn-sm" id="search" name="search" style="font-size: 12px"><i class="fa fa-cog"></i>&nbsp;Run Report</button>

                                                                           </div>
                                                                       </div>
                                                                       <div class="form-inline" style="margin-top: 15px;text-align: left">
                                                                           <div class="form-group">

                                                                               <button  class="btn btn-default btn-xs print"><i class="fas fa-print"></i>&nbsp;Print Document</button>


                                                                           </div>
                                                                           <div class="form-group">

                                                                               <button  class="btn btn-default btn-xs pdf"><i class="far fa-file-pdf"></i>&nbsp;PDF Document</button>

                                                                           </div>
                                                                           <div class="form-group">

                                                                               <button  class="btn btn-default btn-xs excel"><i class="far fa-file-excel"></i>&nbsp;Excel Document</button>

                                                                           </div>
                                                                           <div class="form-group">

                                                                               <button  class="btn btn-default btn-xs csv"><i class="fas fa-file-csv"></i>&nbsp;CSV Document</button>

                                                                           </div>
                                                                       </div>
                                                                    </div>
                                                                </div>
                                                                    <div class="cash-report">
                                                                        <div class="row">
                                                                            <div class="col-lg-12">
                                                                                <div class="header text-center">
                                                                                    <h5 class="header-title font-battambang">សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី ទីតាំងរំចេក</h5>
                                                                                    <h4 class="header-subtitle">Cash Collection Report</h4>
                                                                                    <p class="header-date" id="start_date"></p>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                                                <div class="invoice_total">
                                                                                    <p class="text-invoice-total">Number of Invoices</p>
                                                                                    <h1 class="number-invoice-total" id="cash_invoice"></h1>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                                                <div class="total-received">
                                                                                    <p class="text-total-received">Total Received</p>
                                                                                    <h1 class="number-total-received" id="total_amm"></h1>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="container-fluid">
                                                                                <div class="cash_report" >
                                                                                        <table class="table table-bordered " id="show_report">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <th width="15%" style="text-align: center">Date</th>
                                                                                                    <th width="20%" style="text-align: center">Customer</th>
                                                                                                    <th width="20%" style="text-align: center">Invoice Number</th>
                                                                                                    <th width="20%" style="text-align: center">Description</th>
                                                                                                    <th width="15%" style="text-align: center">Employee</th>
                                                                                                    <th width="10%" style="text-align: center">Amount</th>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>

                                                                                            </tbody>
                                                                                        </table>
                                                                                 {{--<button class="btn btn-primary" id="confirm_paid"> Confrim Paid</button>--}}
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="tab_invoice">
                                                <h5 style="font-size: 12px;font-weight:bold">Search By Invoice </h5>
                                                <div class="container">
                                                    {{-- <div class="form-horizontal">
                                                        <div class="form-group">
                                                            <label class="control-label col-sm-2" for="email">Invocie Number CIN:</label>
                                                            <div class="col-sm-8">
                                                                <input id="search_fitler_byinvoice" type="number" class="form-control form-control-sm" name="email" placeholder="Invoice Number">
                                                            </div>
                                                        </div>
                                                     </div>         --}}
                                                     <div class="row">
                                                        <div class="col-xs-8 col-xs-offset-2">
                                                            <div class="input-group">
                                                                <div class="input-group-btn search-panel">
                                                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                                                        <span id="search_concept">Filter by  CIN</span> <span class="caret"></span>
                                                                    </button>
                                                                </div>
                                                                <input type="hidden" name="search_param" value="all" id="search_param">
                                                                <input type="text" class="form-control form-sm" name="x" placeholder="Search Invoice Number..." id="search_fitler_byinvoice" autocomplete="true">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    {{--card invoice--}}
                                                     <div class="card">
                                                        <div class="card-block">
                                                            <div class="row">
                                                                {{-- <div class="col-lg-12">
                                                                    <div class="header text-center">
                                                                        <img src="{{ asset('DIS.png') }}" style="width: 80px;height: 100px;margin-top: 20px">
                                                                        <h5 class="header-title font-battambang">សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី ទីតាំងរំចេក</h5>
                                                                        <h4 class="header-subtitle">Dewey International School</h4>
                                                                    </div>
                                                                </div> --}}
                                                                <br>
                                                                <div class="col-lg-12">
                                                                    <table>
                                                                        <tr>
                                                                            <td><img src="{{ asset('DIS.png') }}" style="width: 80px;height: 100px"></td>
                                                                            <td>
                                                                                <p style="margin:0px 35px 80px;font-size: 10px">សាលាចំណេះទូទៅអន្តរជាតិឌូវី ទីតាំងរំចេក៥</p>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td></td>
                                                                            <td>
                                                                                <p style="margin-top:-85px;font-size: 10px;margin-left: 35px;font-weight: bold">DEWEY INTERNATIONAL SCHOOL,ROMCHECK 4 CAMPUS </p>
                                                                            </td>

                                                                        </tr>
                                                                        <tr>
                                                                            <td></td>
                                                                            <td>
                                                                                <p style="margin-top:-75px;font-size: 10px;margin-left: 35px;">អត្តលេខសញ្ញាណកម្ម អតប (VATTIN) </p>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td></td>
                                                                            <td>
                                                                                <p style="margin-top:-63px;font-size: 10px;margin-left: 35px;">ទូរស័ព្ទលេខ HP 053 63 73 747/095 59 99 09 (Reletion Office) </p>
                                                                            </td>

                                                                        </tr>
                                                                        <tr>
                                                                            <td></td>
                                                                            <td>
                                                                                <p style="margin-top:-51px;font-size: 10px;margin-left: 35px;">អាស័យដ្ឋាន Address: ផ្លូវ ២០៧ ភូមិរំចេក៤ សង្កាត់រតន:
                                                                                    ក្រុងបាត់ដំបង
                                                                                </p>
                                                                            </td>

                                                                        </tr>
                                                                        <tr>
                                                                            <td></td>
                                                                            <td>
                                                                                <p style="margin-top:-39px;font-size: 10px;margin-left: 35px;"> ខេត្តបាត់ដំបង ខាងកើត ស្ពានសម្ដេចក្រឡាហោម សខេង</p>
                                                                            </td>

                                                                        </tr>
                                                                        <tr>
                                                                            <td></td>
                                                                            <td>
                                                                                <p style="margin-top:-25px;font-size: 10px;margin-left: 35px;"> ចំងាយប្រហែល៤០០ ម៉ែត្រ</p>
                                                                            </td>

                                                                        </tr>
                                                                        <tr>
                                                                            <td></td>
                                                                            <td>
                                                                                <p style="margin-top:-16px;font-size: 10px;margin-left: 35px;font-weight: bold">
                                                                                    Romcheck 4 Village,Songkat Rathanak,BattamBang City,BattamBang Province
                                                                                </p>
                                                                            </td>

                                                                        </tr>

                                                                    </table>
                                                                    <div style="text-align: center;font-size: 14px;font-family: 'Khmer OS Muol Light'">
                                                                        <p>វិក្កយបត្រ</p>
                                                                    </div>
                                                                    <table>
                                                                        <tr>
                                                                            <td><p style="font-size: 10px;font-family: 'Khmer OS Muol Light'">ព័ត៍មានអតិថិជន CUSTOMER INFO:</p></td>
                                                                            <td><p style="font-size: 10px;margin-left: 130px">លេខ NO: <span id="id_invoice_search_id"></span></p></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><p style="font-size: 10px;margin-top: -17px">ឈ្មោះ Name: <span id="search_invoice_enname">Sieng Roeun</span></p></td>
                                                                            <td><p style="font-size: 10px;margin-left: 130px;margin-top: -17px">កាលបរិច្ឆេទ Date : <span id="search_paydate_invoice"></span></p></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><p style="font-size: 10px;margin-top: -17px">គំរោង Job:</p></td>
                                                                            {{--<td><p style="font-size: 10px;margin-left: 130px;margin-top: -17px">ថ្ងៃផុតកំណត់  </p></td>--}}
                                                                        </tr>
                                                                        <tr>
                                                                            <td><p style="font-size: 10px;margin-top: -17px">អាស័យដ្ឋាន Address : BattamBang</p></td>
                                                                            {{--<td><p style="font-size: 10px;margin-left: 130px;margin-top: -17px">Due Date : <span id="search_duedate_invoice"></span></p></td>--}}
                                                                        </tr>

                                                                    </table>
                                                                </div>
                                                                <div class="col-lg-12 col-md-12 col-sm-12">

                                                                    <table class="table table-bordered" id="tbl_search_by_invoice">
                                                                        <thead>
                                                                            <tr>
                                                                                <th width=10%>DATE</th>
                                                                                <th width=15%>PAYMENT METHOD</th>
                                                                                <th width=50%>DESCRIPTION</th>
                                                                                <th width=10%>AMOUNT</th>
                                                                                <th width=15%>STATUS</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>

                                                                        </tbody>
                                                                        <tfoot>
                                                                            <tr>
                                                                                <td colspan="4" style="text-align: right">SubTotal  : </td>
                                                                                <td><span id="sub_total_invoice">0.00$</span></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="4" style="text-align: right">Discount  : </td>
                                                                                <td><span id="total_discount_invoice">0.00$</span></td>
                                                                            </tr>

                                                                            <tr>
                                                                                <td colspan="4" style="text-align: right">Amount Due : </td>
                                                                                <td><span id="total_payment_search_byid">0.00$</span></td>
                                                                            </tr>
                                                                        </tfoot>
                                                                    </table>
                                                                </div>
                                                           </div>
                                                        </div>
                                                     </div>
                                                </div>
                                            </div>

                                            <div class="tab-pane" id="due_schedule">
                                                <h5 style="font-size: 12px;font-weight:bold">Due For Schedule</h5>
                                                 <div class="container">
                                                    <div class="card">
                                                        <div class="card-header bg-blue bg-inverse">
                                                           &nbsp; <p style="font-size: 12px">Option for  Report </p>
                                                        </div>
                                                        <div class="card-block">
                                                            <div class="row">
                                                                <div class="col-sm-12 col-md-12 col-lg-12" style="margin-top: 10px">
                                                                    <div class="form-inline">
                                                                        <div class="form-group">
                                                                            <label for="email">Report Peroid:</label>
                                                                             <select class="form-control form-control-sm" id="select_peroid" style="font-size: 12px">
                                                                                 <option>Please Select Report Peroid</option>
                                                                                  <option value="today">Today</option>
                                                                                 <option value="this_week">This Week</option>
                                                                                 <option value="this_month">This Month</option>
                                                                                 <option value="this_year">This Year</option>
                                                                                 <option value="last_week">Previous Week</option>
                                                                                 <option value="last_month">Previous Month</option>
                                                                                 <option value="last_year">Previous Year</option>
                                                                             </select>
                                                                          </div>
                                                                        <div class="form-group">

                                                                           <input type="date" class="form-control form-control-sm " id="due_service_start" name="start" style="font-size: 12px">
                                                                         </div>
                                                                         <div class="form-group">
                                                                            <label for="email">To Date:</label>
                                                                            <input type="date" class="form-control form-control-sm " id="due_service_end" name="start" style="font-size: 12px">
                                                                          </div>
                                                                    </div>
                                                                 </div>
                                                             </div>

                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12" style="margin-top: 10px">
                                                                    <div class="form-inline">
                                                                        <div class="form-group">
                                                                           {{-- <label for="email">Group By :</label>
                                                                           <select class="form-control form-control-sm" id="select_due_service">
                                                                                @foreach ( $pro_service as $row )
                                                                                    <option value="{{  $row->id }}">{{  $row->service_type }}</option>
                                                                                @endforeach
                                                                           </select> --}}
                                                                         </div>
                                                                         <label class="radio-inline" for="email">Payment Method</label>
                                                                         <label class="radio-inline">
                                                                             <input type="radio" name="optradio" value="1" class="method" checked>Cash
                                                                         </label>
                                                                         <label class="radio-inline">
                                                                             <input type="radio" name="optradio" value="2"  class="method" >Bank
                                                                         </label>
                                                                    </div>

                                                                 </div>

                                                            </div>
                                                            <div style="text-align: center;margin-top: 5px">
                                                                <button class="btn btn-default btn-sm " id="btn_run_report_due_service" style="font-size: 12px"><i class="fa fa-cog"></i>&nbsp;Run Report</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-inline" style="margin-top: 15px;text-align: left">
                                                        <div class="form-group">

                                                            <button  class="btn btn-default btn-xs " id="print_due"><i class="fas fa-print"></i>&nbsp;Print Document</button>


                                                        </div>
                                                        <div class="form-group">

                                                            <button  class="btn btn-default btn-xs " id="pdf_due"><i class="far fa-file-pdf"></i>&nbsp;PDF Document</button>

                                                        </div>
                                                        <div class="form-group">

                                                            <button  class="btn btn-default btn-xs " id="excel_due"><i class="far fa-file-excel"></i>&nbsp;Excel Document</button>

                                                        </div>
                                                        <div class="form-group">

                                                            <button  class="btn btn-default btn-xs " id="cvs_due"><i class="fas fa-file-csv"></i>&nbsp;CSV Document</button>

                                                        </div>
                                                    </div>
                                                    <div class="due_report">
                                                        <div class="row">

                                                            <div class="col-lg-12">
                                                                <div class="header text-center">
                                                                    <h5 class="header-title font-battambang">សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី ទីតាំងរំចេក</h5>
                                                                    <h4 class="header-subtitle">Dewey Internaltional School</h4>
                                                                    <p class="header-date" id="form_due"></p>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                                        <div class="invoice_total">
                                                                            <p class="text-invoice-total">Number of Invoices</p>
                                                                            <h1 class="number-invoice-total" id="total_invoice_due"></h1>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                                        <div class="total-received">
                                                                            <p class="text-total-received">Total Received</p>
                                                                            <h1 class="number-total-received" id="total_amm_due"></h1>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="" style="margin-top: 10px">
                                                            <table class="table table-bordered " id="tbl_due_service">
                                                                <thead>
                                                                    <tr>
                                                                        <th width="15%" style="text-align: center">Date</th>
                                                                        <th width="20%" style="text-align: center">Customer</th>
                                                                        <th width="20%" style="text-align: center">Invoice Number</th>
                                                                        <th width="20%" style="text-align: center">Description</th>
                                                                        <th width="15%" style="text-align: center">Employee</th>
                                                                        <th width="10%" style="text-align: center">Amount</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                             </div>
                                         </div>
                                         <div class="tab-pane" id="due_exepired_date">
                                            <h5 style="font-size: 12px;font-weight:bold">Expired Date</h5>
                                              <div class="container">
                                                  <div class="row">
                                                       <div class="col-lg-12 col-md-12 col-sm-12">
                                                           <div class="card">
                                                                <div class="card-block">
                                                                    <div class="form-inline">
                                                                        <div class="form-group">
                                                                            <label for="email">Report Peroid:</label>
                                                                             <select class="form-control form-control-sm" id="select_exp_peroid"  style="font-size: 12px">
                                                                                 <option>Please Select Report Peroid</option>
                                                                                 <option value="today">Today</option>
                                                                                 <option value="this_week">This Week</option>
                                                                                 <option value="this_month">This Month</option>
                                                                                 {{--<option value="this_year">This Year</option>--}}
                                                                                 <option value="last_week">Previous Week</option>
                                                                                 <option value="last_month">Previous Month</option>
                                                                                 {{--<option value="last_year">Previous Year</option>--}}
                                                                             </select>
                                                                          </div>
                                                                          <div class="form-group">
                                                                                <button class="btn btn-default btn-sm" style="font-size: 12px" id="btn_exp_peroid"><i class="fa fa-cog"></i>&nbsp;Run Report </button>
                                                                          </div>
                                                                          <div class="form-group">
                                                                            <button class="btn btn-default btn-sm" style="font-size: 12px" id="btn_exp_print" ><i class="fas fa-print"></i>&nbsp;Print Document </button>
                                                                      </div>
                                                                    </div>
                                                                </div>
                                                           </div>
                                                           <div class="exp_due">
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <div class="header text-center">
                                                                            <h5 class="header-title font-battambang">សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី ទីតាំងរំចេក</h5>
                                                                            <h4 class="header-subtitle">Dewey Internaltional School</h4>
                                                                            <h4 class="header-title font-battambang">របាយការណ៍សិស្សដែលផុតកំណត់ថ្លៃការសិក្សា</h4>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="" style="margin-top: 10px">
                                                                    <table class="table table-bordered " id="tbl_exp_peroid">
                                                                        <thead>
                                                                            <tr>
                                                                                <th width="20%" style="text-align: center">Ref Nº</th>
                                                                                <th width="20%" style="text-align: center">Student Name</th>
                                                                                <th width="35%" style="text-align: center">Description</th>
                                                                                <th width="15%" style="text-align: center">Phone Number</th>
                                                                                <th width="15%" style="text-align: center">Expired Date</th>
                                                                                <th width="5%" style="text-align: center">Call</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                       </div>
                                                  </div>
                                              </div>
                                        </div>
                                         <div class="tab-pane" id="tab_confirm_paid">
                                                <h5 style="font-size: 12px;font-weight:bold">Confirm Paid</h5>
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <div class="card">
                                                                <div class="card-block">
                                                                    <div class="form-inline">
                                                                        {{--<div class="form-group">--}}
                                                                            {{--<label for="email">Paid Period:</label>--}}
                                                                            {{--<select class="form-control form-control-sm" id="select_exp_peroid"  style="font-size: 12px">--}}
                                                                                {{--<option>Please Select Report Period</option>--}}
                                                                                {{--<option value="today">Today</option>--}}
                                                                                {{--<option value="this_week">This Week</option>--}}
                                                                                {{--<option value="this_month">This Month</option>--}}
                                                                                {{--<option value="this_year">This Year</option>--}}
                                                                                {{--<option value="last_week">Previous Week</option>--}}
                                                                                {{--<option value="last_month">Previous Month</option>--}}
                                                                                {{--<option value="last_year">Previous Year</option>--}}
                                                                            {{--</select>--}}
                                                                        {{--</div>--}}
                                                                        <div class="form-group">
                                                                            <label>Search : </label>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <input class="form-control input-sm" placeholder="Search by invoice" id="txtsearch_confirm_paid" autocomplete="true"/>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <button class="btn btn-default btn-sm" style="font-size: 12px" id="btn_confirm_paid"><i class="fa fa-cog"></i>&nbsp;Run all Confirm Paid </button>
                                                                        </div>
                                                                        {{--<div class="form-group">--}}
                                                                            {{--<button class="btn btn-default btn-sm" style="font-size: 12px" id="btn_exp_print" ><i class="fas fa-print"></i>&nbsp;Print Document </button>--}}
                                                                        {{--</div>--}}
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="confirm_paid">
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <div class="header text-center">
                                                                            <h5 class="header-title font-battambang">សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី ទីតាំងរំចេក</h5>
                                                                            <h4 class="header-subtitle">Dewey Internaltional School</h4>
                                                                            {{--<h4 class="header-title font-battambang">របាយការណ៍សិស្សដែលផុតកំណត់ថ្លៃការសិក្សា</h4>--}}
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="" style="margin-top: 10px">
                                                                    <table class="table table-bordered " id="tbl_confirm_paid">
                                                                        <thead>
                                                                        <tr>
                                                                            <th width="10%" style="text-align: center">Ref Nº</th>
                                                                            <th width="20%" style="text-align: center">Student Name</th>
                                                                            <th width="45%" style="text-align: center">Description</th>
                                                                            <th width="15%" style="text-align: center">Phone Number</th>
                                                                            {{--<th width="15%" style="text-align: center">Expired Date</th>--}}
                                                                            <th width="20%" style="text-align: center">Confirm Paid</th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tbody>

                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                         <div class="tab-pane" id="tab_cancel_paid">
                                                <h5 style="font-size: 12px;font-weight:bold">Form Cancel Paid</h5>
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <div class="card">
                                                                {{--<div class="card-block bg-gray">--}}
                                                                    {{--<div class="form-inline">--}}
                                                                        {{--<div class="form-group">--}}
                                                                            {{--<label for="email">Invoice Number:</label>--}}
                                                                            {{--<input class="form-control-sm" placeholder="Invoice number"  style="font-size: 12px"/>--}}
                                                                        {{--</div>--}}
                                                                        {{--<div class="form-group">--}}
                                                                            {{--<button class="btn btn-primary btn-sm" style="font-size: 12px" id=""><i class="fa fa-cog"></i>&nbsp;Run Report </button>--}}
                                                                        {{--</div>--}}
                                                                        {{--<div class="form-group">--}}
                                                                            {{--<button class="btn btn-primary btn-sm" style="font-size: 12px" id="" ><i class="fas fa-print"></i>&nbsp;Print Document </button>--}}
                                                                        {{--</div>--}}
                                                                    {{--</div>--}}

                                                                {{--</div>--}}
                                                                <div class="card-block">
                                                                    <div class="header text-center">
                                                                        <h5 class="header-title font-battambang">សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី ទីតាំងរំចេក</h5>
                                                                        <h4 class="header-subtitle">Dewey International School</h4>
                                                                        <h4 class="header-subtitle">List Invoice</h4>

                                                                    </div>
                                                                    <table class="table table-bordered" id="tbl_cancel_paid">
                                                                        <thead>
                                                                            <tr>
                                                                                <th width="10%" style="text-align: center">Ref Nº</th>
                                                                                <th width="20%" style="text-align: center">Student Name</th>
                                                                                <th width="20%" style="text-align: center">DATE PAID</th>
                                                                                <th width="15%" style="text-align: center">Phone Number</th>
                                                                                {{--<th width="15%" style="text-align: center">Expired Date</th>--}}
                                                                                <th width="10%" style="text-align: center">VIEW</th>
                                                                                <th width="20%" style="text-align: center">Cancel Paid</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>

                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                         <div class="tab-pane" id="tab_view_history_cancel">
                                                <h5 style="font-size: 12px;font-weight:bold">Form Cancel Paid</h5>
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <div class="card">
                                                                {{--<div class="card-block bg-gray">--}}
                                                                {{--<div class="form-inline">--}}
                                                                {{--<div class="form-group">--}}
                                                                {{--<label for="email">Invoice Number:</label>--}}
                                                                {{--<input class="form-control-sm" placeholder="Invoice number"  style="font-size: 12px"/>--}}
                                                                {{--</div>--}}
                                                                {{--<div class="form-group">--}}
                                                                {{--<button class="btn btn-primary btn-sm" style="font-size: 12px" id=""><i class="fa fa-cog"></i>&nbsp;Run Report </button>--}}
                                                                {{--</div>--}}
                                                                {{--<div class="form-group">--}}
                                                                {{--<button class="btn btn-primary btn-sm" style="font-size: 12px" id="" ><i class="fas fa-print"></i>&nbsp;Print Document </button>--}}
                                                                {{--</div>--}}
                                                                {{--</div>--}}

                                                                {{--</div>--}}
                                                                <div class="card-block">
                                                                    <div class="header text-center">
                                                                        <h5 class="header-title font-battambang">សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី ទីតាំងរំចេក</h5>
                                                                        <h4 class="header-subtitle">Dewey International School</h4>
                                                                        <h4 class="header-subtitle">View History Cancel Paid</h4>

                                                                    </div>
                                                                    <table class="table table-bordered" id="tbl_view_history_cancel">
                                                                        <thead class="bg-primary bg-inverse">
                                                                        <tr>
                                                                            <th width="20%" style="text-align: center">DATE CANCEL</th>
                                                                            <th width="20%" style="text-align: center">Student Name</th>
                                                                            <th width="0%" style="text-align: center">DATE PAID</th>
                                                                            <th width="40%" style="text-align: center">DESCRIPTION</th>
                                                                            {{--<th width="15%" style="text-align: center">Expired Date</th>--}}
                                                                            <th width="10%" style="text-align: center">Cancel By</th>
                                                                            <th width="10%" style="text-align: center">Amount</th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tbody>

                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        {{--<div class="card-header  bg-inverse" style="padding: 10px;background-color: #3B9E75">--}}
                          {{----}}
                        {{--</div>--}}
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-1 col-md-1 col-sm-1"></div>
	</div>
  {{--Modal for show detail payment--}}
    <div class="modal" id="modalViewPay" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-lg" role="document">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    {{--<button type="button" class="close" data-dismiss="modal">&times;</button>--}}
                    <h4 class="modal-title">View Invoice</h4>
                </div>
                <div class="modal-body" >
                    <div  id="div_pri" class="A5 ">

                        <section class="sheet padding-10mm">
                            <table>
                                <tr>
                                    <td><img src="{{ asset('DIS.png') }}" style="width: 80px;height: 100px"></td>
                                    <td>
                                        <p style="margin:0px 35px 80px;font-size: 10px">សាលាចំណេះទូទៅអន្តរជាតិឌូវី ទីតាំងរំចេក៥</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <p style="margin-top:-85px;font-size: 10px;margin-left: 35px;font-weight: bold">DEWEY INTERNATIONAL SCHOOL,ROMCHECK 4 CAMPUS </p>
                                    </td>

                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <p style="margin-top:-75px;font-size: 10px;margin-left: 35px;">អត្តលេខសញ្ញាណកម្ម អតប (VATTIN) </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <p style="margin-top:-63px;font-size: 10px;margin-left: 35px;">ទូរស័ព្ទលេខ HP 053 63 73 747/095 59 99 09 (Reletion Office) </p>
                                    </td>

                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <p style="margin-top:-51px;font-size: 10px;margin-left: 35px;">អាស័យដ្ឋាន Address: ផ្លូវ ២០៧ ភូមិរំចេក៤ សង្កាត់រតន:
                                            ក្រុងបាត់ដំបង
                                        </p>
                                    </td>

                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <p style="margin-top:-39px;font-size: 10px;margin-left: 35px;"> ខេត្តបាត់ដំបង ខាងកើត ស្ពានសម្ដេចក្រឡាហោម សខេង</p>
                                    </td>

                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <p style="margin-top:-25px;font-size: 10px;margin-left: 35px;"> ចំងាយប្រហែល៤០០ ម៉ែត្រ</p>
                                    </td>

                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <p style="margin-top:-16px;font-size: 10px;margin-left: 35px;font-weight: bold">
                                            Romcheck 4 Village,Songkat Rathanak,BattamBang City,BattamBang Province
                                        </p>
                                    </td>

                                </tr>

                            </table>
                            <div style="text-align: center;font-size: 14px;font-family: 'Khmer OS Muol Light'">
                                <p>វិក្កយបត្រ</p>
                            </div>
                            <table>
                                <tr>
                                    <td><p style="font-size: 10px;font-family: 'Khmer OS Muol Light'">ព័ត៍មានអតិថិជន CUSTOMER INFO:</p></td>
                                    <td><p style="font-size: 10px;margin-left: 130px">លេខ NO: <span id="reciept_custom"></span></p></td>
                                </tr>
                                <tr>
                                    <td><p style="font-size: 10px;margin-top: -17px">ឈ្មោះ Name: <span id="name_custom">Sieng Roeun</span></p></td>
                                    <td><p style="font-size: 10px;margin-left: 130px;margin-top: -17px">កាលបរិច្ឆេទ Date : <span id="date_pay_custom"></span></p></td>
                                </tr>
                                <tr>
                                    <td><p style="font-size: 10px;margin-top: -17px">គំរោង Job:</p></td>
                                    {{--<td><p style="font-size: 10px;margin-left: 130px;margin-top: -17px">ថ្ងៃផុតកំណត់  </p></td>--}}
                                </tr>
                                <tr>
                                    <td><p style="font-size: 10px;margin-top: -17px">អាស័យដ្ឋាន Address : BattamBang</p></td>
                                    {{--<td><p style="font-size: 10px;margin-left: 130px;margin-top: -17px">Due Date : <span id="due_date_custom"></span></p></td>--}}
                                </tr>
                            </table>
                            <table class="table table-bordered  " id="tbl_print_invoice" >
                                <thead style="font-size: 10px;font-family: 'Kh Battambang';" class="test" >

                                <th width="55%" style="text-align: center;font-size: 10px">
                                    មុខទំនិញ
                                </th>
                                <th width="5%" style="text-align: center;font-size: 10px">
                                    បរិមាណ
                                </th>
                                <th width="20%" style="text-align: center;font-size: 10px">
                                    ថ្លៃឯកតា
                                </th>
                                <th width="20%" style="text-align: center;font-size: 10px">
                                    ថ្លៃទំនញ
                                </th>

                                </thead>
                                <tbody >

                                </tbody>
                                <tfoot>
                                <tr style="font-size: 10px;text-align: center">
                                    <td colspan="3" style="text-align: right;padding: 2px">សរុបរង:Subtotal</td>
                                    <td style="padding: 2px" id="print_sub">0.00</td>
                                </tr>
                                <tr style="font-size: 10px;text-align: center">
                                    <td colspan="3" style="text-align: right;padding: 2px">បញ្ចុះតម្លៃ:Discount</td>
                                    <td style="padding: 2px" id="print_dis">0.00</td>
                                </tr>
                                <tr style="font-size: 10px;text-align: center">
                                    <td colspan="3" style="text-align: right;padding: 2px">ប្រាក់កក់(Deposit)</td>
                                    <td style="padding: 2px" id="label_deposit">0.00</td>
                                </tr>
                                <tr style="font-size: 10px;text-align: center">
                                    <td colspan="3" style="text-align: right;padding: 2px">សាច់ប្រាក់ទូទាត់ Amount Due</td>
                                    <td style="padding: 2px" id="print_amount"></td>
                                </tr>
                                </tfoot>
                            </table>
                        </section>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"  id="btn_close">Close</button>
                </div>
            </div>
        </div>
    </div>
  {{--endmodal  --}}
 {{--modal for show over due--}}
    <div id="modalOverDue" class="modal" role="dialog">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    {{--<button type="button" class="close" data-dismiss="modal">&times;</button>--}}
                    {{--<h4 class="modal-title">Modal Header</h4>--}}
                    <h5 class="modal-title">EXPIRED PAID </h5>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12" >
                            <table id="table_validate_pay" class="table table-bordered" style="width: 100%" >
                                <thead style="text-align: center">
                                <tr style="text-align: center">
                                    <th style="text-align: center">REFERENCE Nº</th>
                                    <th style="text-align: center">DESCRIPTION</th>
                                    <th style="text-align: center">PHONE</th>
                                    <th style="text-align: center">PAID DATE</th>
                                    <th style="text-align: center">EXPIRED DATE</th>
                                    <th style="text-align: center">STATUS</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">CLOSE</button>
                </div>
            </div>

        </div>
    </div>

 {{--endmodal   --}}
	 {{--modal view all--}}
	<div class="modal " id="view_all_modal" >
		<div class="modal-dialog modal-lg" style="width: 1140px;margin: auto">
			<div class="modal-content">
                <div class="modal-header">
                    {{--<button type="button" class="close" data-dismiss="modal">&times;</button>--}}
                    {{--<h4 class="modal-title">Modal Header</h4>--}}
                    <h5 class="modal-title">ALL STUDENT'S EXPIRED PAID </h5>
                </div>
				<div class="modal-body">
					<table class="table table-bordered" id="all-notifications">
						<thead>
							<tr>
								<th style="text-align: center;font-size: 10px">REF Nº</th>
                                <th style="text-align: center;font-size: 10px">STUDENT NAME</th>
								<th style="text-align: center;font-size: 10px">DESCRIPTION</th>
								<th style="text-align: center;font-size: 10px">PHONE</th>
								{{--<th style="text-align: center;font-size: 10px">PAID DATE</th>--}}
								<th style="text-align: center;font-size: 10px">EXPIRED DATE</th>
								<th style="text-align: center;font-size: 10px">STATUS</th>
							</tr>
						</thead>
						<tbody>
						@foreach($notification as $row)
							<tr >
								<td width="10%" style="vertical-align: middle">CIN{{ $row->invoice_number }}</td>
                                <td width="20%" style="text-align: left;vertical-align: middle">{{ $row->en_name }}</td>
								<td width="50%" style="text-align: left">{{ $row->description }}</td>
								<td width="5%"  style="vertical-align: middle">{{ $row->phone_student }}</td>
								{{--<td width="15%">{{ $row->Volidty_of_payment }}</td>--}}
								<td width="15%"  style="vertical-align: middle">{{ \Carbon\Carbon::createFromTimestamp(strtotime( $row->expired_date))->format('d-m-Y')}}</td>
								<td style="vertical-align: middle;">
                                        CALL
								</td>
							</tr>
						@endforeach
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	{{--end modal--}}
 {{--modal add_service_pro--}}
    <div class="modal " id="modal_service" role="dialog">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    បញ្ចូលតម្លៃសិក្សាកម្មវិធីខ្មែរ
                </div>
                <div class="modal-body">
                    <div class="form-horizontal"  >
                        <p style="font-size: 14px">ជ្រើសរើសតម្លៃសិក្សាសម្រាប់ឆ្នាំ៖</p>
                        <select class="form-control"​ style="font-size: 12px;width: 50%" id="txt_acdemic_service_save">
                            <option selected disabled="true">Select Academic</option>
                             @foreach($academic as $row)
                                <option value="{{ $row->id }}">{{ $row->name }}</option>
                             @endforeach
                        </select>
                        <br>
                        <p style="font-size: 14px">សម្រាប់សិស្សដែលជ្រើសរើសសិក្សាកម្មវិធី ខ្មែរ</p>
                        <p style="font-size: 12px">1.សម្រាប់ថ្នាកបឋមសិក្សា ថ្នាក់ទី ១-៦ (Primary School )</p>
                            <div>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>មួយខែ / Per month</th>
                                            <th>មួយត្រីមាស / Per Term</th>
                                            <th>មួយឆមាស / Per Semester</th>
                                            <th>មួយឆ្នាំ / Per Year</th>
                                        </tr>
                                    </thead>
                                        <tbody>
                                            <tr>
                                                <td><input class="form-control" type="number" id="txtper_month_primary" style="text-align: center"/></td>
                                                <td><input class="form-control" type="number" id="txtper_term_primary"  style="text-align: center"/></td>
                                                <td><input class="form-control" type="number" id="txtper_semester_primary"  style="text-align: center"/></td>
                                                <td><input class="form-control" type="number" id="txtper_year_primary"  style="text-align: center"/></td>
                                            </tr>
                                        </tbody>
                                </table>
                            </div>

                        <p style="font-size: 12px">1.សម្រាប់ថ្នាកបឋមសិក្សា ថ្នាក់ទី ៧-៩ (Secondaray School )</p>
                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>មួយខែ / Per month</th>
                                    <th>មួយត្រីមាស / Per Term</th>
                                    <th>មួយឆមាស / Per Semester</th>
                                    <th>មួយឆ្នាំ / Per Year</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><input class="form-control" type="number" id="txtper_month_secondary"  style="text-align: center"/></td>
                                    <td><input class="form-control" type="number" id="txtper_term_secondary"  style="text-align: center"/></td>
                                    <td><input class="form-control" type="number" id="txtper_semester_secondary"  style="text-align: center"/></td>
                                    <td><input class="form-control" type="number" id="txtper_year_secondary"  style="text-align: center"/></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <p style="font-size: 12px">1.សម្រាប់ថ្នាកបឋមសិក្សា ថ្នាក់ទី ១០-១២ (Higth School )</p>
                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>មួយខែ / Per month</th>
                                    <th>មួយត្រីមាស / Per Term</th>
                                    <th>មួយឆមាស / Per Semester</th>
                                    <th>មួយឆ្នាំ / Per Year</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><input class="form-control" type="number" id="txtper_month_higth"  style="text-align: center"/></td>
                                    <td><input class="form-control" type="number" id="txtper_term_higth"  style="text-align: center"/></td>
                                    <td><input class="form-control" type="number" id="txtper_semester_higth"  style="text-align: center"/></td>
                                    <td><input class="form-control" type="number" id="txtper_year_higth"  style="text-align: center"/></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-sm" id="btn_save_service" >រក្សាទុកតម្លៃសិក្សា</button>
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal" id="btn_close_modal_service">បិទ</button>
                </div>
            </div>

        </div>
    </div>
     <div class="modal " id="modal_service_ac" role="dialog">
            <div class="modal-dialog modal-lg">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        បញ្ចូលតម្លៃសិក្សាកម្មវិធីអាមេរិកាំង
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal">
                            <p style="font-size: 14px">ជ្រើសរើសតម្លៃសិក្សាសម្រាប់ឆ្នាំ៖</p>
                            <select class="form-control"​ style="font-size: 12px;width: 50%" id="txt_acdemic_service_save_ac">
                                <option disabled selected>Select Acdemic</option>
                                @foreach($academic as $row)
                                    <option value="{{ $row->id }}">{{ $row->name }}</option>
                                @endforeach
                            </select>
                            <br>
                            <p style="font-size: 14px">សម្រាប់សិស្សដែលជ្រើសរើសសិក្សាកម្មវិធី អាមេរិកាំង</p>
                            <p style="font-size: 12px">1.ថ្នាក់ត្រៀម ( Preparatory )</p>
                            <div>
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>មួយខែ / Per month</th>
                                        <th>មួយត្រីមាស / Per Term</th>
                                        <th>មួយឆមាស / Per Semester</th>
                                        <th>មួយឆ្នាំ / Per Year</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><input class="form-control" type="number" id="txtper_month_primary_pep_ac_1" style="text-align: center"/></td>
                                        <td><input class="form-control" type="number" id="txtper_term_primary_pep_ac_1"  style="text-align: center"/></td>
                                        <td><input class="form-control" type="number" id="txtper_semester_primary_pep_ac_1"  style="text-align: center"/></td>
                                        <td><input class="form-control" type="number" id="txtper_year_primary_pep_ac_1"  style="text-align: center"/></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <p style="font-size: 12px">2.ថ្នាក់ទី ១-១២ Grade</p>
                            <div>
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>មួយខែ / Per month</th>
                                        <th>មួយត្រីមាស / Per Term</th>
                                        <th>មួយឆមាស / Per Semester</th>
                                        <th>មួយឆ្នាំ / Per Year</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><input class="form-control" type="number" id="txtper_month_ac_1"  style="text-align: center"/></td>
                                        <td><input class="form-control" type="number" id="txtper_term_ac_1"  style="text-align: center"/></td>
                                        <td><input class="form-control" type="number" id="txtper_semester_ac_1"  style="text-align: center"/></td>
                                        <td><input class="form-control" type="number" id="txtper_year_ac_1"  style="text-align: center"/></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <p style="font-size: 14px">សម្រាប់សិស្សដែលជ្រើសរើសសិក្សាកម្មវិធី ខ្មែរ និង អាមេរិកាំង</p>
                            <p style="font-size: 12px">1.ថ្នាក់ត្រៀម ( Preparatory )</p>
                            <div>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>មួយខែ / Per month</th>
                                            <th>មួយត្រីមាស / Per Term</th>
                                            <th>មួយឆមាស / Per Semester</th>
                                            <th>មួយឆ្នាំ / Per Year</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input class="form-control" type="number" id="txtper_month_primary_pep_ac_2" style="text-align: center"/></td>
                                            <td><input class="form-control" type="number" id="txtper_term_primary_pep_ac_2"  style="text-align: center"/></td>
                                            <td><input class="form-control" type="number" id="txtper_semester_primary_pep_ac_2"  style="text-align: center"/></td>
                                            <td><input class="form-control" type="number" id="txtper_year_primary_pep_ac_2"  style="text-align: center"/></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <p style="font-size: 12px">2. ថ្នាក់ទី ១-១២ Grade</p>
                            <div>
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>មួយខែ / Per month</th>
                                        <th>មួយត្រីមាស / Per Term</th>
                                        <th>មួយឆមាស / Per Semester</th>
                                        <th>មួយឆ្នាំ / Per Year</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><input class="form-control" type="number" id="txtper_month_ac_2"  style="text-align: center"/></td>
                                        <td><input class="form-control" type="number" id="txtper_term_ac_2"  style="text-align: center"/></td>
                                        <td><input class="form-control" type="number" id="txtper_semester_ac_2"  style="text-align: center"/></td>
                                        <td><input class="form-control" type="number" id="txtper_year_ac_2"  style="text-align: center"/></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-sm" id="btn_save_ac" >រក្សាទុកតម្លៃសិក្សា</button>
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal" id="btn_close_modal_service">បិទ</button>
                    </div>
                </div>
            </div>
        </div>
    <div class="modal" id="modal_service_type" role="dialog">
        <div class="modal-dialog ">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">

                    <h6 class="modal-title">SERVICE TYPE</h6>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal"  >
                        <div class="form-group">
                            <label class="control-label col-sm-3 label_error" for="pwd">Service Type:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control border_error" id="txtservice_type">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-sm" id="btn_save_service_type" >Save</button>
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
    <div class="modal" id="edit_service" role="dialog">
        <div class="modal-dialog ">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title">+</h6>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal"  >
                        <div class="form-group">
                            <label class="control-label col-sm-3 label_error" for="pwd">PRO/SERVICE:</label>
                            <div class="col-sm-8">
                                <textarea class="border_error" name="" id="editservice_name" cols="49" rows="5" style="font-size: 14px" ></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3 label_error" for="pwd">PRICE($):</label>
                            <div class="col-sm-8">
                               <input type="number" class="form-control border_error" id="editprice_service">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="pwd">PRO/TYPE :</label>
                            <div class="col-sm-8">
                                <select class="form-control" id="edit_service_type">
                                    @foreach($pro_service as $row)
                                        <option value="{{ $row->id }}">{{ $row->service_type}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <input type="hidden" id="id_service">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-sm" id="btn_edit_service" >Edit Service</button>
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal" id="btn_close_modal_service">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" id="modal_edit_service_type" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title">SERVICE TYPE</h6>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal"  >
                        <div class="form-group">
                            <label class="control-label col-sm-3 label_error" for="pwd">Service Type:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control border_error" id="editservice_type">
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="id_type">
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-sm" id="edit_pro_type" >Edit Service Type</button>
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
{{--end modal service_pro    --}}
    <div class="modal" id="modal_add_discount" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title">DISCOUNT</h6>
            </div>
            <div class="modal-body">
                <div class="form-horizontal"  >
                    <div class="form-group">
                        <label class="control-label col-sm-3 label_error" for="pwd">Description :</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control border_error" id="txtdescription">
                        </div>
                    </div>
                </div>
                <div class="form-horizontal"  >
                    <div class="form-group">
                        <label class="control-label col-sm-3 label_error" for="pwd">Discount % :</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control border_error" id="txtdiscount" minlength="1" pattern="\d*" maxlength="3">
                        </div>
                    </div>
                </div>
                <div class="form-horizontal"  >
                    <div class="form-group">
                        <label class="control-label col-sm-3 label_error" for="pwd">From Date:</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control border_error" id="txtfromdate">
                        </div>
                    </div>
                </div>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-sm-3 label_error" for="pwd">Exp Date:</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control border_error" id="txtexpdate">
                        </div>
                    </div>
                </div>
                <div class="form-horizontal"  >
                    <div class="form-group">
                        <label class="control-label col-sm-3 label_error" for="pwd">Note</label>
                        <div class="col-sm-8">
                            <textarea class="form-control border_error" cols="50" rows="5" id="txtnote"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-sm" id="btn_add_discount" >Add New Discount</button>
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>
    <div class="modal" id="modal_edit_discount" role="dialog">
        <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">

                <h6 class="modal-title">DISCOUNT</h6>
            </div>
            <div class="modal-body">
                <div class="form-horizontal"  >
                    <div class="form-group">
                        <label class="control-label col-sm-3 label_error" for="pwd">Description :</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control border_error" id="editdescription">
                        </div>
                    </div>
                </div>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-sm-3 label_error" for="pwd">Discount % :</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control border_error" id="editdiscount" minlength="1" pattern="\d*" maxlength="3">
                        </div>
                    </div>
                </div>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-sm-3 label_error" for="pwd">From Date:</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control border_error" id="editfromdate">
                        </div>
                    </div>
                </div>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-sm-3 label_error" for="pwd">Exp Date:</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control border_error" id="editexpdate">
                        </div>
                    </div>
                </div>
                <div class="form-horizontal"  >
                    <div class="form-group">
                        <label class="control-label col-sm-3 label_error" for="pwd">Note</label>
                        <div class="col-sm-8">
                            <textarea class="form-control border_error" cols="50" rows="5" id="editnote"></textarea>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="edit_id_discount">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-sm" id="button_edit_discount" >Edit Discount</button>
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>
    <div class="modal" id="modal_academic" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">

                <h6 class="modal-title">ACADEMIC STUDY</h6>
            </div>
            <div class="modal-body">
                <div class="form-horizontal"  >
                    <div class="form-group">
                        <label class="control-label col-sm-3 label_error" for="pwd">Academic </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control border_error" id="txtacademicyear">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3 label_error" for="pwd">Start Academic </label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control border_error" id="txtstartacademic">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3 label_error" for="pwd">End Academic </label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control border_error" id="txtendacademic">
                        </div>
                    </div>
                    {{-- <div class="form-group" id="process" style="display:none;">
                        <div class="progress">
                        <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="">
                        </div>
                        </div>
                   </div> --}}
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-sm" id="btn_add_academic" >Add Academic</button>
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>
<!--DEPOSIT MODAL-->
    <div class="modal" id="modal_deposit" role="dialog">
            <div class="modal-dialog modal-lg">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h6 class="modal-title">DEPOSIT </h6>
                    </div>
                    <div class="modal-body">
                        <table id="table_deposit" class="table table-bordered" >
                            <thead style="text-align: center">
                            <tr style="text-align: center">
                                <th style="text-align: center">Date</th>
                                <th style="text-align: center">Payment Method</th>
                                <th style="text-align: center">REFERENCE Nº</th>
                                <th style="text-align: center">AMOUNT</th>
                                <th style="text-align: center">DEPOSIT</th>
                                <th style="text-align: center">Total Deposit</th>
                            </tr>
                            </thead>
                        </table>
                    </div>

                    <div class="modal-footer">
                        {{--<button type="button" class="btn btn-default btn-sm" id="btn_deposit" >Add Academic</button>--}}
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
{{--END--}}
    <div class="modal" id="modal_edit_academic" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">

                <h6 class="modal-title">ACADEMIC STUDY</h6>
            </div>
            <div class="modal-body">
                <div class="form-horizontal"  >
                    <div class="form-group">
                        <label class="control-label col-sm-3 label_error" for="pwd">Academic </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control border_error" id="edittxtacademicyear">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3 label_error" for="pwd">Start Academic </label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control border_error" id="edittxtstartacademic">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3 label_error" for="pwd">End Academic </label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control border_error" id="edittxtendacademic">
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" id="id_academic">
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-sm" id="btn_edit_academic" >Edit Academic</button>
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
    </div>
    {{--Modal for view cancel paid--}}
    <div class="modal fade" id="modal_cancel_paid" role="dialog">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">View Invoice</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered" id="tbl_modal_cancel_paid">
                        <thead>
                            <tr>
                                <th style="text-align: center;font-size: 10px">DATE</th>
                                <th style="text-align: center;font-size: 10px">PAYMENT METHOD</th>
                                <th style="text-align: center;font-size: 10px">DESCRIPTION</th>
                                <th style="text-align: center;font-size: 10px">AMOUNT</th>
                                <th style="text-align: center;font-size: 10px">STATUS</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

    {{--End--}}
@endsection
@section('footer')
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <script src="https://cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
    <script src="https://cdn.rawgit.com/ashl1/datatables-rowsgroup/v1.0.0/dataTables.rowsGroup.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/printThis/1.15.0/printThis.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.6/jspdf.plugin.autotable.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.2/FileSaver.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/TableExport/5.2.0/js/tableexport.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/blob-polyfill/4.0.20200601/Blob.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.8/xlsx.core.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/xls/0.7.6/xls.core.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.6/clipboard.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/excel-export-js@1.0.1/dist/jquery.techbytarun.excelexportjs.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/table2csv@1.1.4/src/table2csv.min.js"></script>
	<script src="{{asset('js/jquery.TableCSVExport.js')}}"></script>
    <script type="text/javascript">
        function getAllList(){
            $('#tbl_cancel_paid').DataTable({
                "pageLength": 10,
                "lengthMenu": [[ 10, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                "pagingType": "full_numbers",
                "displayStart": 0,
                "iDisplayLength": 2,
                "order": [[ 0, "desc" ]],
                destroy:true,
                language: {
                    "sSearchPlaceholder": "Search...",
                    "sLengthMenu": "Show _MENU_ Items",
                    "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                    paginate: {
                        previous: '<i class="fas fa-caret-left"></i>',
                        next: '<i class="fas fa-caret-right"></i>',
                        first: '<i class="fas fa-step-backward"></i>',
                        last:     '<i class="fas fa-step-forward"></i>'
                    },
                    aria: {
                        paginate: {
                            previous: 'Previous',
                            next:     'Next',
                            first: 'First',
                            last: 'Last'
                        }
                    }
                },
                "ajax":{
                    'type':'GET',
                    'url':'{{ route('list_invoice') }}',
                    processData: false,
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    traditional: true,
                },
                "columns": [
                    {
                        "render": function (data, type, full, meta) {

                            return "CIN"+full.invoice_number
                        }
                    },
                    { "data": "en_name" },
                    { "data": "payment_date" },
                    { "data": "phone_student" },
                    {
                        sortable: false,
                        "render": function (data, type, full, meta) {
                            var value=full.p_id
                            var val_del=full.p_id
                            return'<button class="btn btn-app-teal btn-xs  btn_cancel_view"  value="'+value+'"><i class="fa fa-eye"></i></button>&nbsp;';
                        }
                    },
                    {
                        sortable: false,
                        "render": function (data, type, full, meta) {
                            var value=full.p_id
                            var val_del=full.p_id
                            return '<button class="btn btn-danger btn-xs btn_delete_paid "  value="'+value+'"><i class="fa fa-close"></i></button>';
                        }
                    },
                ],
            })
        }
        function getHistoryCancel(){
            $.ajax({

                    'type':'GET',
                    'url':'{{ route('history_cancel_paid') }}',
                    processData: false,
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    traditional: true,
                    success:function(data){
                        var table = $('#tbl_view_history_cancel').DataTable({
                            "pagingType": "full_numbers",
                            "lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
                            language: {
                                "sSearchPlaceholder": "Seach...",
                                "sLengthMenu": "Show _MENU_ Items",
                                "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                                paginate: {
                                    previous: '<i class="fas fa-caret-left"></i>',
                                    next: '<i class="fas fa-caret-right"></i>',
                                    first: '<i class="fas fa-step-backward"></i>',
                                    last: '<i class="fas fa-step-forward"></i>'
                                },
                                aria: {
                                    paginate: {
                                        previous: 'Previous',
                                        next: 'Next',
                                        first: 'First',
                                        last: 'Last'
                                    }
                                }
                            },
                            processing: true,
                            ordering: false,
                            destroy: true,
                            data: data.report,
                            columns: [
                                { "data": "updated_at" },
                                { "data": "en_name" },
                                { "data": "invoice_number" },
                                { "data": "description" },
                                { "data": "username"},
                                { "data": "total_payment" },
                            ],
                            columnDefs:[

                                {targets:2, render:function(data){
                                        return "CIN" + data
                                    }},
                                {targets:5, render:function(data){
                                        return numUSD.format(data)
                                    }},
                                { "visible": false, "targets": 2 },

                            ],
                            "buttons": [ 'print', 'excel','csv','pdf'],
                            order: [[2, 'asc'], [3, 'asc']],
                            rowsGroup:[2],
                            rowGroup: {
                                dataSrc: ['invoice_number'],
                                startRender: function (rows, group) {

                                    if (group == group) {
                                        return 'Invoice Number: ' + 'CIN' + group;
                                    }
                                },
                                endRender: function ( rows, group ) {
                                    var total = rows
                                        .data()
                                        .pluck('total_payment')
                                        .reduce( function (a, b) {
                                            return a + b;
                                        }, 0) + rows;
                                    total = $.fn.dataTable.render.number(',', '.', 2, '$').display( total )
                                    // alert(total)
                                    return $('<tr/>')
                                        .append( '<td colspan="4" style="background-color:#ffffff;text-align:right">Total : </td>' )
                                        .append( '<td  style="background-color: #ffffff; font-weight: normal;text-align:center">'+total+'</td>' );
                                },
                            }
                        })
                    }
            })

            {{--$('#tbl_view_history_cancel').DataTable({--}}
                {{--"pageLength": 10,--}}
                {{--"lengthMenu": [[ 10, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],--}}
                {{--"pagingType": "full_numbers",--}}
                {{--"displayStart": 0,--}}
                {{--"iDisplayLength": 2,--}}
                {{--"order": [[ 0, "desc" ]],--}}
                {{--destroy:true,--}}
                {{--language: {--}}
                    {{--"sSearchPlaceholder": "Search...",--}}
                    {{--"sLengthMenu": "Show _MENU_ Items",--}}
                    {{--"sInfo": "_START_ - _END_ of _TOTAL_ Items",--}}
                    {{--paginate: {--}}
                        {{--previous: '<i class="fas fa-caret-left"></i>',--}}
                        {{--next: '<i class="fas fa-caret-right"></i>',--}}
                        {{--first: '<i class="fas fa-step-backward"></i>',--}}
                        {{--last:     '<i class="fas fa-step-forward"></i>'--}}
                    {{--},--}}
                    {{--aria: {--}}
                        {{--paginate: {--}}
                            {{--previous: 'Previous',--}}
                            {{--next:     'Next',--}}
                            {{--first: 'First',--}}
                            {{--last: 'Last'--}}
                        {{--}--}}
                    {{--}--}}
                {{--},--}}
                {{--"ajax":{--}}
                    {{--'type':'GET',--}}
                    {{--'url':'{{ route('history_cancel_paid') }}',--}}
                    {{--processData: false,--}}
                    {{--dataType: 'json',--}}
                    {{--contentType: "application/json; charset=utf-8",--}}
                    {{--traditional: true,--}}
                {{--},--}}
                {{--"columns": [--}}
                    {{--{--}}
                        {{--"render": function (data, type, full, meta) {--}}

                            {{--return "CIN"+full.invoice_number--}}
                        {{--}--}}
                    {{--},--}}
                    {{--{ "data": "en_name" },--}}
                    {{--{ "data": "payment_date" },--}}
                    {{--{ "data": "phone_student" },--}}
                    {{--{--}}
                        {{--sortable: false,--}}
                        {{--"render": function (data, type, full, meta) {--}}
                            {{--var value=full.total_pay--}}
                            {{--return numUSD.format(value);--}}
                        {{--}--}}
                    {{--},--}}
                    {{--{--}}
                        {{--sortable: false,--}}
                        {{--"render": function (data, type, full, meta) {--}}
                            {{--var value=full.username--}}
                            {{--return  "Cancel by - " + value--}}
                        {{--}--}}
                    {{--},--}}

                {{--],--}}
            {{--})--}}
        }
        $('#btn_view_history_cancel').click(function(){
            getHistoryCancel()
        })
        $('#tbl_cancel_paid').on('click','.btn_cancel_view',function () {
            var id=$(this).val()

            $('#modal_cancel_paid').modal({'static':true,'backdrop':'static'})
            $.ajax({
                type:'POST',
                data:{'_token':'{{ @csrf_token() }}','id':id},
                url:'{{ route('view_cancel_paid') }}',
                success:function(data)
                {
                    $('#tbl_modal_cancel_paid').DataTable({
                        "pageLength": 5,
                        "lengthMenu": [[ 5, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                        "pagingType": "full_numbers",
                        "displayStart": 0,
                        "iDisplayLength": 2,
                        destroy:true,
                        language: {
                            "sSearchPlaceholder": "Search...",
                            "sLengthMenu": "Show _MENU_ Items",
                            "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                            paginate: {
                                previous: '<i class="fas fa-caret-left"></i>',
                                next: '<i class="fas fa-caret-right"></i>',
                                first: '<i class="fas fa-step-backward"></i>',
                                last:     '<i class="fas fa-step-forward"></i>'
                            },
                            aria: {
                                paginate: {
                                    previous: 'Previous',
                                    next:     'Next',
                                    first: 'First',
                                    last: 'Last'
                                }
                            }
                        },
                        data:data.data,
                        "columns": [
                            {
                                "data":'Volidty_of_payment'
                            },
                            { "data": "payment_method" },
                            { "data": "description" },
                            {
                                "data": "total_payment"
                            },
                            {
                                "data": "total_payment"
                            },
                        ],
                    })
                }
            })
        })
        $('#tbl_cancel_paid').on('click','.btn_delete_paid',function(){
            var id= $(this).val()
            Swal.fire({
                title:'Delete Paid',
                text: "Are you Sure ? ",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                cancelButtonText: 'Cancel',
                confirmButtonText: 'Yes'
            }).then((result) => {
                if (result.value) {
                     $.ajax({
                         'type':"POST",
                         'url':'{{ route('delete_pay') }}',
                         data:{ '_token':'{{ @csrf_token() }}','id':id },
                         success:function(data)
                         {
                              Swal.fire({
                                  'type':'success',
                                  'text':'Cancel Paid has successfully'
                              })
                             getAllList()
                         }
                     })
                }else{
                   console.log("Hello Cancel")
                }
            })
        })
        function getDiscount(){
            $('#table_discount').DataTable({
                "pageLength": 10,
                "lengthMenu": [[ 10, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                "pagingType": "full_numbers",
                "displayStart": 0,
                "iDisplayLength": 2,
                destroy:true,
                language: {
                    "sSearchPlaceholder": "Search...",
                    "sLengthMenu": "Show _MENU_ Items",
                    "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                    paginate: {
                        previous: '<i class="fas fa-caret-left"></i>',
                        next: '<i class="fas fa-caret-right"></i>',
                        first: '<i class="fas fa-step-backward"></i>',
                        last:     '<i class="fas fa-step-forward"></i>'
                    },
                    aria: {
                        paginate: {
                            previous: 'Previous',
                            next:     'Next',
                            first: 'First',
                            last: 'Last'
                        }
                    }
                },
                "ajax":{
                    'type':'GET',
                    'url':'{{ route('show_discount') }}',
                    processData: false,
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    traditional: true,
                },
                "columns": [
                    {
                        "data":'id'
                    },
                    { "data": "discount_name" },
                    { "data": "percent_dis" },
                    { "data": "from_date" },
                    { "data": "exp_date" },
                    { "data": "note" },
                    {
                        sortable: false,
                        "render": function (data, type, full, meta) {
                            var value=full.id
                            var val_del=full.id
                            return'<button   class="btn btn-app-green btn-xs btn_edit_discount"  value='+value+'><i class="fa fa-edit"></i></button>&nbsp;' +
                                '<button   class="btn btn-app-red btn-xs btn_delete_discount "  value='+val_del+'><i class="fa fa-trash"></i></button>';
                        }
                    },
                ],
            })
        }
        function getService(idpaid,idyear){
            $('#table_pro_service').DataTable({
                "pageLength": 10,
                "lengthMenu": [[ 10, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                "pagingType": "full_numbers",
                "displayStart": 0,
                "iDisplayLength": 2,
                destroy:true,
                language: {
                    "sSearchPlaceholder": "Search...",
                    "sLengthMenu": "Show _MENU_ Items",
                    "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                    paginate: {
                        previous: '<i class="fas fa-caret-left"></i>',
                        next: '<i class="fas fa-caret-right"></i>',
                        first: '<i class="fas fa-step-backward"></i>',
                        last:     '<i class="fas fa-step-forward"></i>'
                    },
                    aria: {
                        paginate: {
                            previous: 'Previous',
                            next:     'Next',
                            first: 'First',
                            last: 'Last'
                        }
                    }
                },
                "ajax":{
                    'type':'GET',
                    url: "{{ url('show_proservice') }}" + '/' + idpaid+'/'+idyear,
                    processData: false,
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    traditional: true,
                },
                "columns": [
                    {
                      "data":'id'
                    },
                    { "data": "pro_service" },
                    { "data": "service_type" },
                    {
                        "data": "price_service"
                    },
                    {
                        sortable: false,
                        "render": function (data, type, full, meta) {
                            var value=full.id_pay
                            if(value==1)
                            {
                                return "Per Month"
                            }else if(value==3)
                            {
                                return "Per Term"
                            }else if(value==6)
                            {
                                return "Per Semester"
                            }
                            else
                            {
                                return "Per Year"
                            }


                        }
                    },
                    {
                        sortable: false,
                        "render": function (data, type, full, meta) {
                            var value=full.id_service_type
                            var val_del=full.id
                            return'<button   class="btn btn-app-green btn-xs btn_edit_service"  value='+value+'><i class="fa fa-edit"></i></button>&nbsp;' +
                                '<button   class="btn btn-app-red btn-xs btn_delete_service "  value='+val_del+'><i class="fa fa-trash"></i></button>';
                        }
                    },

                ],
            })
        }
        $('#btn_add_service_ac').click(function(){
            $('#modal_service_ac').modal({'static':true,'backdrop':'static'})
        })
        $('#btn_cancel_paid').click(function(){
           getAllList()
        })
        $('#btn_save_ac').click(function(){

            var txt_academic_service_save_ac=$('#txt_acdemic_service_save_ac').val()
            var pep_month_ac_1=$('#txtper_month_primary_pep_ac_1').val()
            var pep_term_ac_1=$('#txtper_term_primary_pep_ac_1').val()
            var pep_sem_ac_1=$('#txtper_semester_primary_pep_ac_1').val()
            var pep_year_ac_1=$('#txtper_year_primary_pep_ac_1').val()
            var ac_month_1=$('#txtper_month_ac_1').val()
            var ac_term_1=$('#txtper_term_ac_1').val()
            var ac_sem_1=$('#txtper_semester_ac_1').val()
            var ac_year_1=$('#txtper_year_ac_1').val()

            var pep_month_ac_2=$('#txtper_month_primary_pep_ac_2').val()
            var pep_term_ac_2=$('#txtper_term_primary_pep_ac_2').val()
            var pep_sem_ac_2=$('#txtper_semester_primary_pep_ac_2').val()
            var pep_year_ac_2=$('#txtper_year_primary_pep_ac_2').val()
            var ac_month_2=$('#txtper_month_ac_2').val()
            var ac_term_2=$('#txtper_term_ac_2').val()
            var ac_sem_2=$('#txtper_semester_ac_2').val()
            var ac_year_2=$('#txtper_year_ac_2').val()

            $.ajax({
                type:'post',
                url:'{{ route('save_prosevice_ac') }}',
                data:{'_token':'{{ @csrf_token() }}',
                    'txt_academic_service_save_ac':txt_academic_service_save_ac,
                    'pep_month_ac_1':pep_month_ac_1,'pep_term_ac_1':pep_term_ac_1,'pep_sem_ac_1':pep_sem_ac_1,'pep_year_ac_1':pep_year_ac_1,
                    'ac_month_1':ac_month_1,'ac_term_1':ac_term_1,'ac_sem_1':ac_sem_1,'ac_year_1':ac_year_1,
                    'pep_month_ac_2':pep_month_ac_2,'pep_term_ac_2':pep_term_ac_2,'pep_sem_ac_2':pep_sem_ac_2,'pep_year_ac_2':pep_year_ac_2,
                    'ac_month_2':ac_month_2,'ac_term_2':ac_term_2,'ac_sem_2':ac_sem_2,'ac_year_2':ac_year_2,
                },
                success:function (data) {
                    Swal.fire(
                        'New Product Service',
                        'Successfully',
                        'success'
                    ).then(function () {
                        $('.label_error').css("color", "black")
                        // $('#modal_service').modal('hide')
                        $('#table_pro_service').DataTable({
                            "pageLength": 5,
                            "lengthMenu": [[ 5, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                            "pagingType": "full_numbers",
                            "displayStart": 0,
                            "iDisplayLength": 2,
                            destroy:true,
                            language: {
                                "sSearchPlaceholder": "Search...",
                                "sLengthMenu": "Show _MENU_ Items",
                                "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                                paginate: {
                                    previous: '<i class="fas fa-caret-left"></i>',
                                    next: '<i class="fas fa-caret-right"></i>',
                                    first: '<i class="fas fa-step-backward"></i>',
                                    last:     '<i class="fas fa-step-forward"></i>'
                                },
                                aria: {
                                    paginate: {
                                        previous: 'Previous',
                                        next:     'Next',
                                        first: 'First',
                                        last: 'Last'
                                    }
                                }
                            },
                            data:data.data,
                            "columns": [
                                {
                                    "data":'id'
                                },
                                { "data": "pro_service" },
                                { "data": "service_type" },
                                {
                                    "data": "price_service"
                                },
                                {
                                    sortable: false,
                                    "render": function (data, type, full, meta) {
                                        var value=full.id_pay
                                        if(value==1)
                                        {
                                            return "Per Month"
                                        }else if(value==3)
                                        {
                                            return "Per Term"
                                        }else if(value==6)
                                        {
                                            return "Per Semester"
                                        }
                                        else
                                        {
                                            return "Per Year"
                                        }

                                    }
                                },
                                {
                                    sortable: false,
                                    "render": function (data, type, full, meta) {
                                        var value=full.id_service_type
                                        var val_del=full.id
                                        return'<button   class="btn btn-app-green btn-xs btn_edit_service"  value='+value+'><i class="fa fa-edit"></i></button>&nbsp;' +
                                            '<button   class="btn btn-app-red btn-xs btn_delete_service "  value='+val_del+'><i class="fa fa-trash"></i></button>';
                                    }
                                },
                            ],
                        })
                    })
                }
            })
        })
        $('#select_peroid').change(function(){

            if($(this).val()=="last_week")
            {
                last_start= moment().subtract(1, 'weeks').startOf('week').format('YYYY-MM-DD')
                last_end=moment().subtract(1, 'weeks').endOf('week').format('YYYY-MM-DD')
                $('#due_service_start').val(last_start)
                $('#due_service_end').val(last_end)
            }else if($(this).val()=="last_month"){
                last_start= moment().subtract(1, 'month').startOf('month').format('YYYY-MM-DD')
                last_end=moment().subtrasearch_fitler_byinvoicect(1, 'month').endOf('month').format('YYYY-MM-DD')
                $('#due_service_start').val(last_start)
                $('#due_service_end').val(last_end)
            }else if($(this).val()=="this_month"){
                last_start= moment().startOf('month').format('YYYY-MM-DD')
                last_end=moment().endOf('month').format('YYYY-MM-DD')
                $('#due_service_start').val(last_start)
                $('#due_service_end').val(last_end)
            }else if($(this).val()=="this_week"){
                last_start= moment().startOf('weeks').format('YYYY-MM-DD')
                last_end=moment().endOf('weeks').format('YYYY-MM-DD')
                $('#due_service_start').val(last_start)
                $('#due_service_end').val(last_end)
            }else if($(this).val()=="today")
            {
                today= moment().format('YYYY-MM-DD')
                $('#due_service_start').val(today)
                $('#due_service_end').val(today)
            }
        })
        $('#tbl_exp_peroid').DataTable({
                                "pagingType": "full_numbers",
                                    language: {
                                        "sSearchPlaceholder": "Seach...",
                                        "sLengthMenu": "Show _MENU_ Items",
                                        "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                                    paginate: {
                                        previous: '<i class="fas fa-caret-left"></i>',
                                        next: '<i class="fas fa-caret-right"></i>',
                                        first: '<i class="fas fa-step-backward"></i>',
                                        last: '<i class="fas fa-step-forward"></i>'
                                },
                                    aria: {
                                        paginate: {
                                            previous: 'Previous',
                                            next: 'Next',
                                            first: 'First',
                                            last: 'Last'
                                        }
                                    }
                                },
        })
        $('#btn_exp_peroid').click(function(){
            var exp_peroid=$('#select_exp_peroid').val()
            var last_start;
            var end_start;
            if(exp_peroid=="last_week")
            {
                last_start= moment().subtract(1, 'weeks').startOf('week').format('YYYY-MM-DD')
                end_start=moment().subtract(1, 'weeks').endOf('week').format('YYYY-MM-DD')

            }else if(exp_peroid=="last_month"){
                last_start= moment().subtract(1, 'month').startOf('month').format('YYYY-MM-DD')
                end_start=moment().subtract(1, 'month').endOf('month').format('YYYY-MM-DD')

            }else if(exp_peroid=="this_month"){
                last_start= moment().startOf('month').format('YYYY-MM-DD')
                end_start=moment().endOf('month').format('YYYY-MM-DD')

            }else if(exp_peroid=="this_week"){
                last_start= moment().startOf('weeks').format('YYYY-MM-DD')
                end_start=moment().endOf('weeks').format('YYYY-MM-DD')

            }else if(exp_peroid=="today")
            {
                last_start= moment().format('YYYY-MM-DD')
                end_start=moment().format('YYYY-MM-DD')

            }else{
                Swal.fire({
                    'text':'Please select Peroid',
                    'type':'warning'
                })
            }

            $.ajax({
                'type':'POST',
                'url':'{{  route('searchExpiredByPeroid') }}',
                 data:{'_token':'{{ @csrf_token() }}','exp_peroid':exp_peroid,'start':last_start,'end':end_start},
                 success:function(data)
                 {
                       var table = $('#tbl_exp_peroid').DataTable({
                                "pagingType": "full_numbers",
                                    language: {
                                        "sSearchPlaceholder": "Seach...",
                                        "sLengthMenu": "Show _MENU_ Items",
                                        "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                                    paginate: {
                                        previous: '<i class="fas fa-caret-left"></i>',
                                        next: '<i class="fas fa-caret-right"></i>',
                                        first: '<i class="fas fa-step-backward"></i>',
                                        last: '<i class="fas fa-step-forward"></i>'
                                },
                                    aria: {
                                        paginate: {
                                            previous: 'Previous',
                                            next: 'Next',
                                            first: 'First',
                                            last: 'Last'
                                        }
                                    }
                                },
                              	processing: true,
						        ordering: false,
						        destroy: true,
						        data: data.data,
						        columns: [
                                    {
                                        "render": function (data, type, full, meta) {

                                            return "CIN"+full.invoice_number
                                        }
                                    },
                                    { "data": "en_name" },
                                    { "data": "description" },
                                    { "data": "phone_student"},
                                    { "data": "expired_date" },
                                    {
                                        "render": function (data, type, full, meta) {

                                            return'Call'
                                        }
                                    },
                                ],
                                columnDefs:[

                                    { "visible": false, "targets": 1 },

                                ],
                                rowGroup: {
                                	dataSrc: ['en_name'],
                                	startRender: function (rows, group) {

								        if (group == group) {
								        	return 'Customer Name  : ' + group;
								        }
                                	},

						        }
							})
                    }
                })

        })
        $('#btn_exp_print').click(function(){
            $('.exp_due').printThis({
                       importCSS: false,
                       importStyle: true,
                       loadCSS: ["{{ asset('css/printThis.css') }}", "{{asset('theme/dist/assets/css/bootstrap.css')}}", "{{asset('css/cash_collection.css')}}"],
            });
        })

         $('#btn_run_report_due_service').click(function(){
            // var val_due_service=$('#select_due_service').val()
            var start_date=$('#due_service_start').val()
            var from_date=$('#due_service_end').val()
            var pay_method=$('input:radio[name=optradio]:checked').val()
            var d = new Date();
            var month = d.getMonth()+1;
            var day = d.getDate();
            var output = d.getFullYear() + '/' +
                ((''+month).length<2 ? '0' : '') + month + '/' +
                ((''+day).length<2 ? '0' : '') + day
            $.ajax({
                "type":"POST",
                "url":'{{ route('searchByDue_service') }}',
                 data:{'_token':'{{  @csrf_token() }}',"start_date":start_date,"from_date":from_date,"pay_method":pay_method},
                 success: function(data) {
                            var total_amount = 0;
							var total_invoice = 0;
							for (var i = 0; i < data.report.length; i++) {
						        total_amount += data.report[i].total_payment;
                            }
                            //for count duplicate array
                                var lists=data.report
                                var browsers = []
                                for (var i = 0; i < lists.length; i++) {
                                    var currentBrowser = lists[i].invoice_number;
                                    if (undefined != browsers[currentBrowser]) {
                                        browsers[currentBrowser]++;
                                    }
                                    else {
                                        browsers[currentBrowser] = 1;
                                    }
                                }
                            console.log(browsers)
                            var count=0
                            browsers.forEach(element => {
                                count++
                            });
                            //end function
                            $('#from_due').html('From' + ' ' + start_date + ' ' + 'To' + ' ' + from_date);
							$('#total_invoice_due').html(count)
                            $('#total_amm_due').html(numUSD.format(total_amount))
                            $('#print_due').click(function() {

                                $('.due_report').printThis({
                                        importCSS: false,
                                        importStyle: true,
                                        loadCSS: ["{{ asset('css/printThis.css') }}", "{{asset('theme/dist/assets/css/bootstrap.css')}}", "{{asset('css/cash_collection.css')}}"],
                                });
                            })

                            $('#pdf_due').click(function() {
                                var doc = new jsPDF('p', 'mm', 'a4')
                                // doc.addFont("{{asset('font/Battambang-Regular.ttf')}}", "Battambang", "regular");
                                // doc.setFont("Battambang", "regular");
                                doc.setFontSize(10);
                                doc.text(70, 10, 'Dewey International School Romcheck Campus');

                                doc.setFontSize(8);
                                doc.setFontStyle('bold')
                                doc.text(90, 15, 'Cash Collection Report');

                                doc.setFontSize(8);
                                doc.setFontStyle('normal')
                                doc.text(85, 20, 'From' + ' ' + start_date + ' ' + 'To' + ' ' + from_date);

                                doc.setFontSize(10)
                                doc.text(18, 30, 'Number of Invoices')

                                doc.setFontSize(12)
                                doc.setFontStyle('bold')
                                doc.text(30, 35, '' + count)

                                doc.setFontSize(10)
                                doc.setFontStyle('normal')
                                doc.text(160, 30, 'Total Received')

                                doc.setFontSize(12)
                                doc.setFontStyle('bold')
                                doc.text(160, 35, '' + numUSD.format(total_amount))

                                doc.autoTable({
                                html: '#tbl_due_service',
                                startY: 40,
                                styles: {font: 'times', overflow: 'linebreak'},
                                showHead: 'firstPage',
                                showFoot: 'lastPage',
                                headStyles: {
                                    halign: 'center',
                                    fontStyle: 'bold'
                                },
                                })
                                doc.save('cash_collection_report.pdf')
                            })

                            $('#excel_due').click(function() {
                                $("#tbl_due_service").excelexportjs({
                                    containerid:"show_report",
                                    datatype:'table',
                                    worksheetName:"Report Cash" + output,
                                    columns:null,
                                    filename: "Report Cash" + output,
                                });
                            })

                            $('#csv_due').click(function() {
                                $('#tbl_due_service').TableCSVExport({
                                    delivery: 'download',
                                    filename: 'cash_collection_report.csv'
                                    })
                            })

							var table = $('#tbl_due_service').DataTable({
                                "pagingType": "full_numbers",
                                    language: {
                                        "sSearchPlaceholder": "Seach...",
                                        "sLengthMenu": "Show _MENU_ Items",
                                        "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                                    paginate: {
                                        previous: '<i class="fas fa-caret-left"></i>',
                                        next: '<i class="fas fa-caret-right"></i>',
                                        first: '<i class="fas fa-step-backward"></i>',
                                        last: '<i class="fas fa-step-forward"></i>'
                                },
                                    aria: {
                                        paginate: {
                                            previous: 'Previous',
                                            next: 'Next',
                                            first: 'First',
                                            last: 'Last'
                                        }
                                    }
                                },
                              	processing: true,
						        ordering: false,
						        destroy: true,
						        data: data.report,
						        columns: [
						        	{ "data": "payment_date" },
                                    { "data": "en_name" },
                                    { "data": "invoice_number" },
                                    { "data": "description" },
                                    { "data": "username"},
                                    { "data": "total_payment" },
                                ],
                                columnDefs:[

                                      {targets:2, render:function(data){
                                              return "CIN" + data
                                      }},
                                      {targets:5, render:function(data){
                                          return numUSD.format(data)
                                      }},
                                      { "visible": false, "targets": 2 },

                                ],
                                "buttons": [ 'print', 'excel','csv','pdf'],
						        order: [[2, 'asc'], [3, 'asc']],
							    rowsGroup:[2],
						        rowGroup: {
                                	dataSrc: ['invoice_number'],
                                	startRender: function (rows, group) {

								        if (group == group) {
								        	return 'Invoice Number: ' + 'CIN' + group;
								        }
                                	},
						            endRender: function ( rows, group ) {
						                var total = rows
						                    .data()
						                    .pluck('total_payment')
						                    .reduce( function (a, b) {
						                        return a + b;
						                    }, 0) + rows;
						                total = $.fn.dataTable.render.number(',', '.', 2, '$').display( total )
                                        // alert(total)
						                return $('<tr/>')
						                    .append( '<td colspan="4" style="background-color:#ffffff;text-align:right">Total : </td>' )
						                    .append( '<td  style="background-color: #ffffff; font-weight: normal;text-align:center">'+total+'</td>' );
						            },
						        }
							})
						},
            })
        })
        $('#tbl_due_service').DataTable()
        $('#tbl_search_by_invoice').DataTable({
                            "bFilter" : false,
                            "bLengthChange": false,
                            "paging":   false,
                            "ordering": false,
                            "info":     false,
        })
        $("#tbl_cancel_paid").DataTable()
        $('#search_fitler_byinvoice').keyup(function(){
            var id_invoice=$(this).val()
            // var select_search_date=$('#select_search_date').val()
            $.ajax({
                    'type':'POST',
                    'url':'{{ route('searchByInvoice_report') }}',
                     data:{'_token':'{{ @csrf_token() }}','id_invoice':id_invoice},
                     success:function(data)
                        {
                            var total_amount=0;
                            var discount=0;
                            var subtotal=0;
                            for (var i = 0; i < data.data.length; i++) {
						        total_amount += data.data[i].original_price;
                                discount+=data.data[i].lose_piad;
                                subtotal+=data.data[i].total_amount;
                            }

                            if(total_amount > 0){

                                $('#search_invoice_enname').html(data.data[0].en_name)
                                $('#id_invoice_search_id').html(data.data[0].invoice_number)
                                $('#search_duedate_invoice').html(data.data[0].due_date)
                                $('#search_paydate_invoice').html(data.data[0].payment_date)

                            }else{

                            }
                            $('#total_payment_search_byid').html(numUSD.format(total_amount))
                            $('#total_discount_invoice').html(numUSD.format(discount))
                            $('#sub_total_invoice').html(numUSD.format(subtotal))
                            $('#tbl_search_by_invoice').DataTable({
                             "bFilter" : false,
                            "bLengthChange": false,
                            "processing": true,
                            destroy:true,
                            "paging":   false,
                            "ordering": false,
                            "info":     false,
                            data:data.data,
                            "columns": [
                                {
                                    "data":'payment_date'
                                },
                                { "data": "payment_method" },
                                { "data": "description" },
                                {
                                    "render": function (data, type, full, meta) {

                                        return numUSD.format(full.total_amount)
                                    }
                                },
                                {
                                    "render": function (data, type, full, meta) {

                                          return "Piad By " +full.username
                                    }
                                },

                            ],
                        })
                     }
            })
        })
        function getacademic(){
            $('#table_acdemic').DataTable({
                "pageLength": 10,
                "lengthMenu": [[ 10, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                "pagingType": "full_numbers",
                "displayStart": 0,
                "iDisplayLength": 2,
                destroy:true,
                language: {
                    "sSearchPlaceholder": "Search...",
                    "sLengthMenu": "Show _MENU_ Items",
                    "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                    paginate: {
                        previous: '<i class="fas fa-caret-left"></i>',
                        next: '<i class="fas fa-caret-right"></i>',
                        first: '<i class="fas fa-step-backward"></i>',
                        last:     '<i class="fas fa-step-forward"></i>'
                    },
                    aria: {
                        paginate: {
                            previous: 'Previous',
                            next:     'Next',
                            first: 'First',
                            last: 'Last'
                        }
                    }

                },
                "ajax":{
                    'type':'GET',
                    'url':'{{ route('show_acedamic_pay') }}',
                    processData: false,
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    traditional: true,
                },
                "columns": [
                    {
                        "data":'id'
                    },
                    { "data": "name" },
                    { "data": "start" },
                    {
                      "data":"end"
                    },
                    {
                        sortable: false,
                        "render": function (data, type, full, meta) {
                            var value=full.id
                            var val_del=full.id
                            return'<button   class="btn btn-app-green btn-xs btn_edit_academic"  value='+value+'><i class="fa fa-edit"></i></button>&nbsp;' +
                                  '<button   class="btn btn-app-red btn-xs btn_del_academic "  value='+val_del+'><i class="fa fa-trash"></i></button>';
                        }
                    },

                ],
            })
        }
        $('#btn_academic').click(function(){

            getacademic()

        })
        $('#show_modal_academic').click(function(){


            $('#modal_academic').modal({backdrop:'static',keyboard:false})

        })
        $('#table_acdemic').on('click','.btn_del_academic',function(){
            var id=$(this).val()
            $.ajax({
                "type":"POST",
                "url":'{{  route('del_accdemic_pay') }}',
                data:{'_token':'{{  @csrf_token() }}','id':id},
                success:function(data)
                {
                $('#table_acdemic').DataTable({
                    "pageLength": 10,
                    "lengthMenu": [[ 10, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                    "pagingType": "full_numbers",
                    "displayStart": 0,
                    "iDisplayLength": 2,
                    destroy:true,
                    language: {
                        "sSearchPlaceholder": "Search...",
                        "sLengthMenu": "Show _MENU_ Items",
                        "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                        paginate: {
                            previous: '<i class="fas fa-caret-left"></i>',
                            next: '<i class="fas fa-caret-right"></i>',
                            first: '<i class="fas fa-step-backward"></i>',
                            last:     '<i class="fas fa-step-forward"></i>'
                        },
                        aria: {
                            paginate: {
                                previous: 'Previous',
                                next:     'Next',
                                first: 'First',
                                last: 'Last'
                            }
                        }

                    },
                    data:data.data,
                    "columns": [
                        {
                            "data":'id'
                        },
                        { "data": "name" },
                        { "data": "start" },
                        {
                        "data":"end"
                        },
                        {
                            sortable: false,
                            "render": function (data, type, full, meta) {
                                var value=full.id
                                var val_del=full.id
                                return'<button   class="btn btn-app-green btn-xs btn_edit_academic"  value='+value+'><i class="fa fa-edit"></i></button>&nbsp;' +
                                    '<button   class="btn btn-app-red btn-xs btn_del_academic "  value='+val_del+'><i class="fa fa-trash"></i></button>';
                            }
                        },
                    ],
                   })
                }
            })
        })
        $('#table_acdemic').on('click','.btn_edit_academic ',function(){
            var dt=$('#table_acdemic').DataTable()
            var name=dt.cells($(this).closest('td').siblings().eq(1)).data();
            var start=dt.cells($(this).closest('td').siblings().eq(2)).data();
            var end=dt.cells($(this).closest('td').siblings().eq(3)).data();
            $('#modal_edit_academic').modal({backdrop:'static',keyboard:false})
            $('#id_academic').val($(this).val())
            $('#edittxtacademicyear').val(name[0])
            $('#edittxtstartacademic').val(start[0])
            $('#edittxtendacademic').val(end[0])
        })
        $('#btn_edit_academic').click(function(){
            var id=$('#id_academic').val()
            var name=$('#edittxtacademicyear').val()
            var start=$('#edittxtstartacademic').val()
            var end=$('#edittxtendacademic').val()
            var frm={
                "name":name,"start":start,"end":end
            }
            $.ajax({
                "type":'POST',
                "url":'{{ route('edit_accdemic_pay') }}',
                 data:{'_token':'{{ @csrf_token() }}','id':id,'frm':frm},
                 success:function(data){
                 $('#table_acdemic').DataTable({
                "pageLength": 10,
                "lengthMenu": [[ 10, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                "pagingType": "full_numbers",
                "displayStart": 0,
                "iDisplayLength": 2,
                destroy:true,
                language: {
                    "sSearchPlaceholder": "Search...",
                    "sLengthMenu": "Show _MENU_ Items",
                    "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                    paginate: {
                        previous: '<i class="fas fa-caret-left"></i>',
                        next: '<i class="fas fa-caret-right"></i>',
                        first: '<i class="fas fa-step-backward"></i>',
                        last:     '<i class="fas fa-step-forward"></i>'
                    },
                    aria: {
                        paginate: {
                            previous: 'Previous',
                            next:     'Next',
                            first: 'First',
                            last: 'Last'
                        }
                    }

                },
                 data:data.data,
                "columns": [
                    {
                        "data":'id'
                    },
                    { "data": "name" },
                    { "data": "start" },
                    {
                      "data":"end"
                    },
                    {
                        sortable: false,
                        "render": function (data, type, full, meta) {
                            var value=full.id
                            var val_del=full.id
                            return'<button   class="btn btn-app-green btn-xs btn_edit_academic"  value='+value+'><i class="fa fa-edit"></i></button>&nbsp;' +
                                  '<button   class="btn btn-app-red btn-xs btn_del_academic "  value='+val_del+'><i class="fa fa-trash"></i></button>';
                        }
                    },

                  ],
                   })

                }
            })
        })
        $('#btn_add_academic').click(function(){
            var academic=$('#txtacademicyear').val()
            var startac=$('#txtstartacademic').val()
            var endac=$('#txtendacademic').val()
            var frm={
                "name":academic,
                "start":startac,
                "end":endac
            }
            $.ajax({
                "type":"POST",
                "url":'{{  route('add_accdemic_pay') }}',
                 data:{'_token':'{{  @csrf_token() }}',"frm":frm},

                //    beforeSend:function()
                //     {
                //         $('#save').attr('disabled', 'disabled');
                //         $('#process').css('display', 'block');
                //     },
                success:function(data){
                    // var percentage = 0;
                    // var timer = setInterval(function(){
                    // percentage = percentage + 20;
                    // progress_bar_process(percentage, timer);
                    // }, 1000);
                    $('#table_acdemic').DataTable({
                    "pageLength": 10,
                    "lengthMenu": [[ 10, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                    "pagingType": "full_numbers",
                    "displayStart": 0,
                    "iDisplayLength": 2,
                    destroy:true,
                    language: {
                        "sSearchPlaceholder": "Search...",
                        "sLengthMenu": "Show _MENU_ Items",
                        "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                        paginate: {
                            previous: '<i class="fas fa-caret-left"></i>',
                            next: '<i class="fas fa-caret-right"></i>',
                            first: '<i class="fas fa-step-backward"></i>',
                            last:     '<i class="fas fa-step-forward"></i>'
                        },
                        aria: {
                            paginate: {
                                previous: 'Previous',
                                next:     'Next',
                                first: 'First',
                                last: 'Last'
                            }
                        }

                    },
                    data:data.data,
                        "columns": [
                            {
                                "data":'id'
                            },
                            { "data": "name" },
                            { "data": "start" },
                            {
                            "data":"end"
                            },
                            {
                                sortable: false,
                                "render": function (data, type, full, meta) {
                                    var value=full.id
                                    var val_del=full.id
                                    return'<button   class="btn btn-app-green btn-xs btn_edit_academic"  value='+value+'><i class="fa fa-edit"></i></button>&nbsp;' +
                                        '<button   class="btn btn-app-red btn-xs btn_del_academic "  value='+val_del+'><i class="fa fa-trash"></i></button>';
                                }
                            },

                        ],
                    })

                    }
                })
        })
        $('#table_discount').on('click','.btn_edit_discount',function() {
              var dt=$('#table_discount').DataTable()
              var des = dt.cells($(this).closest('td').siblings().eq(1)).data();
              var dis=  dt.cells($(this).closest('td').siblings().eq(2)).data();
              var fromdate=  dt.cells($(this).closest('td').siblings().eq(3)).data();
              var expdate=  dt.cells($(this).closest('td').siblings().eq(4)).data();
              var note=  dt.cells($(this).closest('td').siblings().eq(5)).data();
              $('#editdescription').val(des[0])
              $('#editdiscount').val(dis[0])
              $('#editfromdate').val(fromdate[0])
              $('#editexpdate').val(expdate[0])
              $('#editnote').val(note[0])
              $('#edit_id_discount').val($(this).val())
              $('#modal_edit_discount').modal({backdrop:'static',keyboard:false})

        })

        $('#button_edit_discount').click(function () {
           var id=$('#edit_id_discount').val()
           var description=$('#editdescription').val()
           var discount=$('#editdiscount').val()
           var fromdate=$('#editfromdate').val()
           var expdate=$('#editexpdate').val()
           var note=$('#editnote').val()
           var arry_frm=
               {

                    "discount_name":description,
                    "percent_dis":discount,
                    "from_date":fromdate,
                    "exp_date":expdate,
                    "note":note
               }

           $.ajax({
               "type":'POST',
               "url":'{{  route('edit_discount') }}',
                data:{'_token':'{{  @csrf_token() }}',"frm_arr":arry_frm,"id":id},
                      success:function(data){
                        $('#table_discount').DataTable({
                        "pageLength": 10,
                        "lengthMenu": [[ 10, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                        "pagingType": "full_numbers",
                        "displayStart": 0,
                        "iDisplayLength": 2,
                        destroy:true,
                        language: {
                            "sSearchPlaceholder": "Search...",
                            "sLengthMenu": "Show _MENU_ Items",
                            "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                            paginate: {
                                previous: '<i class="fas fa-caret-left"></i>',
                                next: '<i class="fas fa-caret-right"></i>',
                                first: '<i class="fas fa-step-backward"></i>',
                                last:     '<i class="fas fa-step-forward"></i>'
                            },
                            aria: {
                                paginate: {
                                    previous: 'Previous',
                                    next:     'Next',
                                    first: 'First',
                                    last: 'Last'
                                }
                            }

                        },
                        data:data.data,
                        "columns": [
                            {
                                "data":'id'
                            },
                            { "data": "discount_name" },
                            { "data": "percent_dis" },
                            { "data": "from_date" },
                            { "data": "exp_date" },
                            { "data": "note" },
                            {
                                sortable: false,
                                "render": function (data, type, full, meta) {
                                    var value=full.id
                                    var val_del=full.id
                                    return'<button   class="btn btn-app-green btn-xs btn_edit_discount"  value='+value+'><i class="fa fa-edit"></i></button>&nbsp;' +
                                        '<button   class="btn btn-app-red btn-xs btn_delete_discount "  value='+val_del+'><i class="fa fa-trash"></i></button>';
                                }
                            },
                           ],
                       })
                    }

           })

        })

        $('#table_discount').on('click','.btn_delete_discount',function() {
            var id=$(this).val()
            $.ajax({

                "type":'POST',
                "url":'{{  route('delete_discount') }}',
                 data:{'_token':'{{  @csrf_token() }}','id':id},
                 success:function(data){
                        $('#table_discount').DataTable({
                        "pageLength": 10,
                        "lengthMenu": [[ 10, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                        "pagingType": "full_numbers",
                        "displayStart": 0,
                        "iDisplayLength": 2,
                        destroy:true,
                        language: {
                            "sSearchPlaceholder": "Search...",
                            "sLengthMenu": "Show _MENU_ Items",
                            "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                            paginate: {
                                previous: '<i class="fas fa-caret-left"></i>',
                                next: '<i class="fas fa-caret-right"></i>',
                                first: '<i class="fas fa-step-backward"></i>',
                                last:     '<i class="fas fa-step-forward"></i>'
                            },
                            aria: {
                                paginate: {
                                    previous: 'Previous',
                                    next:     'Next',
                                    first: 'First',
                                    last: 'Last'
                                }
                            }

                        },
                        data:data.data,
                        "columns": [
                            {
                                "data":'id'
                            },
                            { "data": "discount_name" },
                            { "data": "percent_dis" },
                            { "data": "from_date" },
                            { "data": "exp_date" },
                            { "data": "note" },
                            {
                                sortable: false,
                                "render": function (data, type, full, meta) {
                                    var value=full.id
                                    var val_del=full.id
                                    return'<button   class="btn btn-app-green btn-xs btn_edit_discount"  value='+value+'><i class="fa fa-edit"></i></button>&nbsp;' +
                                        '<button   class="btn btn-app-red btn-xs btn_delete_discount "  value='+val_del+'><i class="fa fa-trash"></i></button>';
                                }
                            },

                           ],
                       })
                    }
            })

        })
        $('#discount_tab').click(function(){
            getDiscount()
        })
        $('#show_modal_discount').click(function(){
            $('#modal_add_discount').modal({backdrop:'static',keyboard:false})
        })
        $('#btn_add_discount').click(function(){
            var txtdescription=$('#txtdescription').val()
            var txtdiscount=$('#txtdiscount').val()
            var txtfromdate=$('#txtfromdate').val()
            var txtexpdate=$('#txtexpdate').val()
            var txtnote=$('#txtnote').val()
           if(txtdescription=="" || txtdiscount=="" ){
             Swal.fire({

                 'text':'Please Enter the value',
                 'type':'error',
             })
           }else{
            $.ajax({
                   "type":'POST',
                   "url":'{{ route('add_discount') }}',
                    data:{'_token':'{{ @csrf_token() }}','txtdescription':txtdescription,'txtdiscount':txtdiscount,'txtfromdate':txtfromdate,'txtexpdate':txtexpdate,'txtnote':txtnote},
                    success:function(data){
                        $('#txtdescription').val('')
                        $('#txtdiscount').val('')
                        $('#txtnote').val('')
                        $('#table_discount').DataTable({
                        "pageLength": 10,
                        "lengthMenu": [[ 10, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                        "pagingType": "full_numbers",
                        "displayStart": 0,
                        "iDisplayLength": 2,
                        destroy:true,
                        language: {
                            "sSearchPlaceholder": "Search...",
                            "sLengthMenu": "Show _MENU_ Items",
                            "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                            paginate: {
                                previous: '<i class="fas fa-caret-left"></i>',
                                next: '<i class="fas fa-caret-right"></i>',
                                first: '<i class="fas fa-step-backward"></i>',
                                last:     '<i class="fas fa-step-forward"></i>'
                            },
                            aria: {
                                paginate: {
                                    previous: 'Previous',
                                    next:     'Next',
                                    first: 'First',
                                    last: 'Last'
                                }
                            }

                        },
                        data:data.data,
                        "columns": [
                            {
                              "data":'id'
                            },
                            { "data": "discount_name" },
                            { "data": "percent_dis" },
                            { "data": "from_date" },
                            { "data": "exp_date" },
                            { "data": "note" },
                            {
                                sortable: false,
                                "render": function (data, type, full, meta) {
                                    var value=full.id
                                    var val_del=full.id
                                    return'<button   class="btn btn-app-green btn-xs btn_edit_discount"  value='+value+'><i class="fa fa-edit"></i></button>&nbsp;' +
                                        '<button   class="btn btn-app-red btn-xs btn_delete_discount "  value='+val_del+'><i class="fa fa-trash"></i></button>';
                                }
                            },

                           ],
                     })
                 }
            })
           }
        })
        $('#edit_pro_type').click(function(){
            var edit_service_type=$('#editservice_type').val()
            var id=$('#id_type').val()
            let dropdown = $('#service_type');
            $.ajax({
                "type":"POST",
                "url":'{{ route('update_pro_type') }}',
                data:{'_token':'{{ @csrf_token() }}','id':id,'edit_service_type':edit_service_type},
                success:function (data) {
                    $.each(data.data, function (key, entry) {
                        dropdown.append($('<option></option>').attr('value', entry.id).text(entry.service_type));
                    })
                    Swal.fire(
                        'Update Service Type',
                        'Successfully',
                        'success'
                    ).then(function () {
                        // $('#modal_service_type').modal('hide')
                        $('#table_service_type').DataTable({
                            "pageLength": 10,
                            "lengthMenu": [[ 10, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                            "pagingType": "full_numbers",
                            "displayStart": 0,
                            "iDisplayLength": 2,
                            destroy:true,
                            language: {
                                "sSearchPlaceholder": "Search...",
                                "sLengthMenu": "Show _MENU_ Items",
                                "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                                paginate: {
                                    previous: '<i class="fas fa-caret-left"></i>',
                                    next: '<i class="fas fa-caret-right"></i>',
                                    first: '<i class="fas fa-step-backward"></i>',
                                    last:     '<i class="fas fa-step-forward"></i>'
                                },
                                aria: {
                                    paginate: {
                                        previous: 'Previous',
                                        next:     'Next',
                                        first: 'First',
                                        last: 'Last'
                                    }
                                }

                            },
                            data:data.data,
                            "columns": [
                                { "data": "service_type" },

                                {
                                    sortable: false,
                                    "render": function (data, type, full, meta) {
                                        var value=full.id
                                        return'<button   class="btn btn-app-green btn-xs btn_edit_service_type"  value='+value+'><i class="fa fa-edit"></i></button>&nbsp;' +
                                            '<button   class="btn btn-app-red btn-xs  btn_delete_service_type "  value='+value+'><i class="fa fa-trash"></i></button>';
                                    }
                                },
                            ],
                        })
                    })

                }
            })
            dropdown.html('refresh',true)
        })
        $('#table_service_type').on('click','.btn_delete_service_type',function(){
            var id=$(this).val()
            let dropdown = $('#service_type');
           $.ajax({
               "type":'POST',
               'url':'{{  route('delete_pro_type') }}',
               data:{'_token':'{{  @csrf_token() }}','id':id},
               success:function (data) {
                    $.each(data.data, function (key, entry) {
                        dropdown.append($('<option></option>').attr('value', entry.id).text(entry.service_type));
                    })
                    Swal.fire(
                        'Delete Service Type',
                        'Successfully',
                        'success'
                    ).then(function () {
                        // $('#modal_service_type').modal('hide')
                        $('#table_service_type').DataTable({
                            "pageLength": 5,
                            "lengthMenu": [[ 5, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                            "pagingType": "full_numbers",
                            "displayStart": 0,
                            "iDisplayLength": 2,
                            destroy:true,
                            language: {
                                "sSearchPlaceholder": "Search...",
                                "sLengthMenu": "Show _MENU_ Items",
                                "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                                paginate: {
                                    previous: '<i class="fas fa-caret-left"></i>',
                                    next: '<i class="fas fa-caret-right"></i>',
                                    first: '<i class="fas fa-step-backward"></i>',
                                    last:     '<i class="fas fa-step-forward"></i>'
                                },
                                aria: {
                                    paginate: {
                                        previous: 'Previous',
                                        next:     'Next',
                                        first: 'First',
                                        last: 'Last'
                                    }
                                }

                            },
                            data:data.data,
                            "columns": [
                                { "data": "service_type" },

                                {
                                    sortable: false,
                                    "render": function (data, type, full, meta) {
                                        var value=full.id
                                        return'<button   class="btn btn-app-green btn-xs btn_edit_service_type"  value='+value+'><i class="fa fa-edit"></i></button>&nbsp;' +
                                            '<button   class="btn btn-app-red btn-xs  btn_delete_service_type "  value='+value+'><i class="fa fa-trash"></i></button>';
                                    }
                                },
                            ],
                        })
                    })

                }
           })
           dropdown.html('refresh',true)
        })
        $('#btn_edit_service').click(function () {
            var edit_service_name=$('#editservice_name').val()
            var edit_type=$('#edit_service_type').val()
            var id_service=$('#id_service').val()
            var edit_price=$('#editprice_service').val()
            $.ajax({
                type:"POST",
                url:'{{ route('edit_service_type') }}',
                data:{'_token':'{{ @csrf_token() }}','edit_service_name':edit_service_name,'edit_type':edit_type,'id_service':id_service,'edit_price':edit_price},
                success:function (data) {
                    Swal.fire(
                        'Update Product Service',
                        'Successfully',
                        'success'
                    ).then(function () {
                        $('.label_error').css("color", "black")
                        $('#modal_service').modal('hide')
                        $('#table_pro_service').DataTable({
                            "pageLength": 10,
                            "lengthMenu": [[ 10, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                            "pagingType": "full_numbers",
                            "displayStart": 0,
                            "iDisplayLength": 2,
                            destroy:true,
                            language: {
                                "sSearchPlaceholder": "Search...",
                                "sLengthMenu": "Show _MENU_ Items",
                                "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                                paginate: {
                                    previous: '<i class="fas fa-caret-left"></i>',
                                    next: '<i class="fas fa-caret-right"></i>',
                                    first: '<i class="fas fa-step-backward"></i>',
                                    last:     '<i class="fas fa-step-forward"></i>'
                                },
                                aria: {
                                    paginate: {
                                        previous: 'Previous',
                                        next:     'Next',
                                        first: 'First',
                                        last: 'Last'
                                    }
                                }
                            },
                            data:data.data,
                            "columns": [
                                {
                                    "data":'id'
                                },
                                { "data": "pro_service" },
                                { "data": "service_type" },
                                {
                                    "data": "price_service"
                                },
                                {
                                    sortable: false,
                                    "render": function (data, type, full, meta) {
                                        var value=full.id_pay
                                        if(value==1)
                                        {
                                            return "Per Month"
                                        }else if(value==3)
                                        {
                                            return "Per Term"
                                        }else if(value==6)
                                        {
                                            return "Per Semester"
                                        }
                                        else
                                        {
                                            return "Per Year"
                                        }
                                    }
                                },
                                {
                                    sortable: false,
                                    "render": function (data, type, full, meta) {
                                        var value=full.id_service_type
                                        var val_del=full.id
                                        return'<button   class="btn btn-app-green btn-xs btn_edit_service"  value='+value+'><i class="fa fa-edit"></i></button>&nbsp;' +
                                            '<button   class="btn btn-app-red btn-xs btn_delete_service "  value='+val_del+'><i class="fa fa-trash"></i></button>';
                                    }
                                },
                            ],
                        })
                    })
                }
            })
        })
        $('#table_pro_service').on('click','.btn_delete_service',function () {
             var id=$(this).val()
             $.ajax({
                 "type":'POST',
                 "url":'{{  route('delete_service') }}',
                  data:{'_token':'{{  @csrf_token() }}','id':id},
                  success:function (data) {
                    Swal.fire(
                        'Delete Product Service',
                        'Successfully',
                        'success'
                    ).then(function () {
                        $('#table_pro_service').DataTable({
                            "pageLength": 5,
                            "lengthMenu": [[ 5, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                            "pagingType": "full_numbers",
                            "displayStart": 0,
                            "iDisplayLength": 2,
                            destroy:true,
                            language: {
                                "sSearchPlaceholder": "Search...",
                                "sLengthMenu": "Show _MENU_ Items",
                                "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                                paginate: {
                                    previous: '<i class="fas fa-caret-left"></i>',
                                    next: '<i class="fas fa-caret-right"></i>',
                                    first: '<i class="fas fa-step-backward"></i>',
                                    last:     '<i class="fas fa-step-forward"></i>'
                                },
                                aria: {
                                    paginate: {
                                        previous: 'Previous',
                                        next:     'Next',
                                        first: 'First',
                                        last: 'Last'
                                    }
                                }
                            },
                            data:data.data,
                            "columns": [
                                {"data":"id"},
                                { "data": "pro_service" },
                                { "data": "service_type" },
                                {
                                    sortable: false,
                                    "render": function (data, type, full, meta) {
                                        var value=full.id_service_type
                                        var val_del=full.id
                                        return'<button   class="btn btn-app-green btn-xs btn_edit_service"  value='+value+'><i class="fa fa-edit"></i></button>&nbsp;' +
                                            '<button   class="btn btn-app-red btn-xs btn_delete_service "  value='+val_del+'><i class="fa fa-trash"></i></button>';
                                    }
                                },
                            ],
                        })
                    })

                }
             })

        })
        $('#table_pro_service  tbody').on('click','.btn_edit_service',function () {
            var dt=$('#table_pro_service').DataTable()
            var id = dt.cells($(this).closest('td').siblings().eq(0)).data();
            var data = dt.cells($(this).closest('td').siblings().eq(1)).data();
            var data2 = dt.cells($(this).closest('td').siblings().eq(3)).data();
            $('#id_service').val(id[0])
            $('#editservice_name').val(data[0])
            $('#edit_service_type').val($(this).val())
            $('#editprice_service').val(data2[0])
            $('#edit_service').modal({backdrop:'static',keyboard:false})
        })
        function getservicetype(){
            $('#table_service_type').DataTable({
                "pageLength": 5,
                "lengthMenu": [[ 5, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                "pagingType": "full_numbers",
                "displayStart": 0,
                "iDisplayLength": 2,
                destroy:true,
                language: {
                    "sSearchPlaceholder": "Search...",
                    "sLengthMenu": "Show _MENU_ Items",
                    "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                    paginate: {
                        previous: '<i class="fas fa-caret-left"></i>',
                        next: '<i class="fas fa-caret-right"></i>',
                        first: '<i class="fas fa-step-backward"></i>',
                        last:     '<i class="fas fa-step-forward"></i>'
                    },
                    aria: {
                        paginate: {
                            previous: 'Previous',
                            next:     'Next',
                            first: 'First',
                            last: 'Last'
                        }
                    }

                },
                "ajax":{
                    'type':'GET',
                    'url':'{{ route('service_type') }}',
                    processData: false,
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    traditional: true,
                },
                "columns": [
                    { "data": "service_type" },

                    {
                        sortable: false,
                        "render": function (data, type, full, meta) {
                            var value=full.id
                            return'<button   class="btn btn-app-green btn-xs btn_edit_service_type"  value='+value+'><i class="fa fa-edit"></i></button>&nbsp;' +
                                '<button   class="btn btn-app-red btn-xs btn_delete_service_type "   value='+value+'><i class="fa fa-trash"></i></button>';
                        }
                    },
                ],
            })
        }
        $('#table_service_type tbody').on('click','.btn_edit_service_type',function(){
            var dt=$('#table_service_type').DataTable()
            var id = $(this).val()
            var data = dt.cells($(this).closest('td').siblings().eq(0)).data();
           $('#editservice_type').val(data[0])
           $('#id_type').val(id)
           $('#modal_edit_service_type').modal({backdrop:'static',keyboard:false})

        })
        $('#btn_service_type').click(function () {
            getservicetype()
        })
        $('#show_modal_type').click(function () {
            $('#modal_service_type').modal({backdrop: 'static', keyboard: false})
        })
        $('#btn_close_modal_service').click(function () {
            $('.label_error').css("color", "black")
            $('.border_error').css('border-color',"#ddd")
        })
        $('#btn_add_service').on('click',function () {
            $('#modal_service').modal({backdrop: 'static', keyboard: false})
        })
        $('#btn_save_service').click(function () {
            // var service_name=$('#txtservice_name').val()
            // var price_service=$('#txtprice_service').val()
            // var service_type=$('#service_type').val()
            // if(service_name=="" || price_service==""){
            //     $('.label_error').css("color", "red")
            //     $('.border_error').css('border-color',"red")
            // }else{
            //
            // }

            var txt_acdemic_service_save=$('#txt_acdemic_service_save').val();
            var txt_permont_pri=$('#txtper_month_primary').val();
            var txt_perterm_pri=$('#txtper_term_primary').val();
            var txt_persem_pri=$('#txtper_semester_primary').val();
            var txt_permont_secon=$('#txtper_month_secondary').val();
            var txt_perterm_secon=$('#txtper_term_secondary').val();
            var txt_persem_secon=$('#txtper_semester_secondary').val();
            var txt_permont_hig=$('#txtper_month_higth').val();
            var txt_perterm_hig=$('#txtper_term_higth').val();
            var txt_persem_hig=$('#txtper_semester_higth').val();
            var txt_peryear_pri=$('#txtper_year_primary').val()
            var txt_peryear_secon=$('#txtper_year_secondary').val()
            var txt_peryear_high=$('#txtper_year_higth').val()
            $.ajax({
                type:'post',
                url:'{{ route('save_prosevice') }}',
                data:{'_token':'{{ @csrf_token() }}',
                    'txt_acdemic_service_save':txt_acdemic_service_save,
                    'txt_permont_pri':txt_permont_pri,
                    'txt_perterm_pri':txt_perterm_pri,
                    'txt_persem_pri':txt_persem_pri,
                    'txt_permont_secon':txt_permont_secon,'txt_perterm_secon':txt_perterm_secon,'txt_persem_secon':txt_persem_secon,
                    'txt_permont_hig':txt_permont_hig,'txt_perterm_hig':txt_perterm_hig,'txt_persem_hig':txt_persem_hig,
                    'txt_peryear_pri':txt_peryear_pri,'txt_peryear_secon':txt_peryear_secon,'txt_peryear_high':txt_peryear_high
                },
                success:function (data) {
                    Swal.fire(
                        'New Product Service',
                        'Successfully',
                        'success'
                    ).then(function () {
                        $('.label_error').css("color", "black")
                        // $('#modal_service').modal('hide')
                        $('#table_pro_service').DataTable({
                            "pageLength": 5,
                            "lengthMenu": [[ 5, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                            "pagingType": "full_numbers",
                            "displayStart": 0,
                            "iDisplayLength": 2,
                            destroy:true,
                            language: {
                                "sSearchPlaceholder": "Search...",
                                "sLengthMenu": "Show _MENU_ Items",
                                "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                                paginate: {
                                    previous: '<i class="fas fa-caret-left"></i>',
                                    next: '<i class="fas fa-caret-right"></i>',
                                    first: '<i class="fas fa-step-backward"></i>',
                                    last:     '<i class="fas fa-step-forward"></i>'
                                },
                                aria: {
                                    paginate: {
                                        previous: 'Previous',
                                        next:     'Next',
                                        first: 'First',
                                        last: 'Last'
                                    }
                                }
                            },
                            data:data.data,
                            "columns": [
                                {
                                    "data":'id'
                                },
                                { "data": "pro_service" },
                                { "data": "service_type" },
                                {
                                    "data": "price_service"
                                },
                                {
                                    sortable: false,
                                    "render": function (data, type, full, meta) {
                                        var value=full.id_pay
                                        if(value==1)
                                        {
                                            return "Per Month"
                                        }else if(value==3)
                                        {
                                            return "Per Term"
                                        }else if(value==6)
                                        {
                                            return "Per Semester"
                                        }
                                        else
                                        {
                                            return "Per Year"
                                        }


                                    }
                                },
                                {
                                    sortable: false,
                                    "render": function (data, type, full, meta) {
                                        var value=full.id_service_type
                                        var val_del=full.id
                                        return'<button   class="btn btn-app-green btn-xs btn_edit_service"  value='+value+'><i class="fa fa-edit"></i></button>&nbsp;' +
                                            '<button   class="btn btn-app-red btn-xs btn_delete_service "  value='+val_del+'><i class="fa fa-trash"></i></button>';
                                    }
                                },
                            ],
                        })
                    })

                }
            })

        })
        $('#div_title_service').hide()
        $('#btn_search_service').click(function () {
            var idpaid=$('#select_paid').val()
            var idyear=$('#select_academic').val()
            $('#span_permonth').html($('#select_paid option:selected').text())
            $('#span_year_en').html($('#select_academic option:selected').text())
            $('#span_year_kh').html($('#select_academic option:selected').text())
            $('#div_title_service').show()
            getService(idpaid,idyear)
        })
        $('#btn_save_service_type').click(function () {
            let dropdown = $('#service_type');
            var service_type=$('#txtservice_type').val()
            $.ajax({
                "type":'POST',
                'url':'{{ route('save_service_type') }}',
                data:{'_token':'{{ @csrf_token() }}','service_type':service_type},
                success:function (data) {
                    $.each(data.data, function (key, entry) {
                        dropdown.append($('<option></option>').attr('value', entry.id).text(entry.service_type));
                    })
                    Swal.fire(
                        'New Service Type',
                        'Successfully',
                        'success'
                    ).then(function () {
                        // $('#modal_service_type').modal('hide')
                        $('#table_service_type').DataTable({
                            "pageLength": 5,
                            "lengthMenu": [[ 5, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                            "pagingType": "full_numbers",
                            "displayStart": 0,
                            "iDisplayLength": 2,
                            destroy:true,
                            language: {
                                "sSearchPlaceholder": "Search...",
                                "sLengthMenu": "Show _MENU_ Items",
                                "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                                paginate: {
                                    previous: '<i class="fas fa-caret-left"></i>',
                                    next: '<i class="fas fa-caret-right"></i>',
                                    first: '<i class="fas fa-step-backward"></i>',
                                    last:     '<i class="fas fa-step-forward"></i>'
                                },
                                aria: {
                                    paginate: {
                                        previous: 'Previous',
                                        next:     'Next',
                                        first: 'First',
                                        last: 'Last'
                                    }
                                }

                            },
                            data:data.data,
                            "columns": [
                                { "data": "service_type" },

                                {
                                    sortable: false,
                                    "render": function (data, type, full, meta) {
                                        var value=full.id
                                        return'<button   class="btn btn-app-green btn-xs "  value='+value+'><i class="fa fa-edit"></i></button>&nbsp;' +
                                            '<button   class="btn btn-app-red btn-xs "  value='+value+'><i class="fa fa-trash"></i></button>';
                                    }
                                },
                            ],
                        })
                    })

                }
            })
            dropdown.html('refresh',true)
        })
		$('#all-notifications').DataTable({
			"pageLength": 10,
			"lengthMenu": [[ 10, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
			"pagingType": "full_numbers",
			"displayStart": 0,
			"iDisplayLength": 2,
			language: {
				"sSearchPlaceholder": "Search...",
				"sLengthMenu": "Show _MENU_ Items",
				"sInfo": "_START_ - _END_ of _TOTAL_ Items",
				paginate: {
					previous: '<i class="fas fa-caret-left"></i>',
					next: '<i class="fas fa-caret-right"></i>',
					first: '<i class="fas fa-step-backward"></i>',
					last:     '<i class="fas fa-step-forward"></i>'
				},
				aria: {
					paginate: {
						previous: 'Previous',
						next:     'Next',
						first: 'First',
						last: 'Last'
					}
				}

			}
		})

		var numKH= new Intl.NumberFormat('kh-KH',{
			style:'currency',
			currency:'KHR'
		})

		$(document).ready(function() {
			$('#from').data('daterangepicker')
			$('#stuid').html("Not selection");
			$('#name_kh').html("Not selection");
			$('#name_en').html("Not selection");
			$('#tel').html("Not selection");
			$('#h_name_en').html("Not selection")
            if($('#h_name_en').text()=="Not selection"){
                $('#btn_search_by_date').prop('disabled',true)
            }
			crInitClock()

		})
		var crClockInit1 = null;
		var crClockInterval = null;
		function crInitClock() {
			crClockInit1 = setInterval(function() {
				if (moment().format("SSS") <= 40) {
					clearInterval(crClockInit1);
					crStartClockNow();
				}
			}, 30);
		}

		function crStartClockNow() {
			crClockInterval = setInterval(function() {
				$('#clock_time').html(moment().format('D-M-Y hh:mm A'));
			}, 1000);
		}
		$('#student').DataTable({
			"lengthMenu": [ 2, 4, 6, 8, 10 ],
			pageLength : 10,
			searching: false,
		});
		var list = $('#student_name').select2({
			placeholder: "Select a Student",
			allowClear: true,
	  		closeOnSelect: false
		}).on("select2:closing", function(event) {
	  		event.preventDefault();
		}).on("select2:closed", function(event) {
	  		list.select2("open");
		});
		list.select2("open");

		// format currency number to dollar
		var numUSD = new Intl.NumberFormat('en-US', {
			style:'currency',
			currency: 'USD'
		})
		// end

		$(document).ready(function() {

			$.ajaxSetup({
		        headers: {
		            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
		        }
		    });


			$('#edit_data').click(function() {
				if ($('#h_name_en').text()=="Not selection") {
					swal.fire({
			            title: 'Warning!',
			            text: "Please Select a Student First!",
			            type: "warning",
			        })
				}
			});
			$('#open_invoice').click(function () {
				if ($('#h_name_en').text()=="Not selection") {
					swal.fire({
						title: 'Warning!',
						text: "Please Select a Student First!",
						type: "warning",
					})
			}
	   	})

         var tbl=   $('#table_invoice').DataTable({
             "pageLength": 5,
             "lengthMenu": [[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, "All"]],
             "pagingType": "full_numbers",
             "displayStart": 0,
             "iDisplayLength": 2,
             language: {
                 "sSearchPlaceholder": "Search...",
                 "sLengthMenu": "Show _MENU_ Items",
                 "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                 paginate: {
                     previous: '<i class="fas fa-caret-left"></i>',
                     next: '<i class="fas fa-caret-right"></i>',
                     first: '<i class="fas fa-step-backward"></i>',
                     last:     '<i class="fas fa-step-forward"></i>'
                 },
                 aria: {
                     paginate: {
                         previous: 'Previous',
                         next:     'Next',
                         first: 'First',
                         last: 'Last'
                     }
                 }

             }
         })
			function selectStudentInfo() {
				var id = $('#student_name').val();
                $('#btn_search_by_date').prop('disabled',false)
		    	$.ajax({
		    		url: "{{ url('select_info_by_iD') }}" + '/' + id,
		    		method: 'get',
		    		data: {id: JSON.stringify(id)},
		    		processData: false,
		    		dataType: 'json',
		    		contentType: "application/json; charset=utf-8",
		    		traditional: true,
		    		success:function(data) {
							var link='{{ route('payment.show','id_student') }}'
							var link2=link.replace("id_student",data.student.id)
                            var   grouped = [];
                            // var grandTotal=0
                        $('#over_due').html(data.count_over_due.over_due);
							$('#h_name_en').html(data.student.en_name);
							$('#stuid').html(data.student.student_id);
							$('#name_kh').html(data.student.kh_name);
							$('#name_en').html(data.student.en_name);
							$('#tel').html(data.student.phone_student);
							$('#edit_data').attr("href", 'register/' + data.student.id + '/edit');
							$('#open_invoice').attr("href",link2)
							$('#balance').html(numUSD.format(data.data_payment.balance));
							$('#invoice').html(data.data.length);
							$('#deposit').html(numUSD.format(data.deposit.deposit))

                             // for (var i = 0; i < data.data.length; i++) {
                             //        grandTotal += data.data[i].total_pay;
                             // }
                             //    console.log(grandTotal)
                          $('#table_invoice').DataTable( {
                              "pageLength": 5,
                              "lengthMenu": [[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, "All"]],
                              "pagingType": "full_numbers",
                              "displayStart": 0,
                              "iDisplayLength": 2,
                              language: {
                                  "sSearchPlaceholder": "Seach...",
                                  "sLengthMenu": "Show _MENU_ Items",
                                  "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                                  paginate: {
                                      previous: '<i class="fas fa-caret-left"></i>',
                                      next: '<i class="fas fa-caret-right"></i>',
                                      first: '<i class="fas fa-step-backward"></i>',
                                      last:     '<i class="fas fa-step-forward"></i>'
                                  },
                                  aria: {
                                      paginate: {
                                          previous: 'Previous',
                                          next:     'Next',
                                          first: 'First',
                                          last: 'Last'
                                      }
                                  }

                              },
                              "processing": true,
                              searching:true,
                              destroy:true,
                              "order": [[ 0, 'asc' ]],
                              data:data.data,
                                "columns": [
                                    { "data": "payment_date" },
                                    { "data": "payment_method" },
                                    { "data": "invoice_number" },
                                    { "data": "total_pay"},
                                    { "data": "username" },
                                    {
                                        sortable: false,
                                        "render": function (data, type, full, meta) {
                                            {{--var link_ID = '{{ route('register.show','id') }}'--}}
                                            {{--var rederect=link_ID.replace('id',full.Invoice_id)--}}
                                            var value=full.Invoice_id
                                            return '<button   class="btn btn-app-light btn-xs btn_open_detail"  value='+value+'><i class="fa fa-eye"></i></button>';
                                        }
                                    },
                                ],
                                  columnDefs:[
                                      {targets:3, render:function(data){
                                          return numUSD.format(data)
                                      }},
                                      {targets:0, render:function(data){
                                              return formatDateForPint(data)
                                      }}
                                      ,
                                      {targets:2, render:function(data){
                                              return "CIN"+data
                                      }},
                                      {targets:4, render:function(data){
                                              return "Paid By [ " +data+" ]"
                                      }}
                                  ],
                            } );
		    		}
		    	})
			}
			$('#btn_search_by_date').click(function () {
                var from_date=$("#from").val()
                var to_date=$('#to').val()
                var id = $('#student_name').val();
                var pay_method=$('#pay_method').val()
                $('#table_invoice').DataTable( {
                    "pageLength": 5,
                    "lengthMenu": [[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, "All"]],
                    "pagingType": "full_numbers",
                    "displayStart": 0,
                    "iDisplayLength": 2,
                    language: {
                        "sSearchPlaceholder": "Seach...",
                        "sLengthMenu": "Show _MENU_ Items",
                        "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                        paginate: {
                            previous: '<i class="fas fa-caret-left"></i>',
                            next: '<i class="fas fa-caret-right"></i>',
                            first: '<i class="fas fa-step-backward"></i>',
                            last:     '<i class="fas fa-step-forward"></i>'
                        },
                        aria: {
                            paginate: {
                                previous: 'Previous',
                                next:     'Next',
                                first: 'First',
                                last: 'Last'
                            }
                        }

                    },
                    "processing": true,
                    searching:true,
                    destroy:true,
                    "order": [[ 0, 'asc' ]],
                    "ajax":{
                        'type':'POST',
                        'url':'{{ route('searhByDate') }}',
                        data:{'_token':'{{ @csrf_token() }}','from_date':from_date,'to_date':to_date,'id':id,'pay_method':pay_method}
                    },
                    "columns": [
                        { "data": "payment_date" },
                        { "data": "payment_method" },
                        { "data": "invoice_number" },
                        { "data": "total_pay"},
                        { "data": "username" },
                        {
                            sortable: false,
                            "render": function (data, type, full, meta) {
                                var value=full.Invoice_id
                                return '<button   class="btn btn-app-light btn-xs btn_open_detail"  value='+value+'><i class="fa fa-eye"></i></button>';
                            }
                        },

                    ],
                    columnDefs:[
                        {targets:3, render:function(data){
                                return numUSD.format(data)
                            }},
                        {targets:0, render:function(data){
                                return formatDateForPint(data)
                        }},
                        {targets:2, render:function(data){
                                return "CIN"+data
                        }},
                        {targets:4, render:function(data){
                                return "Paid By [ " +data+" ]"
                        }}
                    ],
                } );

            })
            $('#table_invoice').on('click','.btn_open_detail',function () {

                var id=$('#student_name').val()
                var id_payment=$(this).val()
                $.ajax({
                    url: "{{ url('viewinvoice') }}" + '/' + id+'/'+id_payment,
                    method: 'GET',
                    processData: false,
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    traditional: true,
                    success:function (data) {
                        $('#name_custom').html($('#name_en').text())
                        $('#reciept_custom').html('CIN'+data.header.invoice_number)
                        $('#due_date_custom').html(formatDateForPint(data.header.due_date))
                        $('#date_pay_custom').html(formatDateForPint(data.header.payment_date))
                        $('#print_dis').html(numUSD.format(data.header.total_discount))
                        $('#print_sub').html(numUSD.format(data.header.total_subtotal))
                        $('#print_amount').html(numUSD.format(parseFloat(data.header.total_subtotal-data.header.total_discount)))
                        $('#label_deposit').html(numUSD.format(data.header.deposit))
                        $('#tbl_print_invoice tbody').html(data.descriptions)
                    }
                })
                $("#modalViewPay").modal({backdrop: 'static', keyboard: false})
            })
            $('#btn_over_due').click(function () {
                if($('#h_name_en').text()=='Not selection'){
                    swal.fire({
                        title: 'Warning!',
                        text: "Please Select a Student First!",
                        type: "warning",
                    })
                }else{
                    var id=$('#student_name').val()
                    $.ajax({
                        url: "{{ url('searchoverdue') }}" + '/' + id,
                        type:'GET',
                        data: {id: JSON.stringify(id)},
                        processData: false,
                        dataType: 'json',
                        contentType: "application/json; charset=utf-8",
                        traditional: true,
                        success:function (data) {
                            $('#table_validate_pay').removeAttr('width').DataTable( {
                                "pageLength": 5,
                                "lengthMenu": [[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, "All"]],
                                "pagingType": "full_numbers",
                                "displayStart": 0,
                                "iDisplayLength": 2,
                                language: {
                                    "sSearchPlaceholder": "Seach...",
                                    "sLengthMenu": "Show _MENU_ Items",
                                    "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                                    paginate: {
                                        previous: '<i class="fas fa-caret-left"></i>',
                                        next: '<i class="fas fa-caret-right"></i>',
                                        first: '<i class="fas fa-step-backward"></i>',
                                        last:     '<i class="fas fa-step-forward"></i>'
                                    },
                                    aria: {
                                        paginate: {
                                            previous: 'Previous',
                                            next:     'Next',
                                            first: 'First',
                                            last: 'Last'
                                        }
                                    }
                                },
                                "processing": true,
                                searching:true,
                                destroy:true,
                                "order": [[ 0, 'asc' ]],
                                data:data.data,
                                columnDefs:[
                                    {
                                        targets:3,
                                        render:function(data){
                                            return formatDateForPint(data)
                                        }}
                                    ,
                                    {targets:4, render:function(data){
                                            return formatDateForPint(data)
                                        }}
                                    ,
                                    {targets:0, render:function(data){
                                            return "CIN"+data
                                        }},
                                ],
                                fixedColumns: true,
                                "columns": [
                                    { "data": "invoice_number" },
                                    { "data": "description" ,className:"font_style"},
                                    { "data": "phone_student" },
                                    { "data": "Volidty_of_payment"},
                                    { "data": "expired_date" },
                                    {
                                        sortable: false,
                                        "render": function (data, type, full, meta) {
                                            return '<button   class="btn btn-danger btn-xs" style="font-size: 10px">CALL NOW &nbsp;<i class="fa fa-phone" ></i></button>';
                                        }
                                    },
                                ],


                            } );
                            $('#modalOverDue').modal({backdrop:'static',keyboard:false})
                        }
                    })



                }

            })
            function formatDateForPint(date) {
                //function formation date
                var date=new Date(date)
                return    ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate()))+'-' +((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))) + '-' + date.getFullYear()
            }
		    $('#student_name').on('change', function() {
		    	if ($('#student_name').val() == '') {
		    		$('#edit_data').removeAttr('href');
		    		$('#open_invoice').removeAttr('href');

		    	} else {
		    		selectStudentInfo();
		    	}
		    });

		})
		$('#view_all').click(function () {
			$('#view_all_modal').modal({backdrop:'static',keyboard:false})
		})

		'use strict';
		;( function ( document, window, index )
		{
			var inputs = document.querySelectorAll( '.inputfile' );
			Array.prototype.forEach.call( inputs, function( input )
			{
				var label	 = input.nextElementSibling,
					labelVal = label.innerHTML;

				input.addEventListener( 'change', function( e )
				{
					var fileName = '';
					if( this.files && this.files.length > 1 )
						fileName = ( this.getAttribute( 'data-multiple-caption' ) || '' ).replace( '{count}', this.files.length );
					else
						fileName = e.target.value.split( '\\' ).pop();

					if( fileName )
						label.querySelector( 'span' ).innerHTML = fileName;
					else
						label.innerHTML = labelVal;
				});

				// Firefox bug fix
				input.addEventListener( 'focus', function(){ input.classList.add( 'has-focus' ); });
				input.addEventListener( 'blur', function(){ input.classList.remove( 'has-focus' ); });
			});
		}( document, window, 0 ));
    </script>



    <script type="text/javascript">
		function formatDate(date) {
		    var d = new Date(date),
		        month = '' + (d.getMonth() + 1),
		        day = '' + d.getDate(),
		        year = d.getFullYear();

		    if (month.length < 2) month = '0' + month;
		    if (day.length < 2) day = '0' + day;

		    return [day, month, year].join('-');
		}

		$('#show_report').DataTable({
            "pagingType": "full_numbers",
	            language: {
	                "sSearchPlaceholder": "Seach...",
	                "sLengthMenu": "Show _MENU_ Items",
	                "sInfo": "_START_ - _END_ of _TOTAL_ Items",
	            paginate: {
	                previous: '<i class="fas fa-caret-left"></i>',
	                next: '<i class="fas fa-caret-right"></i>',
	                first: '<i class="fas fa-step-backward"></i>',
	                last: '<i class="fas fa-step-forward"></i>'
	            },
	            aria: {
	                paginate: {
	                    previous: 'Previous',
	                    next: 'Next',
	                    first: 'First',
	                    last: 'Last'
	                }
	            }
            },
		})
		$(document).ready(function() {
			var collapsedGroups = {};
			// format currency number to dollar
			var numUSD = new Intl.NumberFormat('en-US', {
				style:'currency',
				currency: 'USD'
			})
			// end



    			$('#search').click(function() {
				var start_date = $('#start_from_date').val();
                var from_date = $('#from_date').val();

                var d = new Date();

                var month = d.getMonth()+1;
                var day = d.getDate();

                var output = d.getFullYear() + '/' +
                    ((''+month).length<2 ? '0' : '') + month + '/' +
                    ((''+day).length<2 ? '0' : '') + day

				if (start_date == '') {
					swal.fire({
			            title: 'Warning!',
			            text: "Please Choose Start Date!",
			            type: "warning",
			        })
				} else if(from_date == '') {
					swal.fire({
			            title: 'Warning!',
			            text: "Please Choose From Date!",
			            type: "warning",
			        })
				} else {
					$.ajax({
						url: '{{ url('search-report') }}',
						method: 'get',
						data: {'_token':'{{ @csrf_token() }}', 'start_date':start_date, 'from_date': from_date},
						dataType: 'json',
						success: function(data) {
							var total_amount = 0;
							var total_invoice = 0;
							for (var i = 0; i < data.report.length; i++) {
						        total_amount += data.report[i].total_payment;
						    }
                                var lists=data.report
                                var browsers = []
                                for (var i = 0; i < lists.length; i++) {
                                    var currentBrowser = lists[i].invoice_number;
                                    if (undefined != browsers[currentBrowser]) {
                                        browsers[currentBrowser]++;
                                    }
                                    else {
                                        browsers[currentBrowser] = 1;
                                    }
                                }
                            console.log(browsers)
                            var count=0
                            browsers.forEach(element => {
                                count++
                            });

                            $('.header-date').html('From' + ' ' + start_date + ' ' + 'To' + ' ' + from_date);
							$('#cash_invoice').html(count)
							$('#total_amm').html(numUSD.format(total_amount))
                               $('.print').click(function() {

                                    $('.cash-report').printThis({
                                            importCSS: false,
                                            importStyle: true,
                                           loadCSS: ["{{ asset('css/printThis.css') }}", "{{asset('theme/dist/assets/css/bootstrap.css')}}", "{{asset('css/cash_collection.css')}}"],
                                       });
                                })

                             $('.pdf').click(function() {
		  						var doc = new jsPDF('p', 'mm', 'a4')
								// doc.addFont("{{asset('font/Battambang-Regular.ttf')}}", "Battambang", "regular");
								// doc.setFont("Battambang", "regular");
								doc.setFontSize(10);
								doc.text(70, 10, 'Dewey International School Romcheck Campus');

								doc.setFontSize(8);
								doc.setFontStyle('bold')
								doc.text(90, 15, 'Cash Collection Report');

								doc.setFontSize(8);
								doc.setFontStyle('normal')
								doc.text(85, 20, 'From' + ' ' + start_date + ' ' + 'To' + ' ' + from_date);

								doc.setFontSize(10)
								doc.text(18, 30, 'Number of Invoices')

								doc.setFontSize(12)
								doc.setFontStyle('bold')
								doc.text(30, 35, '' + count)

								doc.setFontSize(10)
								doc.setFontStyle('normal')
								doc.text(160, 30, 'Total Received')

								doc.setFontSize(12)
								doc.setFontStyle('bold')
								doc.text(160, 35, '' + numUSD.format(total_amount))

							  	doc.autoTable({
							  		html: '#show_report',
							  		startY: 40,
							  		styles: {font: 'times', overflow: 'linebreak'},
							  		showHead: 'firstPage',
							  		showFoot: 'lastPage',
							  		headStyles: {
							  			halign: 'center',
							            fontStyle: 'bold'
							        },
							  	})
							  	doc.save('cash_collection_report.pdf')
							})

							$('.excel').click(function() {
								$("#show_report").excelexportjs({
								  containerid:"show_report",
								  datatype:'table',
								  worksheetName:"Report Cash" + output,
								  columns:null,
								  filename: "Report Cash" + output,
								});
							})

							$('.csv').click(function() {
								$('#show_report').TableCSVExport({
									delivery: 'download',
        							filename: 'cash_collection_report.csv'
								})
							})
							var table = $('#show_report').DataTable({
                                "pagingType": "full_numbers",
                                  "lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
                                    language: {
                                        "sSearchPlaceholder": "Seach...",
                                        "sLengthMenu": "Show _MENU_ Items",
                                        "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                                    paginate: {
                                        previous: '<i class="fas fa-caret-left"></i>',
                                        next: '<i class="fas fa-caret-right"></i>',
                                        first: '<i class="fas fa-step-backward"></i>',
                                        last: '<i class="fas fa-step-forward"></i>'
                                },
                                    aria: {
                                        paginate: {
                                            previous: 'Previous',
                                            next: 'Next',
                                            first: 'First',
                                            last: 'Last'
                                        }
                                    }
                                },
                              	processing: true,
						        ordering: false,
						        destroy: true,
						        data: data.report,
						        columns: [
						        	{ "data": "payment_date" },
                                    { "data": "en_name" },
                                    { "data": "invoice_number" },
                                    { "data": "description" },
                                    { "data": "username"},
                                    { "data": "total_payment" },
                                ],
                                columnDefs:[

                                      {targets:2, render:function(data){
                                              return "CIN" + data
                                      }},
                                      {targets:5, render:function(data){
                                          return numUSD.format(data)
                                      }},
                                      { "visible": false, "targets": 2 },

                                ],
                                "buttons": [ 'print', 'excel','csv','pdf'],
						        order: [[2, 'asc'], [3, 'asc']],
							    rowsGroup:[2],
						        rowGroup: {
                                	dataSrc: ['invoice_number'],
                                	startRender: function (rows, group) {

								        if (group == group) {
								        	return 'Invoice Number: ' + 'CIN' + group;
								        }
                                	},
						            endRender: function ( rows, group ) {
						                var total = rows
						                    .data()
						                    .pluck('total_payment')
						                    .reduce( function (a, b) {
						                        return a + b;
						                    }, 0) + rows;
						                total = $.fn.dataTable.render.number(',', '.', 2, '$').display( total )
                                        // alert(total)
						                return $('<tr/>')
						                    .append( '<td colspan="4" style="background-color:#ffffff;text-align:right">Total : </td>' )
						                    .append( '<td  style="background-color: #ffffff; font-weight: normal;text-align:center">'+total+'</td>' );
						            },
						        }
							})
						},
					});
				}
			})
		});
        function fetchAllCount(){
            $.ajax({
                url:'{{  route('countDetail') }}',
                type:'GET',
                processData: false,
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                traditional: true,
                success:function(data)
                {
                   $('#proserive').html(data.pro_service)
                   $('#servicetype').html(data.service_type)
                   $("#discount").html(data.discount)
                   $('#academic').html(data.academic)
                }
            })

        }
        $('#btn_das').click(function(){
            fetchAllCount()
        })
        $('#pills-profile-tab').click(function(){
            fetchAllCount()
        })
        $('#tbl_confirm_paid').DataTable()
        function show_cofirm_paid(){
            $.ajax({
                url:'{{ route('search_customer_not_paid') }}',
                type:'POST',
                data:{'_token':'{{ @csrf_token() }}'},
                success:function(data)
                {
                    $('#tbl_confirm_paid').DataTable({
                        "pageLength": 10,
                        "lengthMenu": [[ 10, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                        "pagingType": "full_numbers",
                        "displayStart": 0,
                        "iDisplayLength": 2,
                        destroy:true,
                        language: {
                            "sSearchPlaceholder": "Search...",
                            "sLengthMenu": "Show _MENU_ Items",
                            "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                            paginate: {
                                previous: '<i class="fas fa-caret-left"></i>',
                                next: '<i class="fas fa-caret-right"></i>',
                                first: '<i class="fas fa-step-backward"></i>',
                                last:     '<i class="fas fa-step-forward"></i>'
                            },
                            aria: {
                                paginate: {
                                    previous: 'Previous',
                                    next:     'Next',
                                    first: 'First',
                                    last: 'Last'
                                }
                            }
                        },
                        data:data.data,
                        "columns": [
                            {
                                "render": function (data, type, full, meta) {

                                    return "CIN"+full.invoice_number
                                }
                            },
                            { "data": "en_name" },
                            { "data": "invoice_des" },
                            { "data": "phone_student" },
                            {
                                sortable: false,
                                "render": function (data, type, full, meta) {
                                    var value=full.p_id
                                    return'<button   class="btn btn-success btn-xs  btn_update_confirm"  style="font-size: 11px" value='+value+'>Confirm Paid</button>&nbsp;';
                                }
                            },
                        ],
                    })
                }
            })
        }
        $('#btn_confirm_paid').click(function(){
                show_cofirm_paid()
        })

        $('#tbl_confirm_paid').on('click','.btn_update_confirm',function(){
            Swal.fire({
                title:'Confirm Paid ',
                text: "You want to confirm paid",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                cancelButtonText: 'Cancel',
                confirmButtonText: 'Confirm'
            }).then((result) => {
                if (result.value) {
                    $.ajax({
                        'url':'{{ route('update_save_paid') }}',
                        'type':'POST',
                        data:{'_token':'{{ @csrf_token() }}','id':$(this).val()},
                        success:function(data)
                        {
                            Swal.fire({
                                'text':'Confirm Paid Successfully',
                                'type':'success'
                            }).then(function(){
                                show_cofirm_paid()
                            })
                            // window.location.reload().delay(200)
                        }
                    })
                }
            })
        })

        $('#txtsearch_confirm_paid').keyup(function(){
            var id=$('#txtsearch_confirm_paid').val()
            if(id=="")
            {
                // Swal.fire({
                //     'type':'warning',
                //     'text':'Please select id first'
                // })
            }else{
                $.ajax({
                    url: "{{ url('search_confirm_paid') }}" + '/' + id,
                    method: 'get',
                    data: {id: JSON.stringify(id)},
                    processData: false,
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    traditional: true,
                    success:function(data)
                    {
                        $('#tbl_confirm_paid').DataTable({
                            "pageLength": 10,
                            "lengthMenu": [[ 10, 25, 50, 100, -1], [ 10, 25, 50, 100, "All"]],
                            "pagingType": "full_numbers",
                            "displayStart": 0,
                            "iDisplayLength": 2,
                            destroy:true,
                            language: {
                                "sSearchPlaceholder": "Search...",
                                "sLengthMenu": "Show _MENU_ Items",
                                "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                                paginate: {
                                    previous: '<i class="fas fa-caret-left"></i>',
                                    next:  '<i class="fas fa-caret-right"></i>',
                                    first: '<i class="fas fa-step-backward"></i>',
                                    last:  '<i class="fas fa-step-forward"></i>'
                                },
                                aria: {
                                    paginate: {
                                        previous: 'Previous',
                                        next:     'Next',
                                        first: 'First',
                                        last: 'Last'
                                    }
                                }
                            },
                            data:data.data,
                            "columns": [
                                {
                                    "render": function (data, type, full, meta) {

                                        return "CIN"+full.invoice_number
                                    }
                                },
                                { "data": "en_name" },
                                { "data": "invoice_des" },
                                { "data": "phone_student" },
                                {
                                    sortable: false,
                                    "render": function (data, type, full, meta) {
                                        var value=full.p_id
                                        return'<button   class="btn btn-success btn-xs  btn_update_confirm"  style="font-size: 11px" value='+value+'>Confirm Paid</button>&nbsp;';
                                    }
                                },
                            ],
                        })
                    }
                })
            }
        })
    </script>
    <script>
        function formatDateForPint(date) {
            //function formation date
            var date=new Date(date)
            return    ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate()))+'-' +((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))) + '-' + date.getFullYear()

        }
        $('#btn_show_modal_deposit').click(function(){
            var id=$('#student_name').val()
            $('#modal_deposit').modal({backdrop:'static',keyboard:false})
            $.ajax({
                'type':'POST',
                'url':'{{ route('viewDeposit_View') }}',
                data:{'_token':'{{ @csrf_token() }}','id':id},
                success:function(data)
                {
                    $('#table_deposit').DataTable( {
                        "pageLength": 5,
                        "lengthMenu": [[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, "All"]],
                        "pagingType": "full_numbers",
                        "displayStart": 0,
                        "iDisplayLength": 2,
                        language: {
                            "sSearchPlaceholder": "Seach...",
                            "sLengthMenu": "Show _MENU_ Items",
                            "sInfo": "_START_ - _END_ of _TOTAL_ Items",
                            paginate: {
                                previous: '<i class="fas fa-caret-left"></i>',
                                next: '<i class="fas fa-caret-right"></i>',
                                first: '<i class="fas fa-step-backward"></i>',
                                last:     '<i class="fas fa-step-forward"></i>'
                            },
                            aria: {
                                paginate: {
                                    previous: 'Previous',
                                    next:     'Next',
                                    first: 'First',
                                    last: 'Last'
                                }
                            }
                        },
                        "processing": true,
                        searching:true,
                        destroy:true,
                        "order": [[ 0, 'asc' ]],
                        data:data.data,
                        "columns": [
                            { "data": "payment_date" },
                            { "data": "payment_method" },
                            { "data": "invoice_number" },
                            { "data": "total_pay"},
                            { "data": "deposit" },
                            {
                                sortable: false,
                                "render": function (data, type, full, meta) {
                                            {{--var link_ID = '{{ route('register.show','id') }}'--}}
                                            {{--var rederect=link_ID.replace('id',full.Invoice_id)--}}
                                    // var value=full.Invoice_id
                                    // return '<button   class="btn btn-app-light btn-xs btn_open_detail"  value='+value+'><i class="fa fa-eye"></i></button>';

                                    return '<p style="color:red">'+numUSD.format(full.total_pay-full.deposit)+'</p>';
                                }
                            },
                        ],
                        columnDefs:[
                            {targets:3, render:function(data){
                                    return numUSD.format(data)
                                }},
                            {targets:0, render:function(data){
                                    return formatDateForPint(data)
                                }}
                            ,
                            {targets:2, render:function(data){
                                    return "CIN"+data
                                }},
                            {targets:4, render:function(data){
                                    return numUSD.format(data)
                                }}
                        ],
                    } );
                }
            })
        })
    </script>
@endsection


