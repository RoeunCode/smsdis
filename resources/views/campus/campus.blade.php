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
                <h4>@lang('campus.head')</h4>
                <div style="float: right">
                    <button class="btn btn-pill btn-info" id="add">@lang('campus.btn')</button>
                    <div class="modal fade" id="modal-add" tabindex="-1" role="dialog"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="card-header bg-blue bg-inverse">
                                    <h4 id="modcap">@lang('campus.m_head')</h4>
                                    <ul class="card-actions">
                                        <li>
                                            <button data-dismiss="modal" type="button"><i class="ion-close"></i></button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-block">
                                    <input type="hidden" id="hid" value="">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>@lang('campus.m_khn')</label>
                                                <input type="text" id="name" class="form-control" placeholder="@lang('campus.m_kh_ph')">
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>@lang('campus.m_enn')</label>
                                                <input type="text" id="name_en" class="form-control" placeholder="@lang('campus.m_en_ph')">
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
                <div class="table-responsive">
                    <table id="dt" class="table table-bordered">
                        <thead>
                        <tr>
                            <th style="display: none">ID</th>
                            <th style="text-align: center">@lang('campus.khn')</th>
                            <th style="text-align: center">@lang('campus.enn')</th>
                            <th style="text-align: center">@lang('campus.st')</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($data as $d)
                            <tr style="text-align: center">
                                <td style="display: none">{{$d->id}}</td>
                                <td>{{$d->name}}</td>
                                <td>{{$d->name_en}}</td>
                                <td>
                                    <button class="btn  btn-primary edit"><i class="fa fa-pen"></i></button>
                                    <a class="btn btn-app-red " onclick="return confirm('Are You Sure You Want To Delete ?')" href="{{route('cpdel',$d->id)}}"><i class="fa fa-trash"></i></a>
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
            var add = "@lang('campus.m_btn_add')";
            $('#mf').html(add)
            $('#modal-add').modal('show')

        })
        $('.edit').click(function(){
            var row = $(this).closest("tr").find("td");
            var up = "@lang('campus.m_btn_up')";
            $('#mf').html(up);
            $('#hid').val($(row[0]).html());
            $('#name').val($(row[1]).html());
            $('#name_en').val($(row[2]).html());
            $('#modal-add').modal('show');
        })
    </script>
    <script>
        $('#mf').click(()=>{
            var add = "@lang('campus.m_btn_add')";
            if($('#mf').html() == add){
                var arr = ['name','name_en'];
                if(!vali(arr)){
                    swal.fire(
                        '@lang("campus.e_head")',
                        '@lang("campus.e_body")',
                        'error'
                    )
                }else{
                    var kh = $('#name').val();
                    var en = $('#name_en').val();
                    $.ajax({
                        url:'{{route('campus.store')}}',
                        type:'POST',
                        data:{'_token':'{{csrf_token()}}','name':kh,'name_en':en},
                        success:(r)=>{
                            if(r == 1){
                                swal.fire(
                                    '@lang("campus.s_head")',
                                    '@lang("campus.s_body")',
                                    'success'
                                ).then(()=>{
                                    location.reload()
                                })
                            }
                        }
                    })
                }
            }else{
                var arr = ['name','name_en'];
                if(!vali(arr)){
                    swal.fire(
                        '@lang("campus.e_head")',
                        '@lang("campus.e_body")',
                        'error'
                    )
                }else{
                    var id = $('#hid').val();
                    var kh = $('#name').val();
                    var en = $('#name_en').val();
                    $.ajax({
                        url:'cajup',
                        type:'POST',
                        data:{'_token':'{{csrf_token()}}','id':id,'name':kh,'name_en':en},
                        success:(r)=>{
                            if(r == 1){
                                swal.fire(
                                    '@lang("campus.s_head")',
                                    '@lang("campus.s_body_u")',
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
