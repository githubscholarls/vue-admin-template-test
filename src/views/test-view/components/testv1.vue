<template>
    <div>
        <div>
            <span> {{ "<<" }}test store 数据 {{ ">>" }}</span>
                    <p>wshilistdata: {{ this.$store.state.teststore.wshilist }}</p>
                    <p>testcount {{ this.$store.state.teststore.testcount }}</p>
        </div>
        <div>

            <span> {{ "<<" }} mapState 数据 {{ ">>" }}</span>
                    <p> storename:{{ this.storename }}</p>
                    <p> count0:{{ this.getcount0 }}</p>
                    <!-- <p> count1 (testcount):{{ this.testcount }}</p> -->
                    <p> count2:{{ this.count2 }}</p>



        </div>
        <div>
            <span> {{ "<<" }} 点击事件 {{ ">>" }}</span>
                    <a @click="increment()">count++</a>
                    <a @click="resetwshilist()">重置数据</a>
                    <a @click="setdata('123')">设置数据 123</a>
                    <a @click="apigetwshilist()">设置接口数据</a>
        </div>
    </div>
</template>

<script>
import { getViewTestList } from '@/api/testview'  // 导入API方法
import { tSMethodSignature, thisExpression } from '@babel/types'
import { mapState, mapGetters, mapMutations } from 'vuex'

export default {
    data() {
        return {
            wshilistdata: ''

        }
    },
    computed: {
        getcount0() {
            return this.$store.state.teststore.testcount
        },
        //这种好像没有
        // mapState('teststore', [
        //     'testcount'
        // ]),
        ...mapState({
            count2: state => state.teststore.testcount,
            storename: state => state.teststore.storename
        }),
        ...mapGetters(['teststore/testcountgetter'])
    },
    methods: {
        //muutation依然没有命名空间的概念 所以在定义 mutations 时要注意全局的唯一性
        ...mapMutations([
            'increment',
            'resetwshilist'
        ]),
        ...mapMutations({
            setdata: 'setwshilist'
        }),
        apigetwshilist() {
            getViewTestList().then(res => {

                //this.$store.commit('setwshilist', res)
                //or
                this.setdata(res)

                console.log('created end')
            })
        }
    },
    created() {
    },
    mounted() {
        // this.wshilistdata = this.$store.wshilistdata
    },
}
</script>

<style lang="scss" scoped></style>