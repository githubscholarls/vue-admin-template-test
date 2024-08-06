<template>
    <div>
        这是testview内容

        下面是testview子页面内容
        <router-view></router-view>
    </div>
</template>

<script setup>
    const res =  getViewTestList();

    res.then(data=>function(){
        
        console.log('data:',data);
    }).catch(err=>function(){
        console.log('error:',err);
    })
</script>

<style scoped>

</style>