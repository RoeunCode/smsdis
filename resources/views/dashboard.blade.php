@extends('layout')
@section('content')
    <div class="row">
        <div class="col-sm-6 col-lg-3">
            <a class="card">
                <div class="card-block clearfix">
                    <div class="pull-right">
                        <p class="h4 text-muted m-t-0 m-b-xs">@lang('dash.stu')</p>
                        <p class="h3 text-blue m-t-sm m-b-0">{{count($stu)}}</p>
                    </div>
                    <div class="pull-left m-r">
                        <span class="img-avatar img-avatar-48 bg-blue bg-inverse"><i class="fas fa-user-graduate"></i></span>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-sm-6 col-lg-3">
            <a class="card">
                <div class="card-block clearfix">
                    <div class="pull-right">
                        <p class="h4 text-muted m-t-0 m-b-xs">@lang('dash.tch')</p>
                        <p class="h3 text-blue m-t-sm m-b-0">{{count($tch)}}</p>
                    </div>
                    <div class="pull-left m-r">
                        <span class="img-avatar img-avatar-48 bg-blue bg-inverse"><i class="fas fa-chalkboard-teacher"></i></span>
                    </div>
                </div>
            </a>
        </div>
        <!-- .col-sm-6 -->

        <div class="col-sm-6 col-lg-3">
            <a class="card">
                <div class="card-block clearfix">
                    <div class="pull-right">
                        <p class="h4 text-muted m-t-0 m-b-xs">@lang('dash.camp')</p>
                        <p class="h3 text-blue m-t-sm m-b-0">{{count($camp)}}</p>
                    </div>
                    <div class="pull-left m-r">
                        <span class="img-avatar img-avatar-48 bg-blue bg-inverse"><i class="fas fa-university"></i></span>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6 col-md-12 col-xs-12">
            <div class="card">
                <div class="card-header">
                    <h4>@lang('dash.line')&nbsp;@php echo date('Y'); @endphp</h4>
                    <ul class="card-actions">
                        <li>
                            <button type="button" data-toggle="card-action" data-action="refresh_toggle" data-action-mode="demo"><i class="ion-refresh"></i></button>
                        </li>
                    </ul>
                </div>
                <div class="card-block">
                    <!-- Lines Chart Container -->
                    <div class="js-flot-lines" style="height: 330px;"></div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4>@lang('dash.pie')&nbsp;@php echo date('Y'); @endphp</h4>
                    <ul class="card-actions">
                        <li>
                            <button type="button" data-toggle="card-action" data-action="refresh_toggle" data-action-mode="demo"><i class="ion-refresh"></i></button>
                        </li>
                    </ul>
                </div>
                <div class="card-block">
                    <!-- Pie Chart Container -->
                    <div class="js-flot-pie" style="height: 330px;"></div>
                </div>
            </div>
        </div>
    </div>
    {{--<form method="post" enctype="multipart/form-data" action="{{ url('/import_excel/import') }}">--}}
        {{--{{ csrf_field() }}--}}
        {{--<div class="form-group">--}}
            {{--<table class="table">--}}
                {{--<tr>--}}
                    {{--<td width="40%" align="right"><label>Select File for Upload</label></td>--}}
                    {{--<td width="30">--}}
                        {{--<input type="file" name="select_file" />--}}
                    {{--</td>--}}
                    {{--<td width="30%" align="left">--}}
                        {{--<input type="submit" name="upload" class="btn btn-primary" value="Upload">--}}
                    {{--</td>--}}
                {{--</tr>--}}
                {{--<tr>--}}
                    {{--<td width="40%" align="right"></td>--}}
                    {{--<td width="30"><span class="text-muted">.xls, .xslx</span></td>--}}
                    {{--<td width="30%" align="left"></td>--}}
                {{--</tr>--}}
            {{--</table>--}}
        {{--</div>--}}
    {{--</form>--}}
