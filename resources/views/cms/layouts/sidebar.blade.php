<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
    <div class="menu_section">
        <ul class="nav side-menu">
            <li>
                {!! html_entity_decode(Html::link(null, '<i class="fa fa-home"></i> ' . Lang::get('cms.home') . '<span class="fa fa-chevron-down"></span>')) !!}
            </li>
            
        </ul>
    </div>
</div>
<div class="sidebar-footer hidden-small">
    <a data-toggle="tooltip" data-placement="top" title="Settings">
        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
    </a>
    <a data-toggle="tooltip" data-placement="top" title="FullScreen">
        <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
    </a>
    <a data-toggle="tooltip" data-placement="top" title="Lock">
        <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
    </a>
    <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
    </a>
</div>
