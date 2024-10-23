@extends('layout')
@section('content')
	<style>
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .btn-white {
            color: #358ed7;
            background-color: #fff;
            border-color: rgba(0, 0, 0, 0.1);
        }

        .sel {
            width: 400px;
        }

        .sal {
            width: 110px;
        }

        .avg {
            width: 60px;
            text-align: center;
        }

        label {
            font-size: 16px;
            font-weight: bold;
        }

        .intsc {
            width: 50px;
            text-align: center;
        }

        th {
            text-align: center;
        }
        td{
            text-align: center;
        }
        .cd{
            text-align: center;
            height:28px;
            border: 1px solid gray;
            border-radius: 4px;
        }
        .cd1{
            text-align: center;
            height:28px;
            border: 1px solid gray;
            border-radius: 4px;
        }
        .csl{
            width: 400px;
        }
    </style>
    <style>
        button.dt-button, div.dt-button, a.dt-button {
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            color: white;
            background: #358ed7;
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #ccc;
            float: left;

        }
    </style>
    <style>
        .select2-container--default .select2-selection--single .select2-selection__arrow {
            background-image: -khtml-gradient(linear, left top, left bottom, from(#424242), to(#030303));
            background-image: -moz-linear-gradient(top, #424242, #030303);
            background-image: -ms-linear-gradient(top, #424242, #030303);
            background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #424242), color-stop(100%, #030303));
            background-image: -webkit-linear-gradient(top, #424242, #030303);
            background-image: -o-linear-gradient(top, #424242, #030303);
            background-image: linear-gradient(#424242, #030303);
            width: 40px;
            color: #fff;
            font-size: 1.3em;
            padding: 4px 12px;
            height: 28px;
            position: absolute;
            top: 0px;
            right: 0px;
            width: 20px;
        }
    </style>
    <div class="col-md-12">
        <div class="card">
            <div class="card-block">
                <div class="card">
                    <div class="card-header bg-blue bg-inverse">
                        <h4 style="text-align: center">Report Score Online</h4>
                    </div>
                    <div class="card-block">
                        <label class="lblc">Class: </label>
                        <select class="cd" id="cid" name="cid">
                            <option value="">Choose Class</option>
                            @foreach($class as $class)
                            	<option value="{{ $class->id }}">បន្ទប់:{{$class->class}} ថ្នាក់ទី:{{ $class->gname }} ឆ្នាំសិក្សា:{{ $class->year }}</option>
                            @endforeach
                            {{--input for view print report header--}}
                            <input type="hidden" id="txtgrade" >
                        </select>
                        &nbsp;&nbsp;
                        <label class="lblc">Subject: </label>
                        <select class="cd1" id="subid" name="subid">
                            <option value="">Choose Subject</option>
                        </select>
                        &nbsp;&nbsp;
                        <label id="lblc">Month: </label>
                        <select class="cd sl2 csl" id="month" name="month">
                        	@foreach($month as $month)
                        		<option value="{{ $month->id }}">{{ $month->name_kh }}</option>
                        	@endforeach
                        </select>
                        <button type="button" class="btn btn-sm btn-app-blue" id="btnshow"><i class="fas fa-search"></i>&nbsp;@lang('att.btnshow')
                        </button>
                    </div>
                </div>
                <div id="rpt_content">
                </div>
            </div>
        </div>
    </div>
@endsection

@section('footer')
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script src="https://nightly.datatables.net/buttons/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
    <script src="{{asset('theme/dist/assets/js/jquery.table2excel.js')}}"></script>
	<script type="text/javascript">
        $('.cd').select2()
		$(document).ready(function() {
			$('#cid').on('change', function() {
                var test=  $("#cid option:selected").text()
                $('#txtgrade').val(test)
	            var cid = $(this).val();
	            if (cid) {
	                $.ajax({
	                	method: 'GET',
	                    url: "{{url('reportonline')}}/" + cid,
	                    data: {"_token":"{{ csrf_token() }}"},
	                    dataType: 'json',
	                    success: function(data) {
	                        if (data) {
	                            $('select[name="subid"]').empty();
	                            $.each(data, function(key, value) {
	                                $('select[name="subid"]').append('<option value="'+ value.id +'">'+ value.name +'</option>');
	                            });
	                        } else {
	                            $('select[name="subid"]').empty();
	                        }
	                    }
	                });
	            } else {
	                $('select[name="subid"]').empty();
	            }
	        });
			$('#btnshow').click(function() {
				var cid = $('#cid').val();
				var subid = $('#subid').val();
				var month = $('#month').val();
				if (cid == '') {
					swal.fire(
                        'Failed',
                        'Please Select A Class',
                        'error'
                    )
				} else if(subid == '') {
					swal.fire(
                        'Failed',
                        'Please Select A Subject',
                        'error'
                    )
				} else {
					$.ajax({
		                method:'GET',
		                url:'{{ route('ajrpt') }}',
		                data:{'_token':'{{ @csrf_token() }}','cid':cid, 'subid':subid, 'month':month},
		                success:function (data) {
		                    $('#rpt_content').html(data.output)
                            rnks();
		                }
		            })
				}
			});
		});
        function rnks() {

            var grade=$('#txtgrade').val()
            var sub=$("#subid option:selected").text()
            var month=$("#month option:selected").text()
            $('#exp').DataTable({
                dom: 'lBfrtip',
                buttons: [
                    {extend: 'copy', text: '<i class="fa fa-copy"></i>&nbsp;ចម្លងទិន្ន័យ'},
                    {extend: 'pdf', text: '<i class="fa fa-plus-circle"></i>&nbsp;ទាញទិន្ន័យជា PDF'},
                    {extend: 'print', text: '<i class="fa fa-print"></i>&nbsp;បង្ហាញទិន្ន័យ',
                        title:'',
                        customize: function ( win ) {
                            $(win.document.body)
                                .css( 'font-size', '10pt' )
                                .prepend(
                                    '<p style="text-align: center;font-size: 14px">បញ្ជីសម្រង់ពិន្ទុប្រឡង នៃការសិក្សាពីចម្ងាយតាមប្រព័ន្ធអនឡាញ</p>' +
                                    '<p style="text-align: center;font-size: 14px">'+grade+'&nbsp;&nbsp;'+sub+'&nbsp;&nbsp;ប្រចាំខែ '+month+'</p>'
                                )
                                // .prepend(
                                //     '<img src="http://datatables.net/media/images/logo-fade.png" style="position:absolute; top:0; left:0;" />'
                                // );

                            $(win.document.body).find( 'table' )
                                .addClass( 'compact' )
                                .css( 'font-size', 'inherit' );
                        }
                    },
                    {extend: 'excel', text: '<i class="fa fa-print"></i>&nbsp;ទាញទិន្ន័យជា Excel',
                        title : 'បញ្ជីសម្រង់ពិន្ទុប្រឡង នៃការសិក្សាពីចម្ងាយតាមប្រព័ន្ធអនឡាញ'+grade+' មុខវិជ្ជា' +sub +' ប្រចាំខែ'+month
                    },
                ],

                "language": {
                    "lengthMenu": "បង្ហាញ _MENU_ ចំនួនទិន្ន៏យក្នុងទំព័រ",
                    "zeroRecords": "មិនមានទិន្ន័យ",
                    "info": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",
                    "infoEmpty": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",
                    "search": "ស្វែងរក",
                    "infoFiltered": "(filtered from _MAX_ total records)",
                    "paginate": {
                        "previous": "ថយក្រោយ",
                        "next": "ទៅមុខ"
                    }
                }
            })
        }
	</script>




@endsection
