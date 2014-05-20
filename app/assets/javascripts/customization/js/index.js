$(document).on('ready page:load', function (){


    $.fn.MainDataInIt = function () {
        //$.Body.PlayCollect();
        $.Body.DragIt();
        $.Body.IndexAni();
        $.Body.EventInIt();
        $.Body.moveIt();
    }


    $.fn.moveIt = function(){
        var moveItem = $.Body.find('div.moveItem'),
            moveItemNum = moveItem.length,//總共幾頁
            curPage = 0,
            nextPage = 0
            moveNav = $.Body.find('div.moveNav'),
            moveList = $.Body.find('div.moveList'),
            moveLeft = $.Body.find('div.moveLeft'),
            itemWidth = 980;

        for(var i = 0; i < moveItemNum; i ++){
            moveNav.append('<div class="moveNavItem">'+(i+1)+'</div>');
        }
        var moveNavItem = $.Body.find('div.moveNavItem');
        moveNavItem.hover(
            function(){
                if($(this).index() == nextPage){

                } else {
                    $(this).css({'background':'#999'});
                }
            },
            function(){
                if($(this).index() == nextPage){

                } else {
                    $(this).css({'background':'#ccc'});
                }
            }
        );
        moveNavItem.click(
            function(){
                if(!moveList.is(':animated') && $(this).index() !== curPage){
                    nextPage = $(this).index();
                    moveItem.css({'display':'none'});
                    moveNavItem.css({'background':'#ccc'});
                    moveNavItem.eq(nextPage).css({'background':'#999'});
                    moveItem.eq(curPage).css({'left':0+'px','display':'block'});
                    moveItem.eq(nextPage).css({'left':itemWidth+'px','display':'block'});
                    curPage = nextPage;
                    moveList.css({'left':0+'px'}).animate({'left':-itemWidth+'px'},500);    
                }
            }
        );
        moveLeft.click(
            function(){
                if(!moveList.is(':animated')){
                    nextPage = curPage-1;
                    if(nextPage == -1){
                        nextPage = moveItemNum-1;
                    }
                    moveItem.css({'display':'none'});
                    moveNavItem.css({'background':'#ccc'});
                    moveNavItem.eq(nextPage).css({'background':'#999'});
                    moveItem.eq(curPage).css({'left': itemWidth+'px','display':'block'});
                    moveItem.eq(nextPage).css({'left': 0+'px','display':'block'});
                    curPage = nextPage;
                    moveList.css({'left': -itemWidth+'px'}).animate({'left': 0+'px'},500);
                }
            }
        );
        $.Body.find('div.moveRight,div.moveHidden').click(
            function(){
                if(!moveList.is(':animated')){
                    nextPage = curPage+1;
                    if(nextPage == moveItemNum){
                        nextPage = 0;
                    }
                    moveItem.css({'display':'none'});
                    moveNavItem.css({'background':'#ccc'});
                    moveNavItem.eq(nextPage).css({'background':'#999'});
                    moveItem.eq(curPage).css({'left': 0+'px','display':'block'});
                    moveItem.eq(nextPage).css({'left': itemWidth+'px','display':'block'});
                    curPage = nextPage;
                    moveList.css({'left':0+'px'}).animate({'left':-itemWidth+'px'},500,function(){
                        if(moreClick.done == true){
                            moreClick.done = false;
                            moreClick.obj.trigger('click');
                        }
                    });
                }
            }
        );
        var clickTime = 0,
            clickTimeInterval;
        clickTimeInterval = setInterval(
            function(){
                if(moveList.is(':animated')){
                    clickTime = 0;
                    //console.log(clickTime);
                }
                if(!moveList.is(':animated')){
                    clickTime += 100;
                    //console.log(clickTime);
                }
                if(clickTime == 6000){
                    delete moreClick.done;
                    //console.log(moreClick.obj);
                    runIt();
                }

            },
            100
        );
        $.Body.find('div.moveNavItem,div.moveLeft,div.moveRight').click(
            function(){
                clearInterval(autoRun);
                if(moreClick.done == undefined){
                    moreClick.done = true;
                }
                moreClick.obj = $(this);
            }
        );
        var moreClick = {
            obj:$.Body.find('div.moveRight')
        };
        var autoRun ;
        runIt();
        function runIt(){
            autoRun= setInterval(
                function(){
                    $.Body.find('div.moveHidden').trigger('click');
                }
                ,
                3000
            );            
        }

    }
    $.fn.IndexAni = function () {
    }
    $.fn.DragIt = function () {
        $.Body.find('div.card').css({'cursor':'pointer'});
        //
        /*
        $.Body.find('div.card').draggable({ 
            start:  function() { scrollBarToData() }, 
            drag:   function() { scrollBarToData() }, 
            stop:   function() { scrollBarToDataEnd() }/*, 
            containment: "parent",
            axis: "x"*/
        //});
        
        var pozArray = "";
        function scrollBarToData () {
            var offset = $.Body.find('div.card').offset(),
                xPos = offset.left,
                yPos = offset.top;
            var pozset = $.Body.find('div.card').position(),
                xPoz = pozset.left,
                yPoz = pozset.top;
            //console.log(xPos,yPos,$.Body.find('div.card').css('left'));
            pozArray += "{x:"+xPoz+",y:"+ yPoz+"},"
        }
        function scrollBarToDataEnd () {
            console.log(pozArray);
        }
        //$.Body.find('div.card').on( "drag", function( event, ui ) {console.log(event)} );
    }
    $.fn.EventInIt = function () {
        var navBox = document.querySelector('div.navBox'),
            bodyItem = document.body;
        $.Window.scroll(
            function (){
               //navBox.style.top = bodyItem.scrollTop+"px";
               //$.navBox.stop().animate({'top': bodyItem.scrollTop+"px"},300);
            }
        );
    }
    $.fn.LoadData = function (callBack) {
        this.each(function () {           
            var loadNumber = 0;
            var _self = $(this);
            var totalLoadNumber = _self.find('img').length;//圖片數量   
                                
            var checkIfLoadedTimer = setInterval(function() {
                totalLoadNumber = _self.find('img').length;//圖片數量
                loadNumber = 0;
                _self.find('img').each( function(){ if( this.complete ){ loadNumber++; } } );
                console.log((loadNumber / totalLoadNumber)*100,totalLoadNumber ); //百分比
                if( loadNumber == totalLoadNumber ){
                    //clearInterval(checkIfLoadedTimer);                  
                    callBack();
                }
            }, 400);
        });
        return this;
    }
    $.fn.ComCss = function (property) {
        var _self = $(this);
            _self['propObj'] = {};
        for(x in property){ 
            _self.propObj['-webkit-'+x] = property[x];
            _self.propObj['-moz-'+x] = property[x];
            _self.propObj['-ms-'+x] = property[x];
            _self.propObj[x] = property[x];
        }
        _self.css(_self.propObj);
        /*for(x in _self.propObj){ 
            delete _self.propObj[x];
        }*/
        delete _self.propObj;
        property = null;
        _self = null;      
    }
    $.fn.PngFix = function () {
        var _self = $(this)
        _self.find('img[src$=".png"]').each(function() {
            this.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src='"+ this.src +"')";
        });
    }
    
});
	
$(function(){
	$.Body =$('body');	
	$.Window = $(window);
    $.collectBtn = $.Body.find('div.collectBtn');
    $.flagItem = $.Body.find('div.flagItem');
    $.navBox = $.Body.find('div.navBox');
    
    $.Window.load(
        function () {
            $.Body.PngFix();
            $.Body.MainDataInIt();
        }
    );

    
});

