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
                <h4>@lang('grade.head')</h4>
                <div style="float: right">
                    {{-- <button class="btn btn-pill btn-info" id="add">@lang('grade.btn')</button> --}}
                    <div class="modal fade" id="modal-add" tabindex="-1" role="dialog"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="card-header bg-blue bg-inverse">
                                    <h4 id="modcap">@lang('grade.m_head')</h4>
                                    <ul class="card-actions">
                                        <li>
                                            <button data-dismiss="modal" type="button"><i class="ion-close"></i></button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-block">
                                    <input type="hidden" id="hid" value="">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="form-group">
                                                <label>@lang('grade.m_cur')</label>
                                                <select class="form-control" name="text" id="cur">
                                                    <option value="">@lang('grade.m_cur_ph')</option>
                                                        @foreach($cur as $c)
                                                            <option value="{{$c->id}}">{{$c->name}}</option>
                                                        @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="form-group">
                                                <label>@lang('grade.m_gr')</label>
                                                <input type="text" id="name" class="form-control" placeholder="@lang('grade.m_gr_ph')">
                                                <input type="hidden" id="camp" value="{{ \Illuminate\Support\Facades\Auth::user()->camp_id }}"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-sm btn-app btn-app-blue" type="button"
                                                id="mf"><i class="ion-checkmark"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-block">
                <button class="btn btn-primary btn-sm" id="add">  <i class="fa fa-plus"></i>&nbsp;&nbsp;Create Grade</button>
                <div class="table-responsive m-t">
                    <table id="dt" class="table table-bordered">
                        <thead>
                        <tr>
                            <th style="display: none">ID</th>
                            <th style="text-align: center">@lang('grade.gr')</th>
                            <th style="display: none">cur_id</th>
                            <th style="text-align: center">@lang('grade.cur')</th>
                            <th style="text-align: center">@lang('grade.st')</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($data as $d)
                            <tr style="text-align: center">
                                <td style="display: none">{{$d->id}}</td>
                                <td>{{$d->name}}</td>
                                <td style="display: none">{{$d->cur_id}}</td>
                                <td>@php if($d->cur_id == 1){echo "កម្មវិធីជាតិ";}elseif($d->cur_id == 2){echo "American Curriculum";}elseif($d->cur_id == 3){echo "Foreign Language Academy";} @endphp</td>
                                <td>
                                    <button class="btn btn-pill btn-primary edit"><i class="fa fa-pen"></i></button>
                                    <a class="btn btn-app-red btn-pill" onclick="return confirm('Are You Sure You Want To Delete ?')" href="{{route('gdel',$d->id)}}"><i class="fa fa-trash"></i></a>
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
            $('#dt').DataTable();
        });
    </script>
    <script>
        $('#add').click(()=>{
            var add = "@lang('grade.m_btn_add')";
            $('#mf').html(add)
            $('#name').val("")
            $('#modal-add').modal('show')

        })
        $('.edit').click(function(){
            var row = $(this).closest("tr").find("td");
            var up = "@lang('grade.m_btn_up')";
            $('#mf').html(up);
            $('#hid').val($(row[0]).html());
            $('#name').val($(row[1]).html());
            $('#cur').val($(row[2]).html());
            $('#modal-add').modal('show');
        })
    </script>
    <script>
        $('#mf').click(()=>{
            var add = "@lang('grade.m_btn_add')";
            if($('#mf').html() == add){
                var arr = ['name','cur'];
                if(!vali(arr)){
                    swal.fire(
                        '@lang("grade.e_head")',
                        '@lang("grade.e_body")',
                        'error'
                    )
                }else{
                    var kh = $('#name').val();
                    var cur = $('#cur').val();
                    var camp=$('#camp').val()
                    $.ajax({
                        url:'{{route('grade.store')}}',
                        type:'POST',
                        data:{'_token':'{{csrf_token()}}','name':kh,'cur_id':cur,'campus_id':camp},
                        success:(r)=>{
                            if(r == 1){
                                swal.fire(
                                    '@lang("grade.s_head")',
                                    '@lang("grade.s_body")',
                                    'success'
                                ).then(()=>{
                                    location.reload()
                                })
                            }
                        }
                    })
                }
            }else{
                var arr = ['name','cur'];
                if(!vali(arr)){
                    swal.fire(
                        '@lang("grade.e_head")',
                        '@lang("grade.e_body")',
                        'error'
                    )
                }else{
                    var id = $('#hid').val();
                    var kh = $('#name').val();
                    var cur = $('#cur').val();
                    $.ajax({
                        url:'gajup',
                        type:'POST',
                        data:{'_token':'{{csrf_token()}}','id':id,'name':kh,'cur_id':cur},
                        success:(r)=>{
                            if(r == 1){
                                swal.fire(
                                    '@lang("grade.s_head")',
                                    '@lang("grade.s_body_u")',
                                    'success'
                                ).then(()=>{
                                    location.reload()
                                })
                            }
                        }
                    })
                }
            }
        })
    </script>
@endsection
