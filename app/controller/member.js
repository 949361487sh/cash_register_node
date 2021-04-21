'use strict';
const BaseController = require('./base')
const moment = require('moment')
class MemberController extends BaseController {
    // 搜索会员
    async getMemberList() {
        const {
            ctx
        } = this;
        // 库存搜索
        const { state, sex, name, tel, startTime, endTime, pageSize, pageNo } = ctx.request.body || {}
        let isState = `state = '${state}' and`, isSex = `sex = '${sex}' and`
        if (state == '2') {
            isState = ''
        }
        if (sex == '2') {
            isSex = ''
        }
        let sql = `select * from member where ${isState} ${isSex} memberName like '%${name}%' and tel LIKE '%${tel}%' and createTime >= '${startTime} 00:00:00' and createTime <= '${endTime} 23:59:59' ORDER BY id DESC LIMIT ${(pageNo - 1) * 10},${pageSize}`
        let getCont = `select * from member where ${isState} ${isSex} memberName like '%${name}%' and tel LIKE '%${tel}%' and createTime >= '${startTime} 00:00:00' and createTime <= '${endTime} 23:59:59'`
        console.log(sql, '搜索会员Sql');
        const data = await this.app.mysql.query(sql);
        const getContData = await this.app.mysql.query(getCont);
        console.log(getContData.length, '获取的长度');
        if (data) {
            this.success(data, getContData.length)
        } else {
            this.error('查询失败')
        }
    }
    // 查找会员信息
    async getMember() {
        const { ctx } = this;
        const payload = ctx.request.body || {}
        console.log(payload, '获取会员查询');
        if (payload) {
            const data = await this.app.mysql.query(`SELECT * FROM member WHERE memberName='${payload.val}' or tel='${payload.val}'`);
            if (data && data.length > 0) {
                console.log(data[0].state, '该会员状态');
                if (data[0].state == 1) {
                    this.error('该会员已被禁用!')
                } else {
                    this.success(data[0])
                }

            } else {
                this.error('未查到该会员信息')
            }
        } else {
            this.error('未查到该会员信息')
        }
    }
    // 新增会员信息
    async addMember() {
        const { ctx } = this;
        let { memberName, // 姓名
            tel, // 电话
            birthday, // 生日
            address, // 地址
            sex } = ctx.request.body || {}
        try {
            const updateTime = moment().format('YYYY-MM-DD HH:mm:ss')
            await this.app.mysql.insert('member', { memberName, tel, address, sex, birthday, createTime: updateTime, updateTime: updateTime, integral: 0, state: '0' });
            this.message('会员注册成功')
        } catch (error) {
            this.error('会员注册失败!')
        }
    }
    // 删除会员信息
    async delMember() {
        const { ctx } = this;
        let { id, state } = ctx.request.body || {}
        try {
            const updateTime = moment().format('YYYY-MM-DD HH:mm:ss')
            await this.app.mysql.update('member', { id, updateTime: updateTime, state });
            this.message('会员禁用成功')
        } catch (error) {
            this.error('会员禁用失败!')
        }
    }
    // 更新会员信息
    async upMember() {
        const { ctx } = this;
        let { memberName, // 姓名
            tel, // 电话
            birthday, // 生日
            address, // 地址
            sex,
            id,
            integral,
            balance
        } = ctx.request.body || {}
        if (!balance) {
            balance = ''
        }
        try {
            birthday = moment(birthday).format('YYYY-MM-DD HH:mm:ss')
            const updateTime = moment().format('YYYY-MM-DD HH:mm:ss')
            const sql = `update member set integral = '${integral}', balance = '${balance}',memberName = '${memberName}',tel = '${tel}',address = '${address}',sex = '${sex}',birthday = '${birthday}',updateTime = '${updateTime}'  where id = ${id}`
            console.log('会员更新sql', sql);
            let results = await this.app.mysql.query(sql);
            this.message('会员更新成功')
        } catch (error) {
            this.error('会员更新失败!')
        }
    }
}

module.exports = MemberController;
