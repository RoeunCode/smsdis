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
            width: 70px;
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
                        <h4 style="text-align: center">Score Online</h4>
                    </div>
                    <div class="card-block">
                        <label class="lblc">Class: </label>
                        <select class="cd" id="cid" name="cid">
                            <option value="" disabled="true">Choose Class</option>
                            @foreach($class as $class)
                            	<option value="{{ $class->id }}">បន្ទប់:{{$class->class}} ថ្នាក់ទី:{{ $class->gname }} ឆ្នាំសិក្សា:{{ $class->year }}</option>
                            @endforeach
                        </select>
                        &nbsp;&nbsp;
                        <label class="lblc">Subject: </label>
                        <select class="cd subid" id="subid" name="subid">
                            @foreach($subject as $subject)
                                <option value="{{ $subject->id }}">{{ $subject->name }}</option>
                            @endforeach
                        </select>
                        &nbsp;&nbsp;
                        <label id="lblc">Month: </label>
                        <select class="cd sl2 csl month" id="month" name="month">
                        	@foreach($month as $month)
                        		<option value="{{ $month->id }}">{{ $month->name_kh }}</option>
                        	@endforeach
                        </select>
                        <button class="btn btn-sm btn-app-blue" id="btnshow"><i class="fas fa-search"></i>&nbsp;@lang('att.btnshow')
                        </button>
                        <button class='btn btn-sm btn-app-blue' id='save'><i class="fas fa-save"></i>&nbsp;@lang('att.btnsave')
                        </button>
                    </div>
                </div>
                <div class="table-responsive" id="stu_content"></div>
                <br>
                <input type="hidden" id="con">

            </div>
        </div>
    </div>
@endsection
@section('footer')
	<script type="text/javascript">
        $('.cd').select2()
		$('#save').hide();
		$(document).ready(function() {
			$('#btnshow').click(function () {
		        var cid = $('#cid').val()
                var subid = $('#subid').val();
                var month = $('#month').val();
		        if (cid == "") {
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
                } else if(month == '') {
                    swal.fire(
                        'Failed',
                        'Please Select A Month',
                        'error'
                    )
                } else {
		            $.ajax({
		                method:'GET',
		                url:'{{ route('getstu') }}',
		                data:{'_token':'{{ @csrf_token() }}','cid':cid, 'subid':subid, 'month':month},
		                success:function (data) {
		                	$('#save').show();
                            $('#con').val(data.con)
		                    $('#stu_content').html(data.output)
		                }
		            })
		        }

		    })


            $('#save').click(function() {
                var exam = [];
                var homework = [];
                var attendance = [];
                var quiz = [];
                var cid = [];
                var stuid = [];

                $('.exam').each(function () {
                    exam.push($(this).val())
                })
                $('.homework').each(function () {
                    homework.push($(this).val())
                })
                $('.attendance').each(function () {
                    attendance.push($(this).val())
                })
                $('.quiz').each(function () {
                    quiz.push($(this).val())
                })
                $('.cid').each(function () {
                    cid.push($(this).val())
                })
                $('.stuid').each(function () {
                    stuid.push($(this).val())
                })

                var score_id = [];
                $('.score_id').each(function () {
                    score_id.push($(this).val())
                })
                var month = $('.month').val();
                var subid = $('.subid').val();
                var con = $('#con').val();

                $.ajax({
                    method: 'POST',
                    url: '{{route("scoreonline.store")}}',
                    data: {'_token': '{{csrf_token()}}', 'exam': exam, 'homework': homework, 'attendance':attendance, 'quiz': quiz, 'cid':cid, 'stuid':stuid, 'month':month, 'subid':subid, 'con':con, 'score_id':score_id},
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
            });
		});
	</script>
@endsection
