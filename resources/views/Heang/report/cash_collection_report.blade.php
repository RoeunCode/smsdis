@extends('layout')
@section('content')
	<link rel="stylesheet" type="text/css" href="{{asset('css/main.css')}}">
	<link rel="stylesheet" type="text/css" href="{{asset('css/cash_collection.css')}}">
	<link rel="stylesheet" href="https://cdn.datatables.net/rowgroup/1.0.4/css/rowGroup.dataTables.min.css"/>
	<div class="row">
		<div class="col-lg-1 col-md-1 col-sm-1"></div>
		<div class="col-lg-10 col-md-10 col-sm-10">
			<div class="card">
				<div class="card-header bg-blue bg-inverse">
					<h4>Report Collection Report</h4>
					<button type="button" class="btn btn-primary btn-sm float-right" id="print_report"><i class="fas fa-print"></i> Print</button>
				</div>
				<div class="card-block">
					<div class="form-search-date">
						<div class="row">
							<div class="col-lg-3 col-md-4 col-sm-5 col-xs-5">
								<div class="form-group">
									<input type="date" class="form-control form-control-sm" id="start" name="start">
								</div>
							</div>
							<div class="col-lg-3 col-md-4 col-sm-5 col-xs-5">
								<div class="form-group">
									<input type="date" class="form-control form-control-sm" id="from" name="from">
								</div>	
							</div>
							<div class="col-lg-3 col-md-4 col-sm-2 col-xs-2">
								<div class="form-group">
									<button class="btn btn-default btn-sm" id="search" name="search"><i class="fa fa-search" aria-hidden="true"></i></button>
								</div>	
							</div>
						</div>
					</div>
					<div class="cash-report">
						<div class="row">
							<div class="col-lg-12">
								<div class="header text-center">
									<h4 class="header-title font-battambang">សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី ទីតាំងរំចេក</h4>
									<h4 class="header-subtitle">Cash Collection Report</h4>
									<p class="header-date" id="start_date"></p>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								<div class="invoice_total">
									<p class="text-invoice-total">Number of Invoices</p>
									<h1 class="number-invoice-total"></h1>
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
								<div class="cash_report">
									<div class="table-responsive">
									<table class="table table-borderless" id="show_report" width="100%">
										<thead>
											<tr>
												<th>Date</th>
												<th>Customer</th>
												<th>Invoice Number</th>
												<th>Description</th>
												<th>Employee</th>
												<th>Amount</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-1 col-md-1 col-sm-1"></div>
	</div>

@endsection
@section('footer')
	<script src="https://cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
	<script src="https://cdn.rawgit.com/ashl1/datatables-rowsgroup/v1.0.0/dataTables.rowsGroup.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script src="https://nightly.datatables.net/buttons/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
	
	<script type="text/javascript">
		$('.app-layout-drawer').hide();
		
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
				var start_date = $('#start').val();
				var from_date = $('#from').val();
				if (start == '') {
					swal.fire({
			            title: 'Warning!',
			            text: "Please Choose Start Date!",
			            type: "warning",
			        })
				} else if(from == '') {
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
						        total_amount += data.report[i].total_amount;  
						    }

						    for (var i = 0; i < data.report.length; i++) {
						        total_invoice += data.report[i].total_invoice;  
						    }

						    
							$('.header-date').html('From' + ' ' + start_date + ' ' + 'To' + ' ' + from_date);
							$('.number-invoice-total').html(total_invoice)
							$('.number-total-received').html(numUSD.format(total_amount))
							
							var table = $('#show_report').DataTable({
								dom: 'Bfrtip',
                              	"pagingType": "full_numbers",
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
                              	autoWidth: true,
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
                                    { "data": "total_amount" },
                                ],
                                columnDefs:[
                                      {targets:2, render:function(data){
                                              return "CIN" + data
                                      }},
                                      {targets:5, render:function(data){
                                          return numUSD.format(data)
                                      }},
                                      { "visible": false, "targets": 2 }
                                ],
                                "buttons": [ 'print', 'excel','csv','pdf'],
                                // rowsGroup:[2],
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
						                    .pluck('total_amount')
						                    .reduce( function (a, b) {
						                        return a + b;
						                    }, 0) + rows;
						                total = $.fn.dataTable.render.number(',', '.', 0, '$').display( total )
						                return $('<tr/>')
						                    .append( '<td colspan="4" style="background-color: #ffffff;"></td>' )
						                    .append( '<td style="background-color: #ffffff; font-weight: normal;">'+total+'</td>' );
						            },
						        }
							})
						},
					});
				}
			})
		});

	</script>
@endsection