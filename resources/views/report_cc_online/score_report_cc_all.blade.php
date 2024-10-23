@extends('layout')
@section('header')
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
            width: 340px;
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

        button.dt-button, div.dt-button, a.dt-button {
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            color: white;
            background: #358ed7;
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #ccc;
            float: left;

        }
    </style>

@endsection
<style>
    .select2-container--default .select2-selection--single .select2-selection__arrow {
        background-image: -khtml-gradient(linear, left top, left bottom, from(#424242), to(#030303));
        background-image: -moz-linear-gradient(top, #424242, #030303);
        background-image: -ms-linear-gradient(top, #424242, #030303);
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #424242), color-stop(100%, #030303));
        background-image: -webkit-linear-gradient(top, #424242, #030303);
        background-image: -o-linear-gradient(top, #424242, #030303);
        background-image: linear-gradient(#424242, #030303);
        width: 40px;
        color: #fff;
        font-size: 1.3em;
        padding: 4px 12px;
        height: 80px;
        position: absolute;
        top: 0px;
        right: 0px;
        width: 20px;
    }
</style>
@section('content')
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="card">
                <div class="card-header bg-primary bg-inverse">
                    <p>Get Report</p>
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-lg-2 ">
                            <select class="form-control" id="txtgrade">
                                <option value="" selected disabled="true">ជ្រើសរើសថ្នាក់</option>
                                <option value="7">ថ្នាក់ទី 7</option>
                                <option value="8">ថ្នាក់ទី 8</option>
                                <option value="9">ថ្នាក់ទី 9</option>
                                <option value="10">ថ្នាក់ទី 10</option>
                                <option value="11">ថ្នាក់ទី 11</option>
                                <option value="12">ថ្នាក់ទី 12</option>
                            </select>
                        </div>
                        <div class="col-lg-5 ">
                            <select class="form-control " id="txtclass">
                                {{--@foreach($grade as $row)--}}
                                    {{--<option value="{{ $row->id }}">ថ្នាក់ទី {{ $row->grade }} ទីតាំង  {{ $row->campus }}  ម៉ោងសិក្សា {{ $row->study_time }} &nbsp; ឆ្នាំសិក្សា {{ $row->academic_year }} </option>--}}
                                {{--@endforeach--}}
                                <option value="">Default</option>
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
                        <div class="col-lg-2">
                            <button class="btn btn-primary btn-sm" id="btn_search"><i class="fa fa-search"></i>&nbsp;Get Report</button>
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
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script src="https://nightly.datatables.net/buttons/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
    <script src="{{asset('theme/dist/assets/js/jquery.table2excel.js')}}"></script>

    <script>
        $('.select_2').select2()
        $('#txtgrade').on('change',function () {
                var grade=$('#txtgrade').val()
                $.ajax({
                    url:'{{ route('select_json') }}',
                    type:'POST',
                    data:{'_token':'{{ @csrf_token() }}','grade':grade},
                    success:function (data) {
                        var iteam=''

                        $.each(JSON.parse(data),function(index,value) {
                            iteam+=('<option value="' + value.id + '"> បន្ទប់ '+value.id+' ថ្នាក់ទី' + value.grade + ' ទីតាំង '+ value.campus+' ម៉ោងសិក្សា '+ value.study_time+' ឆ្នាំសិក្សា '+ value.academic_year+'</option>');
                        });
                        $('#txtclass').append(iteam)
                    }
                })

            $('#txtclass').html('refresh',true);
        })
        function prt(){
            $("#tbl_grade_all").table2excel({
                exclude: ".excludeThisClass",
                name: "DIS Semester",
                filename: "DIS"+Date.now()+".xls", // do include extension
                preserveColors: false // set to true if you want background colors and font colors preserved
            });
            $("#tbl_final_all").table2excel({
                exclude: ".excludeThisClass",
                name: "DIS Semester",
                filename: "DIS"+Date.now()+".xls", // do include extension
                preserveColors: false // set to true if you want background colors and font colors preserved
            });
            $("#tbl_grade_9").table2excel({
                exclude: ".excludeThisClass",
                name: "DIS Semester",
                filename: "DIS"+Date.now()+".xls", // do include extension
                preserveColors: false // set to true if you want background colors and font colors preserved
            });
            $("#tbl_9_final").table2excel({
                exclude: ".excludeThisClass",
                name: "DIS Semester",
                filename: "DIS"+Date.now()+".xls", // do include extension
                preserveColors: false // set to true if you want background colors and font colors preserved
            });
        }
        function printtag(tagid){
            var hashid = "#"+ tagid;
            var tagname =  $(hashid).prop("tagName").toLowerCase();
            var attributes = "";
            var attrs = document.getElementById(tagid).attributes;
            var appBanners = document.getElementsByClassName('btn_delete'), i;
            for (var i = 0; i < appBanners.length; i ++) {
                appBanners[i].style.display = 'none';
            }
            $.each(attrs,function(i,elem){
                attributes +=  " "+  elem.name+" ='"+elem.value+"'";
            })
            var divToPrint= $(hashid).html() ;
            var head = "<html><head>"+ $("head").html() + "</head>" ;
            var allcontent = head + "<body  onload='window.print()' >"+ "<" + tagname + attributes + ">" +  divToPrint + "</" + tagname + ">" +  "</body></html>"  ;
            var newWin=window.open('','Print-Window');
            newWin.document.open();
            newWin.document.write(allcontent);
            newWin.document.close();
        }
        $('#btn_search').click(function () {
            var grade=$('#txtclass').val()
            var month=$('#txtmonth').val()
            var level=$('#txtgrade').val()
            $.ajax({
                url:'{{ route('report_online.store') }}',
                type:'POST',
                data:{'_token':'{{ @csrf_token() }}','grade':grade,'month':month,'level':level},
                success:function (data) {
                    $('#list_student').html(data.output)
                    $('#btn_insert').show()
                    $('#tbl_online').DataTable()
                    $('.tbl_semester_11').DataTable({
                        dom: 'lfrtip',
                        aaSorting: [[18, 'asc']],
                        "lengthMenu": [[10, 25, 50,100, -1], [10, 25, 50,100, "All"]],
                        scrollX:        true,
                        scrollCollapse: true,
                        columnDefs: [
                            { width: 150, targets: 0 },
                            { width: 80, targets: 1 },
                            { width: 120, targets: 2 },
                            { width: 120, targets: 4 },
                        ],
                        fixedColumns: true,
                        "fnDrawCallback": function (oSettings) {
                            if (oSettings.bSorted || oSettings.bFiltered) {
                                api = this.api();
                                var arr = api.columns(9).data()[0];  //get array of column 1 (extn)

                                console.log(arr);
                                var sorted = arr.slice().sort(function (a, b) {
                                    return b - a
                                });
                                var ranks = arr.slice().map(function (v) {
                                    return sorted.indexOf(v) + 1
                                });
                                console.log(sorted);
                                console.log(ranks);
                                if (oSettings.bSorted || oSettings.bFiltered) {
                                    for (var i = 0, iLen = oSettings.aiDisplay.length; i < iLen; i++) {
                                        $('td:eq(17)', oSettings.aoData[oSettings.aiDisplay[i]].nTr).html(ranks[i]);
                                    }
                                }
                            }
                        },
                        aaSorting: [[9, 'desc']],
                        buttons: [
                            {extend: 'copy', text: '<i class="fa fa-copy"></i>&nbsp;ចម្លងទិន្ន័យ'},
                            {extend: 'pdf', text: '<i class="fa fa-plus-circle"></i>&nbsp;ទាញទិន្ន័យជា PDF'},
                            {extend: 'print', text: '<i class="fa fa-print"></i>&nbsp;បង្ហាញទិន្ន័យ'},
                            {extend: 'excel', text: '<i class="fa fa-print"></i>&nbsp;ទាញទិន្ន័យជា Excel'},

                        ],
                        "language": {
                            "lengthMenu": "បង្ហាញ _MENU_ ចំនួនទិន្ន៏យក្នុងទំព័រ",
                            "zeroRecords": "មិនមានទិន្ន័យ",
                            "info": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",
                            "infoEmpty": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",
                            "search": "ស្វែងរក",
                            "infoFiltered": "(filtered from _MAX_ total records)",
                            "paginate": {
                                "previous": "ថយក្រោយ",
                                "next": "ទៅមុខ"
                            }
                        }
                    })
                    $('.tbl_11').DataTable({
                        dom: 'lBfrtip',
                        aaSorting: [[16, 'asc']],
                        "lengthMenu": [[10, 25, 50,100, -1], [10, 25, 50,100, "All"]],
                        scrollX:        true,
                        scrollCollapse: true,
                        columnDefs: [
                            { width: 150, targets: 0 },

                        ],
                        fixedColumns: true,
                        buttons: [
                            {extend: 'copy', text: '<i class="fa fa-copy"></i>&nbsp;ចម្លងទិន្ន័យ'},
                            {extend: 'pdf', text: '<i class="fa fa-plus-circle"></i>&nbsp;ទាញទិន្ន័យជា PDF'},
                            {extend: 'print', text: '<i class="fa fa-print"></i>&nbsp;បង្ហាញទិន្ន័យ'},
                            {extend: 'excel', text: '<i class="fa fa-print"></i>&nbsp;ទាញទិន្ន័យជា Excel'},

                        ],
                        "language": {
                            "lengthMenu": "បង្ហាញ _MENU_ ចំនួនទិន្ន៏យក្នុងទំព័រ",
                            "zeroRecords": "មិនមានទិន្ន័យ",
                            "info": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",
                            "infoEmpty": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",
                            "search": "ស្វែងរក",
                            "infoFiltered": "(filtered from _MAX_ total records)",
                            "paginate": {
                                "previous": "ថយក្រោយ",
                                "next": "ទៅមុខ"
                            }
                        }

                    })
                    $('#tbl_grade9').DataTable({
                        dom: 'lfrtip',
                        aaSorting: [[18, 'asc']],
                        "lengthMenu": [[10, 25, 50,100, -1], [10, 25, 50,100, "All"]],
                        scrollX:        true,
                        scrollCollapse: true,
                        columnDefs: [
                            { width: 150, targets: 0 },
                            { width: 80, targets: 1 },
                            { width: 120, targets: 2 },
                            { width: 120, targets: 4 },
                        ],
                        fixedColumns: true,
                        "fnDrawCallback": function (oSettings) {
                            if (oSettings.bSorted || oSettings.bFiltered) {
                                api = this.api();
                                var arr = api.columns(9).data()[0];  //get array of column 1 (extn)

                                console.log(arr);
                                var sorted = arr.slice().sort(function (a, b) {
                                    return b - a
                                });
                                var ranks = arr.slice().map(function (v) {
                                    return sorted.indexOf(v) + 1
                                });
                                console.log(sorted);
                                console.log(ranks);
                                if (oSettings.bSorted || oSettings.bFiltered) {
                                    for (var i = 0, iLen = oSettings.aiDisplay.length; i < iLen; i++) {
                                        $('td:eq(19)', oSettings.aoData[oSettings.aiDisplay[i]].nTr).html(ranks[i]);
                                    }
                                }
                            }
                        },
                        aaSorting: [[9, 'desc']],
                        buttons: [
                            {extend: 'copy', text: '<i class="fa fa-copy"></i>&nbsp;ចម្លងទិន្ន័យ'},
                            {extend: 'pdf', text: '<i class="fa fa-plus-circle"></i>&nbsp;ទាញទិន្ន័យជា PDF'},
                            {extend: 'print', text: '<i class="fa fa-print"></i>&nbsp;បង្ហាញទិន្ន័យ'},
                            {extend: 'excel', text: '<i class="fa fa-print"></i>&nbsp;ទាញទិន្ន័យជា Excel'},

                        ],
                        "language": {
                            "lengthMenu": "បង្ហាញ _MENU_ ចំនួនទិន្ន៏យក្នុងទំព័រ",
                            "zeroRecords": "មិនមានទិន្ន័យ",
                            "info": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",
                            "infoEmpty": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",
                            "search": "ស្វែងរក",
                            "infoFiltered": "(filtered from _MAX_ total records)",
                            "paginate": {
                                "previous": "ថយក្រោយ",
                                "next": "ទៅមុខ"
                            }
                        }
                    })
                    $('#exp').DataTable({
                        dom: 'lBfrtip',
                        aaSorting: [[18, 'asc']],
                            "lengthMenu": [[10, 25, 50,100, -1], [10, 25, 50,100, "All"]],
                            scrollX:        true,
                            scrollCollapse: true,
                            columnDefs: [
                                { width: 150, targets: 0 },
                                { width: 80, targets: 1 },
                                { width: 120, targets: 2 },
                                { width: 120, targets: 4 },
                            ],
                            fixedColumns: true,
                        buttons: [
                            {extend: 'copy', text: '<i class="fa fa-copy"></i>&nbsp;ចម្លងទិន្ន័យ'},
                            {extend: 'pdf', text: '<i class="fa fa-plus-circle"></i>&nbsp;ទាញទិន្ន័យជា PDF'},
                            {extend: 'print', text: '<i class="fa fa-print"></i>&nbsp;បង្ហាញទិន្ន័យ'},
                            {extend: 'excel', text: '<i class="fa fa-print"></i>&nbsp;ទាញទិន្ន័យជា Excel'},

                        ],
                        "language": {
                            "lengthMenu": "បង្ហាញ _MENU_ ចំនួនទិន្ន៏យក្នុងទំព័រ",
                            "zeroRecords": "មិនមានទិន្ន័យ",
                            "info": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",
                            "infoEmpty": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",
                            "search": "ស្វែងរក",
                            "infoFiltered": "(filtered from _MAX_ total records)",
                            "paginate": {
                                "previous": "ថយក្រោយ",
                                "next": "ទៅមុខ"
                            }
                        }
                    })
                    $('#tbl_9_final').DataTable({
                        dom: 'frtip',
                        "fnDrawCallback": function (oSettings) {
                            if (oSettings.bSorted || oSettings.bFiltered) {
                                api = this.api();
                                var arr = api.columns(3).data()[0];  //get array of column 1 (extn)

                                console.log(arr);
                                var sorted = arr.slice().sort(function (a, b) {
                                    return b - a
                                });
                                var ranks = arr.slice().map(function (v) {
                                    return sorted.indexOf(v) + 1
                                });
                                console.log(sorted);
                                console.log(ranks);
                                if (oSettings.bSorted || oSettings.bFiltered) {
                                    for (var i = 0, iLen = oSettings.aiDisplay.length; i < iLen; i++) {
                                        $('td:eq(4)', oSettings.aoData[oSettings.aiDisplay[i]].nTr).html(ranks[i]);
                                    }
                                }
                            }
                        },
                        aaSorting: [[3, 'desc']],
                        buttons: [
                            {extend: 'copy', text: '<i class="fa fa-copy"></i>&nbsp;ចម្លងទិន្ន័យ'},
                            {extend: 'pdf', text: '<i class="fa fa-plus-circle"></i>&nbsp;ទាញទិន្ន័យជា PDF'},
                            {extend: 'print', text: '<i class="fa fa-print"></i>&nbsp;បង្ហាញទិន្ន័យ'},
                            {extend: 'excel', text: '<i class="fa fa-print"></i>&nbsp;ទាញទិន្ន័យជា Excel'},

                        ],
                        "language": {
                            "lengthMenu": "បង្ហាញ _MENU_ ចំនួនទិន្ន៏យក្នុងទំព័រ",
                            "zeroRecords": "មិនមានទិន្ន័យ",
                            "info": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",
                            "infoEmpty": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",
                            "search": "ស្វែងរក",
                            "infoFiltered": "(filtered from _MAX_ total records)",
                            "paginate": {
                                "previous": "ថយក្រោយ",
                                "next": "ទៅមុខ"
                            }
                        }
                    })

                    $('#tbl_grade_all').DataTable({
                        dom: 'frtip',
                        "fnDrawCallback": function (oSettings) {
                            if (oSettings.bSorted || oSettings.bFiltered) {
                                api = this.api();
                                var arr = api.columns(8).data()[0];  //get array of column 1 (extn)

                                console.log(arr);
                                var sorted = arr.slice().sort(function (a, b) {
                                    return b - a
                                });
                                var ranks = arr.slice().map(function (v) {
                                    return sorted.indexOf(v) + 1
                                });
                                console.log(sorted);
                                console.log(ranks);
                                if (oSettings.bSorted || oSettings.bFiltered) {
                                    for (var i = 0, iLen = oSettings.aiDisplay.length; i < iLen; i++) {
                                        $('td:eq(9)', oSettings.aoData[oSettings.aiDisplay[i]].nTr).html(ranks[i]);
                                    }
                                }
                            }
                        },
                        aaSorting: [[8, 'desc']],
                        buttons: [
                            {extend: 'copy', text: '<i class="fa fa-copy"></i>&nbsp;ចម្លងទិន្ន័យ'},
                            {extend: 'pdf', text: '<i class="fa fa-plus-circle"></i>&nbsp;ទាញទិន្ន័យជា PDF'},
                            {extend: 'print', text: '<i class="fa fa-print"></i>&nbsp;បង្ហាញទិន្ន័យ'},
                            {extend: 'excel', text: '<i class="fa fa-print"></i>&nbsp;ទាញទិន្ន័យជា Excel'},

                        ],
                        "language": {
                            "lengthMenu": "បង្ហាញ _MENU_ ចំនួនទិន្ន៏យក្នុងទំព័រ",
                            "zeroRecords": "មិនមានទិន្ន័យ",
                            "info": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",
                            "infoEmpty": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",
                            "search": "ស្វែងរក",
                            "infoFiltered": "(filtered from _MAX_ total records)",
                            "paginate": {
                                "previous": "ថយក្រោយ",
                                "next": "ទៅមុខ"
                            }
                        }
                    })


                    $('#tbl_final_all').DataTable({
                        dom: 'frtip',
                        "fnDrawCallback": function (oSettings) {
                            if (oSettings.bSorted || oSettings.bFiltered) {
                                api = this.api();
                                var arr = api.columns(3).data()[0];  //get array of column 1 (extn)

                                console.log(arr);``
                                var sorted = arr.slice().sort(function (a, b) {
                                    return b - a
                                });
                                var ranks = arr.slice().map(function (v) {
                                    return sorted.indexOf(v) + 1
                                });
                                console.log(sorted);
                                console.log(ranks);
                                if (oSettings.bSorted || oSettings.bFiltered) {
                                    for (var i = 0, iLen = oSettings.aiDisplay.length; i < iLen; i++) {
                                        $('td:eq(4)', oSettings.aoData[oSettings.aiDisplay[i]].nTr).html(ranks[i]);
                                    }
                                }
                            }
                        },
                        aaSorting: [[3, 'desc']],
                        buttons: [
                            {extend: 'copy', text: '<i class="fa fa-copy"></i>&nbsp;ចម្លងទិន្ន័យ'},
                            {extend: 'pdf', text: '<i class="fa fa-plus-circle"></i>&nbsp;ទាញទិន្ន័យជា PDF'},
                            {extend: 'print', text: '<i class="fa fa-print"></i>&nbsp;បង្ហាញទិន្ន័យ'},
                            {extend: 'excel', text: '<i class="fa fa-print"></i>&nbsp;ទាញទិន្ន័យជា Excel'},

                        ],
                        "language": {
                            "lengthMenu": "បង្ហាញ _MENU_ ចំនួនទិន្ន៏យក្នុងទំព័រ",
                            "zeroRecords": "មិនមានទិន្ន័យ",
                            "info": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",
                            "infoEmpty": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",
                            "search": "ស្វែងរក",
                            "infoFiltered": "(filtered from _MAX_ total records)",
                            "paginate": {
                                "previous": "ថយក្រោយ",
                                "next": "ទៅមុខ"
                            }
                        }
                    })
                }
            })


        })

    </script>


@endsection
