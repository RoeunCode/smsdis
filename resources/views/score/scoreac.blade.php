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
            /*width: 50px;*/
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
                        <h4 style="text-align: center">American Curriculum</h4>
                    </div>
                    <div class="card-block">
                        <div class="row">
                            <div class="col-lg-4">
                                <select class="form-control sl2" id="class">
                                    @foreach($cl as $c)
                                        <option value="{{$c->id}}">{{$c->full}}</option>
                                    @endforeach
                                </select>
                            </div>
                            {{--Grade--}}
                            <div class="col-lg-2">
                               <div class="form-inline">
                                   <div class="form-group">
                                       <label for="">Quarter:</label>
                                       <select class="form-control sl2" id="month">
                                           @foreach($mo as $m)
                                               <option value="{{$m->id}}">{{$m->name}}</option>
                                           @endforeach
                                       </select>
                                   </div>
                               </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-inline">
                                    <div class="form-group">
                                        <button class="btn btn-primary btn-sm" id="btnshow"><i class="fa fa-search"></i>&nbsp;Get Student</button>
                                        <button class='btn btn-primary btn-sm' id='save'><i class='fa fa-save'></i>&nbsp;Save Score</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <form>
                   <div class="table-responsive" id="ajt"></div>
                </form>
                <a class="btn btn-app-blue btn-sm" href="{{ route('reportac.index') }}" target="_blank"><i class="fa fa-arrow-right"></i>&nbsp;Go to report</a>
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
                url: '{{route('ajscoreac')}}',
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
                    'quarter': $("#mid").val(),
                    's': $("#s" + i).val(),
                    'ss': $("#ss" + i).val(),
                    'pc': $("#pc" + i).val(),
                    'eng': $("#eng" + i).val(),
                    'la': $("#la" + i).val(),
                    'd_a': $("#d_a" + i).val(),
                    'm': $("#m" + i).val(),
                    'me': $("#me" + i).val(),
                    'r_c': $("#r_c" + i).val(),
                    'pe': $("#pe" + i).val(),
                })
            }
            $.ajax({
                url: '{{route("inscoreac")}}',
                type: 'POST',
                data: {'_token': '{{csrf_token()}}', 'data': dataarray},
                success: function (r) {
                    if (r == 1) {
                        Swal.fire(
                            'Success',
                            'Score Updated !',
                            'success'
                        ).then(function () {
                            location.reload().delay(200)

                        })
                    }
                }
            })
        })
    </script>
@endsection
