@extends('layout')
@section('content')
    <style>
        .card > .nav-tabs > li > a:hover {
            color: #5bc0de;
            background-color: transparent;
            border-color: transparent;
        }
        .card > .nav-tabs > li.active > a, .card > .nav-tabs > li.active > a:hover, .card > .nav-tabs > li.active > a:focus {
            background-color: #fff;
            box-shadow: inset 0 2px #5bc0de;
        }
        .btn-white {
            color: #358ed7;
            background-color: #fff;
            border-color: rgba(0, 0, 0, 0.1);
        }
        .tdx{
            text-align: center;
        }
        .chhk{
            width: 30px;
            height: 30px;
        }
        a:hover{
            color: #2e6da4;
        }
    </style>
    <div class="col-md-12">
        <div class="row">
            <div class="col-lg-3">
                <div class="card">
                    <div class="card-header bg-blue bg-inverse">
                        <h4 style="text-align: center">Class Detail</h4>
                    </div>
                    <div class="card-block">
                        <input type="hidden" id="txtclass" value="{{ $d->id }}">
                        <table class="table">
                            <tr>
                                <th>Classroom :</th>
                                <td>{{$d->classroom}}</td>
                            </tr>
                            <tr>
                                <th>Campus :</th>
                                <td>{{$d->campus}}</td>
                            </tr>
                            <tr>
                                <th>Curriculum :</th>
                                <td>{{$d->curriculum}}</td>
                            </tr>
                            <tr>
                                <th>Grade :</th>
                                <td>{{$d->grade}}</td>
                            </tr>
                            <tr>
                                <th>Academic Year :</th>
                                <td>{{$d->academic_year}}</td>
                            </tr>
                            <tr>
                                <th>Study Time :</th>
                                <td>{{$d->study_time}}</td>
                            </tr>
                            <tr>
                                <td>
                                    <button class="btn  btn-app-blue" id="edit" data-toggle="modal"
                                            data-target="#modal-edit"><i class="fas fa-edit"></i>&nbsp;Edit
                                    </button>
                                </td>
                                <td style="text-align: right">
                                    <a onclick="return confirm('Are You Sure You Want To Delete ?')"
                                       href="{{route('cldelete',$d->id)}}" class="btn btn-app-red"><i
                                                class="fas fa-trash"></i>&nbsp;Delete</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal fade" id="modal-edit" tabindex="-1" role="dialog"
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
                                            @foreach($cl as $c)
                                                <option value="{{$c->id}}">{{$c->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Campus</label>
                                        <select class="form-control" id="campus">
                                            @foreach($cmp as $cm)
                                                <option value="{{$cm->id}}">{{$cm->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Curriculum</label>
                                        <select class="form-control" id="cur">
                                            @foreach($cur as $cr)
                                                <option value="{{$cr->id}}">{{$cr->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Grade</label>
                                        <select class="form-control" id="grade">
                                            @foreach($gr as $g)
                                                <option value="{{$g->id}}">{{$g->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Academic Year</label>
                                        <select class="form-control" id="yid">
                                            @foreach($yr as $y)
                                                <option value="{{$y->id}}">{{$y->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Study Time</label>
                                        <input type="text" class="form-control" id="sdt" value="{{$d->study_time}}">
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-sm btn-app btn-app-blue" type="button"
                                                id="update"><i class="ion-checkmark"></i>
                                            Update
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="card">
                    <ul class="nav nav-tabs" data-toggle="tabs">
                        <li class="active">
                            <a href="#btabs-static-home">Students In Class</a>
                        </li>
                        <li>
                            <a href="#btabs-static-profile">Teachers In Class</a>
                        </li>
                        <li>
                            <a href="#btabs-static-addst">Add Students To Class</a>
                        </li>
                        <li>
                            <a href="#btabs-static-addtc">Add Teachers To Class</a>
                        </li>
                    </ul>
                    <div class="card-block tab-content">
                        <div class="tab-pane active" id="btabs-static-home">
                            <p style="text-align: center;font-size: 20px;">បញ្ជីរាយនាមសិស្ស ថ្នាក់ទី  " {{$d->grade}} "</p>
                            <div class="table-responsive">
                                <table id="dt" class="table table-bordered table-condensed">
                                    <thead>
                                    <tr>
                                        <th class="tdx">Nº</th>
                                        <th class="tdx">Student ID</th>
                                        <th class="tdx">ឈ្មោះ</th>
                                        <th class="tdx">Name</th>
                                        <th class="tdx">Sex</th>
                                        <th class="tdx">DOB</th>
                                        <th class="tdx">Settings</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @php $i=1;$fmale=0;@endphp
                                    @foreach($stc as $s)
                                        @if($s->sex=="F" || $s->sex=="ស")
                                          @php $fmale++;@endphp
                                        @endif
                                        <tr>
                                            <td class="tdx">{{ $i++ }}</td>
                                            <td class="tdx">{{$s->student_id}}</td>
                                            <td class="tdx">{{$s->kh_name}}</td>
                                            <td class="tdx">{{$s->en_name}}</td>
                                            <td class="tdx">{{$s->sex}}</td>
                                            <td class="tdx">{{$s->dob}}</td>
                                            <td class="tdx">
                                                <a class="btn  btn-app-red" onclick="return confirm('Are You Sure You Want To Remove ?')" href="{{route('delst',$s->st_id)}}"><i class="fas fa fa-trash"></i></a>
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <br>
                            <div class="form-inline">
                                <div class="form-group">
                                    <h4>ចំនួនសិស្សសរុប {{ $i-1 }} នាក់</h4>
                                </div>
                                <div class="form-group" style="margin-left: 30px">

                                </div>
                                <div class="form-group">
                                    <h4>ស្រី {{ $fmale }} នាក់</h4>
                                </div>
                            </div>


                        </div>
                        <div class="tab-pane" id="btabs-static-profile">
                            <div class="table-responsive">
                                <table id="dt2" class="table table-bordered table-condensed">
                                    <thead>
                                    <tr>
                                        <th class="tdx">KH Name</th>
                                        <th class="tdx">EN Name</th>
                                        <th class="tdx">Sex</th>
                                        <th class="tdx">DOB</th>
                                        <th class="tdx">Professions</th>
                                        <th class="tdx">Phone</th>
                                        <th class="tdx">Facebook</th>
                                        <th class="tdx">Settings</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($ttc as $t)
                                        <tr>
                                            <td class="tdx">{{$t->kh_name}}</td>
                                            <td class="tdx">{{$t->en_name}}</td>
                                            <td class="tdx">{{$t->sex}}</td>
                                            <td class="tdx">{{$t->nat}}</td>
                                            <td class="tdx">{{$t->pro}}</td>
                                            <td class="tdx">{{$t->phone}}</td>
                                            <td class="tdx">{{$t->facebook}}</td>
                                            <td class="tdx">
                                                <a class="btn  btn-app-red" onclick="return confirm('Are You Sure You Want To Remove ?')" href="{{route('deltc',$t->id)}}"><i class="fas fa fa-trash"></i></a>
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane" id="btabs-static-addst">
                            <div class="table-responsive">
                                <table id="dta" class="table table-bordered table-condensed">
                                    <thead>
                                    <tr>
                                        <th class="tdx">លេខរៀង</th>
                                        <th class="tdx">ឈ្មោះ</th>
                                        <th class="tdx">Name</th>
                                        <th class="tdx">Sex</th>
                                        <th class="tdx">DOB</th>
                                        <th class="tdx">Select</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($ast as $a)
                                        <tr>
                                            <td class="tdx">{{$a->student_id}}</td>
                                            <td class="tdx">{{$a->kh_name}}</td>
                                            <td class="tdx">{{$a->en_name}}</td>
                                            <td class="tdx">{{$a->sex}}</td>
                                            <td class="tdx">{{$a->dob}}</td>
                                            <td class="tdx">
                                                <input  class="chhk" type="checkbox"  value="{{$a->id}}">
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                                <br>
                                <div style="float: right">
                                    <button class="btn  btn-app-blue" id="addst"><i class="fas fa fa-check"></i>&nbsp;Add To Class</button>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="btabs-static-addtc">
                            <div class="table-responsive">
                                <table id="dtb" class="table table-condensed table-bordered">
                                    <thead>
                                    <tr>
                                        <th class="tdx">KH Name</th>
                                        <th class="tdx">EN Name</th>
                                        <th class="tdx">Sex</th>
                                        <th class="tdx">DOB</th>
                                        <th class="tdx">Professions</th>
                                        <th class="tdx">Select</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($atc as $a)
                                        <tr>
                                            <td class="tdx">{{$a->kh_name}}</td>
                                            <td class="tdx">{{$a->en_name}}</td>
                                            <td class="tdx">{{$a->sex}}</td>
                                            <td class="tdx">{{$a->dob}}</td>
                                            <td class="tdx">{{$a->pro}}</td>
                                            <td class="tdx">
                                                <input id="chktc{{$a->id}}" class="chhk" type="checkbox" name="chktc{{$a->id}}" value="{{$a->id}}">
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                                <br>
                                <div style="float: right">
                                    <button class="btn  btn-app-blue" id="addtc"><i class="fas fa fa-check"></i>&nbsp;Add To Class</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('footer')
    {{--    DataTable--}}
    <script>
        $(document).ready(function () {
            $('#dt').DataTable();
            $('#dt2').DataTable();
            $('#dta').DataTable();
            $('#dtb').DataTable();
        });
    </script>
    {{--    DataTable--}}
    {{--    Edit--}}
    <script>
        $('#edit').click(function () {
            $('#hid').val('{{$od->id}}');
            $('#clid').val('{{$od->classroom_id}}');
            $('#cur').val('{{$od->curriculum_id}}');
            $('#campus').val('{{$od->campus_id}}');
            $('#grade').val('{{$od->grade_id}}');
            $('#yid').val('{{$od->academic_year_id}}');
        })
    </script>
    {{--    Edit--}}
    {{--    Update--}}
    <script>
        $('#update').click(function () {
            var arr = ['sdt'];
            if(!vali(arr)){
                swal.fire(
                    '@lang("class.e_head")',
                    '@lang("class.e_body")',
                    'error'
                )
            }else {
                var id = $('#hid').val();
                var clid = $('#clid').val();
                var cur = $('#cur').val();
                var campus = $('#campus').val();
                var grade = $('#grade').val();
                var yid = $('#yid').val();
                var sdt = $('#sdt').val();
                $.ajax({
                    url: '{{route('ccajup')}}',
                    type: 'POST',
                    data: {
                        '_token': '{{csrf_token()}}',
                        'id': id,
                        'classroom_id': clid,
                        'campus_id': campus,
                        'curriculum_id': cur,
                        'grade_id': grade,
                        'academic_year_id': yid,
                        'study_time': sdt
                    },
                    success: function (r) {
                        if (r == 1) {
                            Swal.fire(
                                '@lang("class.s_head")',
                                '@lang("class.s_body_u")',
                                'success'
                            ).then(function () {
                                location.reload()
                            })
                        }
                    }
                })
            }

        })
    </script>
    {{--    Update--}}
    {{--    Add Student To Class--}}
    <script>
        // $('#dta').on('click','.chhk',function () {
        //
        //
        // })
        var table = $('#dta').DataTable();
        $('#addst').click(function () {
            var arrchks = [];
            table.$('.chhk').each(function () {
                if ($(this).is(":checked")) {
                    arrchks.push($(this).val());
                }
            })
            var txtclass=$('#txtclass').val()
            if(arrchks.length === 0){
                Swal.fire(
                    'Error !',
                    'No Student Selected !',
                    'error'
                )
            }else{
                $.ajax({
                    url:'{{route('addst')}}',
                    type:'POST',
                    data:{'_token':'{{csrf_token()}}','data':arrchks,'txtclass':txtclass},
                    success:function (r) {
                        if(r == 1){
                            Swal.fire(
                                'Success !',
                                'Students Added To Class Successfully',
                                'success'
                            ).then(function () {
                                location.reload()
                            })
                        }
                    }
                })
            }
        })
    </script>
    {{--    Add Student To Class--}}
    {{--    Add Teacher To Class--}}
    <script>
        $('#addtc').click(function () {
            var arrchk = [];
            @foreach($atc as $a)
            if($('#chktc{{$a->id}}').is(':checked')){
                var chid =  $('#chktc{{$a->id}}').val()
                arrchk.push({'teacher_id':chid,'class_id':'{{$d->id}}'})
            }
            @endforeach
            if(arrchk.length === 0){
                Swal.fire(
                    'Error !',
                    'No Teacher Selected !',
                    'error'
                )
            }else{
                $.ajax({
                    url:'{{route('addtc')}}',
                    type:'POST',
                    data:{'_token':'{{csrf_token()}}','data':arrchk},
                    success:function (r) {
                        if(r == 1){
                            Swal.fire(
                                'Success !',
                                'Students Added To Class Successfully',
                                'success'
                            ).then(function () {
                                location.reload()
                            })
                        }
                    }
                })
            }
        })
    </script>
    {{--Add Student To Class--}}
@endsection
