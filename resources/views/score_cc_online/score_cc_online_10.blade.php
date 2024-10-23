@extends('layout')
@section('header')


@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="card">
                <div class="card-header bg-primary bg-inverse">
                    <p>Grade 10</p>
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-lg-4">
                            <select class="form-control" id="txtclass">
                                @foreach($grade as $row)
                                    <option value="{{ $row->id }}">ថ្នាក់ទី {{ $row->grade }} ទីតាំង  {{ $row->campus }}  ម៉ោងសិក្សា {{ $row->study_time }} &nbsp; ឆ្នាំសិក្សា {{ $row->academic_year }} </option>
                                @endforeach
                            </select>
                        </div>
                        {{--Grade--}}
                        <div class="col-lg-2">
                            <select class="form-control" id="txtmonth">
                                @foreach($month as $row)
                                    <option value="{{ $row->id }}">{{ $row->name_kh }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-inline">
                                <div class="form-group">
                                    <label for="example-if-email">សូមបញ្ចូលតួចែក</label>
                                    <input class="form-control input-sm" type="number" id="txtavg"  name="example-if-email" placeholder="តួចែក" style="text-align: center;font-size: 14px" >
                                    <button class="btn btn-primary btn-sm" id="btn_search"><i class="fa fa-search"></i>&nbsp;Get Student</button>
                                    <button class='btn btn-primary btn-sm' id='btn_insert'><i class='fa fa-plus'></i>&nbsp;បញ្ចូលពិន្ទុ</button>
                                </div>
                            </div>

                        </div>
                        <br>
                        <div class="col-lg-12 col-md-12 col-sm-12" style="margin-top: 50px">

                            <div id="list_student" class="table-responsive">

                            </div>
                            <br>
                            <input type="hidden" id="con">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('footer')
    <script>
        // $('#btn_insert').hide()
        $('#btn_search').click(function () {
            var grade=$('#txtclass').val()
            var month=$('#txtmonth').val()
            $.ajax({
                url:'{{ route('score_online_grade_10.store') }}',
                type:'POST',
                data:{'_token':'{{ @csrf_token() }}','grade':grade,'month':month},
                success:function (data) {

                    $('#list_student').html(data.output)
                    $('#btn_insert').show()
                    // $('#tbl_online').DataTable()
                    $('#con').val(data.con)
                    $('#txtavg').val(data.AVG)
                }
            })
        })
        $('#btn_insert').click(function () {
            if($('#txtavg').val()==""){
                Swal.fire({
                    'title':'សូមពីនិត្យ',
                    'text':'មិនទាន់បានបញ្ជូលតួចែក',
                    'type':'warning'
                })
            }else{
                var math=[]
                var khmer=[]
                var physical=[]
                var chemistry=[]
                var biology=[]
                var student_id=[]
                var month=[]
                var grade=[]
                var class_id=[]
                var score_id=[]
                var polroth=[]
                var sport=[]
                var polakam=[]
                var phum=[]
                var kehak=[]
                var phandey=[]
                var history=[]
                var english=[]
                var txtavg=$('#txtavg').val()

                $('.english').each(function () {
                    english.push($(this).val())
                })
                $('.history').each(function () {
                    history.push($(this).val())
                })
                $('.phandey').each(function () {
                    phandey.push($(this).val())
                })
                $('.kehak').each(function () {
                    kehak.push($(this).val())
                })
                $('.phum').each(function () {
                    phum.push($(this).val())
                })
                $('.polakam').each(function () {
                    polakam.push($(this).val())
                })
                $('.sport').each(function () {
                    sport.push($(this).val())
                })
                $('.polroth').each(function () {
                    polroth.push($(this).val())
                })
                $('.score_id').each(function () {
                    score_id.push($(this).val())
                })
                $('.math').each(function () {
                    math.push($(this).val())
                })
                $('.class_id').each(function () {
                    class_id.push($(this).val())
                })
                $('.khmer').each(function () {
                    khmer.push($(this).val())
                })
                $('.physical').each(function () {
                    physical.push($(this).val())
                })
                $('.chemistry').each(function () {
                    chemistry.push($(this).val())
                })
                $('.biology').each(function () {
                    biology.push($(this).val())
                })
                $('.student_id').each(function () {
                    student_id.push($(this).val())
                })
                $('.month').each(function () {
                    month.push($(this).val())
                })
                $('.grade').each(function () {
                    grade.push($(this).val())
                })
                var con=$('#con').val()
                $.ajax({
                    url:'{{ route('InsertScore10') }}',
                    type:'POST',
                    data:{'_token':'{{ @csrf_token() }}','math':math,'khmer':khmer,'physical':physical,
                        'chemistry':chemistry,'biology':biology,'month':month,'student_id':student_id,
                        'grade':grade,'class_id':class_id,'con':con,'score_id':score_id,'phum':phum,'polakam':polakam,
                        'sport':sport,'polroth':polroth,'kehak':kehak,'phandey':phandey,
                        'history':history,'english':english,'txtavg':txtavg
                    },
                    success:function () {
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
        })
    </script>

@endsection
