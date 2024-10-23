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
    </style>
    <div class="col-md-12">
        <div class="card">
            <div class="card-block">
                <div class="card">
                    <div class="card-header bg-blue bg-inverse">
                        <h4 style="text-align: center">Foreign Language Academy</h4>
                    </div>
                    <div class="card-block">
                        <label>Class :</label>
                        <select class="sel sl2" id="class">
                            @foreach($cl as $c)
                                <option value="{{$c->id}}">{{$c->full}}</option>
                            @endforeach
                        </select>
                        &nbsp;
                        <label>Month :</label>
                        <select class="sal sl2" id="month">
                            @foreach($mo as $m)
                                <option value="{{$m->id}}">{{$m->name}}</option>
                            @endforeach
                        </select>
                        &nbsp;
                        <button class="btn btn-pill btn-app-blue" id="btnshow"><i class="fas fa-search"></i>&nbsp;Show
                        </button>
                        <div style='float: right'>
                            <button class='btn btn-app-blue btn-pill' id='save'><i class="fas fa-save"></i>&nbsp;Save
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
            $('#save').hide();
            $('.sl2').select2();
        });
    </script>
    <script>
        $('#btnshow').click(function () {
            var cid = $('#class').val();
            var mid = $('#month').val();
            $.ajax({
                url: '{{route('ajscorefla')}}',
                type: 'POST',
                data: {'_token': '{{csrf_token()}}', 'cid': cid, 'mid': mid},
                success: function (r) {
                    $('#save').show();
                    $('#ajt').html(r['rt']);
                    var rowCount = $('#tb tr').length;
                    $('#rl').val(rowCount);
                }
            })
        })
    </script>
    <script>
        $('#save').click(function () {
            // var scid = $('#scid').val();
                var dataarray = [[]];
                var rcnt = $('#rl').val();
                for (i = 1; i < rcnt; i++) {
                    dataarray.push({
                        'student_id': $("#sid" + i).html(),
                        'class_id': $("#cid").val(),
                        'month_id': $("#mid").val(),
                        'r': $("#r" + i).val(),
                        's': $("#s" + i).val(),
                        'l': $("#l" + i).val(),
                        'w': $("#w" + i).val(),
                        'g': $("#g" + i).val(),
                        'v': $("#v" + i).val(),
                        'h': $("#h" + i).val(),
                        'cp': $("#cp" + i).val(),
                    })
                }
                $.ajax({
                    url: '{{route("inscorefla")}}',
                    type: 'POST',
                    data: {'_token': '{{csrf_token()}}', 'data': dataarray},
                    success: function (r) {
                        if (r == 1) {
                            Swal.fire(
                                'Success',
                                'Score Updated !',
                                'success'
                            )
                        }
                    }
                })
        })
    </script>
@endsection