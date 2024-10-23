@extends('layout')
@section('content')
    <link href="https://fonts.googleapis.com/css2?family=Battambang&display=swap" rel="stylesheet">
    <style>
        table, label, select, option, button, h4 {
            font-family: 'Battambang', cursive;
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
	<div class="card">
		<div class="card-header bg-blue bg-inverse">
			<h4 style="text-align: center">ពិន្ទុ Online សិស្សបឋម</h4>
		</div>
		<div class="card-block">
			<label class="lblc">ថ្នាក់: </label>
            <select class="cd" id="cid" name="cid">
                <option value="">ជ្រើសរើសថ្នាក់រៀន</option>
                @foreach($class as $class)
                	<option value="{{ $class->id }}">បន្ទប់:{{$class->class}} ថ្នាក់ទី:{{ $class->gname }} ឆ្នាំសិក្សា:{{ $class->year }}</option>
                @endforeach
            </select>
            &nbsp;&nbsp;
            <label id="lblc">ខែ: </label>
            <select class="cd sl2 csl mid" id="mid" name="mid">
            	@foreach($month as $month)
                    <option value="{{ $month->id }}">{{ $month->name_kh }}</option>
              	@endforeach
            </select>
            <button class="btn btn-sm btn-app-blue" id="show"><i class="fas fa-search"></i> បង្ហាញ</button>
            <div style='float: right' id="avg">
                <label id="avg_lbl">ចំនួនមុខវិជ្ជា :</label>
                <input class="avg" type="text" id="numsub">&nbsp;&nbsp;                    
            </div>
            <hr>
            <div class="table-responsive" id="stu_content"></div>
            <br>
            <input type="hidden" id="con">
            <button class='btn btn-sm btn-app-blue' id='save'><i class="fas fa-save"></i> រក្សាទុក</button>
		</div>
	</div>
@endsection
@section('footer')
    <script type="text/javascript">
        $('#save').hide();
        $('#avg').hide();
        $(document).ready(function() {
            $('#show').click(function() {
                var cid = $('#cid').val();
                var mid = $('#mid').val();
                if(cid == '') {
                    swal.fire(
                        'មិនត្រឹមត្រូវ',
                        'សូមមេត្តាជ្រើសរើសថ្នាករៀន',
                        'warning'
                    )
                } else if (mid == 13) {
                    $('#stu_content').hide();
                    $('#save').hide();
                    $('#avg').hide();
                    swal.fire(
                        'មិនត្រឹមត្រូវ',
                        'ពិន្ទុប្រចាំឆ្នាំមិនតម្រូវអោយបញ្ចូល',
                        'warning'
                    )
                } else {
                    $.ajax({
                        method:'GET',
                        url:'{{ route('getsc') }}',
                        data:{'_token':'{{ @csrf_token() }}','cid':cid, 'mid':mid},
                        success:function (data) {
                            $('#save').show()
                            $('#avg').show()
                            $('#con').val(data.con)
                            $('#numsub').val(data.AVG)
                            $('#stu_content').show();
                            $('#stu_content').html(data.output)
                        }
                    })
                }
            });
        });

        $('#save').click(function() {
            var r = [];
            var w = [];
            var e = [];
            var c = [];
            var d = [];
            var g = [];
            var ma = [];
            var mo = [];
            var science = [];
            var score_id = [];
            var stuid = [];
            var cid = [];
            var numsub = [];

            $('.reading').each(function () {
                r.push($(this).val())
            })
            $('.written').each(function () {
                w.push($(this).val())
            })
            $('.essay').each(function () {
                e.push($(this).val())
            })
            $('.calligraphy').each(function () {
                c.push($(this).val())
            })
            $('.draw').each(function () {
                d.push($(this).val())
            })
            $('.grammer').each(function () {
                g.push($(this).val())
            })
            $('.math').each(function () {
                ma.push($(this).val())
            })
            $('.moral').each(function () {
                mo.push($(this).val())
            })
            $('.science').each(function () {
                science.push($(this).val())
            })
            $('.score_id').each(function () {
                score_id.push($(this).val())
            })
            $('.stuid').each(function () {
                stuid.push($(this).val())
            })
            $('.cid').each(function () {
                cid.push($(this).val())
            })

            var numsub = $('#numsub').val();
            var mid = $('.mid').val();
            var con = $('#con').val();

            if ($('.reading').val() <= 10 && $('.reading').val() >= 0 && $('.written').val() <= 10 && $('.written').val() >= 0 && $('.essay').val() <= 10 && $('.essay').val() >= 0 && $('.calligraphy').val() <= 10 && $('.calligraphy').val() >= 0 && $('.draw').val() <= 10 && $('.draw').val() >= 0 && $('.grammer').val() <= 10 && $('.grammer').val() >= 0 && $('.math').val() <= 10 && $('.math').val() >= 0 && $('.moral').val() <= 10 && $('.moral').val() >= 0 && $('.science').val() <= 10 && $('.science').val() >= 0) {
                if ($('#numsub').val() == '') {
                    Swal.fire(
                        'មិនត្រឹមត្រូវ !',
                        'សូមបញ្ចូលចំនួនមុខវិជ្ជា !',
                        'warning'
                    )
                } else {
                    $.ajax({
                        method: 'POST',
                        url: '{{route("primary_score.store")}}',
                        data: {'_token': '{{csrf_token()}}', 'r': r, 'w': w, 'e':e, 'c': c, 'd':d, 'g':g, 'ma':ma, 'mo':mo, 'con':con, 'mid':mid, 'stuid':stuid, 'cid':cid, 'score_id':score_id, 'science':science, 'numsub':numsub},
                        success:function ($data) {
                            Swal.fire({
                                'type':'success',
                                'text':'Complete',
                                'title':'Score Online'
                            }).then(function () {
                                location.reload().delay(200)
                            })
                        }
                    })
                }
            } else {
                Swal.fire(
                    'មិនត្រឹមត្រូវ !',
                    'សូមបញ្ចូលពិន្ទុចន្លោះពីលេខ១ដល់១០ !',
                    'warning'
                )
            }
        });
    </script>
@endsection