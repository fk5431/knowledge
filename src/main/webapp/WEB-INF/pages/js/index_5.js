window.onresize = function () {
    var id  = document.getElementById('_j_top_pic_container');
    var ul = id.firstElementChild;
    var height ;
    for (var i=0;i<5;i++){
        var li = ul.children[i];
        if(li.style.display == ""){
            height = li.firstElementChild.firstElementChild.scrollHeight;
        }
    }

    id.style.height = height;
}