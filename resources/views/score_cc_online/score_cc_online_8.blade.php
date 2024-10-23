@extends('layout')
@section('header')


@endsection
<style>
    .modal.in .modal-dialog {
        width:100% !important;
        min-height: 100%;
        margin: 0 0 0 0 !important;
        bottom: 0px !important;
        top: 0px;
    }


    .modal-content {
        border:0px solid rgba(0,0,0,.2) !important;
        border-radius: 0px !important;
        -webkit-box-shadow: 0 0px 0px rgba(0,0,0,.5) !important;
        box-shadow: 0 3px 9px rgba(0,0,0,.5) !important;
        height: auto;
        min-height: 100%;
    }

    .modal-dialog {
        position: fixed !important;
        margin:0px !important;
    }

    .bootstrap-dialog .modal-header {
        border-top-left-radius: 0px !important;
        border-top-right-radius: 0px !important;
    }


    @media (min-width: 768px)
        .modal-dialog {
            width: 100% !important;
            margin: 0 !important;
        }

</style>
@section('content')
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="card">
                <div class="card-header bg-primary bg-inverse">
                    <p>Grade 8</p>
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
                        {{--<div class="col-lg-2">--}}
                        {{--<button class="btn btn-primary btn-sm" id="btn_search"><i class="fa fa-search"></i>&nbsp;Get Student</button>--}}
                        {{--</div>--}}
                        <br>
                        <div class="col-lg-12 col-md-12 col-sm-12" style="margin-top: 50px">

                            <div id="list_student" class="table-responsive">

                            </div>
                            <br>
                            <input type="hidden" id="con">

                        </div>
                        {{--<div id="myModal" class="modal" role="dialog">--}}
                        {{--<div class="modal-dialog modal-full">--}}
                        {{--<!-- Modal content-->--}}
                        {{--<div class="modal-content ">--}}
                        {{--<div class="modal-header ">--}}
                        {{--<button type="button" class="close" data-dismiss="modal">&times;--}}
                        {{--</button>--}}
                        {{--<h4 class="modal-title">hi</h4>--}}
                        {{--</div>--}}
                        {{--<div class="modal-body">--}}
                        {{--<div class="row">--}}
                        {{--<div class="col-lg-12">--}}
                        {{--<div id="list_student">--}}

                        {{--</div>--}}
                        {{--</div>--}}
                        {{--</div>--}}
                        {{--</div>--}}
                        {{--</div>--}}

                        {{--</div>--}}
                        {{--</div>--}}
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
                url:'{{ route('score_online_grade_8.store') }}',
                type:'POST',
                data:{'_token':'{{ @csrf_token() }}','grade':grade,'month':month},
                success:function (data) {

                    $('#list_student').html(data.output)
                    $('#btn_insert').show()
                    // $('#tbl_online').DataTable({
                    //     "lengthMenu": [[10, 25, 50,100, -1], [10, 25, 50,100, "All"]],
                    //     scrollX:        true,
                    //     scrollCollapse: true,
                    //     columnDefs: [
                    //         { width: 150, targets: 0 }
                    //     ],
                    //     fixedColumns: true
                    // })
                    $('#con').val(data.con)
                    $('#txtavg').val(data.AVG)
                    // $('#myModal').modal('show')
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
                var teasekdey=[]
                var writting=[]
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
                $('.writting').each(function () {
                    writting.push($(this).val())
                })
                $('.teasekdey').each(function () {
                    teasekdey.push($(this).val())
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
                    url:'{{ route('InsertScore8') }}',
                    type:'POST',
                    data:{'_token':'{{ @csrf_token() }}','math':math,'khmer':khmer,'physical':physical,
                        'chemistry':chemistry,'biology':biology,'month':month,'student_id':student_id,
                        'grade':grade,'class_id':class_id,'con':con,'score_id':score_id,'phum':phum,'polakam':polakam,
                        'sport':sport,'writting':writting,'teasekdey':teasekdey,'polroth':polroth,'kehak':kehak,'phandey':phandey,
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
                                                    
