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
        .card > .nav-tabs > li > a:hover {
            color: #5bc0de;
            background-color: transparent;
            border-color: transparent;
        }
        .card > .nav-tabs > li.active > a, .card > .nav-tabs > li.active > a:hover, .card > .nav-tabs > li.active > a:focus {
            background-color: #fff;
            box-shadow: inset 0 2px #5bc0de;
        }
    </style>
    <div class="col-md-12">
                <div class="card">
                    <ul class="nav nav-tabs" data-toggle="tabs">
                        <li class="active">
                            <a href="#btabs-static-home">Attendance By Day</a>
                        </li>
                        <li>
                            <a href="#btabs-static-profile">Attendance By Period</a>
                        </li>
                    </ul>
                    <div class="card-block tab-content">
                        <div class="tab-pane active" id="btabs-static-home">
                            <div class="card-header bg-blue bg-inverse">
                                <h4 style="text-align: center">@lang('att.head_v')</h4>
                            </div>
                            <div class="card-block">
                                <label>@lang('att.cur')</label>
                                <select class="cd" id="cur">
                                    <option value="">@lang('att.cur_ph')</option>
                                    @foreach($cur as $c)
                                        <option value="{{$c->id}}">{{$c->name}}</option>
                                    @endforeach
                                </select>
                                &nbsp;&nbsp;
                                <label id="lblc">@lang('att.class')</label>
                                <select class="cd sl2 csl" id="class">

                                </select>
                                &nbsp;
                                <label id="lbld">@lang('att.date')</label>
                                <input type="date" class="cd" id="date">
                                <button class="btn btn-pill btn-app-blue" id="btnshow"><i class="fas fa-search"></i>&nbsp;@lang('att.btnshow')
                                </button>
                                <div style='float: right'>
                                    <button class='btn btn-app-blue btn-pill' id='up'><i class="fas fa-save"></i>&nbsp;@lang('att.btnup')
                                    </button>
                                </div>
                                <br><br>
                                <div class="row">
                                    <div class="table-responsive" id="ajt"></div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="btabs-static-profile">
                            <div class="card-header bg-blue bg-inverse">
                                <h4 style="text-align: center">View Attendance By Period</h4>
                            </div>
                            <div class="card-block">
                                <label>@lang('att.cur')</label>
                                <select class="cd" id="cur2">
                                    <option value="">@lang('att.cur_ph')</option>
                                    @foreach($cur as $c)
                                        <option value="{{$c->id}}">{{$c->name}}</option>
                                    @endforeach
                                </select>
                                &nbsp;&nbsp;
                                <label id="lblc2">@lang('att.class')</label>
                                <select class="cd sl2 csl" id="class2">

                                </select>
                                &nbsp;
                                <label id="lblf">From</label>
                                <input type="date" class="cd" id="from">
                                <label id="lblt">To</label>
                                <input type="date" class="cd" id="to">
                                <button class="btn btn-pill btn-app-blue" id="btnshow2"><i class="fas fa-search"></i>&nbsp;@lang('att.btnshow')
                                </button>
                                <br><br>
                                <div class="row">
                                    <div class="table-responsive" id="ajt2"></div>
                                </div>
                            </div>
                        </div>
                    </div>
            <input type="hidden" id="rl" value="" multiple>
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
    <script>
        $(document).ready(function () {
            $('#up').hide();
            $('.sl2').select2();
            $('#lblc').hide();
            $('#class').hide();
            $('.select2-container').hide();
            $('#btnshow').hide();
            $('#btnshow2').hide();
            $('#date').hide();
            $('#lbld').hide();
            $('#lblc2').hide();
            $('#from').hide();
            $('#to').hide();
            $('#lblf').hide();
            $('#lblt').hide();
        });
    </script>
    <script>
        $('#btnshow').click(function () {
            if($('#date').val() == ""){
                swal.fire(
                    'Failed',
                    'Please Select Date',
                    'error'
                )
            }else{
                var date = $('#date').val();
                var cid = $('#class').val();
                $.ajax({
                    url:'{{route('ajatt')}}',
                    type:'POST',
                    data:{'_token':'{{csrf_token()}}','cid':cid,'date':date},
                    success:(r)=>{
                        $('#up').show();
                        $('#ajt').html(r.rt)
                    }
                })
            }
        })
        $('#btnshow2').click(function () {
            if($('#from').val() == "" || $('#to').val() == ""){
                swal.fire(
                    'Failed',
                    'Please Select Date',
                    'error'
                )
            }else{
                var fr = $('#from').val();
                var to = $('#to').val();
                var cid = $('#class2').val();
                $.ajax({
                    url:'{{route('ajattp')}}',
                    type:'POST',
                    data:{'_token':'{{csrf_token()}}','from':fr,'to':to,'cid':cid},
                    success:(r)=>{
                        $('#ajt2').html(r.rt)
                        dts();
                        console.log(r.arr)
                    }
                })
            }
        })
    </script>
    <script>
        $('#cur').change(function () {
            var id  = $('#cur').val();
            $.ajax({
                url:'{{route('ajcl')}}',
                type:'POST',
                data:{'_token':'{{csrf_token()}}','id':id},
                success:function (r) {
                    if(r == 0){
                        $('#lblc').hide();
                        $('#class').hide();
                        $('.select2-container').hide();
                        $('#btnshow').hide();
                        $('#date').hide();
                        $('#lbld').hide();
                    }else{
                        var opt = "";
                        for(var i=0;i<r.length;i++){
                            opt += "<option value='"+r[i].id+"'>"+r[i].full+"</option>";
                        }
                        $('#class').html(opt);
                        $('#lblc').show();
                        $('#class').show();
                        $('.select2-container').show();
                        $('.sl2').select2();
                        $('#btnshow').show();
                        $('#date').show();
                        $('#lbld').show();
                    }
                }
            })
        })
        $('#cur2').change(function () {
            var id  = $('#cur2').val();
            $.ajax({
                url:'{{route('ajcl')}}',
                type:'POST',
                data:{'_token':'{{csrf_token()}}','id':id},
                success:function (r) {
                    if(r == 0){
                        $('#lblc2').hide();
                        $('#class2').hide();
                        $('.select2-container').hide();
                        $('#btnshow2').hide();
                        $('#from').hide();
                        $('#to').hide();
                        $('#lblf').hide();
                        $('#lblt').hide();
                    }else{
                        var opt = "";
                        for(var i=0;i<r.length;i++){
                            opt += "<option value='"+r[i].id+"'>"+r[i].full+"</option>";
                        }
                        $('#class2').html(opt);
                        $('#lblc2').show();
                        $('#class2').show();
                        $('.select2-container').show();
                        $('.sl2').select2();
                        $('#btnshow2').show();
                        $('#from').show();
                        $('#to').show();
                        $('#lblf').show();
                        $('#lblt').show();
                    }
                }
            })
        })
    </script>
    <script>
        $('#up').click(function () {
            arraid = [];
            $('.aid').each(function () {
                arraid.push({'id':$(this).val()})
            });
            arrpr = [];
            $('.rdpr').each(function () {
                if($(this).is(':checked')){
                    arrpr.push({'pr':$(this).val()})
                }else{
                    arrpr.push({'pr':null})
                }
            });
            arrpm = [];
            $('.rdpm').each(function () {
                if($(this).is(":checked")) {
                    arrpm.push({'pm': $(this).val()})
                }else{
                    arrpm.push({'pm':null})
                }
            });
            arrab = [];
            $('.rdab').each(function () {
                if($(this).is(":checked")) {
                    arrab.push({'ab': $(this).val()})
                }else{
                    arrab.push({'ab':null})
                }
            });
            arrdt = [];
            for(var i=0;i<arraid.length;i++){
                arrdt.push({'id':arraid[i]['id'],'pr':arrpr[i]['pr'],'pm':arrpm[i]['pm'],'ab':arrab[i]['ab']});
            }
            $.ajax({
                url:'{{route('upatt')}}',
                type:'POST',
                data:{'_token':'{{csrf_token()}}','data':arrdt},
                success:function (r) {
                    if(r == 1){
                        swal.fire(
                            '@lang("att.s_head")',
                            '@lang("att.s_body_up")',
                            'success'
                        )
                    }
                }
            })
        })
    </script>
    <script>
        function dts() {
            $('#exps').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    {extend: 'copy', text: '<i class="fa fa-copy"></i>&nbsp;Copy'},
                    {extend: 'pdf', text: '<i class="fas fa-file-pdf"></i>&nbsp;Export As PDF'},
                    {extend: 'print', text: '<i class="fa fa-print"></i>&nbsp;Print'},
                    {extend: 'excel', text: '<i class="fas fa-file-excel"></i>&nbsp;Export As Excel'},

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
            });
        }
    </script>
@endsection