(function(){
    function pageEventStat(eventData) {
        typeof mfwPageEvent=='function' && mfwPageEvent('mdd', 'mdd_index', eventData);
    }
    //æ£€ç´¢å¤„ç†
    var psearch = $('.place-search-panel'),
        mddSForm        = psearch.find('form'),
        mddIndexSearch  = psearch.find('input.search-input'),
        suggestMddLayer = psearch.find('.search-suggest-panel'),
        searchInterval,//æœç´¢
        currentlihover = -1,
        currentSeachValue = '',
        ajaxabort = null;

    /*ç›®çš„åœ°*/
    suggestMddLayer.hover(function(){
        suggestMddLayer.show();
    },function(){
        setTimeout(function(){
            suggestMddLayer.hide();
        }, 2000);
    }).delegate("li","click",function(ev){
        if(typeof(isHao123) == 'undefined'){
            pageEventStat({
                mode : 'å°é¢',
                type : 'æœç´¢ç›®çš„åœ°'
            });
            document.location.href = $(this).data('url');
        }else{
            window.open($(this).data('url'));
        }
    });

    mddIndexSearch.keyup(function(ev){
        var params = {
                'sAct'   : 'KMdd_StructWebAjax|SearchMdd',
                'sName'  : encodeURIComponent($.trim($(this).val()))
            },
            url = '/ajax/router.php?';
        if(ev.keyCode == "27"){ //ESC
            suggestMddLayer.hide();
            return;
        }
        if(ev.keyCode == "40" || ev.keyCode == "38"){
            return;
        }
        if(currentSeachValue == params.sName && suggestMddLayer[0].style.display == 'block'){
            return;
        }
        clearTimeout(searchInterval);
        if(ajaxabort){
            ajaxabort.abort();
        }
        if(!params.sName){
            suggestMddLayer.hide();
            return;
        }

        searchInterval = setTimeout(function(){
            //alert(params.sName);
            for(var k in params){
                url += k + '=' + params[k] + '&';
            }
            url = url.slice(0, url.length - 1);
            ajaxabort = $.ajax({
                type: 'GET',
                url: url,
                dataType: 'json',
                success: function(d){
                    if(d.succ){
                        if(d.data.mdd.length){
                            currentSeachValue = params.sName;
                            suggestLayer(d.data);
                            currentlihover = d.data.exact ? 0 : -1;
                            suggestMddLayer.show();
                        }else{
                            suggestMddLayer.hide();
                        }
                    }else{
                        alert(d.error.msg);
                    }
                }
            });
        }, 200);
    });
    mddIndexSearch.blur(function(){
        setTimeout(function(){
            suggestMddLayer.hide();
        }, 500);
    });
    $(document.body).keyup(function(ev){
        var suggestlists = suggestMddLayer.find('li'),
            len = suggestlists.length,
            ctarget = $(ev.srcElement || ev.target);
        if(ctarget.hasClass('search-input')){
            if(ev.keyCode == "40"){ //Down Arrow
                if(len && suggestMddLayer[0].style.display == 'block'){
                    if(currentlihover != -1){
                        $(suggestlists[currentlihover]).removeClass('active');
                    }
                    currentlihover = currentlihover + 1;
                    if(currentlihover == len){
                        currentlihover = 0;
                    }
                    $(suggestlists[currentlihover]).addClass('active');
                }
            }else if(ev.keyCode == "38"){ // Up Arrow
                if(len && suggestMddLayer[0].style.display == 'block'){
                    if(currentlihover == -1) return;
                    $(suggestlists[currentlihover]).removeClass('active');
                    currentlihover = currentlihover -1;
                    if(currentlihover == -1){
                        currentlihover = len - 1;
                    }
                    $(suggestlists[currentlihover]).addClass('active');
                }
            }
        }
    });

    //è¡¨å•æäº¤
    mddSForm.submit(function (e, trigger) {
        var searchvalue = $.trim(mddIndexSearch.val()),
            $activeLi = suggestMddLayer.find('li.active');
        if (searchvalue) {
            if (trigger != 'click' && suggestMddLayer.is(":visible") && $activeLi.length) {
                $activeLi.click();
                return false;
            }
        } else {
            mddIndexSearch[0].focus();
            return false;
        }
    }).find('a.search-button').click(function(e){
        e.preventDefault();
        pageEventStat({
            mode : 'å°é¢',
            type : 'æœç´¢æŒ‰é’®'
        });
        mddSForm.trigger("submit",['click'])
    });

    (function getSearchHotMdds(){
        var params = {
                'sAct'   : 'KMdd_StructWebAjax|GetSearchHotMdds'
            },
            url = '/ajax/router.php?';
        for(var k in params){
            url += k + '=' + params[k] + '&';
        }
        url = url.slice(0, url.length - 1);
        $.ajax({
            type: 'GET',
            url: url,
            dataType: 'json',
            success: function(d){
                if(d.succ){
                    var sb = [],k;
                    for(k in d.data){
                        if(d.data.hasOwnProperty(k)){
                            if(typeof(isHao123) == 'undefined'){
                                sb[sb.length] = '<a href="/travel-scenic-spot/mafengwo/'+k+'.html">'+d.data[k]+'</a>';
                            }else{
                                sb[sb.length] = '<a href="/travel-scenic-spot/mafengwo/'+k+'.html" target="_blank">'+d.data[k]+'</a>';
                            }
                        }
                    }
                    $('.place-search-hot').html(sb.join(''));
                }else{

                }
            }
        });
    })();

    function suggestLayer(data){
        var lists = data.mdd,
            objlist = [];
        for(var i = 0, len = lists.length, h = ''; i < len; i++){
            h = i == 0 && data.exact ? 'active' : '';
            objlist[objlist.length] = '<li class="'+
                h+'" data-url="http://' + Env.WWW_HOST +'/travel-scenic-spot/mafengwo/'+
                lists[i].mddid + '.html" ><i class="sicon-place"></i><span class="skey">' +
                lists[i].name +'</span>'+
                (lists[i].parent ? ('<span>' + lists[i].parent + '</span>') : '') +
                '</li>';

        }
        suggestMddLayer.find('ul').html(objlist.join(''));
    }
    //ç›®çš„åœ°æŽ¨è
    var mddimg = $('.mddimg');
    $.each(mddimg, function (k, img) {
        img = $(img);
        loadImg(img.data('src'), function () {
            coverPicLoad(this, img.parent(), 1);
            img.remove();
        });
    });


    //æŽ¨èåˆ‡æ¢
    var $tabs = $('ul.r-nav');
    $tabs.click(function(e){
        var target = e.target;
        if(target.tagName != "LI"){
            target = target.parentNode;
        }
        e.preventDefault();
        var $this = $(target);
        if(!$this.is('.r-nav-active')){
            $this.addClass('r-nav-active').siblings().removeClass('r-nav-active');
            var $blocks = $this.parents('.wrapper').find('.discovery-tiles')
            $blocks.hide().eq($(this).find('li').index($this)).show();
        }
    });
    $('.row').each(function(i, e){
        if(i%2 != 0){
            $(e).addClass('row-bg');
        }else{
            $(e).removeClass('row-bg');
        }
    });
    /*ç»Ÿè®¡ä»£ç */
    /*å°é¢*/
    $('.place-search-hot').delegate('a', 'click', function(ev){
        pageEventStat({
            mode : 'å°é¢',
            type : 'æœç´¢æŽ¨èç›®çš„åœ°'
        });
    });
    $('.show-name a').click(function(ev){
        var target = $(ev.currentTarget),
            type = target.attr('data-t');
        if(type){
            pageEventStat({
                mode : 'å°é¢',
                type : 'POI'
            });
        }
    });
    $('.show-links a').click(function(ev){
        var target = $(ev.currentTarget),
            type = target.attr('data-t');
        if(type){
            pageEventStat({
                mode : 'å°é¢',
                type : type
            });
        }
    });
    $('.show-ft').delegate('a', 'click', function(ev){
        var target = $(ev.currentTarget),
            type = target.attr('data-t');
        if(type){
            pageEventStat({
                mode : 'å°é¢',
                type : type
            });
        }
    });
    /*ç›®çš„åœ°æŽ¨è*/
    $('.discovery-tiles').delegate('a', 'click', function(ev){
        var target = $(ev.currentTarget),
            rowList = target.parents('.discovery-tiles'),
            type = rowList.attr('data-t');
        if(type){
            pageEventStat({
                mode   : 'ç›®çš„åœ°æŽ¨è',
                type   : type
            });
        }
    });
    /*ç›®çš„åœ°åˆ—è¡¨*/
    $('.row-list').delegate('a', 'click', function(ev){
        var target = $(ev.currentTarget),
            rowList = target.parents('.row-list'),
            mddname = target.text();
        if(mddname){
            pageEventStat({
                mode   : 'ç›®çš„åœ°åˆ—è¡¨',
                type   : mddname
            });
        }
    });
    $('.domestic').click(function(){
        pageEventStat({
            mode   : 'ç›®çš„åœ°åˆ—è¡¨',
            type   : 'çº¢æ——'
        });
    });

    //è·¯çº¿åˆ—è¡¨ç‚¹å‡»
    $('.row-routelines').delegate('.discovery-tiles a[href]', 'click', function (e) {
        pageEventStat({
            mode: 'çŽ©æ³•è·¯çº¿',
            type: $.trim($(this).find('>.title h3').text())
        });
    });
    $('.pop-share').delegate('a[href]', 'click', function (e) {
        pageEventStat({
            mode: 'å°é¢',
            type: $.trim($(this).attr('title'))
        });
    });
    $('.cover').delegate('a[href]', 'click', function (e) {
        pageEventStat({
            mode: 'å°é¢',
            type: 'èƒŒæ™¯å›¾ç‰‡'
        });
    });
    var setid1;
    $('.btn-share').hover(function(){
        $('.pop-share').show();
    }, function(){
        setid1 = setTimeout(function(){
            $('.pop-share').hide();
        },200);
    });
    $('.pop-share').hover(function(){
        clearTimeout(setid1);
        $(this).show();
    },function(){
        $(this).hide();
    });
    $('#_j_sharecnt').attr('data-content',$('#_j_sharecnt').attr('data-content')+$('.location').text()+'ã€‚');
    $('.row-hot .r-navbar').delegate('a', 'hover', function(ev){
        var target = $(ev.target),
            navbar = target.parent().find('a'),
            index = navbar.index(target),
            hotlist = $('.hot-list');
        navbar.removeClass('on');
        target.addClass('on');
        hotlist.addClass('hide');
        hotlist.eq(index).removeClass('hide');
    });
    $('.row-hot').delegate('a[href]', 'click', function (e) {
        pageEventStat({
            mode   : 'çƒ­é—¨ç›®çš„åœ°',
            type   : $(e.currentTarget).html()
        });
    });
})();

