/**
 * Created by User on 2016/4/16.
 */
KindEditor.ready(function(K){
    K.create('textarea[name=content]',{
        width:"1000px",
        height:"400px",
        uploadJson:'/admin/upload/kindeditor'
    })
})
