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
                <h4>@lang('academic_year.head')</h4>
                <div style="float: right">
                    {{-- <button class="btn btn-pill btn-info" id="add">@lang('academic_year.btn')</button> --}}
                    <div class="modal fade" id="modal-add" tabindex="-1" role="dialog"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="card-header bg-blue bg-inverse">
                                    <h4 id="modcap">@lang('academic_year.m_head')</h4>
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
                                                <label>@lang('academic_year.m_name')</label>
                                                <input type="text" id="name" class="form-control" placeholder="@lang('academic_year.m_name_ph')">
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label>@lang('academic_year.m_start')</label>
                                                <input type="date" id="start" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label>@lang('academic_year.m_end')</label>
                                                <input type="date" id="end" class="form-control">
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
                <button class="btn btn-primary btn-sm" id="add">  <i class="fa fa-plus"></i>&nbsp;&nbsp;Create Academic Year</button>
                <div class="table-responsive m-t">
                    <table id="dt" class="table table-bordered">
                        <thead>
                        <tr>
                            <th style="display: none">ID</th>
                            <th style="text-align: center">@lang('academic_year.name')</th>
                            <th style="text-align: center">@lang('academic_year.start')</th>
                            <th style="text-align: center">@lang('academic_year.end')</th>
                            <th style="text-align: center">@lang('academic_year.st')</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($data as $d)
                            <tr style="text-align: center">
                                <td style="display: none">{{$d->id}}</td>
                                <td>{{$d->name}}</td>
                                <td>{{$d->start}}</td>
                                <td>{{$d->end}}</td>
                                <td>
                                    <button class="btn btn-sm btn-primary edit"><i class="fa fa-pen"></i></button>
                                    <a class="btn btn-app-red btn-sm " onclick="return confirm('Are You Sure You Want To Delete ?')" href="{{route('aydel',$d->id)}}"><i class="fa fa-trash"></i></a>
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
            var add = "@lang('academic_year.m_btn_add')";
            $('#mf').html(add)
            $('#modal-add').modal('show')

        })
        $('.edit').click(function(){
            var row = $(this).closest("tr").find("td");
            var up = "@lang('academic_year.m_btn_up')";
            $('#mf').html(up);
            $('#hid').val($(row[0]).html());
            $('#name').val($(row[1]).html());
            $('#start').val($(row[2]).html());
            $('#end').val($(row[3]).html());
            $('#modal-add').modal('show');
        })
    </script>
    <script>
        $('#mf').click(()=>{
            var add = "@lang('academic_year.m_btn_add')";
            if($('#mf').html() == add){
                var arr = ['name','start','end'];
                if(!vali(arr)){
                    swal.fire(
                        '@lang("academic_year.e_head")',
                        '@lang("academic_year.e_body")',
                        'error'
                    )
                }else{
                    var name = $('#name').val();
                    var start = $('#start').val();
                    var end = $('#end').val();
                    $.ajax({
                        url:'{{route('academic_year.store')}}',
                        type:'POST',
                        data:{'_token':'{{csrf_token()}}','name':name,'start':start,'end':end},
                        success:(r)=>{
                            if(r == 1){
                                swal.fire(
                                    '@lang("academic_year.s_head")',
                                    '@lang("academic_year.s_body")',
                                    'success'
                                ).then(()=>{
                                    location.reload()
                                })
                            }
                        }
                    })
                }
            }else{
                var arr = ['name','start','end'];
                if(!vali(arr)){
                    swal.fire(
                        '@lang("academic_year.e_head")',
                        '@lang("academic_year.e_body")',
                        'error'
                    )
                }else{
                    var id = $('#hid').val();
                    var name = $('#name').val();
                    var start = $('#start').val();
                    var end = $('#end').val();
                    $.ajax({
                        url:'aajup',
                        type:'POST',
                        data:{'_token':'{{csrf_token()}}','id':id,'name':name,'start':start,'end':end},
                        success:(r)=>{
                            if(r == 1){
                                swal.fire(
                                    '@lang("academic_year.s_head")',
                                    '@lang("academic_year.s_body_u")',
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
