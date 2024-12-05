@extends('layout')
@section('content')
    <style>
        .btn-white {
            color: #358ed7;
            background-color: #fff;
            border-color: rgba(0, 0, 0, 0.1);
        }
        label{
            color: #616161;
        }
    </style>
    <div class="col-md-12">
        <!-- Card Tabs Justified Default Style -->
        <div class="card">
            <div class="card-header bg-blue bg-inverse">
                <h4>@lang('class.head')</h4>
                <div style="float: right">

                    <div class="modal fade" id="modal-add" tabindex="-1" role="dialog"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="card-header bg-blue bg-inverse">
                                    <h4 id="modcap">Edit Class Details</h4>
                                    <ul class="card-actions">
                                        <li>
                                            <button data-dismiss="modal" type="button"><i
                                                        class="ion-close"></i></button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-block">
                                    <input type="hidden" id="hid" value="">
                                    <div class="form-group">
                                        <label>Classroom</label>
                                        <select class="form-control" id="clid">
                                            <option value="">@lang('class.room_ph')</option>
                                            @foreach($cl as $c)
                                                <option value="{{$c->id}}">{{$c->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Campus</label>
                                        <select class="form-control" id="campus">
                                            <option value="">@lang('class.campus_ph')</option>
                                            @foreach($cmp as $cm)
                                                <option value="{{$cm->id}}">{{$cm->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Curriculum</label>
                                        <select class="form-control" id="cur">
                                            <option value="">@lang('class.cur_ph')</option>
                                            @foreach($cur as $cr)
                                                <option value="{{$cr->id}}">{{$cr->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Grade</label>
                                        <select class="form-control" id="grade">
                                            <option value="">@lang('class.grade_ph')</option>
                                            @foreach($gr as $g)
                                                <option value="{{$g->id}}">{{$g->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Academic Year</label>
                                        <select class="form-control" id="yid">
                                            <option value="">@lang('class.year_ph')</option>
                                            @foreach($yr as $y)
                                                <option value="{{$y->id}}">{{$y->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Study Time</label>
                                        {{-- <input type="text" class="form-control" id="sdt" placeholder="@lang('class.sdt_ph')"> --}}
                                        <select id="sdt" class="form-control">
                                            <option value="7:00 Am - 12:00 Pm">
                                                7:00 Am - 12:00 Pm
                                            </option>
                                            <option value="1:00 Am - 5:00 Pm">
                                                1:00 Am - 5:00 Pm
                                            </option>
                                        </select>
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-sm btn-app btn-app-blue" type="button"
                                                id="mf"><i class="ion-checkmark"></i>
                                            Update
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-block">
                <button class="btn btn-primary btn-sm" id="add">  <i class="fa fa-plus"></i>&nbsp;&nbsp;@lang('class.btn')</button>
                <div class="table-responsive" style="margin-top: 20px">
                    <table id="dt" class="table table-bordered">
                        <thead>
                        <tr>
                            <th style="text-align: center;display: none">ID</th>
                            <th style="text-align: center">@lang('class.room')</th>
                            <th style="text-align: center">@lang('class.campus')</th>
                            <th style="text-align: center">@lang('class.cur')</th>
                            <th style="text-align: center">@lang('class.grade')</th>
                            <th style="text-align: center">@lang('class.ay')</th>
                            <th style="text-align: center">@lang('class.sdt')</th>
                            <th style="text-align: center">@lang('class.st')</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($data as $d)
                            <tr style="text-align: center">
                                <td style="text-align: center;display: none">{{$d->id}}</td>
                                <td>{{$d->classroom}}</td>
                                <td>{{$d->campus}}</td>
                                <td>{{$d->curriculum}}</td>
                                <td>{{$d->grade}}</td>
                                <td>{{$d->academic_year}}</td>
                                <td>{{$d->study_time}}</td>
                                <td>
                                    <a class="btn btn-primary " href="{{route('class.show',$d->id)}}"><i class="fa fa-search"></i></a>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- End Card Tabs Justified Alternative Style -->
    </div>
@endsection
@section('footer')
    <script>
        $(document).ready(function () {
            $('#dt').DataTable({
                order:[[1,'DESC']]
            });
        });
    </script>
    <script>
        $('#add').click(()=>{
            var add = "@lang('class.m_btn_add')";
            $('#mf').html(add)
            $('#modal-add').modal('show')

        })
    </script>
    <script>
        $('#mf').click(()=>{
                var arr = ['clid','cur','campus','grade','yid','sdt'];
                if(!vali(arr)){
                    swal.fire(
                        '@lang("class.e_head")',
                        '@lang("class.e_body")',
                        'error'
                    )
                }else{
                    var clid = $('#clid').val();
                    var cur = $('#cur').val();
                    var campus = $('#campus').val();
                    var grade = $('#grade').val();
                    var yid = $('#yid').val();
                    var sdt = $('#sdt').val();
                    $.ajax({
                        url:'{{route('class.store')}}',
                        type:'POST',
                        data:{
                            '_token': '{{csrf_token()}}',
                            'classroom_id': clid,
                            'campus_id':campus,
                            'curriculum_id':cur,
                            'grade_id': grade,
                            'academic_year_id': yid,
                            'study_time': sdt
                        },
                        success:(r)=>{
                            if(r == 1){
                                swal.fire(
                                    '@lang("class.s_head")',
                                    '@lang("class.s_body")',
                                    'success'
                                ).then(()=>{
                                    location.reload()
                                })
                            }
                        }
                    })
                }
        })
    </script>
@endsection
