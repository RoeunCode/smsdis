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
            width: 340px;
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
    </style>
    <div class="col-md-12">
        <div class="card">
            <div class="card-block">
                <div class="card">
                    <div class="card-header bg-blue bg-inverse">
                        <h4 style="text-align: center">កម្មវិធីជាតិ</h4>
                    </div>
                    <div class="card-block">
                        <label>ថ្នាក់ :</label>
                        <select class="sel sl2" id="class">
                            @foreach($cl as $c)
                                <option value="{{$c->id}}">{{$c->full}}</option>
                            @endforeach
                        </select>
                        &nbsp;
                        <label>ខែ :</label>
                        <select class="sal sl2" id="month">
                            @foreach($mo as $m)
                                <option value="{{$m->id}}">{{$m->name_kh}}</option>
                            @endforeach
                        </select>
                        &nbsp;
                        <button class="btn btn-pill btn-app-blue" id="btnshow"><i class="fas fa-search"></i>&nbsp;បង្ហាញទិន្នន័យ
                        </button>
                        <div style='float: right'>
                            <label id="avg_lbl">មេគុណ :</label>
                            <input class="avg" type="text" id="avg_m">&nbsp;&nbsp;
                            <button class='btn btn-app-blue btn-pill' id='save'><i class="fas fa-save"></i>&nbsp;រក្សាទុក
                            </button>
                        </div>
                    </div>
                </div>
                <div class="table-responsive" id="ajt"></div>
            </div>
            <input type="hidden" id="rl" value="" multiple>
        </div>
    </div>
@endsection
@section('footer')
    <script>
        $(document).ready(function () {
            $('#avg_lbl').hide();
            $('#avg_m').hide();
            $('#save').hide();
            $('.sl2').select2();
        });
    </script>
    <script>
        $('#btnshow').click(function () {
            var cid = $('#class').val();
            var mid = $('#month').val();
            $.ajax({
                url: '{{route('ajscorecc')}}',
                type: 'POST',
                data: {'_token': '{{csrf_token()}}', 'cid': cid, 'mid': mid},
                success: function (r) {
                    if(r['mst']) {
                        $('#avg_lbl').hide();
                        $('#avg_m').hide();
                        $('#save').hide();
                    }else{
                        $('#avg_lbl').show();
                        $('#avg_m').show();
                        $('#save').show();
                    }
                    $('#ajt').html(r['rt']);
                    var rowCount = $('#tb tr').length;
                    $('#rl').val(rowCount);
                    var ao = $('#avg_o').val();
                    $('#avg_m').val(ao);
                }
            })
        })
    </script>
        <script>
            $('#save').click(function () {
                // var scid = $('#scid').val();
                if($('#avg_m').val() == ""){
                    Swal.fire(
                        'មិនត្រឹមត្រូវ !',
                        'សូមបញ្ចូលមេគុណ !',
                        'error'
                    )
                }else {
                    var dataarray = [[]];
                    var rcnt = $('#rl').val();
                    for (i = 1; i < rcnt; i++) {
                        dataarray.push({
                            'student_id': $("#sid" + i).html(),
                            'class_id': $("#cid").val(),
                            'month_id': $("#mid").val(),
                            'avg_m': $("#avg_m").val(),
                            'eng': $("#eng" + i).val(),
                            'b': $("#b" + i).val(),
                            'c': $("#c" + i).val(),
                            'e': $("#e" + i).val(),
                            'g': $("#g" + i).val(),
                            'h': $("#h" + i).val(),
                            'k': $("#k" + i).val(),
                            'm': $("#m" + i).val(),
                            'p': $("#p" + i).val(),
                            'ph': $("#ph" + i).val(),
                        })
                    }
                    $.ajax({
                        url: '{{route("inscorecc")}}',
                        type: 'POST',
                        data: {'_token': '{{csrf_token()}}', 'data': dataarray},
                        success: function (r) {
                            if (r == 1) {
                                Swal.fire(
                                    'អបអរសាទរ !',
                                    'ពិន្ទុត្រូវបានកែប្រែ !',
                                    'success'
                                )
                            }
                        }
                    })
                }
            })
        </script>
@endsection