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
                <h4>@lang('classroom.head')</h4>
                <div style="float: right">

                    <div class="modal fade" id="modal-add" tabindex="-1" role="dialog"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="card-header bg-blue bg-inverse">
                                    <h4 id="modcap">@lang('classroom.m_head')</h4>
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
                                                <label>@lang('classroom.m_name')</label>
                                                <input type="text" id="name" class="form-control" placeholder="@lang('classroom.m_name_ph')">
                                                <input type="hidden" id="campus" value="{{ \Illuminate\Support\Facades\Auth::user()->camp_id }}"/>
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

                <button class="btn btn-primary btn-sm" id="add">  <i class="fa fa-plus"></i>&nbsp;&nbsp;Create ClassRoom</button>
                <div class="table-responsive m-t">
                    <table id="dt" class="table table-bordered">
                        <thead>
                        <tr>
                            <th style="display: none">ID</th>
                            <th style="text-align: center">@lang('classroom.name')</th>
                            <th style="text-align: center">@lang('classroom.st')</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($data as $d)
                            <tr style="text-align: center">
                                <td style="display: none">{{$d->id}}</td>
                                <td>{{$d->name}}</td>
                                <td>
                                    <button class="btn btn-primary edit"><i class="fa fa-pen"></i></button>
                                    <button class="btn btn-danger delete"  ><i class="fa fa-trash"></i></button>
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
        $('#dt').on('click','.delete',function () {
            $tr = $(this).closest('tr');
            var data = $tr.children("td").map(function () {
                return $(this).text();
            }).get();
            var url='{{ route('classroom.destroy','id') }}'
            var url2=url.replace('id',data[0])
           $.ajax({
               type:"DELETE",
               url:url2,
               data:{'_token':'{{ @csrf_token() }}'},
               success:function (data) {
                   if(data==1){
                       Swal.fire({
                           'title':'Delete ClassRoom',
                           'text':'Completed',
                           'type':'success'
                       }).then(function () {
                           location.reload().delay(200)
                       })
                   }
               }
           })
        })
    </script>
    <script>
        $('#add').click(()=>{
            var add = "@lang('classroom.m_btn_add')";
            $('#mf').html(add)
            $('#modal-add').modal('show')

        })
        $('.edit').click(function(){
            var row = $(this).closest("tr").find("td");
            var up = "@lang('classroom.m_btn_up')";
            $('#mf').html(up);
            $('#hid').val($(row[0]).html());
            $('#name').val($(row[1]).html());
            $('#modal-add').modal('show');
        })
    </script>
    <script>
        $('#mf').click(()=>{
            var add = "@lang('classroom.m_btn_add')";
            if($('#mf').html() == add){
                var arr = ['name'];
                if(!vali(arr)){
                    swal.fire(
                        '@lang("classroom.e_head")',
                        '@lang("classroom.e_body")',
                        'error'
                    )
                }else{
                    var kh = $('#name').val();
                    var campus=$('#campus').val()
                    $.ajax({
                        url:'{{route('classroom.store')}}',
                        type:'POST',
                        data:{'_token':'{{csrf_token()}}','name':kh,'campus_id':campus},
                        success:(r)=>{
                            if(r == 1){
                                swal.fire(
                                    '@lang("classroom.s_head")',
                                    '@lang("classroom.s_body")',
                                    'success'
                                ).then(()=>{
                                    location.reload()
                                })
                            }
                        }
                    })
                }
            }else{
                var arr = ['name'];
                if(!vali(arr)){
                    swal.fire(
                        '@lang("classroom.e_head")',
                        '@lang("classroom.e_body")',
                        'error'
                    )
                }else{
                    var id = $('#hid').val();
                    var kh = $('#name').val();
                    $.ajax({
                        url:'clajup',
                        type:'POST',
                        data:{'_token':'{{csrf_token()}}','id':id,'name':kh},
                        success:(r)=>{
                            if(r == 1){
                                swal.fire(
                                    '@lang("classroom.s_head")',
                                    '@lang("classroom.s_body_u")',
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
