<!DOCTYPE html>
    <html>
    <head>
        @include('cms.layouts.head')

        @section('style')
            @show

    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <div class="left_col scroll-view">
                        @include('cms.layouts.header')

                        @include('cms.layouts.sidebar')
                    </div>
                </div>

                @include('cms.layouts.topnav')

            <div class="right_col" role="main">
                @section('content')
                    @show

            </div>
            @include('cms.layouts.footer')
            
        </div>

        @include('cms.layouts.script')

    </body>
</html>
