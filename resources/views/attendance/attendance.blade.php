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
    </style>
    <div class="col-md-12">
        <div class="card">
            <div class="card-block">
                <div class="card">
                    <div class="card-header bg-blue bg-inverse">
                        <h4 style="text-align: center">@lang('att.head')</h4>
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
                        <button class="btn btn-sm btn-app-blue" id="btnshow"><i class="fas fa-search"></i>&nbsp;@lang('att.btnshow')
                        </button>
                    </div>
                </div>
                <div class="table-responsive" id="ajt"></div>
                <button class='btn btn-sm btn-app-blue' id='save'><i class="fas fa-save"></i>&nbsp;@lang('att.btnsave')
                </button>
            </div>
            <input type="hidden" id="rl" value="" multiple>
        </div>
    </div>
@endsection
@section('footer')
    <script>
        $(document).ready(function () {
            $('#save').hide();
            $('.sl2').select2();
            $('#lblc').hide();
            $('#class').hide();
            $('.select2-container').hide();
            $('#btnshow').hide();
        });
    </script>
    <script>
        $('#btnshow').click(function () {
            if($('#cur').val() == ""){
                swal.fire(
                    'Failed',
                    'Please Select A Curriculum',
                    'error'
                )
            }else{
                var cid = $('#class').val();
                $.ajax({
                    url:'{{route('takeatt')}}',
                    type:'POST',
                    data:{'_token':'{{csrf_token()}}','cid':cid},
                    success:(r)=>{
                        $('#save').show();
                        $('#ajt').html(r.rt)
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
                    }
                }
            })
        })
    </script>
    <script>
        $('#save').click(function () {
            arrsid = [];
            $('.sid').each(function () {
                arrsid.push({'id':$(this).val()})
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
            var acid = $('#acid').val();
            for(var i=0;i<arrsid.length;i++){
                arrdt.push({'id':arrsid[i]['id'],'cid':acid,'pr':arrpr[i]['pr'],'pm':arrpm[i]['pm'],'ab':arrab[i]['ab']});
            }
            $.ajax({
                url:'{{route('addatt')}}',
                type:'POST',
                data:{'_token':'{{csrf_token()}}','data':arrdt},
                success:function (r) {
                    if(r == 1){
                        swal.fire(
                            '@lang("att.s_head")',
                            '@lang("att.s_body")',
                            'success'
                        ).then(()=>{
                            location.reload()
                        })
                    }
                }
            })
        })
    </script>
@endsection