@endsection
@section('footer')
    <script src="{{asset('theme/dist/assets/js/plugins/flot/jquery.flot.min.js')}}"></script>
    <script src="{{asset('theme/dist/assets/js/plugins/flot/jquery.flot.pie.min.js')}}"></script>
    <script src="{{asset('theme/dist/assets/js/plugins/flot/jquery.flot.stack.min.js')}}"></script>
    <script src="{{asset('theme/dist/assets/js/plugins/flot/jquery.flot.resize.min.js')}}"></script>
    {{--    Flot Charts--}}
    <script>
        var BaseJsCharts = function() {

            // Flot charts: http://www.flotcharts.org/flot/examples/
            var initChartsFlot = function() {
                // Get the elements where we will attach the charts
                var $flotLines = jQuery( '.js-flot-lines' );
                var $flotPie = jQuery( '.js-flot-pie' );

                var ba1 = '{{count($ba1)}}';
                var ba2 = '{{count($ba2)}}';
                var ba3 = '{{count($ba3)}}';
                var ba4 = '{{count($ba4)}}';
                var ba5 = '{{count($ba5)}}';
                var ba6 = '{{count($ba6)}}';
                var ba7 = '{{count($ba7)}}';
                var ba8 = '{{count($ba8)}}';
                var ba9 = '{{count($ba9)}}';
                var ba10 = '{{count($ba10)}}';
                var ba11 = '{{count($ba11)}}';
                var ba12 = '{{count($ba12)}}';

                var $dataCompanies = [
                    [1, ba1],
                    [2, ba2],
                    [3, ba3],
                    [4, ba4],
                    [5, ba5],
                    [6, ba6],
                    [7, ba7],
                    [8, ba8],
                    [9, ba9],
                    [10, ba10],
                    [11, ba11],
                    [12, ba12]
                ];

                var $dataMonths = [
                    [1, '@lang('dash.jan')'],
                    [2, '@lang('dash.feb')'],
                    [3, '@lang('dash.mar')'],
                    [4, '@lang('dash.apr')'],
                    [5, '@lang('dash.may')'],
                    [6, '@lang('dash.jun')'],
                    [7, '@lang('dash.jul')'],
                    [8, '@lang('dash.aug')'],
                    [9, '@lang('dash.sep')'],
                    [10, '@lang('dash.oct')'],
                    [11, '@lang('dash.nov')'],
                    [12, '@lang('dash.dec')']
                ];

                // Init Lines chart
                jQuery.plot( $flotLines, [{
                    label: '@lang('dash.line_cap')',
                    data: $dataCompanies,
                    shadowSize: 0,
                    lines: {
                        show: true,
                        fill: false,
                        fillColor: {
                            colors: [{
                                opacity: 1
                            }, {
                                opacity: 1
                            }]
                        },
                    },
                    points: {
                        show: true,
                        radius: 4
                    }
                }], {
                    colors: [
                        App.colors.blue,
                        App.colors.purple,
                        App.colors.cyan
                    ],
                    legend: {
                        show: true,
                        noColumns: 2,
                        position: 'nw',
                        backgroundOpacity: 0
                    },
                    grid: {
                        borderWidth: 0,
                        hoverable: true,
                        clickable: true
                    },
                    yaxis: {
                        tickColor: '#fff',
                        ticks: 3
                    },
                    xaxis: {
                        ticks: $dataMonths,
                        tickColor: '#f5f5f5'
                    }
                });

                // Creating and attaching a tooltip to the classic chart
                var previousPoint = null,
                    ttlabel = null;
                $flotLines.bind( 'plothover', function( event, pos, item ) {
                    if ( item) {
                        if ( previousPoint !== item.dataIndex ) {
                            previousPoint = item.dataIndex;

                            jQuery( '.js-flot-tooltip' ).remove();
                            var x = item.datapoint[0],
                                y = item.datapoint[1];

                            if ( item.seriesIndex === 0 ) {
                                ttlabel = '<strong>' + y + '</strong> នាក់';
                            } else if ( item.seriesIndex === 1) {
                                ttlabel = '<strong>' + y + '</strong> នាក់';
                            } else {
                                ttlabel = '<strong>' + y + '</strong> នាក់';
                            }

                            jQuery( '<div class="js-flot-tooltip flot-tooltip">' + ttlabel + '</div>' )
                                .css({
                                    top: item.pageY - 45,
                                    left: item.pageX + 5
                                }).appendTo( 'body' ).show();
                        }
                    } else {
                        jQuery( '.js-flot-tooltip' ).remove();
                        previousPoint = null;
                    }
                });

                // Pie Chart
                jQuery.plot( $flotPie, [{
                    label: '@lang("dash.cc")',
                    data: '{{count($cc)}}'
                }, {
                    label: '@lang("dash.ac")',
                    data: '{{count($ac)}}'
                }, {
                    label: '@lang("dash.fla")',
                    data: '{{count($fla)}}'
                }], {
                    colors: [App.colors.green, App.colors.blue, App.colors.cyan],
                    legend: {
                        show: false
                    },
                    series: {
                        pie: {
                            show: true,
                            radius: 1,
                            label: {
                                show: true,
                                radius: 2 / 3,
                                formatter: function(label, pieSeries) {
                                    return '<div class="flot-pie-label">' + label + '<br>' + Math.round( pieSeries.percent ) + '%</div>';
                                },
                                background: {
                                    opacity: .75,
                                    color: '#000000'
                                }
                            }
                        }
                    }
                });
            };

            return {
                init: function() {
                    // Init charts
                    initChartsFlot();
                }
            };
        }();

        // Initialize when page loads
        jQuery( function() {
            BaseJsCharts.init();
        });
    </script>
@endsection
