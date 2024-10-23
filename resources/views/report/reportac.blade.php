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
            width: 390px;
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
        .fa-ban{
            color: rgba(255, 57, 0, 0.72);
        }
    </style>
    <div class="col-md-12">
        <div class="card">
            <div class="card-block">
                <div class="card">
                    <div class="card-header bg-blue bg-inverse">
                        <h4 style="text-align: center">American Curriculum</h4>
                    </div>
                    <div class="card-block">
                        <label>Class :</label>
                        <select class="sel sl2" id="class">
                            @foreach($cl as $c)
                                <option value="{{$c->id}}">{{$c->full}}</option>
                            @endforeach
                        </select>
                        &nbsp;
                        <label>Month :</label>
                        <select class="sal sl2" id="month">
                            @foreach($mo as $m)
                                <option value="{{$m->id}}">{{$m->name}}</option>
                            @endforeach
                        </select>
                        &nbsp;
                        <button class="btn btn-sm btn-app-blue" id="btnshow"><i class="fas fa-search"></i>&nbsp;Search
                        </button>
                    </div>
                </div>
                <div class="table-responsive" id="ajt"></div>
            </div>
            <input type="hidden" id="rl" value="" multiple>
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
        function dts() {
            $('#exps').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    {extend: 'copy', text: '<i class="fa fa-copy"></i>&nbsp;Copy'},
                    {extend: 'pdf', text: '<i class="fa fa-plus-circle"></i>&nbsp;Export To PDF'},
                    {extend: 'print', text: '<i class="fa fa-print"></i>&nbsp;Print'},
                    {extend: 'excel', text: '<i class="fa fa-print"></i>&nbsp;Export To Excel'},

                ],
                aaSorting: [[11, 'desc']],
            });
        }
    </script>
    <script>
        $(document).ready(function () {
            $('#save').hide();
            $('.sl2').select2();
        });
    </script>
    <script>
        $('#btnshow').click(function () {
            var cid = $('#class').val();
            var mid = $('#month').val();
            $.ajax({
                url: '{{route('ajrac')}}',
                type: 'POST',
                data: {'_token': '{{csrf_token()}}', 'cid': cid, 'mid': mid},
                success: function (r) {
                    $('#ajt').html(r['rt']);
                    dts();
                    rnks();
                    // anu();
                }
            })
        })
    </script>
    <script>
        function rnks() {
            $('#exp').DataTable({
                dom: 'frtip',
                "fnDrawCallback": function (oSettings) {
                    if (oSettings.bSorted || oSettings.bFiltered) {
                        api = this.api();
                        var arr = api.columns(11).data()[0];  //get array of column 1 (extn)

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
                                $('td:eq(13)', oSettings.aoData[oSettings.aiDisplay[i]].nTr).html(ranks[i]);
                            }
                        }
                    }
                },
                aaSorting: [[11, 'desc']],
                buttons: [
                    {extend: 'copy', text: '<i class="fa fa-copy"></i>&nbsp;ចម្លងទិន្ន័យ'},
                    {extend: 'pdf', text: '<i class="fa fa-plus-circle"></i>&nbsp;ទាញទិន្ន័យជា PDF'},
                    {extend: 'print', text: '<i class="fa fa-print"></i>&nbsp;បង្ហាញទិន្ន័យ'},
                    {extend: 'excel', text: '<i class="fa fa-print"></i>&nbsp;ទាញទិន្ន័យជា Excel'},

                ]
            })
        }
    </script>
    <script>
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
    </script>
    <script>
        function prt(){
            $("#exp").table2excel({
                exclude: ".excludeThisClass",
                name: "Elite Semester",
                filename: "DISSystem"+Date.now()+".xls", // do include extension
                preserveColors: false // set to true if you want background colors and font colors preserved
            });
        }
        // function prts(){
        //     $("#exp").table2excel({
        //         exclude: ".excludeThisClass",
        //         name: "Elite Semester",
        //         filename: "EliteFinal"+Date.now()+".xls", // do include extension
        //         preserveColors: false // set to true if you want background colors and font colors preserved
        //     });
        // }
    </script>
{{--    <script>--}}
{{--        function anu() {--}}
{{--            $('#anual').DataTable({--}}
{{--                dom: 'frtip',--}}
{{--                "fnDrawCallback": function (oSettings) {--}}
{{--                    if (oSettings.bSorted || oSettings.bFiltered) {--}}
{{--                        api = this.api();--}}
{{--                        var arr = api.columns(3).data()[0];  //get array of column 1 (extn)--}}

{{--                        console.log(arr);--}}
{{--                        var sorted = arr.slice().sort(function (a, b) {--}}
{{--                            return b - a--}}
{{--                        });--}}
{{--                        var ranks = arr.slice().map(function (v) {--}}
{{--                            return sorted.indexOf(v) + 1--}}
{{--                        });--}}
{{--                        console.log(sorted);--}}
{{--                        console.log(ranks);--}}
{{--                        if (oSettings.bSorted || oSettings.bFiltered) {--}}
{{--                            for (var i = 0, iLen = oSettings.aiDisplay.length; i < iLen; i++) {--}}
{{--                                $('td:eq(4)', oSettings.aoData[oSettings.aiDisplay[i]].nTr).html(ranks[i]);--}}
{{--                            }--}}
{{--                        }--}}
{{--                    }--}}
{{--                },--}}
{{--                aaSorting: [[3, 'desc']],--}}
{{--                buttons: [--}}
{{--                    {extend: 'copy', text: '<i class="fa fa-copy"></i>&nbsp;ចម្លងទិន្ន័យ'},--}}
{{--                    {extend: 'pdf', text: '<i class="fa fa-plus-circle"></i>&nbsp;ទាញទិន្ន័យជា PDF'},--}}
{{--                    {extend: 'print', text: '<i class="fa fa-print"></i>&nbsp;បង្ហាញទិន្ន័យ'},--}}
{{--                    {extend: 'excel', text: '<i class="fa fa-print"></i>&nbsp;ទាញទិន្ន័យជា Excel'},--}}

{{--                ],--}}

{{--                "language": {--}}
{{--                    "lengthMenu": "បង្ហាញ _MENU_ ចំនួនទិន្ន៏យក្នុងទំព័រ",--}}
{{--                    "zeroRecords": "មិនមានទិន្ន័យ",--}}
{{--                    "info": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",--}}
{{--                    "infoEmpty": "បង្ហាញ ទំព័រ _PAGE_ នៃទំព័រ _PAGES_",--}}
{{--                    "search": "ស្វែងរក",--}}
{{--                    "infoFiltered": "(filtered from _MAX_ total records)",--}}
{{--                    "paginate": {--}}
{{--                        "previous": "ថយក្រោយ",--}}
{{--                        "next": "ទៅមុខ"--}}
{{--                    }--}}
{{--                }--}}
{{--            })--}}
{{--        }--}}
{{--    </script>--}}
@endsection
