'use strict';
const BaseController = require('./base')

class HomeController extends BaseController {
  async login() {
    const { ctx } = this;
    const payload = ctx.request.body || {}
    console.log(payload)
    const user = await this.app.mysql.get("user", { user: payload.username });
    if (user) {
      this.success(user)
    } else {
      this.error('用户获取失败')
    }
  }
  async getInfo() {
    const { ctx } = this;
    const payload = ctx.request.body || {}
    console.log(payload)
    const user = await this.app.mysql.get("user", { id: payload.id });
    if (user) {
      this.success(user)
    } else {
      this.error('用户获取失败')
    }
  }
  async logout() {
    const { ctx } = this;
    const payload = ctx.request.body || {}
    console.log(payload)
    // const user = await this.app.mysql.get("user", { id: payload.id });
    this.message('退出成功')
    // if (user) {

    // } else {
    //   this.error('用户获取失败')
    // }
  }
  // 收银扫码获取商品
  async scanCode() {
    const { ctx } = this;
    const payload = ctx.request.body || {}
    console.log(payload, '扫码')
    if (payload) {
      const data = await this.app.mysql.get("stock", { code: payload.code });
      if (data) {
        this.success(data)
      } else {
        this.error('未查到该商品')
      }
    } else {
      this.error('获取商品失败')
    }
  }
  // 查找会员信息
  async getMember() {
    const { ctx } = this;
    const payload = ctx.request.body || {}

    if (payload) {
      const data = await this.app.mysql.query(`SELECT * FROM member WHERE name='${payload.val}' or tel='${payload.val}'`);
      console.log(data)
      if (data && data.length > 0) {
        this.success(data[0])
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
    let { name, // 姓名
      tel, // 电话
      birthday, // 生日
      address, // 地址
      sex, } = ctx.request.body || {}
    try {
      await this.app.mysql.insert('member', { name, tel, address, sex, birthday, createTime: new Date(), updateTime: new Date(), integral: 0 });
      this.message('会员注册成功')
    } catch (error) {
      this.error('会员注册失败!')
    }


  }
}

module.exports = HomeController;
