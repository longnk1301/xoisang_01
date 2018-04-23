<div class="navbar nav_title" style="border: 0;">
    {!! html_entity_decode(Html::link(null, Lang::get('cms.title'), ['class' => 'site_title'])) !!}
</div>

<div class="clearfix"></div>

<div class="profile clearfix">
    <div class="profile_pic">
        {!! Html::image('images/user-image.png', 'Profile Image', ['class' => 'img-circle profile_img']) !!}
    </div>
    <div class="profile_info">
        <span>@lang('cms.welcome')</span>
        <h2>John Doe</h2>
    </div>
</div>

<br />
