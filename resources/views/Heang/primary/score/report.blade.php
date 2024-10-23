@extends('layout')
@section('content')
    <link href="https://fonts.googleapis.com/css2?family=Battambang&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Moul&display=swap" rel="stylesheet">
	<style type="text/css">
        table, label, select, option, button {
            font-family: 'Battambang', cursive;
        }
        .top-header h4, h5, h6 {
            font-family: 'Moul', cursive;
        }
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
        td:nth-child(2){
            text-align: left;
        }
        .cd{
            text-align: center;
            height:28px;
            border: 1px solid gray;
            border-radius: 4px;
        }
        .csl{
            width: 400px;
        }

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

    .brand img {
        width: 55px;
        position: absolute;
        left: 90px;
        margin-top: -50px;
    }
    .header h6 {
        line-height: 5px;
    }
  
    th .rotate {
        display: flex;
        justify-content: center;
        transform: rotate(-90deg);
        transform-origin: center center;
    }
    th div {
        font-size: 12px;
    }
    table.report.dataTable.table-condensed>thead>tr>th {
        padding-right: 0px;
        padding-top: 25px;
        padding-bottom: 25px;
        padding-left: 0px;
    }
    .table > thead > tr > th:nth-child(1), th:nth-child(3), th:nth-child(4), th:nth-child(5), th:nth-child(6), th:nth-child(7), th:nth-child(8), th:nth-child(9), th:nth-child(10), th:nth-child(11), th:nth-child(12), th:nth-child(13), th:nth-child(14), th:nth-child(15) {
        width: 52.75px;
    }
    .table > thead > tr > th:last-child {
        width: 10%;
    }

    .font-weight {
        font-weight: bold;
    }


	</style>
	<div class="col-md-12">
        <div class="card">
            <div class="card-block">
                <div class="card">
                    <div class="card-header bg-blue bg-inverse">
                        <h4 style="text-align: center">របាយការណ៏ពិន្ទុសិស្សបឋម</h4>
                    </div>
                    <div class="card-block">
                        <label class="lblc">ថ្នាក់រៀន: </label>
                        <select class="cd" id="cid" name="cid">
                            <option value="">ជ្រើសរើសថ្នាក់រៀន</option>
                            @foreach($class as $row)
                            	<option value="{{ $row->id }}">បន្ទប់:{{$row->class}} ថ្នាក់ទី:{{ $row->gname }} ឆ្នាំសិក្សា:{{ $row->year }}</option>
                            @endforeach
                        </select>
                        &nbsp;&nbsp;
                        <label id="lblc">ខែ: </label>
                        <select class="cd sl2 csl" id="mid" name="mid">
                        	@foreach($month as $row)
                        		<option value="{{ $row->id }}">{{ $row->name_kh }}</option>
                        	@endforeach
                        </select>
                        <button type="button" class="btn btn-sm btn-app-blue" id="show"><i class="fas fa-search"></i>បង្ហាញ</button>
                    </div>
                </div>
                <div id="rpt_content"></div>
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
		$('#show').click(function() {
			var cid = $('#cid').val();
			var mid = $('#mid').val();

			if (cid == '') {
				swal.fire(
                    'Failed',
                    'Please Select A Class',
                    'error'
                )
			} else if(mid == '') {
				swal.fire(
                    'Failed',
                    'Please Select A Month',
                    'error'
                )
			} else {
				$.ajax({
		            method:'GET',
		            url:'{{ route('rpt_primary_score') }}',
		            data:{'_token':'{{ @csrf_token() }}','cid':cid, 'mid':mid},
		            success:function (data) {
		                $('#rpt_content').html(data.output)
		                rnks()
		            }
		        })
			}
		});

		function rnks() {
            $('#exp').DataTable({
                responsive: true,
                dom: 'Bfrtip',
                destroy: true,
                "autoWidth": true,
                "paging": true,
                buttons: [
                    {extend: 'copy', text: '<i class="fa fa-copy"></i>&nbsp;ចម្លងទិន្ន័យ'},
                    {
                        extend: 'pdf',
                        text: '<i class="fa fa-plus-circle"></i>&nbsp;ទាញទិន្ន័យជា PDF',
                        pageSize: 'LEGAL',
                        charset: "utf-8",
                        download: 'open',
                        header: true,
                        customize: function(doc) {
                            doc.defaultStyle.fontSize = 8;
                            doc.defaultStyle.alignment = 'center';
                            doc.defaultStyle.fontFamily = 'Battambang';
                            doc['styles'] = {
                                userTable: {
                                    margin: [0, 15, 0, 15]
                                },
                                tableHeader: {
                                    bold:!0,
                                    fontSize:11,
                                    color:'#ffffff',
                                    fillColor:'#358ed7',
                                    alignment:'center',

                                }
                            };
                        }
                    },
                    {
                        extend: 'excelHtml5',
                        text: '<i class="fa fa-file-excel"></i>&nbsp;ទាញទិន្ន័យជា Excel',
                        messageTop: 'តារាងស្រង់ពិន្ទុកិច្ចការសិស្ស ប្រចាំខែ.........................ឆ្នាំ.........',
                        customize: function ( xlsx ) {
                            // Rename sheet name
                            var source = xlsx.xl['workbook.xml'].getElementsByTagName('sheet')[0];
                            source.setAttribute('name','New Name');

                            var sheet = xlsx.xl.worksheets['sheet1.xml'];
                            
                            $('row c[r^="B2"]', sheet).attr('s', '51');
                            $('row c[r^="D2"]', sheet).attr('s', ['54', '53']);

                        }
                    },
                    {
                        extend: 'print',
                        text: '<i class="fa fa-print"></i>&nbsp;បោះពុម្ពទិន្ន័យ',
                        title: function() {
                            return "<div class='top-header'><div class='header'><h6 style='text-align: center;'>ព្រះរាជាណាចក្រកម្ពុជា</h6><h6 style='text-align: center;'>ជាតិ សាសនា ព្រះមហាក្សត្រ</h6></div><div class='brand'><img src='{{asset('theme/pic/logo.png')}}'><h5 style='float: left;'>សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី</h5><h5 style='float: right;'>ថ្នាក់ទី.......... </h5></div><div><h5 style='text-align: center; clear: left;'>តារាងស្រង់ពិន្ទុកិច្ចការសិស្ស ប្រចាំខែ.........................ឆ្នាំ......... </h5></div></div>";
                        },
                        orientation: 'portrait',
                        pageSize: 'A4',
                        className: 'cell-border',
                        targets: -1,
                        customize: function ( win ) {
                            $(win.document.body)
                                .css( 'font-size', '8pt' )
                            $(win.document.body).find( 'table' )
                                .addClass( 'compact' )
                                .css( 'font-size', '10pt' );
                            $(win.document.body).find('table th').css('alignment', 'center');
                            $(win.document.body).find('table thead > tr > th:nth-child(1)').css('width', '5%');
                            $(win.document.body).find('table thead > tr > th:nth-child(2)').css('width', '20%');
                            $(win.document.body).find('table thead > tr > th:nth-child(3)').css('width', '5%');

                            // $(win.document.body).find('table thead > tr > th:nth-child(4)').css('transform', 'rotate(270deg)');
                            // $(win.document.body).find('table thead > tr > th:nth-child(4)').css('writing-mode', 'tb-rl');
                            // $(win.document.body).find('table thead > tr > th:nth-child(4)').css('white-space', 'nowrap');
                            // $(win.document.body).find('table thead > tr > th:nth-child(4)').css('vertical-align', 'middle');
                            // $(win.document.body).find('table thead > tr > th:nth-child(4)').css('border-color', 'none');

                            // $(win.document.body).find('table').css('border-collapse', 'collapse');
                            // $(win.document.body).find('table, td, th').css('border', '1px solid #000');
                            // $(win.document.body).find('th').css('height', '50px');
                        },
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