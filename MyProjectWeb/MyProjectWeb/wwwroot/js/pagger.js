/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function createPagger(div,pageindex,gap,totalpage,curcateid,cursubid)
{
        var container = document.getElementById(div);
        //container.innerHTML = pageindex+' '+gap +' '+totalpage;
        
        if(pageindex - gap>1){
            container.innerHTML += '<a href="../../../../Shop/List/'+curcateid+'/'+cursubid+'/1">First</a>';
        }
        for(var i = pageindex - gap;i< pageindex; i++){
            if(i>0)
                container.innerHTML += '<a href="../../../../Shop/List/'+curcateid+'/'+cursubid+'/'+i+'">'+i+'</a>';
        }
    container.innerHTML += '<a class="text-success" class="P_active" href="../../../../Shop/List/'+curcateid+'/'+cursubid+'/'+pageindex+'">'+pageindex+'</a>';
        for(var i = pageindex + 1;i<= pageindex+gap; i++){
            if(i<= totalpage)
                container.innerHTML += '<a href="../../../../Shop/List/'+curcateid+'/'+cursubid+'/'+i+'">'+i+'</a>';
        }
        if(pageindex + gap < totalpage){
            container.innerHTML += '<a href="../../../../Shop/List/'+curcateid+'/'+cursubid+'/'+totalpage+'">Last</a>';
        }
}


